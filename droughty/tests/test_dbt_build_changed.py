"""Tests for building new and changed models empty to read their columns (dbt_build_changed).

dbt is replaced by tests/fixtures/fake_dbt.py, which records each call.
"""

import os

import git
import pytest

from droughty.droughty_core.project_settings import dbt_target_path, get_git_root
from droughty.droughty_dbt.dbt_build_changed import (
    BuildError,
    Dbt,
    build_settings,
    default_compare_branch,
)
from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_output
from droughty.droughty_dbt.dbt_schema_paths import is_droughty_schema_file

from helpers import (
    FAKE_DBT,
    dbt_commands,
    fake_dbt_calls,
    fixture_manifest,
    run_droughty,
    set_fake_dbt,
    write_json,
    write_project,
)


def schema_text(repo):

    return (repo / 'models' / 'droughty_schema.yml').read_text()


def model_block(text, name):

    """The lines of one model's entry in the schema text."""

    start = text.index(f"  - name: {name}\n")
    end = text.find("\n  - name: ", start + 1)

    return text[start:] if end == -1 else text[start:end + 1]


def set_manifest(repo, change):

    manifest = fixture_manifest()
    change(manifest)
    write_json(str(repo / 'target' / 'manifest.json'), manifest)


# --- settings ---

def test_setting_is_required():

    with pytest.raises(BuildError, match='needs dbt_build_changed in droughty_project.yaml'):
        build_settings({})


@pytest.mark.parametrize('value, message', [
    ('scratch', 'must have a target'),
    ({'targett': 'x'}, 'unknown keys: targett'),
    ({'defer_target': 'prod'}, 'target is missing'),
    ({'target': ['a']}, 'target must be text'),
    ({'target': 'prod', 'defer_target': 'prod'}, 'must write to its own scratch dataset'),
])
def test_bad_settings(value, message):

    with pytest.raises(BuildError, match=message):
        build_settings({'dbt_build_changed': value})


def test_setting_defaults():

    assert build_settings({'dbt_build_changed': {'target': 'scratch'}}) == {
        'target': 'scratch',
        'defer_target': None,
        'compare_branch': None,
        'state_path': None,
        'dbt_command': 'dbt',
    }


def test_command_line_without_setting(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text("dbt_path: models\n")

    result = run_droughty(dbt_repo, 'dbt', 'manifest')

    assert result.returncode == 2
    assert 'needs dbt_build_changed' in result.stdout
    assert not (dbt_repo / 'models' / 'droughty_schema.yml').exists()


# --- which models are built ---

def test_changed_model_gets_columns_from_the_build(dbt_repo, capsys):

    set_fake_dbt(
        dbt_repo,
        changed=['model.jaffle.stg_orders'],
        columns={'model.jaffle.stg_orders': {'order_pk': 'STRING', 'amount': 'NUMERIC', 'status': 'STRING'}},
    )

    manifest_schema_output(cwd=str(dbt_repo))

    block = model_block(schema_text(dbt_repo), 'stg_orders')

    # status is new; customer_fk was dropped from the SQL, so it is gone
    assert '- name: status' in block
    assert 'customer_fk' not in block

    out = capsys.readouterr().out
    assert 'Building 2 of 4 models empty in the scratch target: int_orders_joined, stg_orders' in out


def test_model_without_columns_is_built(dbt_repo):

    set_fake_dbt(dbt_repo, columns={'model.jaffle.int_orders_joined': {'order_pk': 'STRING'}})

    manifest_schema_output(cwd=str(dbt_repo))

    assert model_block(schema_text(dbt_repo), 'int_orders_joined') == (
        "  - name: int_orders_joined\n"
        "    columns:\n"
        "      - name: order_pk\n"
        "        description: '{{doc(\"order_pk\")}}'\n"
        "        tests:\n"
        "          - not_null\n"
        "          - unique\n"
    )


def test_dbt_steps_and_options(dbt_repo):

    set_fake_dbt(dbt_repo, changed=['model.jaffle.stg_orders'])

    manifest_schema_output(cwd=str(dbt_repo))

    assert dbt_commands(dbt_repo) == ['parse', 'ls', 'run', 'docs']

    run_args = fake_dbt_calls(dbt_repo)[2]['args']
    for option in ('--empty', '--full-refresh', '--defer', '--favor-state'):
        assert option in run_args
    assert run_args[run_args.index('--target') + 1] == 'scratch'
    assert run_args[run_args.index('--state') + 1] == str(dbt_repo / 'state')

    # the scratch build never writes over the project's own target folder
    assert run_args[run_args.index('--target-path') + 1] != str(dbt_repo / 'target')


def test_nothing_to_build_skips_the_warehouse(dbt_repo, capsys):

    write_project(dbt_repo, "test_ignore:\n  models:\n    - int_orders_joined\n")

    manifest_schema_output(cwd=str(dbt_repo))

    assert dbt_commands(dbt_repo) == ['parse', 'ls']
    assert 'No new or changed models, so nothing to build.' in capsys.readouterr().out


def test_ignored_model_is_not_built(dbt_repo):

    write_project(dbt_repo, "test_ignore:\n  models:\n    - stg_orders\n    - int_orders_joined\n")
    set_fake_dbt(dbt_repo, changed=['model.jaffle.stg_orders'])

    manifest_schema_output(cwd=str(dbt_repo))

    assert 'run' not in dbt_commands(dbt_repo)


def test_model_described_in_its_own_yaml_is_left_out(dbt_repo, capsys):

    def own_yaml(manifest):
        manifest['nodes']['model.jaffle.stg_orders']['patch_path'] = 'jaffle://models/staging/_staging.yml'
        manifest['nodes']['model.jaffle.misc_lookup']['patch_path'] = 'jaffle://models/droughty_schema.yml'

    set_manifest(dbt_repo, own_yaml)
    set_fake_dbt(dbt_repo, changed=['model.jaffle.stg_orders'])

    manifest_schema_output(cwd=str(dbt_repo))

    text = schema_text(dbt_repo)
    assert 'stg_orders' not in text
    assert 'misc_lookup' in text

    assert '1 models are described in their own YAML files, so droughty leaves them out' in capsys.readouterr().out


def test_columns_are_lower_case_for_snowflake(dbt_repo):

    set_manifest(dbt_repo, lambda m: m['metadata'].update(adapter_type='snowflake'))
    set_fake_dbt(dbt_repo, columns={'model.jaffle.int_orders_joined': {'ORDER_PK': 'TEXT'}})

    manifest_schema_output(cwd=str(dbt_repo))

    assert '- name: order_pk' in model_block(schema_text(dbt_repo), 'int_orders_joined')


def test_model_missing_from_catalog_keeps_manifest_columns(dbt_repo, capsys):

    set_fake_dbt(dbt_repo, changed=['model.jaffle.stg_orders'])

    manifest_schema_output(cwd=str(dbt_repo))

    assert '- name: customer_fk' in model_block(schema_text(dbt_repo), 'stg_orders')
    assert 'dbt did not return columns for stg_orders' in capsys.readouterr().out


# --- safety and errors ---

def test_refuses_to_build_over_a_real_table(dbt_repo):

    def add_relation(manifest):
        manifest['nodes']['model.jaffle.stg_orders']['relation_name'] = '`proj`.`analytics_staging`.`stg_orders`'

    set_manifest(dbt_repo, add_relation)
    set_fake_dbt(
        dbt_repo,
        changed=['model.jaffle.stg_orders'],
        relations={'model.jaffle.stg_orders': '`proj`.`ANALYTICS_STAGING`.`stg_orders`'},
        schemas={'model.jaffle.stg_orders': 'droughty_scratch_but_misconfigured'},
    )

    with pytest.raises(BuildError, match='the same table as your default dbt target'):
        manifest_schema_output(cwd=str(dbt_repo))

    assert 'run' not in dbt_commands(dbt_repo)
    assert not (dbt_repo / 'models' / 'droughty_schema.yml').exists()


def test_refuses_to_build_outside_a_droughty_schema(dbt_repo):

    set_fake_dbt(
        dbt_repo,
        changed=['model.jaffle.stg_orders'],
        schemas={'model.jaffle.stg_orders': 'analytics_staging'},
    )

    with pytest.raises(BuildError, match=r"in schemas without 'droughty' in the name: stg_orders \(analytics_staging\)"):
        manifest_schema_output(cwd=str(dbt_repo))

    assert 'run' not in dbt_commands(dbt_repo)
    assert not (dbt_repo / 'models' / 'droughty_schema.yml').exists()


def test_entry_that_differs_from_the_compare_manifest_is_rebuilt(dbt_repo, capsys):

    # the droughty entry for stg_orders has a column main does not have, but the SQL is unchanged
    def extra_column(manifest):
        manifest['nodes']['model.jaffle.stg_orders']['columns']['status'] = {'name': 'status'}

    set_manifest(dbt_repo, extra_column)
    set_fake_dbt(dbt_repo, columns={'model.jaffle.stg_orders': {'order_pk': 'STRING'}})

    manifest_schema_output(cwd=str(dbt_repo))

    assert 'stg_orders' in capsys.readouterr().out.split('Building ')[1]
    assert 'status' not in model_block(schema_text(dbt_repo), 'stg_orders')

    ls_args = fake_dbt_calls(dbt_repo)[1]['args']
    assert 'stg_orders+' in ls_args


def test_dbt_failure_is_reported(dbt_repo):

    set_fake_dbt(dbt_repo, fail='run')

    result = run_droughty(dbt_repo, 'dbt', 'manifest')

    assert result.returncode == 2
    assert 'Error: dbt run failed:' in result.stdout
    assert 'failed on purpose' in result.stdout
    assert not (dbt_repo / 'models' / 'droughty_schema.yml').exists()


def test_missing_dbt_program(tmp_path):

    with pytest.raises(BuildError, match='Could not run no-such-dbt. Install dbt'):
        Dbt('no-such-dbt', str(tmp_path)).run(['parse'])


def test_saved_state_path_must_hold_a_manifest(dbt_repo):

    (dbt_repo / 'state' / 'manifest.json').unlink()

    with pytest.raises(BuildError, match='No manifest.json in'):
        manifest_schema_output(cwd=str(dbt_repo))


# --- comparing with the main branch ---

def commit_all(repo):

    repo.git.add('-A')
    repo.git.commit('-m', 'commit', '--no-gpg-sign')


@pytest.fixture
def branch_repo(dbt_repo, monkeypatch):

    """dbt_repo with a main branch commit and a feature branch, comparing with main."""

    repo = git.Repo(dbt_repo)
    repo.config_writer().set_value('user', 'name', 'test').release()
    repo.config_writer().set_value('user', 'email', 'test@example.com').release()

    (dbt_repo / 'dbt_project.yml').write_text("name: jaffle\nprofile: jaffle\n")
    (dbt_repo / '.gitignore').write_text("target/\ndbt_packages/\nfake_dbt*\n")
    write_project(dbt_repo)
    project = (dbt_repo / 'droughty_project.yaml').read_text().replace("  state_path: state\n", "")
    (dbt_repo / 'droughty_project.yaml').write_text(project)

    commit_all(repo)
    repo.git.branch('-M', 'main')
    repo.git.checkout('-b', 'feature')

    # the stand-in dbt runs in the worktree, so point it at the config in the repo
    monkeypatch.setenv('FAKE_DBT_DIR', str(dbt_repo))
    set_fake_dbt(dbt_repo, state_manifest=str(dbt_repo / 'state' / 'manifest.json'))

    return dbt_repo


def test_compares_with_main_in_a_temporary_worktree(branch_repo, capsys):

    manifest_schema_output(cwd=str(branch_repo))

    calls = fake_dbt_calls(branch_repo)
    assert dbt_commands(branch_repo)[:2] == ['parse', 'parse']

    # the second parse ran on main in a temporary folder, and the folder is gone
    assert calls[1]['cwd'] != str(branch_repo)
    assert not os.path.exists(calls[1]['cwd'])
    assert len(git.Repo(branch_repo).git.worktree('list').splitlines()) == 1

    assert 'Comparing with main' in capsys.readouterr().out


def test_defer_target_is_used_for_the_compare_manifest(branch_repo):

    project = (branch_repo / 'droughty_project.yaml').read_text()
    (branch_repo / 'droughty_project.yaml').write_text(project + "  defer_target: prod\n")

    manifest_schema_output(cwd=str(branch_repo))

    compare_parse = fake_dbt_calls(branch_repo)[1]['args']
    assert compare_parse[compare_parse.index('--target') + 1] == 'prod'


def test_installed_packages_are_reused_and_left_alone(branch_repo):

    packages = branch_repo / 'dbt_packages' / 'dbt_utils'
    packages.mkdir(parents=True)
    (packages / 'dbt_project.yml').write_text("name: dbt_utils\n")

    manifest_schema_output(cwd=str(branch_repo))

    assert (packages / 'dbt_project.yml').exists()
    assert 'deps' not in dbt_commands(branch_repo)


def test_packages_are_installed_when_missing(branch_repo):

    repo = git.Repo(branch_repo)
    repo.git.checkout('main')
    (branch_repo / 'packages.yml').write_text("packages: []\n")
    commit_all(repo)
    repo.git.checkout('-B', 'feature')

    manifest_schema_output(cwd=str(branch_repo))

    assert 'deps' in dbt_commands(branch_repo)


def test_worktree_is_removed_when_dbt_fails(branch_repo):

    set_fake_dbt(branch_repo, fail='parse')

    with pytest.raises(BuildError):
        manifest_schema_output(cwd=str(branch_repo))

    assert len(git.Repo(branch_repo).git.worktree('list').splitlines()) == 1


def test_default_compare_branch(tmp_path):

    repo = git.Repo.init(tmp_path)
    repo.git.commit('--allow-empty', '-m', 'first', '--no-gpg-sign', '--author', 'test <test@example.com>')

    repo.git.branch('-M', 'master')
    assert default_compare_branch(repo) == 'master'

    repo.git.branch('-M', 'trunk')
    with pytest.raises(BuildError, match='Set dbt_build_changed.compare_branch'):
        default_compare_branch(repo)


# --- helpers ---

def test_not_a_git_repo_has_a_clear_error(tmp_path):

    with pytest.raises(FileNotFoundError, match='is not inside a git repository'):
        get_git_root(str(tmp_path))


def test_dbt_target_path(tmp_path, monkeypatch):

    monkeypatch.delenv('DBT_TARGET_PATH', raising=False)
    assert dbt_target_path(str(tmp_path)) == str(tmp_path / 'target')

    (tmp_path / 'dbt_project.yml').write_text("name: x\ntarget-path: build\n")
    assert dbt_target_path(str(tmp_path)) == str(tmp_path / 'build')

    monkeypatch.setenv('DBT_TARGET_PATH', 'other')
    assert dbt_target_path(str(tmp_path)) == str(tmp_path / 'other')


@pytest.mark.parametrize('path, expected', [
    ('models/droughty_schema.yml', True),
    ('models/droughty_schema_staging.yml', True),
    ('models/staging/_staging.yml', False),
    ('models/droughty_schema_x/other.yml', False),
    ('models/droughty_schema.yaml', False),
])
def test_is_droughty_schema_file(tmp_path, path, expected):

    assert is_droughty_schema_file(str(tmp_path / path), str(tmp_path), None, None) == expected


def test_fake_dbt_is_used():

    # guards against the tests running the real dbt by mistake
    assert 'fake_dbt.py' in FAKE_DBT

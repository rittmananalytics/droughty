"""Tests for the droughty GitHub check (droughty.droughty_dbt.dbt_ci_check), run by action.yml."""

import subprocess
import sys

import pytest
import yaml

from droughty.droughty_dbt.dbt_ci_check import (
    CheckError,
    ci_check_enabled,
    main,
    placeholder_profile,
)
from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_output

from helpers import PACKAGE_ROOT, fixture_manifest, write_json, write_project

# int_orders_joined has no declared columns, so no tests; ignore it unless a test needs it
ON = "droughty_dbt_ci_check: true\ntest_ignore:\n  models:\n    - int_orders_joined\n"


def setup(repo, monkeypatch, project=ON, generate=True):

    write_project(repo, project)

    if generate:
        manifest_schema_output(cwd=str(repo))

    monkeypatch.chdir(repo)


def set_manifest(repo, change):

    manifest = fixture_manifest()
    change(manifest['nodes'])
    write_json(str(repo / 'target' / 'manifest.json'), manifest)


def run(capsys):

    code = main(['run'])

    return code, capsys.readouterr().out


# --- the droughty_dbt_ci_check switch ---

def test_off_when_missing():

    assert ci_check_enabled({}) is False


def test_must_be_true_or_false():

    with pytest.raises(CheckError, match='droughty_dbt_ci_check must be true or false'):
        ci_check_enabled({'droughty_dbt_ci_check': 'yes'})


@pytest.mark.parametrize('project, expected', [("droughty_dbt_ci_check: true\n", 'true'), ("droughty_dbt_ci_check: false\n", 'false'), ("", 'false')])
def test_enabled_step_prints_the_switch(dbt_repo, monkeypatch, capsys, project, expected):

    setup(dbt_repo, monkeypatch, project, generate=False)

    assert main(['enabled']) == 0
    assert capsys.readouterr().out.splitlines()[-1] == expected


def test_switched_off_check_passes_without_a_manifest(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch, "droughty_dbt_ci_check: false\n", generate=False)
    (dbt_repo / 'target' / 'manifest.json').unlink()

    code, out = run(capsys)

    assert code == 0
    assert 'droughty check is skipped' in out


# --- passing ---

def test_passes_after_generating(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)

    code, out = run(capsys)

    assert code == 0, out
    assert 'all 3 dbt models have droughty tests' in out


def test_passes_with_per_layer_files(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch, ON + "dbt_schema_output: per_layer\n")

    assert run(capsys)[0] == 0


def test_column_and_test_changes_do_not_fail(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)

    def change_columns(nodes):
        nodes['model.jaffle.stg_orders']['columns']['discount'] = {'name': 'discount'}

    set_manifest(dbt_repo, change_columns)

    assert run(capsys)[0] == 0


def test_data_tests_key_counts_as_tests(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)

    schema = dbt_repo / 'models' / 'droughty_schema.yml'
    schema.write_text(schema.read_text().replace('tests:', 'data_tests:'))

    assert run(capsys)[0] == 0


# --- failing ---

def test_new_model_without_entry(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)

    def add_model(nodes):
        nodes['model.jaffle.stg_customers'] = dict(nodes['model.jaffle.misc_lookup'], name='stg_customers')

    set_manifest(dbt_repo, add_model)

    code, out = run(capsys)

    assert code == 1
    assert 'stg_customers: no entry in the droughty schema.' in out
    assert 'To fix, run `droughty dbt manifest --clean`' in out


def test_deleted_model_still_in_schema(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)

    set_manifest(dbt_repo, lambda nodes: nodes.pop('model.jaffle.misc_lookup'))

    code, out = run(capsys)

    assert code == 1
    assert 'misc_lookup: in models/droughty_schema.yml but not a model in the dbt project.' in out


def test_model_without_tests(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch, "droughty_dbt_ci_check: true\n")

    code, out = run(capsys)

    assert code == 1
    assert 'int_orders_joined: in models/droughty_schema.yml but has no tests.' in out


def test_no_schema_files(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch, generate=False)

    code, out = run(capsys)

    assert code == 1
    assert out.count('no entry in the droughty schema') == 3


def test_github_annotations(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch, "droughty_dbt_ci_check: true\n")
    monkeypatch.setenv('GITHUB_ACTIONS', 'true')

    assert '::error title=droughty check::int_orders_joined' in run(capsys)[1]


def test_model_described_in_its_own_yaml(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch, generate=False)

    def own_yaml(nodes):
        nodes['model.jaffle.stg_orders']['patch_path'] = 'jaffle://models/staging/_staging.yml'

    set_manifest(dbt_repo, own_yaml)

    code, out = run(capsys)

    assert code == 1
    assert (
        'stg_orders: described in models/staging/_staging.yml, not in the droughty schema. '
        'Remove its entry there so droughty can add it, or add it to test_ignore.'
    ) in out


def test_model_without_tests_points_to_droughty_dbt_manifest(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch, "droughty_dbt_ci_check: true\n")

    assert 'Run `droughty dbt manifest` to add its columns and tests' in run(capsys)[1]


def test_reads_manifest_from_dbt_project_dir_and_target_path(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)

    (dbt_repo / 'dbt').mkdir()
    (dbt_repo / 'dbt' / 'dbt_project.yml').write_text("name: jaffle\ntarget-path: build\n")
    (dbt_repo / 'target' / 'manifest.json').rename(dbt_repo / 'manifest.json')
    write_json(str(dbt_repo / 'dbt' / 'build' / 'manifest.json'), fixture_manifest())

    code = main(['run', '--dbt-project-dir', 'dbt'])

    assert code == 0, capsys.readouterr().out


def test_check_needs_only_pyyaml_and_gitpython():

    # the action installs only these two, so markdown and ruamel.yaml must not be imported
    code = (
        "import sys\n"
        "for name in ('markdown', 'ruamel', 'ruamel.yaml', 'pandas', 'lkml'):\n"
        "    sys.modules[name] = None\n"
        "import droughty.droughty_dbt.dbt_ci_check\n"
    )

    result = subprocess.run([sys.executable, '-c', code], cwd=PACKAGE_ROOT, capture_output=True, text=True)

    assert result.returncode == 0, result.stderr


# --- errors ---

def test_missing_manifest_is_an_error(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)
    (dbt_repo / 'target' / 'manifest.json').unlink()

    code, out = run(capsys)

    assert code == 2
    assert 'No dbt manifest found' in out


def test_invalid_schema_yaml_is_an_error(dbt_repo, monkeypatch, capsys):

    setup(dbt_repo, monkeypatch)
    (dbt_repo / 'models' / 'droughty_schema.yml').write_text("models: [\n")

    code, out = run(capsys)

    assert code == 2
    assert 'is not valid YAML' in out


# --- placeholder profile for dbt parse ---

def test_placeholder_profile(tmp_path):

    (tmp_path / 'dbt_project.yml').write_text("name: jaffle\nprofile: jaffle_profile\n")

    profile = yaml.safe_load(placeholder_profile('dbt-bigquery==1.8.2', str(tmp_path)))

    assert profile['jaffle_profile']['target'] == 'ci'
    assert profile['jaffle_profile']['outputs']['ci']['type'] == 'bigquery'
    assert yaml.safe_load(placeholder_profile('dbt-snowflake', str(tmp_path)))['jaffle_profile']['outputs']['ci']['type'] == 'snowflake'


def test_placeholder_profile_unsupported_adapter(tmp_path):

    (tmp_path / 'dbt_project.yml').write_text("profile: p\n")

    with pytest.raises(CheckError, match='Pass profiles-dir to the action instead'):
        placeholder_profile('dbt-postgres', str(tmp_path))


def test_profile_step_writes_file(tmp_path, monkeypatch):

    (tmp_path / 'dbt_project.yml').write_text("profile: p\n")
    monkeypatch.chdir(tmp_path)

    assert main(['profile', '--adapter', 'dbt-bigquery', '--out', 'profiles']) == 0
    assert (tmp_path / 'profiles' / 'profiles.yml').exists()


def test_profile_step_without_dbt_project(tmp_path, monkeypatch, capsys):

    monkeypatch.chdir(tmp_path)

    assert main(['profile', '--adapter', 'dbt-bigquery', '--out', 'profiles']) == 2
    assert 'No dbt_project.yml' in capsys.readouterr().out

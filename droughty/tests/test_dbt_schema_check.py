"""Tests for droughty dbt manifest --check: comparing committed schema files with the manifest."""

import pytest
import yaml

from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_check, manifest_schema_output
from droughty.droughty_dbt.dbt_schema_check import CheckError, ci_check_enabled

# reuse the git repo fixture and helpers from the manifest tests
from test_dbt_manifest import dbt_repo, fixture_manifest, run_droughty, write_json  # noqa: F401

PER_LAYER = "dbt_schema_output: per_layer\n"


def set_manifest(repo, change):

    manifest = fixture_manifest()
    change(manifest['nodes'])
    write_json(str(repo / 'target' / 'manifest.json'), manifest)


def check(repo, capsys):

    in_sync = manifest_schema_check(cwd=str(repo))

    return in_sync, capsys.readouterr().out


def schema(repo, name='droughty_schema.yml'):

    return repo / 'models' / name


# --- settings ---

def test_ci_check_is_on_by_default():

    assert ci_check_enabled({}) is True


def test_ci_check_must_be_true_or_false():

    with pytest.raises(CheckError, match='dbt_ci_check must be true or false'):
        ci_check_enabled({'dbt_ci_check': 'no'})


def test_ci_check_false_skips_the_check(dbt_repo, capsys):

    (dbt_repo / 'droughty_project.yaml').write_text("dbt_ci_check: false\n")

    # skipped before the manifest is read, so a missing manifest does not matter
    (dbt_repo / 'target' / 'manifest.json').unlink()

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is None
    assert 'check is skipped' in out


# --- in sync ---

def test_in_sync_after_generating(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is True
    assert 'in sync: 4 models in 1 files' in out


def test_formatting_and_comments_are_ignored(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    # rewrite with a different YAML writer: other indentation, quoting and key order
    document = yaml.safe_load(schema(dbt_repo).read_text())
    reformatted = "# reformatted\n" + yaml.safe_dump(document, indent=4, sort_keys=True, default_style='"')
    assert reformatted != schema(dbt_repo).read_text()
    schema(dbt_repo).write_text(reformatted)

    assert check(dbt_repo, capsys)[0] is True


def test_check_writes_nothing(dbt_repo, capsys):

    assert check(dbt_repo, capsys)[0] is False
    assert not (dbt_repo / 'models').exists()


# --- out of sync ---

def test_new_model(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    def add_model(nodes):
        node = dict(nodes['model.jaffle.misc_lookup'], name='stg_customers', original_file_path='models/staging/stg_customers.sql')
        nodes['model.jaffle.stg_customers'] = node

    set_manifest(dbt_repo, add_model)

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'stg_customers: missing, expected in models/droughty_schema.yml.' in out
    assert '+  - name: stg_customers' in out


def test_deleted_model(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    set_manifest(dbt_repo, lambda nodes: nodes.pop('model.jaffle.misc_lookup'))

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'misc_lookup: in models/droughty_schema.yml but no longer generated' in out


def test_column_changes(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    def change_columns(nodes):
        columns = nodes['model.jaffle.stg_orders']['columns']
        columns.pop('amount')
        columns['discount'] = {'name': 'discount'}

    set_manifest(dbt_repo, change_columns)

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'stg_orders: columns to add: discount; columns to remove: amount.' in out


def test_test_changes(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    (dbt_repo / 'droughty_project.yaml').write_text(
        "test_overwrite:\n  models:\n    stg_orders:\n      amount:\n        - not_null\n"
    )

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'stg_orders: tests or descriptions differ.' in out


def test_hand_edit_is_reported(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    schema(dbt_repo).write_text(schema(dbt_repo).read_text().replace('version: 2', 'version: 3'))

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'models/droughty_schema.yml differs from the generated output.' in out


def test_invalid_yaml(dbt_repo, capsys):

    (dbt_repo / 'models').mkdir()
    schema(dbt_repo).write_text("models: [\n")

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'models/droughty_schema.yml is not valid YAML' in out


# --- per layer ---

def test_model_in_wrong_layer_file(dbt_repo, capsys):

    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)
    manifest_schema_output(cwd=str(dbt_repo))

    def move_model(nodes):
        nodes['model.jaffle.misc_lookup']['original_file_path'] = 'models/staging/misc_lookup.sql'

    set_manifest(dbt_repo, move_model)

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'misc_lookup: in models/droughty_schema_unassigned.yml, expected in models/droughty_schema_staging.yml.' in out
    assert 'models/droughty_schema_unassigned.yml is an old droughty file' in out


def test_switch_to_per_layer_without_regenerating(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))
    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'models/droughty_schema_staging.yml does not exist.' in out
    assert 'models/droughty_schema.yml is an old droughty file and should be deleted' in out


def test_old_file_left_after_switch(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))
    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)
    manifest_schema_output(cwd=str(dbt_repo))

    in_sync, out = check(dbt_repo, capsys)

    assert in_sync is False
    assert 'stg_orders: also in models/droughty_schema.yml. dbt fails if a model is described in two files.' in out

    manifest_schema_output(cwd=str(dbt_repo), clean=True)

    assert check(dbt_repo, capsys)[0] is True


# --- command line ---

def test_command_line_exit_codes(dbt_repo):

    result = run_droughty(dbt_repo, 'dbt', 'manifest', '--check')
    assert result.returncode == 1, result.stdout + result.stderr
    assert 'To fix, run `droughty dbt manifest --clean`' in result.stdout
    assert not (dbt_repo / 'models').exists()

    run_droughty(dbt_repo, 'dbt', 'manifest')

    result = run_droughty(dbt_repo, 'dbt', 'manifest', '--check')
    assert result.returncode == 0, result.stdout + result.stderr

    result = run_droughty(dbt_repo, 'dbt', 'manifest', '--check', '--manifest-path', 'nowhere.json')
    assert result.returncode == 2
    assert 'No dbt manifest found' in result.stdout


def test_command_line_check_switched_off(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text("dbt_ci_check: false\n")

    result = run_droughty(dbt_repo, 'dbt', 'manifest', '--check')

    assert result.returncode == 0
    assert 'check is skipped' in result.stdout

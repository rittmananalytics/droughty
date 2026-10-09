"""Tests for splitting the droughty dbt schema into one file per layer."""

import os

import pytest

from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_output
from droughty.droughty_dbt.dbt_schema_builder import build_schema_entries, render_schema
from droughty.droughty_dbt.dbt_schema_layers import (
    DEFAULT_LAYERS,
    GENERATED_HEADER,
    LayerError,
    assign_layer,
    layer_settings,
    schema_files,
)

# reuse the git repo fixture and command runner from the manifest tests
from test_dbt_manifest import dbt_repo, run_droughty  # noqa: F401

PER_LAYER = "dbt_schema_output: per_layer\n"


def models_dir(repo):

    return repo / 'models'


def written(repo):

    return sorted(p.name for p in models_dir(repo).glob('*.yml'))


# --- settings ---

def test_defaults_keep_single_output():

    settings = layer_settings({})

    assert settings['schema_output'] == 'single'
    assert settings['layer_unmatched'] == 'warn'
    assert settings['layers'] == DEFAULT_LAYERS


@pytest.mark.parametrize('project, message', [
    ({'dbt_schema_output': 'per_folder'}, 'dbt_schema_output must be one of single, per_layer'),
    ({'dbt_layer_unmatched': 'ignore'}, 'dbt_layer_unmatched must be one of warn, fail'),
    ({'dbt_layers': ['staging']}, 'dbt_layers must map each layer name'),
    ({'dbt_layers': {'unassigned': {'prefixes': ['x_']}}}, 'cannot be used as a layer name'),
    ({'dbt_layers': {'my layer': {'prefixes': ['x_']}}}, 'cannot be used as a layer name'),
    ({'dbt_layers': {'staging': {'prefix': ['stg_']}}}, 'unknown keys: prefix'),
    ({'dbt_layers': {'staging': {'prefixes': [1]}}}, 'must be a name or a list of names'),
])
def test_invalid_settings_are_reported(project, message):

    with pytest.raises(LayerError, match=message):
        layer_settings(project)


def test_custom_layers_accept_single_names():

    settings = layer_settings({'dbt_layers': {'marts': {'folders': 'marts', 'prefixes': ['fct_', 'dim_']}}})

    assert settings['layers'] == {'marts': {'folders': ['marts'], 'prefixes': ['fct_', 'dim_'], 'schemas': []}}


# --- assigning models to layers ---

def test_folder_wins_over_prefix():

    assert assign_layer('int_odd_one', 'models/staging/int_odd_one.sql', None, DEFAULT_LAYERS) == 'staging'


def test_nested_folder_matches():

    assert assign_layer('orders', 'models/marketing/warehouse/orders.sql', None, DEFAULT_LAYERS) == 'warehouse'


def test_prefix_used_when_no_folder_matches():

    assert assign_layer('stg_orders', 'models/other/stg_orders.sql', None, DEFAULT_LAYERS) == 'staging'


def test_schema_used_when_no_folder_or_prefix_matches():

    layers = layer_settings({'dbt_layers': {'warehouse': {'schemas': ['analytics']}}})['layers']

    # the warehouse source has no file path; Snowflake schemas come back upper case
    assert assign_layer('orders_fact', None, 'ANALYTICS', layers) == 'warehouse'


def test_no_match():

    assert assign_layer('lookup', 'models/misc/lookup.sql', 'analytics', DEFAULT_LAYERS) == None


def test_single_output_is_unchanged():

    entries = build_schema_entries({'stg_a': {'a_pk': 'string'}}, None, [], [])

    files = schema_files(entries, {}, '/repo', None, None, layer_settings({}))

    assert files == {'/repo/models/droughty_schema.yml': render_schema(entries)}
    assert not render_schema(entries).startswith('#')


# --- writing per-layer files ---

def test_per_layer_files(dbt_repo, capsys):

    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)

    manifest_schema_output(cwd=str(dbt_repo))

    assert written(dbt_repo) == [
        'droughty_schema_integration.yml',
        'droughty_schema_staging.yml',
        'droughty_schema_unassigned.yml',
        'droughty_schema_warehouse.yml',
    ]

    assert (models_dir(dbt_repo) / 'droughty_schema_staging.yml').read_text() == GENERATED_HEADER + (
        "version: 2\n"
        "models:\n"
        "  - name: stg_orders\n"
        "    columns:\n"
        "      - name: amount\n"
        "        tests:\n"
        "          - dbt_utils.at_least_one\n"
        "      - name: customer_fk\n"
        "        tests:\n"
        "          - dbt_utils.at_least_one\n"
        "      - name: order_pk\n"
        "        tests:\n"
        "          - not_null\n"
        "          - unique\n"
    )

    assert 'misc_lookup' in (models_dir(dbt_repo) / 'droughty_schema_unassigned.yml').read_text()
    assert '1 models match no layer' in capsys.readouterr().out


def test_custom_layers_and_filename(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text(
        PER_LAYER +
        "dbt_tests_filename: schema\n"
        "dbt_layers:\n"
        "  staging:\n    folders: [staging]\n"
        "  other:\n    folders: [integration, warehouse, misc]\n"
    )

    manifest_schema_output(cwd=str(dbt_repo))

    assert written(dbt_repo) == ['schema_other.yml', 'schema_staging.yml']


def test_unmatched_fail_writes_nothing(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER + "dbt_layer_unmatched: fail\n")

    with pytest.raises(LayerError, match='1 models match no layer in dbt_layers: misc_lookup'):
        manifest_schema_output(cwd=str(dbt_repo))

    assert not models_dir(dbt_repo).exists()


# --- old files after switching modes ---

def test_switch_to_per_layer_reports_then_cleans_single_file(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))
    assert written(dbt_repo) == ['droughty_schema.yml']

    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)

    manifest_schema_output(cwd=str(dbt_repo))
    assert 'droughty_schema.yml' in written(dbt_repo)
    assert 'Re-run with --clean' in capsys.readouterr().out

    manifest_schema_output(cwd=str(dbt_repo), clean=True)
    assert 'droughty_schema.yml' not in written(dbt_repo)


def test_switch_to_single_cleans_layer_files_but_not_user_files(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)
    manifest_schema_output(cwd=str(dbt_repo))

    # a file the user wrote by hand with a layer-like name, without droughty's header
    (models_dir(dbt_repo) / 'droughty_schema_staging.yml').write_text("version: 2\nmodels: []\n")

    (dbt_repo / 'droughty_project.yaml').write_text("dbt_schema_output: single\n")
    manifest_schema_output(cwd=str(dbt_repo), clean=True)

    assert written(dbt_repo) == ['droughty_schema.yml', 'droughty_schema_staging.yml']


def test_layer_with_no_models_left_is_stale(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)
    manifest_schema_output(cwd=str(dbt_repo))

    (dbt_repo / 'droughty_project.yaml').write_text(
        PER_LAYER + "dbt_layers:\n  staging:\n    folders: [staging, integration, warehouse, misc]\n  integration:\n    prefixes: [int_]\n"
    )
    manifest_schema_output(cwd=str(dbt_repo), clean=True)

    assert written(dbt_repo) == ['droughty_schema_staging.yml']


# --- command line ---

def test_command_line_clean(dbt_repo):

    run_droughty(dbt_repo, 'dbt', 'manifest')
    (dbt_repo / 'droughty_project.yaml').write_text(PER_LAYER)

    result = run_droughty(dbt_repo, 'dbt', 'manifest', '--clean')

    assert result.returncode == 0, result.stdout + result.stderr
    assert 'Removed old droughty schema file' in result.stdout
    assert 'droughty_schema.yml' not in written(dbt_repo)


def test_command_line_reports_bad_setting(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text("dbt_schema_output: per_folder\n")

    result = run_droughty(dbt_repo, 'dbt', 'manifest')

    assert result.returncode == 2
    assert 'dbt_schema_output must be one of single, per_layer' in result.stdout

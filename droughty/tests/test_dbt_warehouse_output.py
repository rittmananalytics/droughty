"""Tests for writing the schema from the warehouse source (droughty dbt).

The real config and warehouse modules load the profile and log in to the
warehouse when imported, so they are replaced with stand-ins here.
"""

import importlib
import sys
import types

import pytest

# what the warehouse query returns: {table: {column: data_type}} and {table: schema}
TABLES = {
    'stg_orders': {'order_pk': 'string'},
    'orders_fact': {'order_pk': 'string', 'customer_fk': 'string'},
    'lookup': {'lookup_pk': 'string'},
}
SCHEMAS = {'stg_orders': 'STAGING', 'orders_fact': 'ANALYTICS', 'lookup': 'OTHER'}


@pytest.fixture
def warehouse_module(tmp_path, monkeypatch):

    """Import dbt_test_module with stand-in config and warehouse modules. Returns (module, project settings)."""

    droughty_project = {}

    config = types.ModuleType('droughty.droughty_core.config')
    config.IdentifyConfigVariables = types.SimpleNamespace(git_path=str(tmp_path))
    # config.py sets these to the string "None" when they are not configured
    config.ExploresVariables = types.SimpleNamespace(dbt_path=None, dbt_tests_filename=None, test_overwrite='None', test_ignore='None')
    config.droughty_project = droughty_project

    config_cli = types.ModuleType('droughty.droughty_core.config_cli')
    config_cli.Common = types.SimpleNamespace(clean=False)

    base_dict = types.ModuleType('droughty.droughty_dbt.dbt_test_base_dict')
    base_dict.dbt_test_dict_and_schemas = lambda: ({k: dict(v) for k, v in TABLES.items()}, SCHEMAS)

    field_base = types.ModuleType('droughty.droughty_dbt.dbt_test_field_base')
    field_base.described_columns_list = []

    for module in (config, config_cli, base_dict, field_base):
        monkeypatch.setitem(sys.modules, module.__name__, module)

    monkeypatch.delitem(sys.modules, 'droughty.droughty_dbt.dbt_test_module', raising=False)

    return importlib.import_module('droughty.droughty_dbt.dbt_test_module'), droughty_project


def test_single_file(warehouse_module, tmp_path):

    module, _ = warehouse_module

    module.schema_output()

    text = (tmp_path / 'models' / 'droughty_schema.yml').read_text()

    assert text.startswith('version: 2\nmodels:\n  - name: stg_orders\n')
    assert '  - name: lookup\n' in text


def test_per_layer_by_prefix_and_schema(warehouse_module, tmp_path):

    module, droughty_project = warehouse_module
    droughty_project.update({
        'dbt_schema_output': 'per_layer',
        'dbt_layers': {
            'staging': {'prefixes': ['stg_']},
            'warehouse': {'schemas': ['analytics']},
        },
    })

    module.schema_output()

    files = sorted(p.name for p in (tmp_path / 'models').glob('*.yml'))

    assert files == ['droughty_schema_staging.yml', 'droughty_schema_unassigned.yml', 'droughty_schema_warehouse.yml']
    assert 'orders_fact' in (tmp_path / 'models' / 'droughty_schema_warehouse.yml').read_text()
    assert 'lookup' in (tmp_path / 'models' / 'droughty_schema_unassigned.yml').read_text()

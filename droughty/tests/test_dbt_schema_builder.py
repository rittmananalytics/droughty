"""Tests for the shared dbt schema builder used by droughty dbt and droughty dbt manifest."""

import copy
import os

import pytest

from droughty.droughty_dbt.dbt_schema_builder import (
    build_schema_entries,
    read_described_columns,
    render_schema,
    schema_file_path,
)

FIXTURES = os.path.join(os.path.dirname(__file__), 'fixtures')

# The golden files were written by the original get_all_values() and file writer
# in dbt_test_module.py, before they moved to dbt_schema_builder.py.
SAMPLE = {
    'wh_customers_dim': {'customer_pk': 'string', 'customer_name': 'string', 'created_ts': 'timestamp', 'valid_from': 'timestamp', 'valid_to': 'timestamp'},
    'wh_orders_fact': {'order_pk': 'string', 'customer_fk': 'string', 'amount': 'number'},
    'stg_ignored': {'thing_pk': 'string', 'other': 'string'},
    'int_overridden': {'id_pk': 'string', 'status': 'string'},
}

CASES = {
    # config.py sets test_overwrite and test_ignore to the string "None" when they are not configured
    'plain': dict(test_overwrite='None', test_ignore='None', described=[]),
    'described': dict(test_overwrite='None', test_ignore='None', described=['customer_pk', 'amount', 'customer_fk', 'valid_from']),
    'overwrite_ignore': dict(test_overwrite={'int_overridden': {'status': ['accepted_values']}}, test_ignore=['stg_ignored'], described=['status']),
}


@pytest.mark.parametrize('case', sorted(CASES))
def test_output_matches_original_writer(case):

    c = CASES[case]

    entries = build_schema_entries(copy.deepcopy(SAMPLE), copy.deepcopy(c['test_overwrite']), c['test_ignore'], c['described'])

    with open(os.path.join(FIXTURES, 'golden', case + '.yml')) as f:
        assert render_schema(entries) == f.read()


def test_test_overwrite_none_does_not_fail():

    entries = build_schema_entries({'m': {'a_pk': 'string'}}, None, [], [])

    assert entries[2] == [{'name': 'm', 'columns': [{'name': 'a_pk', 'tests': ['not_null', 'unique']}]}]


def test_read_described_columns():

    assert read_described_columns(os.path.join(FIXTURES, 'field_descriptions.md')) == ['order_pk', 'amount']


def test_schema_file_path_defaults():

    assert schema_file_path('/repo', None, None) == '/repo/models/droughty_schema.yml'


def test_schema_file_path_configured():

    assert schema_file_path('/repo', 'dbt/models', 'schema') == '/repo/dbt/models/schema.yml'

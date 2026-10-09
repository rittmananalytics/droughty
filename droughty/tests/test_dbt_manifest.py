"""Tests for droughty dbt manifest: reading manifest.json and writing the schema file."""

import copy
import hashlib
import json
import os
import shutil
import subprocess
import sys

import git
import pytest

from droughty.droughty_dbt.dbt_manifest_base_dict import (
    ManifestError,
    load_manifest,
    manifest_dict,
    root_project_name,
    select_models,
)
from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_output

FIXTURES = os.path.join(os.path.dirname(__file__), 'fixtures')
PACKAGE_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

EXPECTED_SCHEMA = """version: 2
models:
  - name: int_orders_joined
    columns: []
  - name: misc_lookup
    columns:
      - name: lookup_pk
        tests:
          - not_null
          - unique
  - name: stg_orders
    columns:
      - name: amount
        description: '{{doc("amount")}}'
        tests:
          - dbt_utils.at_least_one
      - name: customer_fk
        tests:
          - dbt_utils.at_least_one
      - name: order_pk
        description: '{{doc("order_pk")}}'
        tests:
          - not_null
          - unique
  - name: wh_orders_fact
    columns:
      - name: customer_fk
        tests:
          - dbt_utils.at_least_one
      - name: order_pk
        description: '{{doc("order_pk")}}'
        tests:
          - not_null
          - unique
      - name: valid_from
        tests:
          - 'dbt_utils.expression_is_true:expression: valid_from < valid_to'
          - not_null
          - unique
      - name: valid_to
        tests:
          - 'dbt_utils.expression_is_true:expression: valid_from < valid_to'
          - not_null
          - unique
"""


def fixture_manifest():

    with open(os.path.join(FIXTURES, 'manifest.json')) as f:
        return json.load(f)


def write_json(path, data):

    os.makedirs(os.path.dirname(path), exist_ok=True)

    with open(path, 'w') as f:
        json.dump(data, f)


@pytest.fixture
def dbt_repo(tmp_path):

    """A git repo holding a droughty project, field descriptions and target/manifest.json."""

    git.Repo.init(tmp_path)

    (tmp_path / 'droughty_project.yaml').write_text(
        "profile: does_not_exist\n"
        "field_description_path: docs\n"
        "field_description_file_name: field_descriptions.md\n"
    )
    (tmp_path / 'docs').mkdir()
    shutil.copy(os.path.join(FIXTURES, 'field_descriptions.md'), tmp_path / 'docs' / 'field_descriptions.md')
    write_json(str(tmp_path / 'target' / 'manifest.json'), fixture_manifest())

    return tmp_path


# --- loading ---

def test_missing_manifest_says_how_to_create_it(tmp_path):

    with pytest.raises(ManifestError, match='dbt parse'):
        load_manifest(str(tmp_path / 'target' / 'manifest.json'))


def test_invalid_json(tmp_path):

    path = tmp_path / 'manifest.json'
    path.write_text('{not json')

    with pytest.raises(ManifestError, match='not valid JSON'):
        load_manifest(str(path))


def test_not_a_manifest(tmp_path):

    path = tmp_path / 'manifest.json'
    path.write_text('{"nodes": {}}')

    with pytest.raises(ManifestError, match='does not look like a dbt manifest'):
        load_manifest(str(path))


def test_old_manifest_version_is_rejected(tmp_path):

    manifest = fixture_manifest()
    manifest['metadata']['dbt_schema_version'] = 'https://schemas.getdbt.com/dbt/manifest/v3.json'
    manifest['metadata']['dbt_version'] = '0.21.0'
    write_json(str(tmp_path / 'manifest.json'), manifest)

    with pytest.raises(ManifestError, match=r'manifest v3 \(dbt 0.21.0\)'):
        load_manifest(str(tmp_path / 'manifest.json'))


def test_unreadable_manifest_version_is_rejected(tmp_path):

    manifest = fixture_manifest()
    del manifest['metadata']['dbt_schema_version']
    write_json(str(tmp_path / 'manifest.json'), manifest)

    with pytest.raises(ManifestError, match='Could not read the manifest version'):
        load_manifest(str(tmp_path / 'manifest.json'))


def test_newer_manifest_version_warns_and_loads(tmp_path, capsys):

    manifest = fixture_manifest()
    manifest['metadata']['dbt_schema_version'] = 'https://schemas.getdbt.com/dbt/manifest/v99.json'
    write_json(str(tmp_path / 'manifest.json'), manifest)

    assert load_manifest(str(tmp_path / 'manifest.json'))['nodes']
    assert 'newer than the latest version' in capsys.readouterr().out


# --- model selection ---

def test_select_models_keeps_only_built_models_from_the_root_project():

    models = select_models(fixture_manifest())

    # no package models, ephemeral models, seeds or tests
    assert sorted(models) == ['int_orders_joined', 'misc_lookup', 'stg_orders', 'wh_orders_fact']


def test_select_models_reads_declared_columns_and_layer_details():

    stg_orders = select_models(fixture_manifest())['stg_orders']

    assert stg_orders['columns'] == {'order_pk': 'string', 'customer_fk': 'string', 'amount': ''}
    assert stg_orders['original_file_path'] == 'models/staging/stg_orders.sql'
    assert stg_orders['schema'] == 'analytics_staging'


def test_root_project_found_from_project_id_in_older_manifests():

    manifest = fixture_manifest()
    del manifest['metadata']['project_name']
    manifest['metadata']['project_id'] = hashlib.md5(b'jaffle').hexdigest()

    assert root_project_name(manifest) == 'jaffle'


def test_unknown_root_project_includes_all_packages(capsys):

    manifest = fixture_manifest()
    del manifest['metadata']['project_name']

    assert 'package_model' in select_models(manifest)
    assert 'Including models from all packages' in capsys.readouterr().out


def test_manifest_dict_is_sorted():

    nested = manifest_dict(select_models(fixture_manifest()))

    assert list(nested) == sorted(nested)
    assert list(nested['wh_orders_fact']) == ['customer_fk', 'order_pk', 'valid_from', 'valid_to']


# --- writing the schema file ---

def test_writes_schema_without_profile_or_warehouse(dbt_repo, monkeypatch):

    # no ~/.droughty/profile.yaml exists under this home directory
    monkeypatch.setenv('HOME', str(dbt_repo / 'home'))

    file_path = manifest_schema_output(cwd=str(dbt_repo))

    assert file_path == os.path.join(str(dbt_repo), 'models', 'droughty_schema.yml')

    with open(file_path) as f:
        assert f.read() == EXPECTED_SCHEMA


def test_warns_about_models_without_declared_columns(dbt_repo, capsys):

    manifest_schema_output(cwd=str(dbt_repo))

    assert '1 of 4 models have no columns declared in dbt YAML' in capsys.readouterr().out


def test_uses_dbt_path_test_ignore_and_test_overwrite(dbt_repo):

    (dbt_repo / 'droughty_project.yaml').write_text(
        "dbt_path: dbt/models\n"
        "dbt_tests_filename: schema\n"
        "test_ignore:\n  models:\n    - misc_lookup\n"
        "test_overwrite:\n  models:\n    stg_orders:\n      amount:\n        - not_null\n"
    )

    file_path = manifest_schema_output(cwd=str(dbt_repo))

    assert file_path == os.path.join(str(dbt_repo), 'dbt', 'models', 'schema.yml')

    with open(file_path) as f:
        text = f.read()

    assert '  - name: misc_lookup\n    columns: []\n' in text
    assert '      - name: amount\n        tests:\n          - not_null\n' in text


def test_manifest_path_setting_and_argument(dbt_repo):

    manifest = fixture_manifest()
    del manifest['nodes']['model.jaffle.misc_lookup']
    write_json(str(dbt_repo / 'dbt' / 'target' / 'manifest.json'), manifest)

    (dbt_repo / 'droughty_project.yaml').write_text("dbt_manifest_path: dbt/target/manifest.json\n")

    with open(manifest_schema_output(cwd=str(dbt_repo))) as f:
        assert 'misc_lookup' not in f.read()

    # --manifest-path wins over the setting
    with open(manifest_schema_output(cwd=str(dbt_repo), manifest_path=str(dbt_repo / 'target' / 'manifest.json'))) as f:
        assert 'misc_lookup' in f.read()


# --- command line ---

def run_droughty(cwd, *args):

    env = dict(os.environ, PYTHONPATH=PACKAGE_ROOT, HOME=str(cwd / 'home'))

    return subprocess.run(
        [sys.executable, '-m', 'droughty.main', *args],
        cwd=cwd, env=env, capture_output=True, text=True
    )


def test_command_line_writes_schema(dbt_repo):

    result = run_droughty(dbt_repo, 'dbt', 'manifest')

    assert result.returncode == 0, result.stdout + result.stderr
    assert (dbt_repo / 'models' / 'droughty_schema.yml').read_text() == EXPECTED_SCHEMA


def test_command_line_reports_missing_manifest(dbt_repo):

    result = run_droughty(dbt_repo, 'dbt', 'manifest', '--manifest-path', 'nowhere/manifest.json')

    assert result.returncode == 2
    assert 'No dbt manifest found' in result.stdout
    assert not (dbt_repo / 'models' / 'droughty_schema.yml').exists()

"""Builds the droughty dbt schema file from a dbt manifest instead of the warehouse.

Reads only droughty_project.yaml and manifest.json. No profile file or warehouse
connection is needed.
"""

import os

from droughty.droughty_core.project_settings import (
    get_git_root,
    project_file_path,
    load_project_settings,
    nested_setting
)
from droughty.droughty_dbt.dbt_manifest_base_dict import (
    load_manifest,
    select_models,
    manifest_dict
)
from droughty.droughty_dbt.dbt_schema_builder import (
    build_schema_entries,
    read_described_columns,
    render_schema,
    schema_file_path,
    write_schema
)


def resolve_manifest_path(cli_path, setting, git_path):

    """--manifest-path is relative to the current directory; dbt_manifest_path is relative to the git root."""

    if cli_path != None:

        return os.path.abspath(cli_path)

    if setting != None:

        return os.path.join(git_path, setting)

    return os.path.join(git_path, 'target', 'manifest.json')


def described_columns(droughty_project, git_path):

    path = droughty_project.get('field_description_path')
    file_name = droughty_project.get('field_description_file_name')

    if path == None or file_name == None:

        return []

    try:

        return read_described_columns(os.path.join(git_path, path, file_name))

    except Exception as e:

        print(f"Exception creating described_columns_list: {e}")

        return []


def manifest_schema_output(project_dir=None, manifest_path=None, cwd=None):

    git_path = get_git_root(cwd or os.getcwd())

    droughty_project = load_project_settings(project_file_path(project_dir, git_path))

    path = resolve_manifest_path(manifest_path, droughty_project.get('dbt_manifest_path'), git_path)

    print(f"Using dbt manifest {path}")

    models = select_models(load_manifest(path))

    no_columns = [name for name in sorted(models) if not models[name]['columns']]

    if no_columns:

        print(
            f"Warning: {len(no_columns)} of {len(models)} models have no columns declared in dbt YAML "
            f"and are listed without columns: {', '.join(no_columns[:10])}{' ...' if len(no_columns) > 10 else ''}"
        )

    entries = build_schema_entries(
        manifest_dict(models),
        nested_setting(droughty_project, 'test_overwrite', 'models'),
        nested_setting(droughty_project, 'test_ignore', 'models') or [],
        described_columns(droughty_project, git_path)
    )

    file_path = schema_file_path(
        git_path,
        droughty_project.get('dbt_path'),
        droughty_project.get('dbt_tests_filename')
    )

    write_schema(file_path, render_schema(entries))

    print(f"Wrote {len(models)} models to {file_path}")

    return file_path

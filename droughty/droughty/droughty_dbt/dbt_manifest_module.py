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
    write_schema
)
from droughty.droughty_dbt.dbt_schema_layers import (
    layer_settings,
    schema_files,
    stale_schema_files,
    remove_or_report_stale
)
from droughty.droughty_dbt.dbt_schema_check import (
    ci_check_enabled,
    compare_schema_files,
    print_check_result
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


def manifest_schema_files(git_path, droughty_project, manifest_path=None):

    """Return ({path: YAML text}, number of models) for the schema files droughty would write."""

    settings = layer_settings(droughty_project)

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

    files = schema_files(
        entries,
        models,
        git_path,
        droughty_project.get('dbt_path'),
        droughty_project.get('dbt_tests_filename'),
        settings
    )

    return files, len(models)


def manifest_schema_output(project_dir=None, manifest_path=None, cwd=None, clean=False):

    """Write the schema file(s) and return their paths."""

    git_path = get_git_root(cwd or os.getcwd())

    droughty_project = load_project_settings(project_file_path(project_dir, git_path))

    files, model_count = manifest_schema_files(git_path, droughty_project, manifest_path)

    for file_path, text in files.items():

        write_schema(file_path, text)

    print(f"Wrote {model_count} models to {', '.join(files)}")

    remove_or_report_stale(
        stale_schema_files(files, git_path, droughty_project.get('dbt_path'), droughty_project.get('dbt_tests_filename')),
        clean
    )

    return list(files)


def manifest_schema_check(project_dir=None, manifest_path=None, cwd=None):

    """Compare the committed schema files with the manifest without writing anything.

    Returns True if in sync, False if not, and None if dbt_ci_check is false.
    """

    git_path = get_git_root(cwd or os.getcwd())

    droughty_project = load_project_settings(project_file_path(project_dir, git_path))

    if not ci_check_enabled(droughty_project):

        print("dbt_ci_check is false in droughty_project.yaml, so the check is skipped.")

        return None

    files, model_count = manifest_schema_files(git_path, droughty_project, manifest_path)

    stale = stale_schema_files(files, git_path, droughty_project.get('dbt_path'), droughty_project.get('dbt_tests_filename'))

    result = compare_schema_files(files, stale, git_path)

    print_check_result(result, model_count, len(files), 'droughty dbt manifest --clean')

    return result['in_sync']

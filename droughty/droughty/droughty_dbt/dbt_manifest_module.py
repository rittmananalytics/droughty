"""Builds the droughty dbt schema file from the dbt manifest instead of listing warehouse tables.

The model list comes from the manifest, so tables left in the warehouse by deleted or
renamed models are never picked up. Columns for unchanged models come from the
manifest (that is, from droughty's own schema files). New and changed models are
built empty in a scratch target to read their real columns (see dbt_build_changed).

Reads droughty_project.yaml and runs dbt. droughty's profile file is not used.
"""

import os
import tempfile

from droughty.droughty_core.project_settings import (
    get_git_root,
    project_file_path,
    load_project_settings,
    nested_setting,
    dbt_project_dir,
    dbt_target_path
)
from droughty.droughty_dbt.dbt_manifest_base_dict import (
    load_manifest,
    select_models,
    manifest_dict
)
from droughty.droughty_dbt.dbt_build_changed import (
    Dbt,
    build_settings,
    columns_for_changed_models
)
from droughty.droughty_dbt.dbt_schema_builder import (
    build_schema_entries,
    read_described_columns,
    write_schema
)
from droughty.droughty_dbt.dbt_schema_layers import (
    layer_settings,
    schema_files,
    remove_or_report_stale
)
from droughty.droughty_dbt.dbt_schema_paths import (
    stale_schema_files,
    described_elsewhere
)


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


def _listed(names):

    names = sorted(names)

    return ', '.join(names[:10]) + (' ...' if len(names) > 10 else '')


def manifest_schema_output(project_dir=None, cwd=None, clean=False, dbt=None):

    """Write the schema file(s) and return their paths. dbt can be replaced in tests."""

    git_path = get_git_root(cwd or os.getcwd())

    droughty_project = load_project_settings(project_file_path(project_dir, git_path))

    settings = layer_settings(droughty_project)
    build = build_settings(droughty_project)

    dbt_dir = dbt_project_dir(droughty_project, git_path)
    dbt = dbt or Dbt(build['dbt_command'], dbt_dir)

    dbt_path = droughty_project.get('dbt_path')
    dbt_tests_filename = droughty_project.get('dbt_tests_filename')
    ignored = set(nested_setting(droughty_project, 'test_ignore', 'models') or [])

    print("Running dbt parse")

    dbt.run(['parse'])

    manifest = load_manifest(os.path.join(dbt_target_path(dbt_dir), 'manifest.json'))

    models = select_models(manifest)

    elsewhere = described_elsewhere(models, git_path, dbt_dir, dbt_path, dbt_tests_filename)

    if elsewhere:

        print(
            f"Warning: {len(elsewhere)} models are described in their own YAML files, so droughty leaves them out "
            f"(dbt fails if a model is described in two files): {_listed(elsewhere)}"
        )

    with tempfile.TemporaryDirectory(prefix='droughty-') as work_dir:

        built = columns_for_changed_models(
            dbt, build, git_path, dbt_dir, models, ignored | set(elsewhere),
            manifest['metadata'].get('adapter_type'), work_dir
        )

    for name, columns in built.items():

        models[name]['columns'] = columns

    models = {name: model for name, model in models.items() if name not in elsewhere}

    no_columns = [name for name in models if not models[name]['columns'] and name not in ignored]

    if no_columns:

        print(f"Warning: {len(no_columns)} of {len(models)} models have no columns and are listed without tests: {_listed(no_columns)}")

    entries = build_schema_entries(
        manifest_dict(models),
        nested_setting(droughty_project, 'test_overwrite', 'models'),
        list(ignored),
        described_columns(droughty_project, git_path)
    )

    files = schema_files(entries, models, git_path, dbt_path, dbt_tests_filename, settings)

    for file_path, text in files.items():

        write_schema(file_path, text)

    print(f"Wrote {len(models)} models to {', '.join(files)}")

    remove_or_report_stale(
        stale_schema_files(files, git_path, dbt_path, dbt_tests_filename),
        clean
    )

    return list(files)

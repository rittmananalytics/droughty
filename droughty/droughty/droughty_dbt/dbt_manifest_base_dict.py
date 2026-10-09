"""Reads models and columns from a dbt manifest.json (written by dbt parse or dbt compile).

The model list comes only from the manifest, so tables left behind in the
warehouse by deleted or renamed models are never picked up. Columns are the
ones declared in dbt YAML files.
"""

import hashlib
import json
import os
import re

# manifest v4 was introduced with dbt 1.0
MIN_MANIFEST_VERSION = 4
# the newest manifest version droughty has been tested against
MAX_KNOWN_MANIFEST_VERSION = 12


class ManifestError(Exception):
    pass


def manifest_version(manifest):

    schema_version = manifest.get('metadata', {}).get('dbt_schema_version', '')

    match = re.search(r'/manifest/v(\d+)\.json', schema_version or '')

    if match == None:

        return None

    return int(match.group(1))


def load_manifest(path):

    if not os.path.exists(path):

        raise ManifestError(
            f"No dbt manifest found at {path}. "
            f"Run `dbt parse` or `dbt compile` in your dbt project first, "
            f"or point droughty at the file with --manifest-path or dbt_manifest_path."
        )

    try:

        with open(path) as f:
            manifest = json.load(f)

    except json.JSONDecodeError as e:

        raise ManifestError(f"{path} is not valid JSON: {e}")

    if not isinstance(manifest, dict) or 'metadata' not in manifest or 'nodes' not in manifest:

        raise ManifestError(f"{path} does not look like a dbt manifest (no metadata or nodes).")

    version = manifest_version(manifest)
    dbt_version = manifest['metadata'].get('dbt_version', 'unknown')

    if version == None:

        raise ManifestError(
            f"Could not read the manifest version from {path}. "
            f"Expected metadata.dbt_schema_version like https://schemas.getdbt.com/dbt/manifest/v12.json"
        )

    if version < MIN_MANIFEST_VERSION:

        raise ManifestError(
            f"{path} uses manifest v{version} (dbt {dbt_version}). "
            f"droughty dbt manifest needs manifest v{MIN_MANIFEST_VERSION} or later (dbt 1.0 or later). "
            f"Upgrade dbt and run `dbt parse` again."
        )

    if version > MAX_KNOWN_MANIFEST_VERSION:

        print(
            f"Warning: {path} uses manifest v{version} (dbt {dbt_version}), newer than the latest version "
            f"droughty has been tested with (v{MAX_KNOWN_MANIFEST_VERSION}). Continuing."
        )

    return manifest


def root_project_name(manifest):

    """Return the name of the dbt project that produced the manifest, so package models can be skipped."""

    metadata = manifest.get('metadata', {})

    if metadata.get('project_name'):

        return metadata['project_name']

    # older manifests only hold project_id, which dbt sets to the md5 hash of the project name

    project_id = metadata.get('project_id')

    packages = {node.get('package_name') for node in manifest.get('nodes', {}).values() if node.get('package_name')}

    for package in packages:

        if hashlib.md5(package.encode('utf-8')).hexdigest() == project_id:

            return package

    return None


def select_models(manifest):

    """Return {model name: {original_file_path, schema, columns}} for the root project's non-ephemeral models."""

    root = root_project_name(manifest)

    if root == None:

        print("Warning: could not tell which package is your dbt project. Including models from all packages.")

    models = {}

    for unique_id, node in sorted(manifest['nodes'].items()):

        if node.get('resource_type') != 'model':
            continue

        if root != None and node.get('package_name') != root:
            continue

        # ephemeral models are not built in the warehouse, so dbt cannot test them
        if (node.get('config') or {}).get('materialized') == 'ephemeral':
            continue

        name = node.get('name')

        if name in models:

            print(f"Warning: more than one model is named {name} (versioned model?). Using {models[name]['unique_id']}.")

            continue

        columns = {}

        for column_name, column in (node.get('columns') or {}).items():

            columns[column_name] = (column or {}).get('data_type') or ''

        models[name] = {
            'unique_id': unique_id,
            'original_file_path': node.get('original_file_path'),
            'schema': node.get('schema'),
            'columns': columns,
        }

    return models


def manifest_dict(models):

    """Return {model: {column: data_type}} sorted by name, the same shape and order the warehouse source produces."""

    return {name: dict(sorted(models[name]['columns'].items())) for name in sorted(models)}

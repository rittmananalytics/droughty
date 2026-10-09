"""Console script for droughty dbt manifest."""

import sys

import git

from droughty.droughty_core.config_cli import Common
from droughty.droughty_dbt.dbt_manifest_base_dict import ManifestError
from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_output, manifest_schema_check
from droughty.droughty_dbt.dbt_schema_check import CheckError
from droughty.droughty_dbt.dbt_schema_layers import LayerError

ERRORS = (ManifestError, LayerError, CheckError, FileNotFoundError, git.InvalidGitRepositoryError)


def manifest():

    if Common.check:

        return manifest_check()

    print("Generating dbt tests from the dbt manifest")

    try:

        manifest_schema_output(
            project_dir=Common.project_dir,
            manifest_path=Common.manifest_path,
            clean=Common.clean
        )

    except ERRORS as e:

        print(f"Error: {e}")

        sys.exit(2)

    print("dbt tests generated")


def manifest_check():

    """Exit 0 if the schema files are in sync (or the check is off), 1 if not, 2 on error."""

    print("Checking the droughty schema against the dbt manifest")

    try:

        in_sync = manifest_schema_check(
            project_dir=Common.project_dir,
            manifest_path=Common.manifest_path
        )

    except ERRORS as e:

        print(f"Error: {e}")

        sys.exit(2)

    sys.exit(1 if in_sync == False else 0)

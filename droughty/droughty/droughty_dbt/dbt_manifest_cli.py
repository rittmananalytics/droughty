"""Console script for droughty dbt manifest."""

import sys

import git

from droughty.droughty_core.config_cli import Common
from droughty.droughty_dbt.dbt_manifest_base_dict import ManifestError
from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_output
from droughty.droughty_dbt.dbt_schema_layers import LayerError


def manifest():

    print("Generating dbt tests from the dbt manifest")

    try:

        manifest_schema_output(
            project_dir=Common.project_dir,
            manifest_path=Common.manifest_path,
            clean=Common.clean
        )

    except (ManifestError, LayerError, FileNotFoundError, git.InvalidGitRepositoryError) as e:

        print(f"Error: {e}")

        sys.exit(2)

    print("dbt tests generated")

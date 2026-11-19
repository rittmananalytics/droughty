"""Console script for droughty dbt manifest."""

import sys

from droughty.droughty_core.config_cli import Common
from droughty.droughty_dbt.dbt_build_changed import BuildError
from droughty.droughty_dbt.dbt_manifest_base_dict import ManifestError
from droughty.droughty_dbt.dbt_manifest_module import manifest_schema_output
from droughty.droughty_dbt.dbt_schema_layers import LayerError


def manifest():

    print("Generating dbt tests from the dbt manifest")

    try:

        manifest_schema_output(
            project_dir=Common.project_dir,
            clean=Common.clean
        )

    except (BuildError, ManifestError, LayerError, FileNotFoundError) as e:

        print(f"Error: {e}")

        sys.exit(2)

    print("dbt tests generated")

"""Console script for droughty dbt modules."""

import sys

from droughty.droughty_core.config_cli import Common
from droughty.droughty_dbt.dbt_test_module import schema_output, schema_check
from droughty.droughty_dbt.dbt_schema_check import CheckError
from droughty.droughty_dbt.dbt_schema_layers import LayerError


def tests():

    if Common.check:

        return tests_check()

    print("Generating dbt tests")

    try:

        schema_output()

    except LayerError as e:

        print(f"Error: {e}")

        sys.exit(2)

    print("dbt tests generated")


def tests_check():

    """Exit 0 if the schema files are in sync (or the check is off), 1 if not, 2 on error."""

    print("Checking the droughty schema against the warehouse")

    try:

        in_sync = schema_check()

    except (LayerError, CheckError) as e:

        print(f"Error: {e}")

        sys.exit(2)

    sys.exit(1 if in_sync == False else 0)

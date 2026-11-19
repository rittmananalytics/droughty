"""Console script for droughty dbt modules."""

import sys

from droughty.droughty_dbt.dbt_test_module import schema_output
from droughty.droughty_dbt.dbt_schema_layers import LayerError


def tests():

    print("Generating dbt tests")

    try:

        schema_output()

    except LayerError as e:

        print(f"Error: {e}")

        sys.exit(2)

    print("dbt tests generated")

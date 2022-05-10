"""Console script for droughty dbt modules."""

from droughty.dbt_test_module import schema_output


def tests():

    print("Generating dbt tests")

    try:

        return schema_output()

    finally:

        print("dbt tests generated")


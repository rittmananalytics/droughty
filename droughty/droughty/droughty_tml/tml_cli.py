"""Console script for droughty dbt modules."""

from droughty.droughty_tml.tml_module import schema_output


def tml():

    print("Generating tml")

    try:

        return schema_output()

    finally:

        print("tml generated")


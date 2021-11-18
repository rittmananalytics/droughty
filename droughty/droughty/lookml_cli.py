"""Console script for droughty."""
import sys
import click

from .lookml_module import output


@click.command()
def lookml():
    """Console script for droughty."""
    click.echo("dbt_tests generated")

    return output()
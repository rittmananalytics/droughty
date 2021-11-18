"""Console script for droughty."""
import sys
import click

from .dbt_test_module import schema_output


# Command Group
@click.group(name='dbt')
def dbt_tests():
    """Tool related commands"""
    pass

@dbt_tests.command(name='dbt test generation', help='lookml')
def dbt_test_gen():

    click.echo("dbt tests generated")
  
    return schema_output()

if __name__ == '__main__':
    dbt_tests()

    
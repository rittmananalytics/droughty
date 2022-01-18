"""Console script for droughty."""
import sys
import click

from droughty.lookml_module import output
from droughty.dbt_test_module import schema_output
from droughty.dbml_module import dbml_output

@click.group(invoke_without_command=False)
@click.pass_context

def cli(ctx):


    if ctx.invoked_subcommand is None:
        click.echo('I was invoked without subcommand')

    else:
        click.echo(f"I am about to invoke {ctx.invoked_subcommand}")

@cli.command()

def lookml():

    """Generates base lookml"""
    click.echo("lookml generated")

    return output()

@cli.command()

def dbt_tests():
    """Generates basic dbt tests"""
    click.echo("dbt_tests generated")

    return schema_output()

@cli.command()

def dbml():
    """Generates dbml"""
    click.echo("dbml generated")

    return dbml_output()




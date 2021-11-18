"""Console script for droughty."""
import sys
import click

from .droughty_init import wh_init

@click.command()
def init(args=None):
    """Console script for droughty."""
    click.echo("Replace this message by putting your code into "
               "droughty.cli.init")
    click.echo("See click documentation at https://click.palletsprojects.com/")
    return init()
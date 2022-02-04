"""Console script for droughty."""
import typer

from lookml_module import output
from lookml_explore_module import explore_output

app = typer.Typer()


@app.command()
def conquer():

    typer.echo(f"Conquering reign:")

    return output()


@app.command()
def destroy(name: str):
    typer.echo(f"Destroying reign: {name}")

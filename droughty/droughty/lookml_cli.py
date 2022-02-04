"""Console script for droughty."""
import typer

from lookml_module import output
from lookml_explore_module import explore_output
from lookml_measure_module import measure_output

app = typer.Typer()


@app.command()
def base():

    typer.echo(f"Generating lookml base layer")

    return output()

@app.command()
def explore():

    typer.echo(f"Generating explore layer")

    return explore_output()

@app.command()
def measures():

    typer.echo(f"Generating measure layer")

    return measure_output()

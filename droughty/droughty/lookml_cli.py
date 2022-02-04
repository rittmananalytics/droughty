"""Console script for droughty."""
import typer
import time
from tqdm import tqdm

from lookml_module import output
from lookml_explore_module import explore_output
from lookml_measure_module import measure_output

app = typer.Typer()


@app.command()

def base():

    typer.echo(f"Generating lookml base layer")

    total = 0
    with typer.progressbar(range(100), label = "Processing") as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1
    try:

        return output()

    finally:

        print ("lookml base layer generated")

@app.command()

def explore():

    typer.echo(f"Generating explore layer")

    total = 0
    with typer.progressbar(range(100), label = "Processing") as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1
    try:

        return explore_output()

    finally:

        print ("lookml explore layer generated")

@app.command()

def measures():

    typer.echo(f"Generating measure layer")

    total = 0
    with typer.progressbar(range(100), label = "Processing") as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1
    try:

        return measure_output()

    finally:

        typer.secho("lookml measure layer generated",fg=typer.colors.GREEN)
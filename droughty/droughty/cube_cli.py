"""Console script for droughty."""
import typer
import time
from tqdm import tqdm

from droughty.cube_module import output
from droughty.cube_explore_module import explore_output
from droughty.cube_measure_module import measure_output

from droughty import warehouse_target

dimensional_inference_status = warehouse_target.dimensional_inference


app = typer.Typer()

@app.command()

def base():

    typer.echo(f"Generating cube base layer")

    total = 0
    with typer.progressbar(range(100), label = "Processing") as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1
    try:

        return output()

    finally:

        typer.secho("cube base layer generated",fg=typer.colors.GREEN)


@app.command()

def explore():

    typer.echo(f"Generating explore layer")

    total = 0
    with typer.progressbar(range(100), label = "Processing") as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1


        if dimensional_inference_status == "enabled":

            return explore_output()

            typer.secho("cube explore layer generated",fg=typer.colors.GREEN)


        else: 

            raise Exception("Please enable dimensional inference")


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

        typer.secho("cube measure layer generated",fg=typer.colors.GREEN)

@app.command()

def full_refresh():

    for func in [base, explore, measures]:

        result = func()
"""Console script for droughty."""

import typer
import time
from tqdm import tqdm

from droughty.dbt_test_module import schema_output

app = typer.Typer()


@app.command()
def tests():
    typer.echo(f"Generating dbt tests")

    total = 0
    with typer.progressbar(range(100), label = "Processing") as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1
    try:

        return schema_output()

    finally:

        typer.secho("dbt tests generated",fg=typer.colors.GREEN)

if __name__ == "__main__":
    app()


"""Console script for droughty."""

import typer
import time

from droughty.dbml_module import dbml_output

app = typer.Typer()


@app.command()
def erd():
    typer.echo(f"Generating erd")

    total = 0
    with typer.progressbar(range(100), label = "Processing") as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1
    try:

        return dbml_output()

    finally:

        typer.secho("dbml erd generated",fg=typer.colors.GREEN)


if __name__ == "__main__":
    app()


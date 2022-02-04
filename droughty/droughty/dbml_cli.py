"""Console script for droughty."""

import typer
import time

from dbml_module import dbml_output

app = typer.Typer()


@app.command()
def erd():
    typer.echo(f"Generating erd")

    total = 0
    with typer.progressbar(range(100)) as progress:
        for value in progress:
            # Fake processing time
            time.sleep(0.01)
            total += 1
    typer.echo(f"Processed {total} things.")

    return dbml_output()


if __name__ == "__main__":
    app()


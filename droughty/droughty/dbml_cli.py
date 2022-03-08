"""Console script for droughty."""

import typer
import time

from droughty.dbml_module import dbml_output

from droughty.dbml_base_dict import d1


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

    if d1 != False:

        return dbml_output()

    else: 

        raise Exception("It doesn't look like you have declared any primary or foreign keys")


if __name__ == "__main__":
    app()


"""Console script for droughty."""

import typer

from dbml_module import dbml_output

app = typer.Typer()


@app.command()
def erd():
    typer.echo(f"Generating erd")

    return dbml_output()


if __name__ == "__main__":
    app()


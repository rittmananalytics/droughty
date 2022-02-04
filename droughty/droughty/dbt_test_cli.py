"""Console script for droughty."""

import typer

from dbt_test_module import schema_output

app = typer.Typer()


@app.command()
def dbt():
    typer.echo(f"Founding town")

    return schema_output()


if __name__ == "__main__":
    app()


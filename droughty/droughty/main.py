import typer

from droughty import lookml_cli 
from droughty import dbt_test_cli
from droughty import dbml_cli

app = typer.Typer()

app.add_typer(lookml_cli.app, name="lookml")
app.add_typer(dbt_test_cli.app, name="dbt")
app.add_typer(dbml_cli.app, name="dbml")

if __name__ == "__main__":
    app()
import typer

import lookml_cli 
import dbt_test_cli

app = typer.Typer()

app.add_typer(lookml_cli.app, name="lookml")
app.add_typer(dbt_test_cli.app, name="dbt-tests")

if __name__ == "__main__":
    app()
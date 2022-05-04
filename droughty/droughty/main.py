from cgi import test
import typer
import click

from dataclasses import dataclass


from droughty import lookml_cli 
#from droughty import dbt_test_cli
#from droughty import dbml_cli
#from droughty import cube_cli
from droughty import config_cli

app = typer.Typer(callback=config_cli.profile_callback)

app.add_typer(lookml_cli.app, name="lookml")
##app.add_typer(dbt_test_cli.app, name="dbt")
##app.add_typer(dbml_cli.app, name="dbml")
##app.add_typer(cube_cli.app, name="cube")

##app.add_typer(config_cli.app)

#####

if __name__ == "__main__":
    app()
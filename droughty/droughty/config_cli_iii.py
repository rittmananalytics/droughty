from dataclasses import dataclass

from click import command
import typer

app = typer.Typer()
@dataclass
class Common:

    def __init__(self, profile_dir):

        self.profile_dir = profile_dir

@app.callback()
def profile_callback(ctx: typer.Context,
                     profile_dir: str = typer.Option(..., )):

    typer.echo(f"Hello {profile_dir}")

    """Common Entry Point"""
    ctx.obj = Common(profile_dir)

    return (f"{profile_dir}")

def profile_dir_func():
                    ##callback=profile_callback)):
    
    profile_dir = "/Users/lewischarlesbaker/.droughty/"
    
    return profile_dir

##profile_path = Common("/Users/lewischarlesbaker/.droughty/")

profile_path = profile_dir_func()

cli_profile_path = profile_path
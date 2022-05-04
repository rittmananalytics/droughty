from dataclasses import dataclass
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

    ##test_dir = {profile_dir}
    ##test_dir = "/Users/lewischarlesbaker/.droughty/"
    ##test_dir = {profile_dir}

    """Common Entry Point"""
    ctx.obj = Common(profile_dir)

    return (f"{profile_dir}")

#def profile_dir_func(profile_dir: str = typer.Option(..., callback=profile_callback)):
    
    #return (f"{profile_dir}")

profile_path = Common("/Users/lewischarlesbaker/.droughty/")

cli_profile_path = (profile_path.profile_dir)

#cli_profile_path = profile_dir_func()

##cli_profile_path = "/Users/lewischarlesbaker/.droughty/"

##print (cli_profile_path)

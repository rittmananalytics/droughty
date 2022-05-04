from dataclasses import dataclass
import typer

app = typer.Typer()
@dataclass
class Common:
    profile_dir: str

def device_info(ctx: typer.Context):
    """Get device info"""
    return {ctx.obj.profile_dir}

@app.callback()
def profile_callback(ctx: typer.Context,
                     profile_dir: str = typer.Option(..., )):

    typer.echo(f"Hello {profile_dir}")

    ##test_dir = {profile_dir}
    ##test_dir = "/Users/lewischarlesbaker/.droughty/"
    ##test_dir = {profile_dir}

    """Common Entry Point"""
    ctx.obj = Common(profile_dir)

    return {profile_dir}


cli_profile_path = device_info()

##cli_profile_path = "/Users/lewischarlesbaker/.droughty/"

##print (cli_profile_path)

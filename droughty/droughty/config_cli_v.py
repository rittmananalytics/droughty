from dataclasses import dataclass
import typer

app = typer.Typer()
@dataclass
class Common:
    def __init__(self, profile_dir):

        self.profile_dir = profile_dir

@app.callback(invoke_without_command=True)
def profile_callback(##ctx: typer.Context,
                     profile_dir: str = typer.Option(..., )):

    typer.echo(f"Hello, test {profile_dir}")

    """Common Entry Point"""
    ##ctx.obj = Common(profile_dir)

    return (f"{profile_dir}")


profile_path = profile_callback()

##profile_path = Common("profile_dir")

cli_profile_path = profile_path
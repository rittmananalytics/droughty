"""Console script for droughty."""

import typer
import time
from dataclasses import dataclass

app = typer.Typer()

@dataclass
class Common:
    profile_dir: str

@app.callback()
def common(ctx: typer.Context,
           profile_dir: str = typer.Option(..., )):

    typer.echo(f"Hello {profile_dir}")

    DEFAULT_PROFILES_DIR = """{}""".format(profile_dir)

    """Common Entry Point"""
    ctx.obj = Common(profile_dir)

if __name__ == "__main__":
    app()


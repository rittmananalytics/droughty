from dataclasses import dataclass
import typer

import os
import yaml

app = typer.Typer()

@dataclass
class Common:

    profile_dir: str

@app.callback()
def profile_callback(ctx: typer.Context,
                    profile_dir: str = typer.Option(...)
                    ):
    
    print(f"Hello, my name is {profile_dir}")

    ctx.obj = Common(profile_dir)

    Common.profile_dir = f" {profile_dir}"

   ## Common.profile_dir = "/Users/lewischarlesbaker/.droughty/profile.yaml"

cli_profile_path = profile_callback()
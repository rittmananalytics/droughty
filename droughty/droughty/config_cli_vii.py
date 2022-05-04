from dataclasses import dataclass
import typer

import os
import yaml

app = typer.Typer()

@dataclass
class Common:

    def __init__(profile_dir, name):
        profile_dir.name = name

    @app.callback()
    def profile_callback(ctx: typer.Context,
                        profile_dir: str = typer.Option(..., )):
        
        print(f"Hello, my name is {profile_dir}")

        ctx.obj = Common(profile_dir)

    def assignment(profile_dir: str = typer.Option(..., )):
    
        p = (f" assignment test {profile_dir}")
        print (p)
        return p

##cli_profile_path = Common.assignment()

cli_profile_path = Common.profile_callback

##profile_path = Common()

##profile_path = Common("profile_dir")

##cli_profile_path = (profile_path.profile_dir)
from dataclasses import dataclass
import typer

import os
import yaml

app = typer.Typer()

@dataclass
class Common:

    profile_dir: str

@app.callback()
def profile_callback(#ctx: typer.Context,
                    profile_dir: str = typer.Option(...)
                    ):
    
    print(f"Hello, my name is {profile_dir}")

    #ctx.obj = Common(profile_dir)

    Common.profile_dir = "test me"



##def assignment(profile_dir: str = typer.Option(...)):

    ##profile_dir

    ##return profile_dir

##cli_profile_path = Common.assignment()


Common.profile_dir = "test me"

##cli_profile_path = profile_callback()

##profile_path = Common("profile_dir")

##cli_profile_path = (profile_path.profile_dir)
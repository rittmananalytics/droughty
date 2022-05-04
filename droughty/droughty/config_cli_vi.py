from dataclasses import dataclass
import typer

import os
import yaml

app = typer.Typer()
@dataclass
class Common:

    profile_dir = str

    @app.callback()
    def profile_callback(ctx: typer.Context,
                        profile_dir: str = typer.Option(..., )):

        path = (f"{profile_dir}")

        ctx.obj = Common(profile_dir)

        profile_pass = os.path.join(path,"profile.yaml")

        with open(profile_pass) as f:
            lookml_config = yaml.load(f, Loader=yaml.FullLoader)

        return lookml_config


profile_path = Common()

##profile_path = Common("profile_dir")

cli_profile_path = (profile_path.profile_dir)
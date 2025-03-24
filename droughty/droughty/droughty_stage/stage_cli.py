"""Console script for droughty stage."""

import platform
import sys

from droughty.droughty_stage.stage_main import droughty_stage_main

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables
)

dimensional_inference_status = ExploresVariables.explore_tables

def stage():
    # OS discovery
    system = platform.system().lower()

    if system not in ['darwin', 'linux']:
        print("Due to running shell scripts, the stage command is only supported on MacOS. Exiting")
        sys.exit(1)

    print("Generating stage layer model files")

    try:
        # Run the function
        droughty_stage_main()
        print("Stage layer generated successfully")
    
    except Exception as e:
        print(f"Error occurred while generating stage layer")
        print(e)

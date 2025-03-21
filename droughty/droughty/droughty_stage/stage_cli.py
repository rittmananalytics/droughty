"""Console script for droughty lookml modules."""

from droughty.droughty_stage.stage_main import droughty_stage_main

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables
)

dimensional_inference_status = ExploresVariables.explore_tables

def basic_function():
    print("Hello world 2")


def stage():

    print("Hello world")

    try:

        return droughty_stage_main()

    finally:

        print("stage layer generated")
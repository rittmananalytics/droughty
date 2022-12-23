"""Console script for droughty lookml modules."""

from droughty.droughty_docs.openai_descriptions import description_output

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables
)

dimensional_inference_status = ExploresVariables.explore_tables

def docs():

    print("Generating docs base layer")

    try:

        return description_output()

    finally:

        print("docs base layer generated")
"""Console script for droughty cube module."""

from droughty.cube_module import output
from droughty.cube_explore_module import explore_output
from droughty.cube_measure_module import measure_output

from droughty.config import ExploresVariables

dimensional_inference_status = ExploresVariables.dimensional_inference

def base():

    print("Generating cube base layer")

    try:

        return output()

    finally:

        print("cube base layer generated")

def explore():

    print("Generating explore layer")

    if dimensional_inference_status == "enabled":

        try:

            return explore_output()

        finally:

            print("cube explore layer generated")

    else: 

        raise Exception("Please enable dimensional inference")


def measures():

    print("Generating measure layer")

    try:

        return measure_output()

    finally:

        print("cube measure layer generated")

#def full_refresh():
#
#    for func in [base, explore, measures]:
#
#        result = func()
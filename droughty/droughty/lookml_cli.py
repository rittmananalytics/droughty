"""Console script for droughty lookml modules."""

from droughty.lookml_module import output
from droughty.lookml_explore_module import explore_output
from droughty.lookml_measure_module import measure_output

from droughty.config import ExploresVariables

dimensional_inference_status = ExploresVariables.dimensional_inference

def lookml_base():

    print("Generating lookml base layer")

    try:

        return output()

    finally:

        print("lookml base layer generated")

def lookml_explore():

        if dimensional_inference_status == "enabled":

            try:

                return explore_output()
            
            finally:

                print("lookml explore layer generated")

        else: 

            raise Exception("Please enable dimensional inference")



def lookml_measures():

    print("Generating measure layer")

    try:

        return measure_output()

    finally:

        print("lookml measure layer generated")


#def full_refresh():
#
#    for func in [base, explore, measures]:
#
#        result = func()
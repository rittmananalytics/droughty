"""Console script for droughty lookml modules."""

from droughty.lookml_module import output
from droughty.lookml_explore_module import explore_output
from droughty.lookml_measure_module import measure_output

from droughty import warehouse_target

dimensional_inference_status = warehouse_target.dimensional_inference

def base():

    print("Generating lookml base layer")

    try:

        return output()

    finally:

        print("lookml base layer generated")

def explore():

        if dimensional_inference_status == "enabled":

            try:

                return explore_output()
            
            finally:

                print("lookml explore layer generated")

        else: 

            raise Exception("Please enable dimensional inference")



def measures():

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
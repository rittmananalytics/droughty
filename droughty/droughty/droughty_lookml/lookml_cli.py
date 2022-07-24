"""Console script for droughty lookml modules."""

from droughty.droughty_lookml.lookml_module import output
from droughty.droughty_lookml.lookml_explore_module import explore_output
from droughty.droughty_lookml.lookml_measure_module import measure_output
from droughty.droughty_lookml.lookml_pop_module import pop_output
from droughty.droughty_lookml.lookml_pop_module_snowflake import pop_output_snowflake

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables
)

dimensional_inference_status = ExploresVariables.explore_tables

def lookml_base():

    print("Generating lookml base layer")

    try:

        return output()

    finally:

        print("lookml base layer generated")

def lookml_explore():

    if ExploresVariables.explore_tables != None:

        print("Generating explore layer")

        try: 

            return explore_output()
        
        finally:

            print("lookml explore layer generated")

    else:

        pass

def lookml_measures():

    print("Generating measure layer")

    try:

        return measure_output()

    finally:

        print("lookml measure layer generated")

def lookml_pop():

    if ExploresVariables.lookml_pop != None:

        print("Generating base parameter layer")

        try:

            if ProjectVariables.warehouse == 'big_query':

                return pop_output()

            elif ProjectVariables.warehouse == 'snowflake':

                return pop_output_snowflake()

        finally:

            print("lookml base parameter layer generated")


#def full_refresh():
#
#    for func in [base, explore, measures]:
#
#        result = func()
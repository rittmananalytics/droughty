"""Console script for droughty dbml modules."""

from droughty.dbml_module import dbml_output
from droughty.dbml_base_dict import d1

def erd():

    print("Generating dbml erd")

    if d1 != False:

        try:

            return dbml_output()

        finally:

            print("dbml erd generated")

    else: 

        raise Exception("It doesn't look like you have declared any primary or foreign keys")
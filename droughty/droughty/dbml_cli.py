"""Console script for droughty dbml modules."""

from droughty.dbml_module import dbml_output
from droughty.dbml_base_dict import dbml_dict

def erd():

    print("Generating dbml erd")

    if dbml_dict != False:

        try:

            return dbml_output()

        finally:

            print("dbml erd generated")

    else: 

        raise Exception("It doesn't look like you have declared any primary or foreign keys")
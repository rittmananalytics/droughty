"""Console script for droughty dbml modules."""

from droughty.dbml_module import dbml_output
from droughty.dbml_base_dict import dbml_dict

def erd():

    print("Generating dbml erd")

    try:

        return dbml_output()

        print("dbml erd generated")
        
    finally:

       pass
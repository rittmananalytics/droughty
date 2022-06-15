"""Console script for droughty dbml modules."""

from droughty.droughty_dbml.dbml_module import dbml_output

def erd():

    print("Generating dbml erd")

    try:

        return dbml_output()
        
    finally:

        print("dbml erd generated")

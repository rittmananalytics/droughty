"""Console script for droughty resolve modules."""

from droughty.droughty_resolve.resolve_module import resolve_output

def entity_resolution():

    print("Initialising entity resolution")

    try:

        return resolve_output()
        
    finally:

        print("Entities resolved")

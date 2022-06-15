"""Console script for droughty hydrometer modules."""

from droughty.droughty_hydrometer.referential_integrity import get_orphaned_fks

def fks():

    print("Generating fks")

    try:

        return get_orphaned_fks()
        
    finally:

        print("fks generated")

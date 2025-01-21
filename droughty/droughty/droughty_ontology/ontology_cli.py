"""Console script for droughty ontology modules."""

from droughty.droughty_ontology.ontology_base import main
from droughty.droughty_ontology.ontology_retrieval import retrieval_main

def ontology():

    print("Initialising Neo4j Knowledge Graph")

    try:

        return main()
        
    finally:

        print("Knowledge Graph Build Completed")

def onotology_retrieval():

    print("Initialising Knowledge Graph Retrieval")

    try:

        return retrieval_main()
        
    finally:

        print("Knowledge Graph Retrieval Complete")

"""Console script for droughty QA modules."""

from droughty.droughty_qa.qa_agent_base import qa_agent

def qa():

    print("Initialising QA Agent")

    try:

        return qa_agent()
        
    finally:

        print("QA Completed")

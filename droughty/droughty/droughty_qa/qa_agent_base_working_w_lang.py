from operator import add
from typing import Annotated, Any, Dict, List, Literal
import os
from droughty.droughty_core.config import ProjectVariables, droughty_assumptions

import pandas as pd
import yaml
from io import StringIO
from langchain_core.prompts import ChatPromptTemplate
from langchain_openai import ChatOpenAI
from langgraph.graph import END, START, StateGraph
from pydantic import BaseModel, Field
from typing_extensions import TypedDict
from langsmith.run_trees import RunTree
from langchain_core.tracers import LangChainTracer
from langsmith import Client

# Initialize LangSmith client and tracer
client = Client()
tracer = LangChainTracer(project_name="qa_agent")

# Initialize the model with tracing
model = ChatOpenAI(
    model="gpt-4", 
    temperature=0,
    openai_api_key=ProjectVariables.openai_secret,
    callbacks=[tracer])

## Define State and Models
class ResearchState(TypedDict):
    assumptions: str
    parsed_yaml: Dict
    qa_cycles: int
    qa_results: Annotated[List[Dict[str, Any]], add]
    final_report: str


class QAReport(BaseModel):
    column_name: str = Field(description="Name of the column evaluated.")
    expectation: str = Field(description="The expectation for the column.")
    status: Literal["met", "violated"] = Field(description="Whether the expectation was met or violated.")
    evidence: str = Field(description="Evidence supporting the conclusion.")


class QAOutput(BaseModel):
    summary: str = Field(description="Summary of all QA evaluations.")
    reports: List[QAReport] = Field(description="Detailed QA reports for each column.")


## LLM Chain - QA Evaluation
qa_prompt_template = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            """You are a data quality evaluator. Evaluate data based on expectations and generate QA reports.
            Be thorough in your analysis and provide specific evidence for your conclusions."""
        ),
        (
            "human",
            """Evaluate the following data:

                Table: {table_name}
                Columns & Data Types: {column_types}
                Sample Data: {sample_data}

                Expectation: {expectation}

                Provide a QA report that describes whether the expectation was met and any violations or evidence."""
        ),
    ]
)

qa_chain = qa_prompt_template | model.with_structured_output(QAOutput)


## Nodes
def load_yaml_node(state: ResearchState) -> ResearchState:
    """
    Load YAML assumptions and parse datasets, tables, and expectations.
    """
    yaml_data = yaml.dump(droughty_assumptions)
    parsed_yaml = yaml.safe_load(yaml_data)
    return {
        "assumptions": yaml_data, 
        "parsed_yaml": parsed_yaml, 
        "qa_cycles": 0,
        "qa_results": [], 
        "final_report": ""
    }


def qa_node(state: ResearchState) -> ResearchState:
    """
    Evaluate each dataset and table against its expectations, generating QA reports.
    """
    parsed_yaml = state["parsed_yaml"]
    project = ProjectVariables.project
    credentials = ProjectVariables.service_account
    
    for dataset_name, dataset_content in parsed_yaml.get("datasets", {}).items():
        for table_name, table_content in dataset_content.get("tables", {}).items():
            columns = table_content.get("columns", [])
            expectation = table_content.get("expectation", "No expectation provided")

            # Query BigQuery
            query = f"SELECT {', '.join(columns)} FROM `{dataset_name}.{table_name}`"
            df = pd.read_gbq(query, project_id=project, credentials=credentials)

            # Summarize DataFrame
            column_types = df.dtypes.to_dict()
            sample_data = df.head().to_dict(orient="records")

            # Invoke QA Chain
            qa_output = qa_chain.invoke(
                {
                    "table_name": table_name,
                    "column_types": column_types,
                    "sample_data": sample_data,
                    "expectation": expectation,
                }
            )

            state["qa_results"].extend(qa_output.reports)

    return {"qa_cycles": state["qa_cycles"] + 1}


def summary_node(state: ResearchState) -> ResearchState:
    """
    Generate a final summary of QA results.
    """
    qa_results = state["qa_results"]
    
    # Format the report with more structure
    violations = [r for r in qa_results if r.status == "violated"]
    met_expectations = [r for r in qa_results if r.status == "met"]
    
    final_report = "QA Analysis Summary\n\n"
    
    if violations:
        final_report += "Violations Found:\n"
        for v in violations:
            final_report += f"\nColumn: {v.column_name}\n"
            final_report += f"Expectation: {v.expectation}\n"
            final_report += f"Evidence: {v.evidence}\n"
    
    final_report += "\nMet Expectations:\n"
    for m in met_expectations:
        final_report += f"\nColumn: {m.column_name}\n"
        final_report += f"Expectation: {m.expectation}\n"
        final_report += f"Evidence: {m.evidence}\n"

    return {"final_report": final_report}


## Edges
def check_yaml_loaded(state: ResearchState) -> Literal["qa", END]:
    """
    Transition to QA node if YAML assumptions are loaded; otherwise, end.
    """
    return "qa" if state["parsed_yaml"] else END


def check_qa_cycles(state: ResearchState) -> Literal["qa", "summary"]:
    """
    Continue QA evaluation if under cycle limit, otherwise proceed to summary.
    """
    return "summary" if state["qa_cycles"] >= 3 else "qa"


## Build Agent Graph
def qa_agent_graph():
    """
    Build and return the QA agent graph with LangSmith integration.
    """
    builder = StateGraph(ResearchState)

    # Define nodes
    builder.add_node("load_yaml", load_yaml_node)
    builder.add_node("qa", qa_node)
    builder.add_node("summary", summary_node)

    # Add edges with improved flow control
    builder.add_edge(START, "load_yaml")
    builder.add_conditional_edges("load_yaml", check_yaml_loaded)
    builder.add_conditional_edges("qa", check_qa_cycles)
    builder.add_edge("summary", END)

    return builder.compile()


## CLI Entry Point
def qa_agent():
    """
    Entry point for the QA Agent with LangSmith tracing.
    """
    initial_state = {
        "assumptions": "",
        "parsed_yaml": {},
        "qa_cycles": 0,
        "qa_results": [],
        "final_report": "",
    }

    print("Initialising QA Agent")
    agent = qa_agent_graph()
    # Use invoke() method instead of calling directly or using run()
    final_state = agent.invoke(initial_state)

    print("QA Completed")
    print("Final Report:\n", final_state["final_report"])
    
    return final_state


if __name__ == "__main__":
    qa_agent()
from operator import add
from typing import Annotated, Any, Dict, List, Literal
import os
import subprocess

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

def get_git_root():
    """
    Get the root directory of the current git repository.
    
    Returns:
    str: Path to the git repository root
    """
    try:
        # Run git rev-parse command to get the root directory
        git_root = subprocess.check_output(
            ['git', 'rev-parse', '--show-toplevel'], 
            text=True
        ).strip()
        return git_root
    except subprocess.CalledProcessError:
        raise RuntimeError("Not in a git repository")

def visualize_langgraph_dag(graph, filename='langgraph_dag.mmd'):
    """
    Visualize the LangGraph DAG and save it as a Mermaid diagram in a langgraph directory.
    
    Args:
    graph: LangGraph graph object
    filename: Name of the output file (default: langgraph_dag.mmd)
    
    Returns:
    str: Full path to the saved Mermaid diagram
    """
    try:
        # Get the git repository root
        git_root = get_git_root()
        
        # Create langgraph directory path
        langgraph_dir = os.path.join(git_root, 'langgraph')
        
        # Create the directory if it doesn't exist
        os.makedirs(langgraph_dir, exist_ok=True)
        
        # Full path for the output file
        output_path = os.path.join(langgraph_dir, filename)
        
        # Generate Mermaid diagram as text
        mermaid_diagram = graph.get_graph().draw_mermaid()
        
        # Write to file
        with open(output_path, 'w') as f:
            f.write(mermaid_diagram)
        
        print(f"LangGraph DAG diagram saved to: {output_path}")
        return output_path
    
    except Exception as e:
        print(f"Error generating LangGraph DAG diagram: {e}")
        return None

# Initialize LangSmith client and tracer
client = Client(api_key=ProjectVariables.langsmith_secret)
tracer = LangChainTracer(project_name=ProjectVariables.langsmith_project)

# Initialize the model with tracing
model = ChatOpenAI(
    model="gpt-4", 
    temperature=0,
    openai_api_key=ProjectVariables.openai_secret,
    callbacks=[tracer])

## Define State and Models
class QaRearch(TypedDict):
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
qa_prompt_template = ChatPromptTemplate.from_messages([
    (
        "system",
        """You are a data quality evaluator. Evaluate data based on explicit expectations and generate QA reports.
        Be thorough in your analysis and provide specific evidence for your conclusions.
        You must use the exact expectation provided in your evaluation."""
    ),
    (
        "human",
        """Evaluate the following data:

            Table: {table_name}
            Column & Data Type: {column_types}
            Sample Data: {sample_data}

            Specific Expectation: {expectation}

            Provide a QA report that explicitly addresses whether this specific expectation was met and provide concrete evidence."""
    ),
])

# Initialize qa_chain with function calling method
qa_chain = qa_prompt_template | model.with_structured_output(
    QAOutput,
    method="function_calling"
)


## Nodes
def load_yaml_node(state: QaRearch) -> QaRearch:
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


def qa_node(state: QaRearch) -> QaRearch:
    """
    Evaluate each dataset and table against its expectations, generating QA reports.
    """
    parsed_yaml = state["parsed_yaml"]
    project = ProjectVariables.project
    credentials = ProjectVariables.service_account
    
    # Only process if we haven't done any QA cycles yet
    if state["qa_cycles"] == 0:
        for dataset_name, dataset_content in parsed_yaml.get("datasets", {}).items():
            for table_name, table_content in dataset_content.get("tables", {}).items():
                # Get columns and their expectations
                columns_data = table_content.get("columns", {})
                columns = list(columns_data.keys())
                
                # Create a mapping of column expectations
                column_expectations = {
                    col: data[0]["expectation"] 
                    for col, data in columns_data.items()
                }

                # Query BigQuery
                query = f"SELECT {', '.join(columns)} FROM `{dataset_name}.{table_name}`"
                df = pd.read_gbq(query, project_id=project, credentials=credentials)

                # Process each column with its specific expectation
                for column, expectation in column_expectations.items():
                    # Summarize DataFrame for this column
                    column_types = {column: df[column].dtype}
                    sample_data = df[[column]].to_dict(orient="records")

                    # Invoke QA Chain with column-specific expectation
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


def check_qa_cycles(state: QaRearch) -> Literal["qa", "summary"]:
    """
    Proceed to summary after one QA cycle
    """
    return "summary" if state["qa_cycles"] >= 1 else "qa"


def summary_node(state: QaRearch) -> QaRearch:
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
def check_yaml_loaded(state: QaRearch) -> Literal["qa", END]:
    """
    Transition to QA node if YAML assumptions are loaded; otherwise, end.
    """
    return "qa" if state["parsed_yaml"] else END


## Build Agent Graph
def qa_agent_graph():
    """
    Build and return the QA agent graph with LangSmith integration.
    """
    builder = StateGraph(QaRearch)

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
    Entry point for the QA Agent.
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
    
    # Visualize the DAG before running (now saves to langgraph directory)
    visualize_langgraph_dag(agent, 'droughty_qa_agent_dag.mmd')
    
    final_state = agent.invoke(initial_state)

    print("QA Completed")
    print("Final Report:\n", final_state["final_report"])
    print(f"\nView traces in LangSmith project: {ProjectVariables.langsmith_project}")
    
    return final_state
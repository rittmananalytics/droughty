import os
import pandas as pd
from io import StringIO

# LangChain imports
from langchain.chat_models import ChatOpenAI
from langchain.agents import Tool, AgentType, initialize_agent
from langchain.tools import tool
from langchain.schema import SystemMessage

import yaml

# Your project-specific config
from droughty.droughty_core.config import ProjectVariables, droughty_assumptions


def qa_agent():
    """
    A fully agentic approach:
      1) We define Tools for reading YAML, querying BigQuery, summarizing data, etc.
      2) We initialize a ZeroShotAgent (ReAct) with those Tools.
      3) We instruct the Agent (via a system prompt) to:
         - Read the YAML assumptions
         - For each dataset/table/column, query data from BigQuery
         - Summarize the data
         - Compare it to the expectation
         - Provide a final QA report
    """

    #
    # 1. Load your project secrets and set up the LLM
    #
    credentials = ProjectVariables.service_account
    project = ProjectVariables.project
    openai_api_key = ProjectVariables.openai_secret

    llm = ChatOpenAI(
        model_name="gpt-4",
        openai_api_key=openai_api_key,
        temperature=0
    )

    #
    # 2. Define Tools
    #
    @tool("read_yaml_assumptions", return_direct=True)
    def read_yaml_assumptions_tool(input_str: str) -> str:
        """
        Returns the YAML assumptions as a string.
        The input_str is not used but must be present 
        because ZeroShotAgent expects a single string argument.
        """
        return yaml.dump(droughty_assumptions)

    @tool("query_bigquery", return_direct=True)
    def query_bigquery_tool(query: str) -> str:
        """
        Executes a SQL query on BigQuery using pandas.read_gbq 
        and returns the result as a CSV string.
        """
        df = pd.read_gbq(
            query=query,
            project_id=project,
            credentials=credentials,
            dialect='standard'
        )
        return df.to_csv(index=False)

    @tool("summarize_dataframe", return_direct=True)
    def summarize_dataframe_tool(csv_data: str) -> str:
        """
        Takes CSV data and returns a textual summary that 
        the Agent can read and reason about.
        """
        df = pd.read_csv(StringIO(csv_data))
        return (
            f"Columns & dtypes:\n{df.dtypes}\n\n"
            f"Preview (up to 5 rows):\n{df.head().to_string(index=False)}\n\n"
            f"Row count: {len(df)}"
        )

    #
    # 3. Initialize the Agent with these Tools
    #
    tools = [
        read_yaml_assumptions_tool,
        query_bigquery_tool,
        summarize_dataframe_tool
    ]

    # We use ZeroShotAgent/ ReAct style for multi-step reasoning
    agent = initialize_agent(
        tools=tools,
        llm=llm,
        agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION,
        verbose=True
    )

    #
    # 4. Provide a System Prompt
    #
    #    This is crucial: we explicitly instruct the Agent on 
    #    how to parse the YAML, query BigQuery, evaluate data, etc.
    #
    #    The agent has:
    #      - read_yaml_assumptions
    #      - query_bigquery
    #      - summarize_dataframe
    #
    system_instructions = """\
You are a Data QA Agent. You have the following tools:

1) read_yaml_assumptions - returns a YAML string describing:
   datasets -> tables -> columns -> [ { expectation } ]

2) query_bigquery - run a SQL query and return rows as CSV

3) summarize_dataframe - summarize CSV data for analysis

Your job:
1) Read the YAML assumptions (via 'read_yaml_assumptions').
2) Parse them to find each dataset, table, column, and expectation.
3) For each column:
   a) Construct a SQL query to fetch just that column from the table. 
      (If multiple columns for the same table, you may fetch them all at once 
       for efficiency, but you can do it column by column if you like.)
   b) Call 'query_bigquery' with that query.
   c) Call 'summarize_dataframe' to see a summary of the returned data.
   d) Then check if the data meets the expectation. 
      - If it says "Check if all emails are valid," see if any are invalid, etc.
      - If it says "Check if all pks are unique," see if there are duplicates, etc.
   e) Document any rows or evidence that violate the expectation.
4) For each dataset/table/column, produce a short QA report:
   - Summarize whether the expectation was met or not, 
     and show any example violations or relevant statistics.
5) Finally, produce a combined summary of all checks.

Be systematic. You can make as many tool calls as you need.
Output your final answer with the QA results.
"""

    #
    # 5. User Prompt
    #
    #    We instruct the agent to "Go" / "Perform the QA"
    #
    user_prompt = "Please evaluate all data columns based on our YAML assumptions."

    #
    # 6. Run the Agent
    #
    final_answer = agent.run(f"{system_instructions}\n{user_prompt}")

    #
    # 7. Print or return the final answer
    #
    print("\n\n==== AGENT FINAL ANSWER ====")
    print(final_answer)


# Call the main function
qa_agent()

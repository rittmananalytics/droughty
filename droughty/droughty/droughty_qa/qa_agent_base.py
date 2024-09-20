import os
import getpass
import pandas as pd
from google.oauth2 import service_account
from langchain_openai import ChatOpenAI
import yaml  # Import PyYAML to read the YAML file

from droughty.droughty_core.config import ProjectVariables, droughty_assumptions

 

credentials = ProjectVariables.service_account
project = ProjectVariables.project
openai_api_key = ProjectVariables.openai_secret

print(openai_api_key)

# Function to query BigQuery using pandas.read_gbq
def query_bigquery(query, project, credentials):
    """Executes a SQL query on BigQuery using pandas.read_gbq and returns the result."""
    df = pd.read_gbq(query, dialect='standard', project_id=project, credentials=credentials)
    return df

# Function to convert the DataFrame to a text summary (e.g., column names, types)
def dataframe_to_text(df):
    """Convert DataFrame into a human-readable string format."""
    summary = df.to_string()  # Convert the DataFrame to a string.
    return f"Here is the data you need to validate:\n{summary}"

# Define the LLM using OpenAI GPT-4
def create_llm(openai_api_key):
    """Create an instance of ChatOpenAI with the provided API key."""
    return ChatOpenAI(model_name="gpt-4", openai_api_key=openai_api_key)

# Function to evaluate the DataFrame against the expectation using the LLM
def qa_data(expectation, dataframe, column_name, llm):
    """Evaluate the DataFrame directly based on the given expectation."""
    
    # Convert the DataFrame into a readable text format, filtered for the specific column
    df_summary = dataframe[[column_name]].to_string(index=False)
    
    # Create a prompt with the expectation and DataFrame summary
    input_text = (
        f"Expectation: {expectation}. \nData for column '{column_name}':\n{df_summary}\n"
        f"Please evaluate the data based on this expectation and identify any issues."
    )
    
    # Use the LLM directly to evaluate the expectation
    agent_output = llm.predict(input_text)
    
    # Return the results
    return agent_output

# Load the expectations from the YAML file
yaml_data = droughty_assumptions

# Iterate over the expectations and apply them to the respective columns
def process_yaml_expectations(dataframe, yaml_data, llm):
    """Process the expectations from the YAML file and apply them to the dataframe."""
    for table_name, table_data in yaml_data['tables'].items():
        for column_name, column_info in table_data['columns'].items():
            for expectation_data in column_info:
                expectation = expectation_data['expectation']
                print(f"Processing expectation for column '{column_name}': {expectation}")
                
                # Check if the column exists in the dataframe before applying the expectation
                if column_name in dataframe.columns:
                    # Evaluate the expectation against the column in the dataframe
                    agent_output = qa_data(expectation, dataframe, column_name, llm)
                    print(f"LLM Output for column '{column_name}':\n{agent_output}\n")
                else:
                    print(f"Column '{column_name}' not found in the dataframe.")

# Main function to orchestrate the process
def qa_agent():
    # Load the necessary configurations
    credentials = ProjectVariables.service_account
    project = ProjectVariables.project
    openai_secret = ProjectVariables.openai_secret
    
    # Define the query (adjust the query if needed to retrieve the required columns)
    query = """
    SELECT customer_email, customer_pk, persona_type 
    FROM `ra-development.looker_assets.wh_core_customers_dim`
    """
    
    # Run the query and load the DataFrame
    dataframe = query_bigquery(query, project, credentials)
    print("DataFrame from BigQuery:")
    print(dataframe)
    
    # Initialize the LLM
    llm = create_llm(openai_secret)
    
    # Process the YAML expectations
    process_yaml_expectations(dataframe, yaml_data, llm)

# Call the main function
qa_agent()

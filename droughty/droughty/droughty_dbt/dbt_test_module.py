import os
import pandas as pd
import yaml
import ruamel.yaml
from contextlib import redirect_stdout
from langchain_openai import ChatOpenAI
from google.oauth2 import service_account
from droughty.droughty_core.config import ProjectVariables, droughty_assumptions
from droughty.droughty_core.config import ExploresVariables, IdentifyConfigVariables

credentials = ProjectVariables.service_account
project = ProjectVariables.project
openai_api_key = ProjectVariables.openai_secret
yaml_data = droughty_assumptions

# Function to query BigQuery using pandas.read_gbq
def query_bigquery(query, project, credentials):
    """Executes a SQL query on BigQuery using pandas.read_gbq and returns the result."""
    df = pd.read_gbq(query, dialect='standard', project_id=project, credentials=credentials)
    return df

# Define the LLM using OpenAI GPT-4
def create_llm(openai_api_key):
    """Create an instance of ChatOpenAI with the provided API key."""
    return ChatOpenAI(model_name="gpt-4", openai_api_key=openai_api_key)

# Function to get LLM to evaluate data first (text-based response)
def evaluate_data_llm(expectation, column_name, dataframe, llm):
    """Use LLM to evaluate data and provide text-based response."""
    
    # Convert the DataFrame into a readable text format, filtered for the specific column
    df_summary = dataframe[[column_name]].to_string(index=False)
    
    # Create a prompt with the expectation and DataFrame summary
    input_text = (
        f"Expectation: {expectation}. \nData for column '{column_name}':\n{df_summary}\n"
        f"Please evaluate the data based on this expectation and identify any issues."
    )
    
    # Use the LLM to evaluate and provide a text-based response
    agent_output = llm.predict(input_text)
    
    # Return the text-based response (for review/inspection)
    return agent_output

# Function to generate a dbt test using the LLM
def generate_dbt_test_llm(expectation, column_name, table_name, llm):
    """Use LLM to generate dbt test based on the expectation."""
    
    # Create a prompt with the expectation and table/column info
    input_text = (
        f"Create a dbt test in YAML format based on the following expectation: '{expectation}' "
        f"for column '{column_name}' in the table '{table_name}'."
    )
    
    # Use the LLM to generate the dbt test
    agent_output = llm.predict(input_text)
    
    # Return the dbt test YAML content
    return agent_output

# Function to use the custom schema_output to dump YAML
def schema_output(dbt_tests):
    """Use schema_output to generate the path and filename and dump the dbt tests."""
    
    if ExploresVariables.dbt_path is None:
        git_path = IdentifyConfigVariables.git_path
        rel_path = "models"
        path = os.path.join(git_path, rel_path)
    else:
        path = os.path.join(IdentifyConfigVariables.git_path, ExploresVariables.dbt_path)
    
    # Ensure directory exists
    if not os.path.exists(path):
        os.makedirs(path)

    # Set the filename for the dbt tests
    if ExploresVariables.dbt_tests_filename is not None:
        filename = ExploresVariables.dbt_tests_filename
    else:
        filename = 'droughty_qa_schema'
    
    suffix = '.yml'
    extension = filename + suffix

    # Write the dbt tests to the YAML file using ruamel.yaml for formatting
    with open(os.path.join(path, extension), 'w') as file:
        with redirect_stdout(file):
            for i in dbt_tests:
                yaml = ruamel.yaml.YAML()
                yaml.indent(mapping=2, sequence=4, offset=2)
                yaml.dump(i, file)

    print(f"DBT test YAML file created at: {os.path.join(path, extension)}")

# Function to process YAML expectations, evaluate data, generate dbt tests, and dump them to YAML files
def process_yaml_expectations(yaml_data, llm, project, credentials):
    """Process the expectations from the YAML file and generate dbt tests."""
    
    # Loop through each dataset in the YAML file
    for dataset_name, dataset_data in yaml_data['datasets'].items():
        
        # For each dataset, loop through the tables
        for table_name, table_data in dataset_data['tables'].items():
            
            # Dynamically build a list of column names to query for each table
            columns_to_query = []
            for column_name in table_data['columns']:
                columns_to_query.append(column_name)
            
            # Generate the SQL query dynamically with the dataset and table name
            query = f"""
            SELECT {', '.join(columns_to_query)}
            FROM `{project}.{dataset_name}.{table_name}`
            """
            
            print(f"Running query for table '{table_name}' in dataset '{project}.{dataset_name}':\n{query}")
            
            # Run the query and load the DataFrame
            dataframe = query_bigquery(query, project, credentials)
            
            # Collect generated dbt tests for this table
            dbt_tests = []
            
            # For each column in the table, process the expectations
            for column_name, column_info in table_data['columns'].items():
                for expectation_data in column_info:
                    expectation = expectation_data['expectation']
                    print(f"Processing expectation for column '{column_name}': {expectation}")
                    
                    # Check if the column exists in the dataframe before applying the expectation
                    if column_name in dataframe.columns:
                        
                        # 1. **First Instance**: Evaluate the data and get the text-based LLM response
                        evaluation_output = evaluate_data_llm(expectation, column_name, dataframe, llm)
                        print(f"Text-based evaluation for column '{column_name}':\n{evaluation_output}\n")
                        
                        # 2. **Second Instance**: Generate dbt test for the expectation
                        dbt_test = generate_dbt_test_llm(expectation, column_name, table_name, llm)
                        
                        # Convert the generated test (YAML string) into a Python dict for easier dumping
                        dbt_test_dict = yaml.safe_load(dbt_test)
                        
                        # Append the test to the list for this table
                        dbt_tests.append(dbt_test_dict)
                        
                        print(f"Generated dbt test for column '{column_name}':\n{dbt_test}\n")
                    else:
                        print(f"Column '{column_name}' not found in the dataframe.")
            
            # Once all tests for this table are generated, use schema_output to dump them into a YAML file
            schema_output(dbt_tests)

# Main function to orchestrate the process
def qa_agent():
    # Load the necessary configurations
    credentials = ProjectVariables.service_account
    project = ProjectVariables.project
    openai_secret = ProjectVariables.openai_secret
    
    # Initialize the LLM
    llm = create_llm(openai_secret)
    
    # Process the YAML expectations
    process_yaml_expectations(yaml_data, llm, project, credentials)

# Call the main function
qa_agent()
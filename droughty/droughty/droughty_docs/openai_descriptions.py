import os
from contextlib import redirect_stdout
import pandas as pd
from openai import OpenAI
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage

from droughty.droughty_dbt.dbt_test_base_dict import get_dbt_dict
from droughty.droughty_dbt.dbt_test_field_base import described_columns_list

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables,
    IdentifyConfigVariables
)

try:
    client = OpenAI(api_key=ProjectVariables.openai_secret)
except:
    pass

model_name = "gpt-3.5-turbo"  # or "gpt-4" if you have access

def _get_ans_from_response(response) -> str:
    return response.choices[0].message.content

def _getter(model_name: str = model_name, prompt: str = "") -> str:
    # Send the request to the OpenAI API
    response = client.chat.completions.create(
        model=model_name,
        messages=[{"role": "user", "content": prompt}],
        max_tokens=1024
    )
    return _get_ans_from_response(response)

def wrangle_descriptions():
    df = get_dbt_dict()
    df = df[['column_name']].drop_duplicates()
    df['og_column_name'] = df['column_name']
    df['column_name'] = (df['column_name']
                         .str.replace('_', ' ')
                         .str.replace(' fk', ' foreign key')
                         .str.replace(' pk', ' primary key'))
    df['column_name'] = 'what is ' + df['column_name'] + '?'
    return df

def list_rows(dataframe):
    for index, row in dataframe.iterrows():
        if row['og_column_name'] not in described_columns_list:
            yield "\n{% docs " + row['og_column_name'] + " %}" + _getter(prompt=row['column_name']) + "\n\n{% enddocs %}"

def description_output():
    if ExploresVariables.openai_field_descriptions_path:
        path = os.path.join(IdentifyConfigVariables.git_path, ExploresVariables.openai_field_descriptions_path)
    else:
        path = os.path.join(IdentifyConfigVariables.git_path, "warehouse_docs")

    os.makedirs(path, exist_ok=True)
    
    filename = ExploresVariables.openai_field_descriptions_filename or 'openai_field_descriptions'
    extension = f"{filename}.md"

    with open(os.path.join(path, extension), 'w') as file:
        with redirect_stdout(file):
            try:
                for value in list_rows(wrangle_descriptions()):
                    print(value)
            except Exception as e:
                print(f"An error occurred: {str(e)}")

# If you need to use LangChain's ChatOpenAI
def create_llm(openai_api_key):
    return ChatOpenAI(model_name=model_name, openai_api_key=openai_api_key)

# Example usage of LangChain's ChatOpenAI
def langchain_getter(llm, prompt: str) -> str:
    response = llm.invoke([HumanMessage(content=prompt)])
    return response.content
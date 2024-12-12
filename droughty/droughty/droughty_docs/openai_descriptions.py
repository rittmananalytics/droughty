import openai
import os
from contextlib import redirect_stdout
import pandas as pd

from droughty.droughty_dbt.dbt_test_base_dict import get_dbt_dict
from droughty.droughty_dbt.dbt_test_field_base import described_columns_list

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables,
    IdentifyConfigVariables
)

try: 
    openai.api_key = ProjectVariables.openai_secret
except:
    print("setting openai.api_key failed")
    pass

model_engine = "gpt-4o-mini"


def _message_constructor(prompt):
    message = [
        {
            "role": "user",
            "content": prompt
        },
    ]
    return message

def _get_ans_from_response(response) -> str:
    return response.choices[0].message.content

def _getter(model_engine:str = model_engine, prompt:str = "") -> str:

    message = _message_constructor(prompt)

    # Send the request to the Chat GPT API
    completion = openai.chat.completions.create(
                        model=model_engine,
                        max_tokens=1024,
                        messages=message
                        )
    return _get_ans_from_response(completion)


def wrangle_descriptions() -> pd.DataFrame:
    try:
        df = get_dbt_dict()
        df = df.drop_duplicates(subset="column_name", keep="first")
        df['og_column_name'] = df['column_name']
        df['column_name'] = df['column_name'].str.replace('_', ' ')
        df['column_name'] = df['column_name'].str.replace(' fk', ' foreign key')
        df['column_name'] = df['column_name'].str.replace(' pk', ' primary key')
        df['column_name'] = 'I need a concise description for a column called "' + df['column_name'].astype(str) + \
            '". It is in a database table named ' + df['table_name'].astype(str) + \
            ' and is of type ' + df['data_type'].astype(str) + '. Return the description only. Avoid referencing the table name in the description, it is for context only'
        return df
    except Exception as e:
        print(f"Error in wrangle_descriptions: {e}")
        return pd.DataFrame()

def list_rows(dataframe):

    for index, row in dataframe.iterrows():

        if row['og_column_name'] not in described_columns_list:
             
            print("\n{% docs "+row['og_column_name']+ " %}\n"+_getter(prompt=row['column_name'])+"\n{% enddocs %}")
            
def description_output():

    if ExploresVariables.openai_field_descriptions_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.openai_field_descriptions_path)

    else:

        git_path = IdentifyConfigVariables.git_path

        rel_path = "warehouse_docs"

        path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    if ExploresVariables.openai_field_descriptions_filename != None:

        filename = ExploresVariables.openai_field_descriptions_filename
        
    else:

        filename = 'openai_field_descriptions'
   
    suffix = '.md'

    extension = filename+suffix

    with open(os.path.join(path,extension), 'w') as file:

        with redirect_stdout(file):

            try:

                for value in list_rows(wrangle_descriptions()):

                    print(value)

            except Exception as e:

                print('Failed with exception {}'.format(e))

                pass
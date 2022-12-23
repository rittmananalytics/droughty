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
    pass

model_engine = "text-davinci-003"

def _get_ans_from_response(response:openai.openai_object.OpenAIObject) -> str:
    first = dict(response)['choices']
    sec = dict(first[0])
    return sec['text']

def _getter(model_engine:str = model_engine,prompt:str = "") -> str:
    # Send the request to the Chat GPT API
    response = openai.Completion.create(
                          engine=model_engine,
                          prompt=prompt,
                          max_tokens=1024
                          )
    return _get_ans_from_response(response)

def wrangle_descriptions():

    df = get_dbt_dict()

    df = df[['column_name']]
    df = df.drop_duplicates()
    df['og_column_name'] = df['column_name']
    df['column_name'] = df['column_name'].str.replace('_',' ')
    df['column_name'] = df['column_name'].str.replace(' fk',' foreign key')
    df['column_name'] = df['column_name'].str.replace(' pk',' primary key')
    df['column_name'] ='what is ' + df['column_name'].astype(str)
    df['column_name'] = df['column_name'].astype(str) + '?'

    return df

def list_rows(dataframe):

    for index, row in dataframe.iterrows():

        if row['og_column_name'] not in described_columns_list:
             
            print("\n{% docs "+row['og_column_name']+ " %}"+_getter(prompt=row['column_name'])+"\n"*2+"{% enddocs %}")
            
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

            except:

                pass
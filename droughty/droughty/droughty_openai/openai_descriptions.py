import openai
import os
from contextlib import redirect_stdout
import pandas as pd

from droughty.droughty_dbt.dbt_test_base_dict import get_dbt_dict

from droughty.droughty_core.config import (
    ExploresVariables,
    IdentifyConfigVariables
)

openai.api_key = "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"
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

get_dbt_dict()


def wrangle_descriptions():

    #df = pd.read_csv('/Users/lewischarlesbaker/Downloads/test_columns - Sheet1.csv')

    df = get_dbt_dict()

    df = df[['column_name']]
    df = df.drop_duplicates()
    df['og_column_name'] = df['column_name']
    df['column_name'] = df['column_name'].str.replace('_',' ')
    df['column_name'] = df['column_name'].str.replace('fk','foreign key')
    df['column_name'] ='what is ' + df['column_name'].astype(str)
    df['column_name'] = df['column_name'].astype(str) + '?'

    return df

def list_rows(dataframe):

    for index, row in dataframe.iterrows():
        
        print("{% docs "+row['og_column_name']+ " %}")
        
        print(_getter(prompt=row['column_name']))
        
        print("{% enddocs %}")

def description_output():

#    if ExploresVariables.lookml_path != None:
#
#        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.lookml_path)
#
#    else:
#
#        git_path = IdentifyConfigVariables.git_path
#
#        rel_path = "lookml/base"
#
#        path = os.path.join(git_path, rel_path)
#
#    if not os.path.exists(path):
#        os.makedirs(path)
#        
#    if ExploresVariables.lookml_path != None:
#
#        filename = ExploresVariables.lookml_base_filename
#        
#    else:
#
#        filename = '_base.layer'

    git_path = IdentifyConfigVariables.git_path

    rel_path = "warehouse_docs"

    path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)

    filename = "field_descriptions"
   
    suffix = '.md'

    extension = filename+suffix

    with open(os.path.join(path,extension), 'w') as file:

        with redirect_stdout(file):

                for value in list_rows(wrangle_descriptions()):

                    print(value)

description_output()
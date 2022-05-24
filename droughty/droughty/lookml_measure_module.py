import lkml as looker
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas
import os
import json
import sys
import yaml
import git

from droughty.lookml_base_dict import base_dict
from droughty.config import (
    ExploresVariables,
    IdentifyConfigVariables
)

def get_all_values(nested_dictionary):


    includes = {

        "includes": ["/lookml/base/_base.layer.lkml" ]
            
    }

    yield(looker.dump(includes))

        
    for key,value in nested_dictionary.items():

        view = {

            "view": "+"+key+" {"
                                
            }

        yield(looker.dump(view))
        

        for key, value in value.items():
            
            if "pk" in key[0]:

                count_distinct = {

                    "measure": {
                        "type": "count_distinct",
                        "sql": "${TABLE}."+key[0],
                        "name": "count_of_"+key[0],
                        "description": key[2]

                    }
                }

                yield(looker.dump(count_distinct))

            if key[1] == 'number':

                sum_distinct = {

                    "measure": {
                        "type": "sum_distinct",
                        "sql": "${TABLE}."+key[0],
                        "name": "sum_of_"+key[0],
                        "description": key[2]

                    }
                }

                yield(looker.dump(sum_distinct))



                
        for key,value in nested_dictionary.items():

            syntax = "}"


        yield(syntax)
                

nested_dictionary = base_dict

get_all_values(nested_dictionary)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

git_def_path = get_git_root(os.getcwd())

def measure_output():

    if ExploresVariables.lookml_path == None:
   
        git_path = git_def_path

        rel_path = "lookml/base"

        path = os.path.join(git_path, rel_path)

    elif ExploresVariables.lookml_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.lookml_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = '_aggregate.layer.lkml'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary):

                    print(value)    
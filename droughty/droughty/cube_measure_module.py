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

import droughty.cube_parser.cube as cube

from droughty.cube_base_dict import cube_base_dict
from droughty.config import (
    ProjectVariables,
    ExploresVariables,
    IdentifyConfigVariables
)
def get_all_values(nested_dictionary):

    for key,value in nested_dictionary.items():

        explore = {


            "cube": key+"_extended",
            "sql": "select * from"+" "+ProjectVariables.schema+"."+key,
            "extends": key+",",
            "measures": '{'
 
        }
            
        
        yield(cube.dump(explore))
                            

        for key, value in value.items():
            
            if "pk" in key[0]:


                measure = {


                    "measure": {
                    "sql": key[0],
                    "type": "count",
                    "name": "count_of_"+key[0]

                    }

                }

                yield(cube.dump(measure))
                

            if key[1] == 'number':

                measure = {


                    "measure": {
                    "sql": key[0],
                    "type": "sum",
                    "name": "sum_of_"+key[0]

                    }

                }

                yield(cube.dump(measure))

                
        for key,value in nested_dictionary.items():
            
            closing_syntax = "}});"
            
        yield (closing_syntax)
                

nested_dictionary = cube_base_dict

get_all_values(nested_dictionary)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

git_def_path = get_git_root(os.getcwd())

def measure_output():
    
    if ExploresVariables.cube_path == None:
 
        git_path = IdentifyConfigVariables.git_path

        rel_path = "schema"

        path = os.path.join(git_path, rel_path)

    elif ExploresVariables.cube_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.cube_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = 'cube_aggregates.js'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary):

                    print(value)
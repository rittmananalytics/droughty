from pprint import pprint
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

from droughty.lookml_explore_dict import looker_explore_dict

from droughty.config import ProjectVariables
    
def get_all_values(nested_dictionary,explore_dictionary):
        
    for key,value in nested_dictionary.items():
    
        for explore_key, explore_value in explore_dictionary.items():

            if explore_key not in key:
                
                explore = {


                    "cube": key,
                    "sql": "select * from"+" "+ProjectVariables.schema+"."+key,
                    "dimensions": '{'

                }


                yield(cube.dump(explore))


                for key, value in value.items():
                    
                    if "pk" not in key[0] and "number" not in key [1]:  

                        dimension = {


                                "dimension": {
                                "sql": key[0],
                                "type": key[1],
                                "name": key[0],
                                "description": key[2]

                                }

                            }

                        yield(cube.dump(dimension))
                        
                    elif "pk" in key[0]:

                        dimension = {


                            "dimension": {
                                "primaryKey": "true",
                                "type": key[1],
                                "sql": key[0],
                                "name": key[0],
                                "description": key[2]

                            }
                        }

                        yield(cube.dump(dimension))
                
                
                for key,value in nested_dictionary.items():

                    closing_syntax = "}});"

                yield (closing_syntax)
        
nested_dictionary = cube_base_dict
explore_dictionary = looker_explore_dict

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

git_def_path = get_git_root(os.getcwd())

def output():
    
    git_path = git_def_path

    rel_path = "schema"

    path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = 'cube_base.js'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary,explore_dictionary):

                    print(value)
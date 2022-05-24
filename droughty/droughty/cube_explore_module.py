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
from droughty.cube_explore_dict import cube_explore_dict
from droughty.config import (
    ProjectVariables,
    ExploresVariables,
    IdentifyConfigVariables
)

def get_all_values(nested_dictionary,explore_dictionary):
    
    for key,value in nested_dictionary.items():
    
        for explore_key, explore_value in explore_dictionary.items():

            if explore_key in key:

                explore = {


                    "cube": key,
                    "sql": "select * from"+" "+ProjectVariables.schema+"."+key,
                    "joins ": "{"

                }


                yield(cube.dump(explore))
        

                for key1, value1 in explore_value.items(): 

                    

                    join = {


                        "joins": 
                        [
                        
                        {
                        "relationship": key1[3],
                        "sql": "${CUBE."+str(key1[0])+"}"+" = "+"${"+str(key1[1])+"."+str(key1[2])+"}",
                        "name": key1[1]

                        }
                            
                        ]

                    }
                    
                    

                    yield(cube.dump(join))
                    
                    join_end = "},"                 

                yield(join_end)
                
                        
                dimension_start = "dimensions: {"

                yield(dimension_start)


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
explore_dictionary = cube_explore_dict

get_all_values(nested_dictionary,explore_dictionary)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

git_def_path = get_git_root(os.getcwd())


def explore_output():
    
    if ExploresVariables.cube_path == None:
 
        git_path = IdentifyConfigVariables.git_path

        rel_path = "schema"

        path = os.path.join(git_path, rel_path)

    elif ExploresVariables.cube_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.cube_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = 'cube_integration.js'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary,explore_dictionary):

                    print(value)
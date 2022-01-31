import lkml as looker
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

from lookml_base_dict import d2
from lookml_base_dict import d5
from lookml_base_dict import relationship_dict



def get_all_values(nested_dictionary):

    for key,value in nested_dictionary.items():

        explore = {

            "explore": key,

            "view_name": key
                
        }
            
        yield(looker.dump(explore))


        for key1 in value.keys():     
        ##for (key1), (relationship_value) in zip (value.keys(),relationship_dict.values()): 

            join = {

                "joins": [
                    {
                    "sql_on": key1[0]+"."+key1[1]+" = "+ key1[2]+"."+key1[3],
                    "relationship": 'relationship_value',
                    "name": key1[0]
                    }

                ]
                }

            yield(looker.dump(join))




nested_dictionary = d2

get_all_values(nested_dictionary)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

git_def_path = get_git_root(os.getcwd())


def explore_output():
    
    git_path = git_def_path

    rel_path = "base"

    path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = '_explore.layer.lkml'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary):

                    print(value)

explore_output()
    

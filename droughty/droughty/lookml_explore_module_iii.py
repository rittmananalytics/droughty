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

def get_all_values(nested_dictionary):
    
    for key,value in nested_dictionary.items():

        explore = {

            "explore": key,

            "view_name": key
                
            }
            
        
        yield(looker.dump(explore))

        for key,value in nested_dictionary.items():
                    

            join = {

                "joins": [
                    {
                    "sql_on": key[1]+"."+key[2]+" = "+ key[1]+"."+key[0],
                    "name": key,
                    "view_name": value
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
    
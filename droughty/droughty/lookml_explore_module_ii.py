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

    res = [{"version":2},{"models":None}]
    
    for key,value in nested_dictionary.items():
            seq = []
            res.append([{"name": key, "columns": seq}])
            # for key1, value1 in value.items():  # not using value1
            for key1 in value.keys():
                
                if "pk" in key1:
                    
                    elem = {"name": key1, "tests": ["not_null", "unique"]}
                    seq.append(elem)
                    
                elif "fk" in key1:
                    
                    elem = {"name": key1, "tests": ["not_null"]}
                    seq.append(elem)   
                    
                elif "valid_to" in key1 or "valid_from" in key1:
                    
                    elem = {"name": key1, "tests": ["dbt_utils.expression_is_true"":""expression"":"" valid_from < valid_to","not_null","unique"]}
                    seq.append(elem)  

                elif "pk" not in key1 or "fk" not in key1:
            
                    elem = {"name": key1, "tests": [""+"dbt_utils.at_least_one"]}
                    seq.append(elem)  

    yield(looker.dump(res))


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
    
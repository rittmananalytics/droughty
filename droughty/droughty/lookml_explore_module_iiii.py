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

def get_all_values(nested_dictionary):

    res = []
        
    for key,value in nested_dictionary.items():

        seq = []

        res.append({

            "explore": key,

            "view_name": key,
            
            "joins": seq

        })

        for key1,value in value.items():     

            seq_2 = []

            seq.append = ({

                "joins": [
                    {
                    "sql_on": key1[0]+"."+key1[1]+" = "+ key1[2]+"."+key1[3],
                    ##"relationship": 
                    "name": key1[0],
                    "relationship": seq_2
                    }

                ]
                })
            
            for value2 in value.items():

                    elem = [value2]

                    seq_2.append(elem)

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
    
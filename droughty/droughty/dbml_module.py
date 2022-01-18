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

from droughty.dbml_base_dict import d1
from droughty.config import project_value

def get_all_values(nested_dictionary):

    
    project = 'project'+' '+'project_value'

    yield (project)

    project_params = "{ database_type"+":"+" 'bigquery' }"

    yield (project_params)
   
    for key,value in nested_dictionary.items():

        explore = "table"+" "+key+"      {"
                
        yield(explore)

        for key,value in value.items():

            if "pk" not in key[0] and "fk" not in key[0]:

               dimension = key[0]+" "+key[1]

               yield(dimension)

            elif "pk" in key[0]:

                dimension = key[0]+" "+key[1]+" [pk]"

                yield(dimension)   

            elif "fk" in key[0] and "not_available" not in key[3]:

                dimension = key[0]+" "+key[1]+" [ref: - "+key[3]+"."+key[4]+"]"

                yield(dimension)

            elif "fk" in key[0] and "not_available" in key[3]:

                dimension = key[0]+" "+key[1]+" // [ref: - "+key[3]+"."+key[4]+"]"

                yield(dimension)

            else:   

               pass

        for key,value in nested_dictionary.items():

            syntax = "}"

        yield(syntax)
            

nested_dictionary = d1

get_all_values(nested_dictionary)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)
 
git_def_path = get_git_root(os.getcwd())

def dbml_output():
    
    git_path = git_def_path

    rel_path = "db_docs"

    path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = 'example.dbml'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary):

                    print(value)

dbml_output()
    
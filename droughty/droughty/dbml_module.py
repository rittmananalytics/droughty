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

from droughty.dbml_base_dict import dbml_dict
from droughty.config import (
    ProjectVariables,
    ExploresVariables,
    get_git_root
)

try: 

    def get_all_values(nested_dictionary):

        rel_path = "db_docs"

        path = os.path.join(get_git_root(os.getcwd()), rel_path)

        filename = 'example.dbml'
        
        project = 'project'+' '+ProjectVariables.environment_profile

        yield (project)

        project_params = "{ database_type"+":"+" 'bigquery' }"

        yield (project_params)
    
        for key,value in nested_dictionary.items():

            explore = "table"+" "+key[0]+"      {"
                    
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

        if not os.path.exists(path):
            os.makedirs(path)

        with open(os.path.join(path, filename), 'w') as file:

            with redirect_stdout(file):

                    for value in nested_dictionary.items():

                        print(value)
except:

    print("I doesn't look like you have any primary or foreign keys declared")
            

nested_dictionary = dbml_dict
 
#def dbml_output():
#    
#    rel_path = "db_docs"
#
#    path = os.path.join(get_git_root(os.getcwd()), rel_path)
#
#    if not os.path.exists(path):
#        os.makedirs(path)
#        
#    filename = 'example.dbml'
#
#    with open(os.path.join(path, filename), 'w') as file:
#
#        with redirect_stdout(file):
#
#                for value in get_all_values(nested_dictionary):
#
#                    print(value)

def dbml_output():

    get_all_values(nested_dictionary)
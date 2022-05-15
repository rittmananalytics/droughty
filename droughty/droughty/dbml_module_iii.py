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

        if not os.path.exists(path):
            os.makedirs(path)

        for x in ExploresVariables.dbml_schemas:

            for key,value in nested_dictionary.items():

                if key[0] == x:
     
                    filename = x+'.dbml'

                    sys.stdout = open(os.path.join(path, filename), 'w')

                    ## create dbml
                    
                    project = 'project'+' '+ProjectVariables.environment_profile

                    print (project)

                    for key1,value1 in value.items():

                        explore = "table"+" "+key[1]+"      {"
                                
                        print(explore)

except:

    print("I doesn't look like you have any primary or foreign keys declared")
            
nested_dictionary = dbml_dict

def dbml_output():

    get_all_values(nested_dictionary)
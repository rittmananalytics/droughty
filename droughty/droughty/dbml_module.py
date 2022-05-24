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
    IdentifyConfigVariables
)

try: 

    def get_all_values(nested_dictionary):

        if ExploresVariables.dbml_path == None:

            rel_path = "db_docs"

            path = os.path.join(IdentifyConfigVariables.git_path, rel_path)

        elif ExploresVariables.dbml_path != None:

            path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.dbml_path)

        if not os.path.exists(path):
            os.makedirs(path)

        for schema in ExploresVariables.dbml_schemas:
    
            filename = ProjectVariables.environment_profile+'_'+schema+'.dbml'

            sys.stdout = open(os.path.join(path, filename), 'w')

            ## create dbml
            
            project = 'project'+' '+ProjectVariables.environment_profile

            print (project)

            project_params = "{ database_type"+":"+" '"+ProjectVariables.warehouse+"' }"

            print (project_params)

            for key,value in nested_dictionary.items():

                if key[0] == schema:

                    explore = "table"+" "+key[1]+"      {"
                            
                    print(explore)

                    for key,value in value.items():

                        if "pk" in key[0]:

                            dimension = key[0]+" "+key[1]+" [pk]"

                            print(dimension)   

                        elif "fk" in key[0] and "not_available" not in key[3]:

                            dimension = key[0]+" "+key[1]+" [ref: - "+key[3]+"."+key[4]+"]"

                            print(dimension)

                        elif "fk" in key[0] and "not_available" in key[3]:

                            dimension = key[0]+" "+key[1]+" // [ref: - "+key[3]+"."+key[4]+"]"

                            print(dimension)

                        elif "pk" not in key[0] and "fk" not in key[0]:

                            dimension = key[0]+" "+key[1]

                            print(dimension)


                        else:   

                            pass

                    for key,value in nested_dictionary.items():

                        syntax = "}"

                    print(syntax)

except:

    print("I doesn't look like you have any primary or foreign keys declared")
            
nested_dictionary = dbml_dict

def dbml_output():

    get_all_values(nested_dictionary)
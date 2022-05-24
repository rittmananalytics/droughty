import lkml as looker
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

from droughty.lookml_base_dict import base_dict
from droughty.config import (
    ExploresVariables,
    IdentifyConfigVariables
)


def get_all_values(nested_dictionary):

    
    for key,value in nested_dictionary.items():

        explore = {


            "explore": key,
                
            "{ hidden": "yes }"
                
            }
            
        
        yield(looker.dump(explore))
        
    for key,value in nested_dictionary.items():

        view = {


            "view": key+" {",
                    
            "sql_table_name": key
                                
            }

        yield(looker.dump(view))
        

        for key, value in value.items():
            
            if "pk" not in key[0] and "fk" not in key[0] and "date" not in key[1] and "timestamp" not in key[1] and "number" not in key [1]:

                dimension = {

                    "dimension": {
                        "type": key[1],
                        "sql": "${TABLE}."+key[0],
                        "name": key[0],
                        "description": key[2]
                    }
                }

                yield(looker.dump(dimension))

            elif "pk" in key[0]:

                dimension = {

                    "dimension": {
                        "primary_key": "yes",
                        "hidden": "yes",
                        "type": key[1],
                        "sql": "${TABLE}."+key[0],
                        "name": key[0],
                        "description": key[2]

                    }
                }

                yield(looker.dump(dimension))

            elif "date" in key[1]:

                dimension = {

                    "dimension_group": {

                            "timeframes": "[raw,date,week,month,quarter,year]",

                        "type": "time",
                        "datatype": key[1],
                        "sql": "${TABLE}."+key[0],
                        "name": key[0],
                        "description": key[2]

                    }
                }

                yield(looker.dump(dimension))

            elif "timestamp" in key[1]:


                dimension = {

                    "dimension_group": {

                            "timeframes": "[time,raw,date,week,month,quarter,year]",

                        "type": "time",
                        "datatype": key[1],
                        "sql": "${TABLE}."+key[0],
                        "name": key[0],
                        "description": key[2]

                    }
                }


                yield(looker.dump(dimension))

            else:

                dimension = {

                    "dimension": {
                        "hidden": "yes ",
                        "type": key[1],
                        "sql": "${TABLE}."+key[0],
                        "name": key[0],
                        "description": key[2]

                    }
                }

                yield(looker.dump(dimension))

                
        for key,value in nested_dictionary.items():

            syntax = "}"


        yield(syntax)         

nested_dictionary = base_dict

get_all_values(nested_dictionary)


def output():

    if ExploresVariables.lookml_path == None:
    
        git_path = IdentifyConfigVariables.git_path

        rel_path = "lookml/base"

        path = os.path.join(git_path, rel_path)

    elif ExploresVariables.lookml_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.lookml_path)


    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = '_base.layer.lkml'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary):

                    print(value)
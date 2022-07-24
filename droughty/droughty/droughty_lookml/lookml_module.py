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

from droughty.droughty_lookml.lookml_base_dict import (
    get_base_dict,
    get_field_dict
)
from droughty.droughty_core.config import (
    ExploresVariables,
    IdentifyConfigVariables
)


def get_all_values(nested_dictionary,field_dict):

    
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


        for table_name,field_name in field_dict.items():

            if table_name in key:

                set = {

                    "set": {
                        "fields": field_name,
                        "name": table_name+"_set"
                    }
                }   

        yield(looker.dump(set))
        

        for key1, value1 in value.items():
            
            if "pk" not in key1[0] and "fk" not in key1[0] and "date" not in key1[1] and "timestamp" not in key1[1] and "number" not in key1 [1]:

                dimension = {

                    "dimension": {
                        "type": key1[1],
                        "sql": "${TABLE}."+key1[0],
                        "name": key1[0],
                        "description": key1[2],
                        "drill_fields": [key+"_set*"]
                    }
                }

                yield(looker.dump(dimension))


            elif "pk" in key1[0]:

                dimension = {

                    "dimension": {
                        "primary_key": "yes",
                        "hidden": "yes",
                        "type": key1[1],
                        "sql": "${TABLE}."+key1[0],
                        "name": key1[0],
                        "description": key1[2]

                    }
                }

                yield(looker.dump(dimension))

            elif "date" in key1[1]:

                dimension = {

                    "dimension_group": {

                            "timeframes": "[raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]",

                        "type": "time",
                        "datatype": key1[1],
                        "sql": "${TABLE}."+key1[0],
                        "name": key1[0],
                        "description": key1[2]

                    }
                }

                yield(looker.dump(dimension))

            elif "timestamp" in key1[1]:


                dimension = {

                    "dimension_group": {

                            "timeframes": "[time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]",

                        "type": "time",
                        "datatype": key1[1],
                        "sql": "${TABLE}."+key1[0],
                        "name": key1[0],
                        "description": key1[2]

                    }
                }


                yield(looker.dump(dimension))

            else:

                dimension = {

                    "dimension": {
                        "hidden": "yes ",
                        "type": key1[1],
                        "sql": "${TABLE}."+key1[0],
                        "name": key1[0],
                        "description": key1[2]

                    }
                }

                yield(looker.dump(dimension))


        for key,value in nested_dictionary.items():

            syntax = "}"

        yield(syntax)

def output():

    if ExploresVariables.lookml_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.lookml_path)

    else:

        git_path = IdentifyConfigVariables.git_path

        rel_path = "lookml/base"

        path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    if ExploresVariables.lookml_path != None:

        filename = ExploresVariables.lookml_base_filename
        
    else:

        filename = '_base.layer'
   
    suffix = '.lkml'

    extension = filename+suffix

    with open(os.path.join(path,extension), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(get_base_dict(),get_field_dict()):

                    print(value)
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

from lookml_base_dict import d1
from lookml_base_dict import d2
from lookml_base_dict import distinct_duplicate_explore_rows


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

from droughty.lookml_base_dict import d1
from droughty.lookml_base_dict import d2



def get_all_values(nested_dictionary_measure_dimension):

        
    for key,value in nested_dictionary_measure_dimension.items():
        

        
        sql =  { 
            
            "cube" : "(`"+key+"`, { ",
            
            "sql ": " select * from  "+key+",",
            
            "dimensions": ""
        
        }            


        yield(looker.dump(sql))
        
        for key, value in value.items():

                dimension = {

                   key[0]: {
                        "type": "`"+key[1]+"`"+",",
                        "sql ": "`"+key[0]+"`,",
                        "description": key[2]
                    }
                
                }
                


                yield(looker.dump(dimension))
                
                comma = ","
                
                yield(comma)      

        for key,value in nested_dictionary_measure_dimension.items():

            syntax = "},  });"


        yield(syntax)


nested_dictionary_cube = d2
nested_dictionary_measure_dimension = d1

get_all_values(nested_dictionary_measure_dimension)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

git_def_path = get_git_root(os.getcwd())


def cube_output():
    
    git_path = git_def_path

    rel_path = "base"

    path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = 'cube.sql'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary):

                    print(value)

cube_output()
    
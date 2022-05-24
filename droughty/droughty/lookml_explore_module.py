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

from droughty.lookml_explore_dict import looker_explore_dict,ExploreDictVariables
from droughty.config import (
    ExploresVariables,
    IdentifyConfigVariables
)


def get_all_values(nested_dictionary):

    for key,value in nested_dictionary.items():

        explore = {

            "includes": ["/lookml/base/_base.layer.lkml","/lookml/aggregate/_aggregate.layer.lkml"  ],

            "explore": key+"_explore"+" {",

            "hidden": "no",

            "view_name": key
                
        }
            
        
        yield(looker.dump(explore))

        for key1 in value.keys():  

            if key1[0] == key1[0] and key1[0] not in ExploreDictVariables.distinct_duplicate_explore_rows:

                join = {

                    "joins": [
                        {
                        "sql_on": "${"+str(key1[0])+"."+str(key1[3])+"}"+" = "+"${"+str(key1[2])+"."+str(key1[1])+"}",
                        "relationship": key1[4],
                        "name": key1[0]
                        }

                    ]
                    }

                yield(looker.dump(join))


            elif key1[2] == key1[2] and key1[0] not in ExploreDictVariables.distinct_duplicate_explore_rows:

                join = {

                "joins": [
                    {
                    "sql_on": "${"+key1[2]+"."+key1[3]+"}"+" = "+ "${"+key1[0]+"."+key1[1]+"}",
                    "relationship": key1[4],
                    "name": key1[2]
                    }

                ]
                }

                yield(looker.dump(join))


            if key1[0] in ExploreDictVariables.distinct_duplicate_explore_rows:


                join = {

                    "joins": [
                        {
                        "sql_on": "${"+key1[0]+"."+key1[3]+"}"+" = "+ "${"+key1[2]+"."+key1[1]+"}",
                        "relationship": key1[4],
                        "from": key1[0],
                        "name": key1[2]+"_"+key1[0]
                        }

                    ]
                    }

                yield(looker.dump(join))

        for key,value in nested_dictionary.items():

            syntax = "}"


        yield(syntax)



nested_dictionary = looker_explore_dict

get_all_values(nested_dictionary)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

git_def_path = get_git_root(os.getcwd())


def explore_output():

    if ExploresVariables.lookml_path == None:
    
        git_path = git_def_path

        rel_path = "lookml/base"

        path = os.path.join(git_path, rel_path)

    elif ExploresVariables.lookml_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.lookml_path)

    if not os.path.exists(path):
        os.makedirs(path)
        
    filename = '_explore.layer.lkml'

    with open(os.path.join(path, filename), 'w') as file:

        with redirect_stdout(file):

                for value in get_all_values(nested_dictionary):

                    print(value)
import lkml as looker
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import pandas as pd
import pandas
import os
import json
import sys
from itertools import chain

from collections import defaultdict


from droughty.droughty_dbt.dbt_test_base_dict import dbt_test_dict
from droughty.droughty_dbt.dbt_test_field_base import described_columns_list
from droughty.droughty_core.config import (
    IdentifyConfigVariables,
    ExploresVariables
)

import sys
import ruamel.yaml
import git


def get_all_values(nested_dictionary,test_overwrite_dictionary):

    test_overwrite = ExploresVariables.test_overwrite

    try:
        
        if test_overwrite != None:
    
            nested_dictionary.update(test_overwrite_dictionary)

            ignore_test_keys = list(ExploresVariables.test_overwrite.keys())

        else:
        
            pass

    except:

        ignore_test_keys = "None"

    res = [{"version":2},{"models":None}]
    
    for key,value in nested_dictionary.items():

        if key not in ignore_test_keys and not key in ExploresVariables.test_ignore:

            seq = []
            res.append([{"name": key, "columns": seq}])
            # for key1, value1 in value.items():  # not using value1

            for key1,value1 in value.items():

                if key1 in described_columns_list:

                    if "pk" in key1 and "not_null" not in value1 and "unique" not in value1:
                        
                        elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": ["not_null","unique"]}
                        seq.append(elem)
                        
                    elif "fk" in key1:
                        
                        elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": ["not_null"]}
                        seq.append(elem)   
                        
                    elif "valid_to" in key1 or "valid_from" in key1:
                        
                        elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": ["dbt_utils.expression_is_true"":""expression"":"" valid_from < valid_to","not_null","unique"]}
                        seq.append(elem)  

                    elif "pk" not in key1 or "fk" not in key1:
                
                        elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": [""+"dbt_utils.at_least_one"]}
                        seq.append(elem)  

                    elif "pk" not in key1 or "fk" not in key1:
                
                        elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}"}
                        seq.append(elem)  

                elif key1 not in described_columns_list:

                        if "pk" in key1:
                            
                            elem = {"name": key1, "tests": ["not_null","unique"]}
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

        elif key in ignore_test_keys and key not in ExploresVariables.test_ignore:

            seq = []
            res.append([{"name": key, "columns": seq}])
            # for key1, value1 in value.items():  # not using value1

            for key1,value1 in value.items():

                if key1 in described_columns_list:

                        
                    elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": value1}
                    seq.append(elem)

                elif key1 not in described_columns_list:

                    elem = {"name": key1, "tests": value1}
                    seq.append(elem)
                            
    return res

def schema_output():

    if ExploresVariables.dbt_path == None:
    
        git_path = IdentifyConfigVariables.git_path

        rel_path = "models"

        path = os.path.join(git_path, rel_path)

    elif ExploresVariables.dbt_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.dbt_path)

    if not os.path.exists(path):
        os.makedirs(path)

    if ExploresVariables.dbt_tests_filename != None:

        filename = ExploresVariables.dbt_tests_filename
        
    else:

        filename = 'droughty_schema'
  
    suffix = '.yml'

    extension = filename+suffix

    with open(os.path.join(path,extension), 'w') as file:

        with redirect_stdout(file):

            for i in get_all_values(dbt_test_dict(),ExploresVariables.test_overwrite):
                
                yaml = ruamel.yaml.YAML()
                yaml.indent(mapping=2, sequence=4, offset=2)            
                yaml.dump(i,file)    
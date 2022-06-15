from dataclasses import dataclass
from droughty.droughty_dbml.dbml_base_dict import get_dbml_dict

@dataclass
class ProjectHealth: 

    orphaned_fks: str

def get_all_values(nested_dictionary):

    for key,value in nested_dictionary.items():

        for key,value in value.items():

            if "fk" in key[0] and "not_available" in key[3]:

                orphaned_fks = {
                    
                    "column_name": key[0]

                }
    
                return orphaned_fks

def get_orphaned_fks():

    ProjectHealth.orphaned_fks = get_all_values(get_dbml_dict())

get_orphaned_fks()

print (ProjectHealth.orphaned_fks)
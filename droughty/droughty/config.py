import os
import yaml
import git
from cgi import test
from dataclasses import dataclass
from google.oauth2 import service_account

from droughty.config_cli import Common

path = os.path.expanduser('~')

def get_git_root(path):
    
        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)
    
##def return_git_path():
    
git_path = get_git_root(os.getcwd())


## profile vars

@dataclass
class IdentifyConfigVariables(Common):
    
    path_source: str
    profile_path: str
    full_path: str

def assign_droughty_paths():

    if Common.profile_dir != None:

        IdentifyConfigVariables.profile_path = Common.profile_dir

        IdentifyConfigVariables.path_source = 'local_vars'

        print ("Using option path")

        print (Common.profile_dir)


    else:

        path = os.path.expanduser('~')

        print ('test me')

        IdentifyConfigVariables.path_source = 'local_vars'

        IdentifyConfigVariables.profile_pass = os.path.join(path,".droughty/profile.yaml")       

        print ("Using default path")

paths = assign_droughty_paths()

def load_droughty_profile():

        with open(IdentifyConfigVariables.profile_path) as f:

            droughty_profile = yaml.load(f, Loader=yaml.FullLoader)

        return droughty_profile

def load_droughty_project():

    filename = 'droughty_project.yaml'

    droughty_project = os.path.join(git_path,filename)

    with open(droughty_project) as f:
        droughty_project = yaml.load(f, Loader=yaml.FullLoader)

        return droughty_project
    
droughty_profile = load_droughty_profile()
droughty_project = load_droughty_project()

@dataclass
class ProjectVariables:
    
    environment_profile: str
    service_account_path: str
    service_account: str
    project: str
    warehouse: str
    schema: str
    test_schemas: str

    role: str
    password: str
    database: str
        
def assign_project_variables():

    for key, value in droughty_project.items():

        if key == 'profile':

            if value in droughty_profile:
                
                ProjectVariables.environment_profile = droughty_project['profile']

                if IdentifyConfigVariables.path_source == 'local_vars':

                    ProjectVariables.warehouse =  droughty_profile[value]['warehouse_name']
                    ProjectVariables.schema = droughty_profile[value]['schema_name']
                    ProjectVariables.test_schemas = droughty_profile[value]['test_schemas']
                    
                    ProjectVariables.project = droughty_profile[value]['project_name']

                    ProjectVariables.service_account_path = droughty_profile[value]['key_file']
                    ProjectVariables.service_account = service_account.Credentials.from_service_account_file(
                        ProjectVariables.service_account_path,
                    )

project_variables = assign_project_variables()    

@dataclass
class ExploresVariables:

    explore_tables: str
    dimensional_inference: str
    single_list_tables: str
    flat_list: str 
    final_list: str
    join_key_list: str

def assign_explore_variables():

    for key,value in droughty_project.items():

        if key == 'profile':

            explores = (droughty_project.get("explores"))

            ExploresVariables.explore_tables = (droughty_project.get("explores"))

            ExploresVariables.dimensional_inference = (droughty_project.get("dimensional_inference")) 

            explore_tables = []

            for key,value in explores.items():

                for key,value in value.items():

                    explore_tables.append(value)

            single_list_tables = [i[0] for i in explore_tables]

            ExploresVariables.single_list_tables = single_list_tables

            flat_list = []

            for sublist in explore_tables:
                for item in sublist:
                    flat_list.append(item)

            ExploresVariables.flat_list = flat_list

            final_list = []

            for x in flat_list:
                final_list.append("'" + x + "'")

            ExploresVariables.final_list = final_list

            ExploresVariables.join_key_list = ['merge_counts_fk','merge_counts_pk']

explore_variables = assign_explore_variables()    

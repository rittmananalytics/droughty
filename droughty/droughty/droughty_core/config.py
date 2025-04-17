import os
import yaml
import git
from cgi import test
from dataclasses import dataclass
from google.oauth2 import service_account
from snowflake.sqlalchemy import URL
import glom

from droughty.droughty_core.config_cli import Common

path = os.path.expanduser('~')

## profile vars
@dataclass
class IdentifyConfigVariables(Common):
    
    path_source: str
    profile_path: str
    project_path: str
    assumptions_path: str
    full_path: str
    git_path: str

def assign_droughty_paths():

    if Common.env_vars == None:

        IdentifyConfigVariables.path_source = 'local_vars'

    elif Common.env_vars == 'enabled':

        IdentifyConfigVariables.path_source = 'env_vars'

        print ("Using environment variables")

    else:

        pass

    if Common.profile_dir != None:

        IdentifyConfigVariables.profile_path = Common.profile_dir

        print ("Using optional profile path")

        print (Common.profile_dir)

    elif Common.profile_dir == None:

        path = os.path.expanduser('~')

        IdentifyConfigVariables.profile_path = os.path.join(path,".droughty/profile.yaml")       

        print ("Using default profile path")

    elif IdentifyConfigVariables.profile_path == None:

        raise Exception ("It looks like you don't have a profile file or you have directly specified the incorrect directory")  


assign_droughty_paths()

def get_git_root(path):
    
        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)

IdentifyConfigVariables.git_path = get_git_root(os.getcwd())


def load_droughty_profile():

    with open(IdentifyConfigVariables.profile_path) as f:

        droughty_profile = yaml.load(f, Loader=yaml.FullLoader)

    return droughty_profile

def assign_droughty_project_paths():

    if Common.project_dir != None:

        IdentifyConfigVariables.project_path = Common.project_dir  

        IdentifyConfigVariables.path_source = 'local_vars'

        print ("Using optional project path")

        print (Common.project_dir)


    elif Common.project_dir == None:

        path = get_git_root(os.getcwd())

        IdentifyConfigVariables.project_path = os.path.join(path,"droughty_project.yaml")       

        print ("Using default project path")

    else:

        raise Exception ("It looks like you don't have a droughty_project file or you have directly specified the incorrect directory")  

def assign_droughty_assumptions_paths():

    if Common.assumptions_dir != None:

        IdentifyConfigVariables.assumptions_path = Common.assumptions_dir  

        IdentifyConfigVariables.path_source = 'local_vars'

        print ("Using optional assumptions path")

        print (Common.assumptions_dir)


    elif Common.assumptions_dir == None:

        path = get_git_root(os.getcwd())

        IdentifyConfigVariables.assumptions_path = os.path.join(path,"droughty_qa_assumptions.yaml")       

        print ("Using default assumptions path")

    else:

        raise Exception ("It looks like you don't have a droughty_qa_assumptions file or you have directly specified the incorrect directory") 


assign_droughty_project_paths()
assign_droughty_assumptions_paths()

def load_droughty_project():

    with open(IdentifyConfigVariables.project_path) as f:
        droughty_project = yaml.load(f, Loader=yaml.FullLoader)

    return droughty_project

def load_droughty_assumptions():

    with open(IdentifyConfigVariables.assumptions_path) as f:
        assumptions = yaml.load(f, Loader=yaml.FullLoader)

    return assumptions
    
droughty_profile = load_droughty_profile()
droughty_project = load_droughty_project()
droughty_assumptions = load_droughty_assumptions()

@dataclass
class ProjectVariables:
    
    environment_profile: str.lower
    service_account_path: str.lower
    bq_sdk_path: str.lower
    service_account: str.lower
    project: str.lower
    warehouse: str.lower
    schema: str.lower
    openai_secret: str
    langsmith_secret: str
    langsmith_project: str
    role: str.lower
    password: str.lower
    database: str.lower
    account: str.lower
    user: str.lower
    snowflake_warehouse: str.lower
    database: str.lower
        
def assign_project_variables():

    for key, value in droughty_project.items():

        if key == 'profile':

            if value in droughty_profile:

                # local vars

                if IdentifyConfigVariables.path_source == 'local_vars':
                
                    ProjectVariables.environment_profile = droughty_project['profile']
                    ProjectVariables.warehouse =  droughty_profile[value]['warehouse_name']                    
                    ProjectVariables.schema = droughty_profile[value]['schema_name']

                    try:
                        ProjectVariables.openai_secret = droughty_profile[value]['openai_secret']
                    except:
                        pass
                    
                    try:
                        ProjectVariables.langsmith_secret = droughty_profile[value]['langsmith_secret']
                    except:
                        pass
                    
                    try:
                        ProjectVariables.langsmith_project = droughty_profile[value]['langsmith_project']
                    except:
                        pass

                    # BigQuery
                    if ProjectVariables.warehouse == 'big_query':
                        ProjectVariables.project = droughty_profile[value]['project_name']
                        
                        # Check if using service account or OAuth
                        if 'key_file' in droughty_profile[value]:
                            # Service account authentication (existing method)
                            ProjectVariables.service_account_path = droughty_profile[value]['key_file']
                            ProjectVariables.service_account = service_account.Credentials.from_service_account_file(
                                ProjectVariables.service_account_path,
                            )
                        elif 'oauth' in droughty_profile[value]:
                            # OAuth authentication
                            from google.auth.transport.requests import Request
                            from google.oauth2.credentials import Credentials
                            from google_auth_oauthlib.flow import InstalledAppFlow
                            import json
                            
                            SCOPES = ['https://www.googleapis.com/auth/bigquery']
                            oauth_config = droughty_profile[value]['oauth']
                            
                            # Get token file path with fallback
                            token_path = oauth_config.get('token_file', 'token.json')
                            client_secrets_path = oauth_config.get('client_secrets', 'client_secrets.json')
                            
                            creds = None
                            try:
                                with open(token_path, 'r') as token_file:
                                    creds = Credentials.from_authorized_user_info(json.loads(token_file.read()), SCOPES)
                            except (FileNotFoundError, json.JSONDecodeError):
                                pass
                                
                            # If no valid credentials, let user log in
                            if not creds or not creds.valid:
                                if creds and creds.expired and creds.refresh_token:
                                    creds.refresh(Request())
                                else:
                                    flow = InstalledAppFlow.from_client_secrets_file(client_secrets_path, SCOPES)
                                    creds = flow.run_local_server(port=0)
                                
                                # Save credentials for future use
                                with open(token_path, 'w') as token:
                                    token.write(creds.to_json())
                            
                            ProjectVariables.service_account = creds  # Store OAuth creds in the same variable
                        else:
                            raise ValueError(f"Profile '{value}' must contain either 'key_file' or 'oauth' configuration for BigQuery")

                        try:
                            ProjectVariables.bq_sdk_path = droughty_profile[value]['bq_sdk_path']
                        except:
                            ProjectVariables.bq_sdk_path = None

                    # Snowflake

                    elif ProjectVariables.warehouse == 'snowflake':
                    
                        ProjectVariables.account = droughty_profile[value]['account']
                        ProjectVariables.user = droughty_profile[value]['user']
                        ProjectVariables.snowflake_warehouse = droughty_profile[value]['warehouse']
                        ProjectVariables.database = droughty_profile[value]['database']
                        ProjectVariables.password = droughty_profile[value]['password']
                        ProjectVariables.role = droughty_profile[value]['role']

                # environment vars

                elif IdentifyConfigVariables.path_source == 'env_vars':

                    ProjectVariables.environment_profile = os.environ.get(droughty_project['profile'])
                    ProjectVariables.warehouse =  os.environ.get(droughty_profile[value]['warehouse_name'])
                    ProjectVariables.schema = os.environ.get(droughty_profile[value]['schema_name'])

                    # BigQuery

                    if ProjectVariables.warehouse == 'big_query':
                    
                        ProjectVariables.project = os.environ.get(droughty_profile[value]['project_name'])

                        ProjectVariables.service_account_path = os.environ.get(droughty_profile[value]['key_file'])
                        ProjectVariables.service_account = service_account.Credentials.from_service_account_file(
                            ProjectVariables.service_account_path,
                        )

                        try:
                            ProjectVariables.bq_sdk_path = droughty_profile[value]['bq_sdk_path']
                        except:
                            ProjectVariables.bq_sdk_path = None

                        

                    # Snowflake

                    elif ProjectVariables.warehouse == 'snowflake':
                    
                        ProjectVariables.account = os.environ.get(droughty_profile[value]['account'])
                        ProjectVariables.user = os.environ.get(droughty_profile[value]['user'])
                        ProjectVariables.snowflake_warehouse = os.environ.get(droughty_profile[value]['warehouse'])
                        ProjectVariables.database = os.environ.get(droughty_profile[value]['database'])
                        ProjectVariables.password = os.environ.get(droughty_profile[value]['password'])
                        ProjectVariables.role = os.environ.get(droughty_profile[value]['role'])

            else:

                raise Exception ("It looks like there no match between the project name within the droughty_project and your profile file.")

project_variables = assign_project_variables()    

@dataclass
class ExploresVariables:

    explore_tables: str.lower
    single_list_tables: str.lower
    flat_list: str .lower
    final_list: str.lower
    join_key_list: str.lower
    test_overwrite: str.lower
    test_ignore: str.lower
    dbml_schemas: str.lower
    parent_table_name: str.lower

    #paths

    lookml_path: str.lower
    lookml_pop: str.lower
    dbml_path: str.lower
    cube_path: str.lower
    dbt_path: str.lower
    lookml_base_path: str.lower
    stage_path: str.lower

    #filenames

    lookml_base_filename: str.lower
    lookml_explore_filename: str.lower
    lookml_measures_filename: str.lower

    cube_base_filename: str.lower
    cube_integration_filename: str.lower
    cube_measures_filename: str.lower

    dbml_filenames: str.lower

    dbt_tests_filename: str.lower
    test_schemas: str.lower

    openai_field_descriptions_path: str.lower
    openai_field_descriptions_filename: str.lower

    resolution_read_schema: str.lower
    resolution_write_schema: str.lower
    resolution_tables: str.lower
    write_column_names: str.lower
    write_table_name: str.lower

def assign_explore_variables():

    for key,value in droughty_project.items():

        if key == 'profile':

            if 'dbml_schemas' in droughty_project and 'dbml_schemas' not in droughty_profile[value]:
        
                raise Exception ("You have defined dbml_schemas in your project YAML file. As of 0.9.6 this is defined within the profile YAML file")
            
            if 'test_schemas' in droughty_project and 'test_schemas' not in droughty_profile[value]:
    
                raise Exception ("You have defined test_schemas in your project YAML file. As of 0.9.6 this is defined within the profile YAML file")

            try:

                explores = (droughty_project.get("explores"))
                ExploresVariables.explore_tables = (droughty_project.get("explores"))
                ExploresVariables.dbml_schemas = (droughty_profile[value]['dbml_schemas'])

                ExploresVariables.lookml_path = (droughty_project.get("lookml_path"))  
                ExploresVariables.dbml_path = (droughty_project.get("dbml_path"))  
                ExploresVariables.cube_path = (droughty_project.get("cube_path"))  
                ExploresVariables.dbt_path = (droughty_project.get("dbt_path")) 
                ExploresVariables.stage_path = (droughty_project.get("stage_path"))

                ExploresVariables.lookml_base_filename = (droughty_project.get("lookml_base_filename"))  
                ExploresVariables.lookml_explore_filename = (droughty_project.get("lookml_explore_filename"))  
                ExploresVariables.lookml_measures_filename = (droughty_project.get("lookml_measures_filename"))  
                ExploresVariables.cube_base_filename = (droughty_project.get("cube_base_filename"))  
                ExploresVariables.cube_integration_filename = (droughty_project.get("cube_integration_filename"))  
                ExploresVariables.cube_measures_filename = (droughty_project.get("cube_measures_filename"))  
                ExploresVariables.dbml_filenames = (droughty_project.get("dbml_filenames"))  
                ExploresVariables.dbt_tests_filename = (droughty_project.get("dbt_tests_filename"))
                ExploresVariables.lookml_base_path = (droughty_project.get("lookml_base_path"))

                ExploresVariables.openai_field_descriptions_path = (droughty_project.get("openai_field_descriptions_path"))
                ExploresVariables.openai_field_descriptions_filename = (droughty_project.get("openai_field_descriptions_filename"))

                try:
                    ExploresVariables.test_overwrite = droughty_project['test_overwrite']['models']
                except:
                    ExploresVariables.test_overwrite = "None"
                try:
                    ExploresVariables.test_ignore = droughty_project['test_ignore']['models']
                except:
                    ExploresVariables.test_ignore = "None"
                try:
                    ExploresVariables.test_schemas = droughty_profile[value]['test_schemas']
                except:
                    ExploresVariables.test_schemas = "None"
                try:
                    ExploresVariables.lookml_pop = droughty_project['lookml_pop']['views'] # If this is not at the bottom, it creates an error where other values will not fill. Something to look into
                except:
                    ExploresVariables.lookml_pop = None
                try:
                    ExploresVariables.resolution_read_schema = droughty_project['entity_resolution']['read_schema']
                except:
                    ExploresVariables.resolution_read_schema = None
                try:
                    ExploresVariables.resolution_write_schema = droughty_project['entity_resolution']['write_schema']
                except:
                    ExploresVariables.resolution_write_schema = None
                try:
                    ExploresVariables.resolution_tables = droughty_project['entity_resolution']['read_table_names']
                except:
                    ExploresVariables.resolution_tables = None
                try:
                    ExploresVariables.write_column_names = droughty_project['entity_resolution']['write_column_names']
                except:
                    ExploresVariables.write_column_names = None
                try:
                    ExploresVariables.write_table_name = droughty_project['entity_resolution']['write_table_name']
                except:
                    ExploresVariables.write_table_name = None

            except:

                pass     

            try:

                parent_table_path = "explores.parent_table"
                actual = glom.glom(droughty_project, parent_table_path)
                ExploresVariables.parent_table_name = ''.join(actual)
            except:

                pass

            #parent_table_path = "explores.parent_table"
            #actual = glom.glom(droughty_project, parent_table_path)
            #ExploresVariables.parent_table_name = ''.join(actual)

            try:

                explore_tables = []

                for key,value in explores.items():

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

            except: 

                pass

#    if ExploresVariables.dimensional_inference == None:
#
#        raise Exception ("You need to specify if dimensional inference is enabled or not within the droughty_project file.")

#    if ExploresVariables.dimensional_inference == "enabled" and ExploresVariables.explore_tables == None:
#
#        raise Exception ("You have enabled dimensional inference but haven't specified an explore within the droughty_project file.")

    if ExploresVariables.test_schemas == None:

        raise Exception ("You need to specify your target warehouse schemas/datasets for dbt tests to generate against within the droughty_project file.")

    if ExploresVariables.dbml_schemas == None:

        raise Exception ("You need to specify your target warehouse schemas/datasets for dbml erd's to generate against within the droughty_project file.")
        
    try: 
        
        if ExploresVariables.parent_table_name == None and ExploresVariables.explore_tables != None:

            raise Exception ("You need to specify your parent table within the droughty_project file.")
    except:

        pass

explore_variables = assign_explore_variables()    

@dataclass
class DbtTestVariables:
    
    field_description_path: str
    field_description_file_name: str

def assign_dbt_test_variables():

    DbtTestVariables.field_description_path = (droughty_project.get("field_description_path"))
    DbtTestVariables.field_description_file_name = (droughty_project.get("field_description_file_name"))

#    if DbtTestVariables.field_description_path == None:
#
#        raise Exception ("You need to define the dbt field descriptions path within the droughty_project file.")
#
#    if DbtTestVariables.field_description_file_name == None:
#
#        raise Exception ("You need to define the dbt field descriptions file name within the droughty_project file.")

dbt_test_variables = assign_dbt_test_variables()

def get_snowflake_connector_url():

    url = URL(

    account = ProjectVariables.account,
    user =  ProjectVariables.user,
    schema =  ProjectVariables.schema,
    database =  ProjectVariables.database,
    password =  ProjectVariables.password,
    warehouse = ProjectVariables.snowflake_warehouse,
    role =  ProjectVariables.role

    )

    return (url)

def get_snowflake_resolution_connector_url():

    url = URL(

    account = ProjectVariables.account,
    user =  ProjectVariables.user,
    schema =  ExploresVariables.resolution_write_schema,
    database =  ProjectVariables.database,
    password =  ProjectVariables.password,
    warehouse = ProjectVariables.snowflake_warehouse,
    role =  ProjectVariables.role

    )

    return (url)
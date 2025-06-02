import os
import yaml
import git
import warnings
from dataclasses import dataclass
from google.oauth2 import service_account
from google.auth import default
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
    # Load the profile YAML
    with open(IdentifyConfigVariables.profile_path) as f:
        droughty_profile = yaml.load(f, Loader=yaml.FullLoader)

    # Verify the profile has the required structure
    if not isinstance(droughty_profile, dict):
        raise ValueError(f"Profile at {IdentifyConfigVariables.profile_path} is not properly formatted")
        
    # Handle profiles that don't have LangSmith configuration
    # This ensures we don't require langsmith_secret and langsmith_project in profiles
    for profile_name, profile_config in droughty_profile.items():
        if isinstance(profile_config, dict):
            # Set defaults for optional LangSmith parameters if they don't exist
            if 'langsmith_secret' not in profile_config:
                profile_config['langsmith_secret'] = None
            if 'langsmith_project' not in profile_config:
                profile_config['langsmith_project'] = None
                
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
    # Only attempt to load assumptions file if it exists or is required by the command
    try:
        if os.path.exists(IdentifyConfigVariables.assumptions_path):
            with open(IdentifyConfigVariables.assumptions_path) as f:
                assumptions = yaml.load(f, Loader=yaml.FullLoader)
            return assumptions
        else:
            # Return empty dict if file doesn't exist
            return {}    
    except Exception as e:
        # If we couldn't load the file for any reason, return an empty dict
        print(f"Note: No valid assumptions file found at {IdentifyConfigVariables.assumptions_path}. Using default assumptions.")
        return {}
    
droughty_profile = load_droughty_profile()
droughty_project = load_droughty_project()
droughty_assumptions = load_droughty_assumptions()

@dataclass
class ProjectVariables:
    
    environment_profile: str.lower = None
    service_account_path: str.lower = None
    bq_sdk_path: str.lower = None
    service_account: str.lower = None
    project: str.lower = None
    warehouse: str.lower = None
    schema: str.lower = None
    openai_secret: str = None
    langsmith_secret: str = None
    langsmith_project: str = None
    role: str.lower = None
    password: str.lower = None
    database: str.lower = None
    account: str.lower = None
    user: str.lower = None
    snowflake_warehouse: str.lower = None
    database: str.lower = None
        
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
                        # Try ADC first, regardless of whether key_file or oauth is specified
                        try:
                            print("Attempting to use Application Default Credentials (ADC)...")
                            credentials, project_id = default()
                            ProjectVariables.service_account = credentials
                            print("Successfully authenticated using Application Default Credentials")
                        except Exception as adc_error:
                            # If ADC fails, fall back to key_file or oauth
                            print(f"ADC authentication failed: {adc_error}")
                            print("Falling back to other authentication methods...")
                            
                            if 'key_file' in droughty_profile[value]:
                                # Service account authentication (fallback method)
                                print("Using service account key file for authentication")
                                ProjectVariables.service_account_path = droughty_profile[value]['key_file']
                                try:
                                    ProjectVariables.service_account = service_account.Credentials.from_service_account_file(
                                        ProjectVariables.service_account_path,
                                    )
                                    print("Successfully authenticated using service account key file")
                                except Exception as key_error:
                                    raise ValueError(f"Failed to authenticate with service account key file: {key_error}")
                            elif 'oauth' in droughty_profile[value]:
                                # OAuth authentication (fallback method)
                                print("Using OAuth for authentication")
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
                                print("Successfully authenticated using OAuth")
                            else:
                                # No fallback authentication method available
                                # Instead of just showing an error, try to run gcloud auth automatically
                                import subprocess
                                print("\nNo credentials found. Attempting to run 'gcloud auth application-default login' for you...")
                                try:
                                    subprocess.run(["gcloud", "auth", "application-default", "login"], check=True)
                                    print("Authentication successful! Retrying with new credentials...")
                                    # Try to get credentials again after authentication
                                    credentials, project_id = default()
                                    ProjectVariables.service_account = credentials
                                    print("Successfully authenticated using Application Default Credentials")
                                except Exception as cmd_error:
                                    raise ValueError(f"Failed to authenticate. Error: {cmd_error}\n\n"
                                                  f"Please run 'gcloud auth application-default login' manually or configure a service account.")
                        

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

                        # Try ADC first, regardless of whether key_file is specified
                        try:
                            print("Attempting to use Application Default Credentials (ADC)...")
                            credentials, project_id = default()
                            ProjectVariables.service_account = credentials
                            print("Successfully authenticated using Application Default Credentials")
                        except Exception as adc_error:
                            # If ADC fails, fall back to key_file
                            print(f"ADC authentication failed: {adc_error}")
                            print("Falling back to service account key file...")
                            
                            if 'key_file' in droughty_profile[value]:
                                # Service account authentication (fallback method)
                                print("Using service account key file for authentication")
                                ProjectVariables.service_account_path = os.environ.get(droughty_profile[value]['key_file'])
                                try:
                                    ProjectVariables.service_account = service_account.Credentials.from_service_account_file(
                                        ProjectVariables.service_account_path,
                                    )
                                    print("Successfully authenticated using service account key file")
                                except Exception as key_error:
                                    raise ValueError(f"Failed to authenticate with service account key file: {key_error}")
                            else:
                                # No fallback authentication method available
                                raise ValueError(f"ADC authentication failed and environment for profile '{value}' does not contain a key_file. Please run 'gcloud auth application-default login' or configure a service account.")
                        

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

def get_google_credentials():
    """
    Get Google Cloud credentials using the following priority order:
    1. Application Default Credentials (ADC) - from gcloud auth application-default login
    2. ProjectVariables.service_account - if already set in the environment
    3. Service account key file - if path is provided
    4. Interactive OAuth flow - launches browser for user authentication
    
    This function ALWAYS tries ADC first, regardless of whether a key file or OAuth is configured.
    If ADC fails and no other credentials are available, it will automatically launch an interactive
    OAuth flow in the browser for the user to authenticate.
    """
    # Suppress the default Google Auth SDK warning
    with warnings.catch_warnings():
        warnings.filterwarnings("ignore", "Your application has authenticated using end user credentials")
        
    try:
        # Try ADC first as the default method
        credentials, project = default()
        
        # Check if project is None (which means no quota project is set)
        if not project:
            warnings.warn(
                "\nProject hasn't been configured, hence access to all projects. "
                "Be wary of API rate limits and quotas.\n"
                "To set a quota project, run: gcloud auth application-default set-quota-project YOUR_PROJECT_ID"
            )
            
        return credentials
    except Exception as adc_error:
        # If ADC fails, try the existing authentication method
        if hasattr(ProjectVariables, 'service_account') and ProjectVariables.service_account:
            return ProjectVariables.service_account
        elif ProjectVariables.service_account_path:
            return service_account.Credentials.from_service_account_file(
                ProjectVariables.service_account_path
            )
        else:
            # If all else fails, try interactive OAuth flow
            try:
                print("No credentials found. Launching interactive authentication flow...")
                from google_auth_oauthlib.flow import InstalledAppFlow
                from google.oauth2.credentials import Credentials
                import json
                import os
                
                # Define scopes needed for BigQuery access
                SCOPES = ['https://www.googleapis.com/auth/bigquery']
                
                # Create a client_config dictionary for a web application OAuth flow
                client_config = {
                    "installed": {
                        "client_id": "764086051850-6qr4p6gpi6hn506pt8ejuq83di341hur.apps.googleusercontent.com",
                        "client_secret": "d-FL95Q19q7MQmFpd7hHD0Ty",
                        "redirect_uris": ["http://localhost", "urn:ietf:wg:oauth:2.0:oob"],
                        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
                        "token_uri": "https://oauth2.googleapis.com/token"
                    }
                }
                
                # Create the flow using the client config
                flow = InstalledAppFlow.from_client_config(client_config, SCOPES)
                
                # Run the OAuth flow in the browser
                print("\nA browser window will open for you to authenticate with Google.")
                print("Please follow the prompts in the browser to complete authentication.\n")
                creds = flow.run_local_server(port=0)
                
                # Save the credentials for future use
                token_dir = os.path.expanduser("~/.droughty")
                os.makedirs(token_dir, exist_ok=True)
                token_path = os.path.join(token_dir, "google_oauth_token.json")
                
                with open(token_path, 'w') as token_file:
                    token_file.write(creds.to_json())
                    
                print(f"\nAuthentication successful! Credentials saved to {token_path}")
                print("You won't need to authenticate again until these credentials expire.\n")
                
                return creds
            except Exception as oauth_error:
                raise Exception(f"Failed to authenticate with Google. Error: {oauth_error}\n\n"
                               f"Please try one of the following methods:\n"
                               f"1. Run 'gcloud auth application-default login'\n"
                               f"2. Configure a service account in your droughty.yaml file\n"
                               f"3. Check your internet connection and try again") from oauth_error

# Initialising Google credentials
google_credentials = None
try:
    google_credentials = get_google_credentials()
except Exception as e:
    print(f"Warning: Failed to initialise Google credentials: {e}")

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
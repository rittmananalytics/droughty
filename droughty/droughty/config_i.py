from cgi import test
from dataclasses import dataclass
from google.oauth2 import service_account
import os
import yaml
import git



def cli_option_path_import():

    from droughty import config_cli

    return(config_cli.cli_profile_path)


## global vars

path = os.path.expanduser('~')

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)
    
    
git_path = get_git_root(os.getcwd())

## profile vars

def load_profile():

    try:
    
        path_source = 'local_vars'

        path = cli_option_path_import()

        profile_pass = os.path.join(path,"profile.yaml")

        with open(profile_pass) as f:
            lookml_config = yaml.load(f, Loader=yaml.FullLoader)

    except:

        print("I cannot find this variable")

        test_path = cli_option_path_import()

        print (test_path)

        path_source = 'local_vars'

        path = os.path.expanduser('~')

        profile_pass = os.path.join(path,".droughty/profile.yaml")

        with open(profile_pass) as f:
            lookml_config = yaml.load(f, Loader=yaml.FullLoader)

    #except:
    #
    #    path_source = 'external_vars'
    #
    #    filename = 'profile.yaml'
    #
    #    profile_pass = os.path.join(git_path,filename)
    #
    #    with open(profile_pass) as f:
    #        lookml_config = yaml.load(f, Loader=yaml.FullLoader)


## project vars 

def load_project():

    filename = 'droughty_project.yaml'

    droughty_project = os.path.join(git_path,filename)

    with open(droughty_project) as f:
        environment_project = yaml.load(f, Loader=yaml.FullLoader)

@dataclass
class IdentifyProjectVariables:

    environment_profile: str
    warehouse: str
    schema: str
    test_schemas: str

    role: str
    password: str
    database: str

    def load_project(environment_project):

        filename = 'droughty_project.yaml'

        droughty_project = os.path.join(git_path,filename)

        with open(droughty_project) as f:
            environment_project = yaml.load(f, Loader=yaml.FullLoader)

    def AssignProjectVariables(environment_project):

        for key,value in environment_project.items():
            
            if key == 'profile':

                if value in lookml_config:

                    ## global vars

                    if path_source == 'local_vars':

                        warehouse_name =  lookml_config[value]['warehouse_name']
                        schema_name = lookml_config[value]['schema_name']
                        test_schemas = lookml_config[value]['test_schemas']

                    elif path_source == 'external_vars':

                        warehouse_name =  os.environ.get("BIG_QUERY_WAREHOUSE_NAME")
                        schema_name = os.environ.get('BIG_QUERY_DATASET_DEV')
                        test_schemas = lookml_config[value]['test_schemas']


                    environment_profile = environment_project['profile']

                    if path_source == 'local_vars':

                        if warehouse_name == 'big_query':

                            ## bigquery vars

                            project_name =  lookml_config[value]['project_name']

                            service_account_path = lookml_config[value]['key_file']
                            service_account = service_account.Credentials.from_service_account_file(
                                service_account_path,
                            )

                        elif warehouse_name == 'snowflake':

                            ## snowflake vars

                            project_name = ['']
                            snowflake_account = lookml_config[value]['account']
                            snowflake_user = lookml_config[value]['user']
                            snowflake_schema = lookml_config[value]['schema_name']
                            snowflake_database = lookml_config[value]['database']
                            snowflake_password = lookml_config[value]['password']
                            snowflake_warehouse = lookml_config[value]['warehouse']
                            snowflake_role = lookml_config[value]['role']

                    elif path_source == 'external_vars':


                        ## bigquery vars

                        if warehouse_name == 'big_query':

                            project_name =   os.environ.get('BIG_QUERY_PROJECT_DEV')

                            service_account_path = "./droughty-service-account.json"
                            service_account = service_account.Credentials.from_service_account_file(
                                service_account_path,
                            )

                        ## snowflake vars

                        elif warehouse_name == 'snowflake':

                            project_name = ['']
                            snowflake_account = os.environ.get('SNOWFLAKE_ACCOUNT')
                            snowflake_user = os.environ.get('SNOWFLAKE_USER')
                            snowflake_schema = os.environ.get('SNOWFLAKE_SCHEMA_NAME')
                            snowflake_database = os.environ.get('SNOWFLAKE_DATABASE')
                            snowflake_password = os.environ.get('SNOWFLAKE_PASSWORD')
                            snowflake_warehouse = os.environ.get('SNOWFLAKE_WAREHOUSE')
                            snowflake_role = os.environ.get('SNOWFLAKE_ROLE')
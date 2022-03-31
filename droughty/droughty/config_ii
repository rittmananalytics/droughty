from google.oauth2 import service_account
import os
import yaml
import git

## global vars

path = os.path.expanduser('~')

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)
    
    
git_def_path = get_git_root(os.getcwd())

git_path = git_def_path

## profile vars

try:

    path_source = 'local_vars'

    path = os.path.expanduser('~')

    profile_pass = os.path.join(path,".droughty/profile.yaml")

    with open(profile_pass) as f:
        lookml_config = yaml.load(f, Loader=yaml.FullLoader)

except:

    path_source = 'external_vars'

    filename = 'profile.yaml'

    profile_pass = os.path.join(git_path,filename)

    with open(profile_pass) as f:
        lookml_config = yaml.load(f, Loader=yaml.FullLoader)

## project vars 

filename = 'droughty_project.yaml'

droughty_project = os.path.join(git_path,filename)

with open(droughty_project) as f:
    environment_project = yaml.load(f, Loader=yaml.FullLoader)

for key,value in environment_project.items():
    
    if key == 'profile':

        if value in lookml_config:

            ## global vars

            if path_source == 'local_vars':

                warehouse_name =  lookml_config[value]['warehouse_name']
                schema_name = lookml_config[value]['schema_name']
                test_schemas = lookml_config[value]['test_schemas']

            elif path_source == 'external_vars':

                warehouse_name =  os.environ.get("WAREHOUSE_NAME")
                schema_name = os.environ.get('SCHEMA_NAME')
                test_schemas = os.environ.get('TEST_SCHEMAS')

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

                    project_name =  os.environ.get('PROJECT_NAME')

                    service_account_path = "./droughty-service-account.json"
                    service_account = service_account.Credentials.from_service_account_file(
                        service_account_path,
                    )

                ## snowflake vars

                elif warehouse_name == 'snowflake':

                    snowflake_account = os.environ.get('ACCOUNT')
                    snowflake_user = os.environ.get('USER')
                    snowflake_schema = os.environ.get('SCHEMA_NAME')
                    snowflake_database = os.environ.get('DATABASE')
                    snowflake_password = os.environ.get('PASSWORD')
                    snowflake_warehouse = os.environ.get('WAREHOUSE')
                    snowflake_role = os.environ.get('ROLE')
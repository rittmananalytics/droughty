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

filename = 'profile.yaml'

profile_pass = os.path.join(git_path,filename)

with open(profile_pass) as f:
    lookml_config = yaml.load(f, Loader=yaml.FullLoader)

profile_key = list(lookml_config.keys())

## project vars 

filename = 'droughty_project.yaml'

droughty_project = os.path.join(git_path,filename)

with open(droughty_project) as f:
    environment_project = yaml.load(f, Loader=yaml.FullLoader)

for key,value in environment_project.items():
    
    if key == 'profile':

        if value in lookml_config:
        
    ## global vars

            warehouse_name =  lookml_config[value]['warehouse_name']
            project_name =  lookml_config[value]['project_name']
            environment_profile = environment_project['profile']
            

            ## big_query vars

            if warehouse_name == 'big_query':

                #service_account_path = os.environ.get("DBT_GOOGLE_BIGQUERY_KEYFILE_DEV")
                service_account_path = "./droughty-service-account.json"

                warehouse_name =  lookml_config[value]['warehouse_name']
                project_name =  os.environ.get("DBT_GOOGLE_PROJECT_DEV")

                service_account = service_account.Credentials.from_service_account_file(
                    service_account_path,
                )

            elif warehouse_name == 'red_shift':

            ## red_shift vars

                red_shift_project =  lookml_config[value]['project_name']
                red_shift_host =  lookml_config[value]['host']
                red_shift_port =  lookml_config[value]['port']
                red_shift_user =  lookml_config[value]['user']
                red_shift_password =  lookml_config[value]['password']

            ## snowflake vars

            elif warehouse_name == 'snowflake':

                snowflake_account = lookml_config[value]['account']
                snowflake_user = lookml_config[value]['user']
                snowflake_schema = lookml_config[value]['schema_name']
                snowflake_database = lookml_config[value]['database']
                snowflake_password = lookml_config[value]['password']
                snowflake_warehouse = lookml_config[value]['warehouse']
                snowflake_role = lookml_config[value]['role']

                warehouse_name =  lookml_config[value]['warehouse_name']
                project_name =  lookml_config[value]['project_name']
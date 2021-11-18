import os
import yaml

from google.oauth2 import service_account
import os
import yaml
import git

## source vars

path = os.path.expanduser('~')

profile_pass = os.path.join(path,".droughty/profile.yaml")

with open(profile_pass) as f:
    lookml_config = yaml.load(f, Loader=yaml.FullLoader)

def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)
    
    
git_def_path = get_git_root(os.getcwd())

git_path = git_def_path

filename = 'droughty_project.yaml'

droughty_project = os.path.join(git_path,filename)

with open(droughty_project) as f:
    enviroment_project = yaml.load(f, Loader=yaml.FullLoader)

project_value = list(enviroment_project.values())
profile_key = list(lookml_config.keys())

for value in enviroment_project.values():

    if lookml_config[value]['warehouse_name'] == 'big_query':
    
        if value in lookml_config:
            
        ## global vars 

            warehouse_name =  lookml_config[value]['warehouse_name']
            project_name =  lookml_config[value]['project_name']
            schema_name =  lookml_config[value]['schema_name']
            test_schemas = lookml_config[value]['test_schemas']

            warehouse_schema =   """

            with source as (

                select * from `{0}.{1}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`

                )

                select * from source

            """.format(project_name,schema_name)

            dbml_reference_dict = """


            with source as (

            select * from `{0}.{1}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`

            ),

                pks as (
                select 
                table_name as pk_table_name,
                column_name as pk_column_name,
                trim(column_name, "_pk") as pk_sk,
                from source
                where column_name like '%pk%'
                ),

                fks as (
                select
                table_name as fk_table_name,
                column_name as fk_column_name,
                trim(column_name, "_fk") as fk_sk,
                from source
                where column_name like '%fk%'

                ),

                references as (
                select * from pks

                inner join fks on pks.pk_sk = fks.fk_sk

                )

                select 
                
                *except (pk_column_name,pk_table_name),

                case when pk_column_name is null
                    then 'not_available'
                else pk_column_name
                end as pk_column_name,

                case when pk_table_name is null
                    then 'not_available'
                else pk_table_name
                end as pk_table_name                   
                 from source

                left join references on source.column_name = references.fk_column_name and references.fk_table_name = source.table_name
            
            """.format(project_name,schema_name)


    elif lookml_config[value]['warehouse_name'] == 'snowflake':
        
        if value in lookml_config:

            warehouse_name =  lookml_config[value]['warehouse_name']
            project_name =  lookml_config[value]['project_name']
            schema_name =  lookml_config[value]['schema_name']
            test_schemas = lookml_config[value]['test_schemas']
            database = lookml_config[value]['database']

            snowflake_schema = '''

            select * from {0}.information_schema.columns;

            '''.format(database)

## warehouse test schemas

test_warehouse_schema =   """

        with source_1 as (

            select * from `{0}.{1}.INFORMATION_SCHEMA.COLUMNS`

            ),

        source_2 as (

        select * from `{0}.{2}.INFORMATION_SCHEMA.COLUMNS`
        
        ),
        
        source_3 as (

        select * from `{0}.{3}.INFORMATION_SCHEMA.COLUMNS`
        
        ),
        
        unioned as (

        select * from source_1
        
        union all
        
        select * from source_2
        
        union all
        
        select * from source_3
        
        )

        select * from unioned

""".format(project_name,test_schemas[0],test_schemas[1],test_schemas[2])


import os
import yaml

from google.oauth2 import service_account
import os
import yaml
import git

from jinjasql import JinjaSql
from six import string_types
from copy import deepcopy


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



for key,value in enviroment_project.items():
    
    if key == 'profile':

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

explores = (enviroment_project.get("explores"))

## 

explore_tables = []

for key,value in explores.items():

    for key,value in value.items():

        explore_tables.append(value)

## reduce explore_tables from array to single list
        
single_list_tables = [i[0] for i in explore_tables]


flat_list = []
for sublist in explore_tables:
    for item in sublist:
        flat_list.append(item)
        
final_list = []
for x in flat_list:
    final_list.append("'" + x + "'")
    
join_key_list = ['merge_counts_fk','merge_counts_pk']

params = {
    'project_id': project_name,
    'schema_id': schema_name, 
    'table_names': final_list,
    'table_names_unqouted': flat_list,
    'pk_fk_join_key_list': join_key_list
    
}


lookml_explore_schema = '''

with source as (

select 

*


from `{{project_id}}.{{schema_id}}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
where table_name in 
{{ table_names |inclause }}

),

{% for value in table_names_unqouted  %}

explore_table_row_count_{{ value | sqlsafe }} as (

select 

'{{ value | sqlsafe }}' as table_name,
count(*) as row_count

from `{{project_id}}.{{schema_id}}.{{ value | sqlsafe }}`

group by 1

),

{% endfor %}


merge_counts as (


{% for value in table_names_unqouted  %}

select * from explore_table_row_count_{{ value | sqlsafe }}

{% if not loop.last %}union all{% endif %}


{% endfor %}


),

pks as (
    select 
    table_name as pk_table_name,
    column_name as pk_column_name,
    trim(column_name, "_pk") as pk_sk,
    from source
    where column_name like '%%pk%%'
),

fks as (
    select
    table_name as fk_table_name,
    column_name as fk_column_name,
    trim(column_name, "_fk") as fk_sk,
    from source
    where column_name like '%%fk%%'

)


select 

{{ table_names [0] }} as parent_table_name,
pk_table_name,
pk_column_name,
fk_table_name,
fk_column_name,
merge_counts_pk.row_count as pk_row_count,
merge_counts_fk.row_count as fk_row_count,
merge_counts_parent.row_count as parent_row_count,

case when merge_counts_pk.row_count > merge_counts_fk.row_count
        then 'many_to_one'   
     when merge_counts_pk.row_count < merge_counts_fk.row_count
        then 'one_to_many'
     when merge_counts_pk.row_count = merge_counts_fk.row_count
        then 'one_to_one'
end as true_relationship,

case when merge_counts_pk.row_count < merge_counts_parent.row_count
    and merge_counts_fk.row_count < merge_counts_parent.row_count
     or  merge_counts_pk.row_count != merge_counts_parent.row_count
     and  merge_counts_fk.row_count != merge_counts_parent.row_count

        then 'many_to_one'
     when merge_counts_pk.row_count > merge_counts_parent.row_count
        then 'one_to_many'
     when merge_counts_fk.row_count > merge_counts_parent.row_count
        then 'one_to_many'
     when merge_counts_pk.row_count = merge_counts_parent.row_count
     or merge_counts_fk.row_count = merge_counts_parent.row_count
        then 'one_to_one'                
        
end as looker_relationship,

     
    
 
 
from pks

inner join fks on pks.pk_sk = fks.fk_sk

left join merge_counts as merge_counts_fk on merge_counts_fk.table_name = fks.fk_table_name

left join merge_counts as merge_counts_pk on merge_counts_pk.table_name = pks.pk_table_name

left join merge_counts as merge_counts_parent on merge_counts_parent.table_name = {{ table_names[0] }}


order by looker_relationship


'''

j = JinjaSql(param_style='pyformat')
query, bind_params = j.prepare_query(lookml_explore_schema,params)

isinstance(value, string_types)

def quote_sql_string(value):
    '''
    If `value` is a string type, escapes single quotes in the string
    and returns the string enclosed in single quotes.
    '''
    if isinstance(value, string_types):
        new_value = str(value)
        new_value = new_value.replace("'", "''")
        return "'{}'".format(new_value)
    return value

def get_sql_from_template(query, bind_params):
    if not bind_params:
        return query
    params = deepcopy(bind_params)
    for key, val in params.items():
        params[key] = quote_sql_string(val)
    return query % params

def apply_sql_template(template, parameters):
    '''
    Apply a JinjaSql template (string) substituting parameters (dict) and return
    the final SQL.
    '''
    j = JinjaSql(param_style='pyformat')
    query, bind_params = j.prepare_query(template, parameters)
    return get_sql_from_template(query, bind_params)

explore_sql = (query % bind_params)
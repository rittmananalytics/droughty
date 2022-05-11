from dataclasses import dataclass
import os
import yaml

from google.oauth2 import service_account
import os
import yaml
import git

from jinjasql import JinjaSql
from six import string_types
from copy import deepcopy

from droughty.config import ProjectVariables,ExploresVariables

def warehouse_schema():

    # generic warehouse schema

    if ProjectVariables.warehouse == 'big_query':
        
        warehouse_schema =   """
        with source as (
            select * from `{0}.{1}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
            )
            select * from source
        """.format(ProjectVariables.project,ProjectVariables.schema)

    elif ProjectVariables.warehouse == 'snowflake':

        warehouse_schema =   """
        with source as (
            select * from "{0}"."INFORMATION_SCHEMA"."COLUMNS"
            )
            select * from source

            where table_schema = '{1}'
        """.format(ProjectVariables.database,ProjectVariables.schema)

    return warehouse_schema

def dbml_schema():

    # dbml warehouse query

    if ProjectVariables.warehouse == 'big_query':   

        dbml_query = """
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
        
        """.format(ProjectVariables.project,ProjectVariables.schema)

    if ProjectVariables.warehouse == 'snowflake':   

        dbml_query = """
        with source as (
        select * from "{0}"."INFORMATION_SCHEMA"."COLUMNS"
        where table_schema = '{1}'

        ),
            pks as (
            select 
            table_name as pk_table_name,
            column_name as pk_column_name,
            rtrim(column_name, '_pk') as pk_sk
            from source
            where column_name like '%PK%'
            ),
            fks as (
            select
            table_name as fk_table_name,
            column_name as fk_column_name,
            rtrim(column_name, '_fk') as fk_sk
            from source
            where column_name like '%FK%'
            ),
            references as (
            select * from pks
            inner join fks on pks.pk_sk = fks.fk_sk
            )
            select 
            

            source.data_type,
            source.table_name,
            source.column_name,
            source.comment,

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
        
        """.format(ProjectVariables.database,ProjectVariables.schema)

    return dbml_query


    # looker explore warehouse query

if ProjectVariables.warehouse == 'big_query':   

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

if ProjectVariables.warehouse == 'snowflake':   

    lookml_explore_schema = '''

    with source as (
    select 
    *
    from "{0}"."INFORMATION_SCHEMA"."COLUMNS"
    where table_schema = '{1}'
    ),
    row_counts as (
    select
        table_name,
        sum(row_count) as row_count
    from "{0}"."INFORMATION_SCHEMA"."TABLES"
    where table_schema = '{1}'
    group by 1
    ),
    pks as (
        select 
        table_name as pk_table_name,
        column_name as pk_column_name,
        rtrim(column_name, '_PK') as pk_sk
        from source
        where column_name ilike '%%pk%%'
    ),
    fks as (
        select
        table_name as fk_table_name,
        column_name as fk_column_name,
        rtrim(column_name, '_FK') as fk_sk
        from source
        where column_name ilike '%%fk%%'
    )
    select 

    pk_table_name,
    pk_column_name,
    fk_table_name,
    fk_column_name,
    case when merge_counts_pk.row_count > merge_counts_fk.row_count
            then 'many_to_one'   
        when merge_counts_pk.row_count < merge_counts_fk.row_count
            then 'one_to_many'
        when merge_counts_pk.row_count = merge_counts_fk.row_count
            then 'one_to_one'
    end as looker_relationship
    
    from pks
    left join fks on pks.pk_sk = fks.fk_sk
    left join row_counts as merge_counts_fk on merge_counts_fk.table_name = fks.fk_table_name
    left join row_counts as merge_counts_pk on merge_counts_pk.table_name = pks.pk_table_name
    '''.format(ProjectVariables.database,ProjectVariables.schema)

if ProjectVariables.warehouse == 'big_query':


    test_warehouse_schema = '''

    {% for value in test_schemas %}

    {% if loop.first %} with source_{{ value | sqlsafe }} as ( {% endif %}
    {% if not loop.first %} source_{{ value | sqlsafe }} as ( {% endif %}

    select * from `{{project_id}}.{{value | sqlsafe}}.INFORMATION_SCHEMA.COLUMNS`

    ),

    {% endfor %}

    unioned as (
    {% for value in test_schemas  %}
    select * from source_{{ value | sqlsafe }}
    {% if not loop.last %}union all{% endif %}
    {% endfor %}
    )
    select * from unioned

    '''
    
if ProjectVariables.warehouse == 'snowflake':   

    test_warehouse_schema =   """
    with source_1 as (
        select * from "{0}"."INFORMATION_SCHEMA"."COLUMNS"

        where table_schema = '{1}'

        ),

    source_2 as (
        select * from "{0}"."INFORMATION_SCHEMA"."COLUMNS"

        where table_schema = '{2}'


    ),
    
    source_3 as (
    select * from "{0}"."INFORMATION_SCHEMA"."COLUMNS"

        where table_schema = '{3}'
    
    ),
    
    unioned as (
    select * from source_1
    
    union all
    
    select * from source_2
    
    union all
    
    select * from source_3
    
    )
    select * from unioned
    """.format(ProjectVariables.database,ExploresVariables.test_schemas[0],ExploresVariables.test_schemas[1],ExploresVariables.test_schemas[2])

if ProjectVariables.warehouse == 'big_query':   

    cube_explore_schema = '''
    with source as (
    select 
    *
    from `{{project_id}}.{{schema_id}}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
    ),
    row_counts as (
    select
        table_id as table_name,
        row_count
    from `{{project_id}}.{{schema_id}}.__TABLES__`
    ),
    pks as (
        select 
        table_name as pk_table_name,
        column_name as pk_column_name,
        trim(column_name, "_pk") as pk_sk
        from source
        where column_name like '%%pk%%'
    ),
    fks as (
        select
        table_name as fk_table_name,
        column_name as fk_column_name,
        trim(column_name, "_fk") as fk_sk
        from source
        where column_name like '%%fk%%'
    )
    select 
    pk_table_name,
    pk_column_name,
    fk_table_name,
    fk_column_name,
    case when merge_counts_pk.row_count > merge_counts_fk.row_count
            then 'belongsTo'   
        when merge_counts_pk.row_count < merge_counts_fk.row_count
            then 'hasMany'
        when merge_counts_pk.row_count = merge_counts_fk.row_count
            then 'HasOne'
    end as true_relationship
    
    from pks
    inner join fks on pks.pk_sk = fks.fk_sk
    left join row_counts as merge_counts_fk on merge_counts_fk.table_name = fks.fk_table_name
    left join row_counts as merge_counts_pk on merge_counts_pk.table_name = pks.pk_table_name
    '''

if ProjectVariables.warehouse == 'snowflake':   

    cube_explore_schema = '''
    with source as (
    select 
    *
    from "{0}"."INFORMATION_SCHEMA"."COLUMNS"
    where table_schema = '{1}'
    ),
    row_counts as (
    select
        table_name,
        sum(row_count) as row_count
    from "{0}"."INFORMATION_SCHEMA"."TABLES"
    where table_schema = '{1}'
    group by 1
    ),
    pks as (
        select 
        table_name as pk_table_name,
        column_name as pk_column_name,
        rtrim(column_name, '_PK') as pk_sk
        from source
        where column_name ilike '%pk%'
    ),
    fks as (
        select
        table_name as fk_table_name,
        column_name as fk_column_name,
        rtrim(column_name, '_FK') as fk_sk
        from source
        where column_name ilike '%fk%'
    )
    select 
    pk_table_name,
    pk_column_name,
    fk_table_name,
    fk_column_name,
    case when merge_counts_pk.row_count > merge_counts_fk.row_count
            then 'belongsTo'   
        when merge_counts_pk.row_count < merge_counts_fk.row_count
            then 'hasMany'
        when merge_counts_pk.row_count = merge_counts_fk.row_count
            then 'HasOne'
    end as true_relationship
    
    from pks
    left join fks on pks.pk_sk = fks.fk_sk
    left join row_counts as merge_counts_fk on merge_counts_fk.table_name = fks.fk_table_name
    left join row_counts as merge_counts_pk on merge_counts_pk.table_name = pks.pk_table_name
    '''.format(ProjectVariables.database,ProjectVariables.schema)

if ProjectVariables.warehouse == 'big_query':

    params = {
        'project_id': ProjectVariables.project,
        'schema_id': ProjectVariables.schema, 
        'table_names': ExploresVariables.final_list,
        'table_names_unqouted': ExploresVariables.flat_list,
        'pk_fk_join_key_list': ExploresVariables.join_key_list,
        'test_schemas': ExploresVariables.test_schemas

    }

elif ProjectVariables.warehouse == 'snowflake':

    params = {
        'database': ProjectVariables.database,
        'schema_id': ProjectVariables.schema, 
        'table_names': ExploresVariables.final_list,
        'table_names_unqouted': ExploresVariables.flat_list,
        'pk_fk_join_key_list': ExploresVariables.join_key_list,
        'test_schemas': ExploresVariables.test_schemas

    }

j = JinjaSql(param_style='pyformat')

query, bind_params = j.prepare_query(lookml_explore_schema,params)

cube_query, cube_bind_params = j.prepare_query(cube_explore_schema,params)

dbt_query, dbt_bind_params = j.prepare_query(test_warehouse_schema,params)

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

dbt_test_sql = (dbt_query % bind_params)

if ProjectVariables.warehouse =='big_query':

    cube_explore_schema = (query % bind_params)

elif ProjectVariables.warehouse == 'snowflake':
    
    cube_explore_schema = cube_explore_schema

print(dbt_test_sql)
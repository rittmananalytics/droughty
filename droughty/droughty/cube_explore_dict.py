import lkml as looker
from pprint import pprint
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas
import os
import json
import sys
import yaml

from droughty import warehouse_target
from droughty import config

import git

pd.options.mode.chained_assignment = None

credentials = config.service_account

warehouse_name = config.warehouse_name
lookml_project = config.project_name

dimensional_inference_status = warehouse_target.dimensional_inference
sql = warehouse_target.warehouse_schema
explore_sql = warehouse_target.cube_explore_schema

if warehouse_name == 'big_query':

    # Run a Standard SQL query with the project set explicitly
    project_id = lookml_project
    df = pandas.read_gbq(sql, dialect='standard', project_id=lookml_project, credentials=credentials)

    df['description'] = df['description'].fillna('not available')

    df1 = df[['table_name','column_name','data_type','description']]

    df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP','timestamp')
    df1['data_type'] = df1['data_type'].str.replace('DATE','date')
    df1['data_type'] = df1['data_type'].str.replace('INT64','number')
    df1['data_type'] = df1['data_type'].str.replace('FLOAT64','number')
    df1['data_type'] = df1['data_type'].str.replace('NUMERIC','number')
    df1['data_type'] = df1['data_type'].str.replace('STRING','string')
    df1['data_type'] = df1['data_type'].str.replace('BOOL','yesno')

    df2 = df1

    explore_df = pandas.read_gbq(explore_sql, dialect='standard', project_id=lookml_project, credentials=credentials)

    explore_df_2 = explore_df[['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']]

    pk_table_name_df = explore_df[['pk_table_name']]

    duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

    distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()

    df4 = {n: grp.loc[n].to_dict('index')
        
    for n, grp in explore_df.set_index(['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']).groupby(level='pk_table_name')}

    d2 = df4

elif warehouse_name == 'snowflake': 

    url = URL(

        account = config.snowflake_account,
        user =  config.snowflake_user,
        schema =  config.snowflake_schema,
        database =  config.snowflake_database,
        password =  config.snowflake_password,
        warehouse= config.snowflake_warehouse,
        role =  config.snowflake_role

    )

    engine = create_engine(url)

    connection = engine.connect()

    explore_df = pd.read_sql(explore_sql, connection)

    explore_df.drop_duplicates(keep=False, inplace=True)

    explore_df_2 = explore_df[['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']]

    pk_table_name_df = explore_df[['pk_table_name']]

    duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

    distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()

    df4 = {n: grp.loc[n].to_dict('index')
        
    for n, grp in explore_df.set_index(['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']).groupby(level='pk_table_name')}

    d2 = df4

    connection.close()
    engine.dispose()
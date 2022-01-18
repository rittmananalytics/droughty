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
from itertools import chain

from droughty import warehouse_target
from droughty import config

import sys
import ruamel.yaml
import git

pd.options.mode.chained_assignment = None

sql = warehouse_target.test_warehouse_schema

credentials = config.service_account

warehouse_name = config.warehouse_name
lookml_project = config.project_name



if warehouse_name == 'big_query':

    # Run a Standard SQL query using the environment's default project
    df = pandas.read_gbq(sql, dialect='standard', project_id=lookml_project, credentials=credentials)

    # Run a Standard SQL query with the project set explicitly
    project_id = lookml_project
    df = pandas.read_gbq(sql, dialect='standard', project_id=lookml_project, credentials=credentials)

    df1 = df[['table_name','column_name','data_type']]

    df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP','timestamp')
    df1['data_type'] = df1['data_type'].str.replace('DATE','date')
    df1['data_type'] = df1['data_type'].str.replace('INT64','number')
    df1['data_type'] = df1['data_type'].str.replace('FLOAT64','number')
    df1['data_type'] = df1['data_type'].str.replace('NUMERIC','number')
    df1['data_type'] = df1['data_type'].str.replace('STRING','string')
    df1['data_type'] = df1['data_type'].str.replace('BOOL','yesno')

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

    query = '''
    select * from snowflake_sample_data.information_schema.columns;
    '''

    df = pd.read_sql(query, connection)
    
    df['description'] = df['comment'].fillna('not available')
    
    df1 = df.groupby(['table_name', 'column_name','data_type','description']).size().reset_index().rename(columns={0:'count'})

    df1 = df1[['table_name','column_name','data_type','description']]

    connection.close()
    engine.dispose()

def recur_dictify(frame):
    if len(frame.columns) == 1:
        if frame.values.size == 1: return frame.values[0][0]
        return frame.values.squeeze()
    grouped = frame.groupby(frame.columns[0])
    d = {k: recur_dictify(g.iloc[:,1:]) for k,g in grouped}
    return d

model_name = 'model'

d1 = (recur_dictify(df1))
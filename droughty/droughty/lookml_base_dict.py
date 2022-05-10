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

from droughty.warehouse_target import warehouse_schema
from droughty.config import ProjectVariables

def get_base_dict():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = warehouse_schema()

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        # Run a Standard SQL query with the project set explicitly
        df = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        df['description'] = df['description'].fillna('not available')

        df1 = df[['table_name','column_name','data_type','description']]

        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP','timestamp')
        df1['data_type'] = df1['data_type'].str.replace('DATE','date')
        df1['data_type'] = df1['data_type'].str.replace('INT64','number')
        df1['data_type'] = df1['data_type'].str.replace('FLOAT64','number')
        df1['data_type'] = df1['data_type'].str.replace('NUMERIC','number')
        df1['data_type'] = df1['data_type'].str.replace('STRING','string')
        df1['data_type'] = df1['data_type'].str.replace('BOOL','yesno')

    elif warehouse == 'snowflake': 

        url = URL(

            account = ProjectVariables.account,
            user =  ProjectVariables.user,
            schema =  ProjectVariables.schema,
            database =  ProjectVariables.database,
            password =  ProjectVariables.password,
            warehouse = ProjectVariables.snowflake_warehouse,
            role =  ProjectVariables.role

        )

        engine = create_engine(url)

        connection = engine.connect()

        df = pd.read_sql(sql, connection)
        
        df['description'] = df['comment'].fillna('not available')

        df['column_name'] = df['column_name'].str.lower()
        df['table_name'] = df['table_name'].str.lower()
        df['description'] = df['description'].str.lower()

        df1 = df.groupby(['table_name', 'column_name','data_type','description']).size().reset_index().rename(columns={0:'count'})

        df1 = df1[['table_name','column_name','data_type','description']]

        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP','timestamp')
        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP_TZ','timestamp')
        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP_NTZ','timestamp')
        df1['data_type'] = df1['data_type'].str.replace('DATE','date')
        df1['data_type'] = df1['data_type'].str.replace('INT64','number')
        df1['data_type'] = df1['data_type'].str.replace('FLOAT64','number')
        df1['data_type'] = df1['data_type'].str.replace('NUMERIC','number')
        df1['data_type'] = df1['data_type'].str.replace('NUMBER','number')
        df1['data_type'] = df1['data_type'].str.replace('FLOAT','number')
        df1['data_type'] = df1['data_type'].str.replace('TEXT','string')
        df1['data_type'] = df1['data_type'].str.replace('VARIANT','string')   
        df1['data_type'] = df1['data_type'].str.replace('BOOLEAN','yesno')

        connection.close()
        engine.dispose()


    df2 = df1

    df2 = {n: grp.loc[n].to_dict('index')
        
    for n, grp in df1.set_index(['table_name', 'column_name','data_type','description']).groupby(level='table_name')}

    d1 = df2

    return(d1)

base_dict = get_base_dict()
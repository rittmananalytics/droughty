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

sql = warehouse_target.dbml_reference_dict
dimensional_inference_status = warehouse_target.dimensional_inference

if dimensional_inference_status == 'enabled':

    if warehouse_name == 'big_query':

        sql = warehouse_target.dbml_reference_dict

        # Run a Standard SQL query with the project set explicitly
        project_id = lookml_project
        df = pandas.read_gbq(sql, dialect='standard', project_id=lookml_project, credentials=credentials)

        df2 = df[['table_name','column_name','data_type','pk_table_name','pk_column_name']]

        df2['data_type'] = df2['data_type'].str.replace('TIMESTAMP','timestamp')
        df2['data_type'] = df2['data_type'].str.replace('DATE','date')
        df2['data_type'] = df2['data_type'].str.replace('INT64','numeric')
        df2['data_type'] = df2['data_type'].str.replace('FLOAT64','numeric')
        df2['data_type'] = df2['data_type'].str.replace('NUMERIC','numeric')
        df2['data_type'] = df2['data_type'].str.replace('STRING','varchar')
        df2['data_type'] = df2['data_type'].str.replace('BOOL','boolean')

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

        query = sql

        df = pd.read_sql(query, connection)

        df2 = df[['table_name','column_name','data_type','pk_table_name','pk_column_name']]

        df2['data_type'] = df2['data_type'].str.replace('TIMESTAMP','timestamp')
        df2['data_type'] = df2['data_type'].str.replace('DATE','date')
        df2['data_type'] = df2['data_type'].str.replace('INT64','numeric')
        df2['data_type'] = df2['data_type'].str.replace('FLOAT64','numeric')
        df2['data_type'] = df2['data_type'].str.replace('NUMERIC','numeric')
        df2['data_type'] = df2['data_type'].str.replace('NUMBER','numeric')
        df2['data_type'] = df2['data_type'].str.replace('TEXT','varchar')
        df2['data_type'] = df2['data_type'].str.replace('BOOL','boolean')

        connection.close()
        engine.dispose()
        
        
    df3 = {n: grp.loc[n].to_dict('records')
        
    for n, grp in df2.set_index(['table_name', 'column_name','data_type','pk_table_name','pk_column_name']).groupby(level='table_name')}

    d1 = df3

else:

    d1 = (False)
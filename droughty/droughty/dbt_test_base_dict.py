from pprint import pprint
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas
from itertools import chain

from droughty import warehouse_target
from droughty.config import ProjectVariables

import sys

def get_dbt_dict():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = warehouse_target.test_warehouse_schema

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        df = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        df1 = df[['table_name','column_name','data_type']]

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
            warehouse= ProjectVariables.snowflake_warehouse,
            role =  ProjectVariables.role

        )

        engine = create_engine(url)

        connection = engine.connect()

        query = warehouse_target.test_warehouse_schema

        df = pd.read_sql(query, connection)

        df['description'] = df['comment'].fillna('not available')

        df['column_name'] = df['column_name'].str.lower()
        df['table_name'] = df['table_name'].str.lower()
        df['description'] = df['description'].str.lower()

        df1 = df.groupby(['table_name', 'column_name','data_type','description']).size().reset_index().rename(columns={0:'count'})

        df1 = df1[['table_name','column_name','data_type','description']]

        connection.close()
        engine.dispose()

    return (df1)

def recur_dictify(frame):
    if len(frame.columns) == 1:
        if frame.values.size == 1: return frame.values[0][0]
        return frame.values.squeeze()
    grouped = frame.groupby(frame.columns[0])
    d = {k: recur_dictify(g.iloc[:,1:]) for k,g in grouped}
    return d

model_name = 'model'

retrieve_test_dict = get_dbt_dict()

dbt_test_dict = (recur_dictify(retrieve_test_dict))
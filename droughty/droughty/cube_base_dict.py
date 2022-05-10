from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas


from droughty import warehouse_target
from droughty.warehouse_target import warehouse_schema
from droughty.config import ProjectVariables

class CubeBaseDictVariables():

    distinct_duplicate_explore_rows: str

def get_cube_base_dict():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = warehouse_schema()
    explore_sql = warehouse_target.explore_sql

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project


        df = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        df['description'] = df['description'].fillna('not available')

        df1 = df[['table_name','column_name','data_type','description']]

        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP','time')
        df1['data_type'] = df1['data_type'].str.replace('DATE','time')
        df1['data_type'] = df1['data_type'].str.replace('INT64','number')
        df1['data_type'] = df1['data_type'].str.replace('FLOAT64','number')
        df1['data_type'] = df1['data_type'].str.replace('NUMERIC','number')
        df1['data_type'] = df1['data_type'].str.replace('STRING','string')
        df1['data_type'] = df1['data_type'].str.replace('BOOL','boolean')

        df2 = df1

        explore_df = pandas.read_gbq(explore_sql, dialect='standard', project_id=project, credentials=credentials)

        #explore_df_2 = explore_df[['parent_table_name','pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','looker_relationship']]

        pk_table_name_df = explore_df[['pk_table_name']]

        duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

        distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()

        CubeBaseDictVariables.distinct_duplicate_explore_rows = distinct_duplicate_explore_rows

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

        df1 = df[['table_name','column_name','data_type','description']]

        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP','time')
        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP_TZ','time')
        df1['data_type'] = df1['data_type'].str.replace('TIMESTAMP_NTZ','time')
        df1['data_type'] = df1['data_type'].str.replace('DATE','time')
        df1['data_type'] = df1['data_type'].str.replace('INT64','number')
        df1['data_type'] = df1['data_type'].str.replace('FLOAT64','number')
        df1['data_type'] = df1['data_type'].str.replace('NUMERIC','number')
        df1['data_type'] = df1['data_type'].str.replace('NUMBER','number')
        df1['data_type'] = df1['data_type'].str.replace('FLOAT','number')
        df1['data_type'] = df1['data_type'].str.replace('TEXT','string')
        df1['data_type'] = df1['data_type'].str.replace('VARIANT','string')   
        df1['data_type'] = df1['data_type'].str.replace('BOOLEAN','boolean')

        df['column_name'] = df['column_name'].str.lower()
        df['table_name'] = df['table_name'].str.lower()
        df['description'] = df['description'].str.lower()

        df1 = df.groupby(['table_name', 'column_name','data_type','description']).size().reset_index().rename(columns={0:'count'})

        df1 = df1[['table_name','column_name','data_type','description']]

        df2 = df1

        connection.close()
        engine.dispose()

    df3 = {n: grp.loc[n].to_dict('index')
        
    for n, grp in df2.set_index(['table_name', 'column_name','data_type','description']).groupby(level='table_name')}

    d1 = df3

    return(d1)

cube_base_dict = get_cube_base_dict()


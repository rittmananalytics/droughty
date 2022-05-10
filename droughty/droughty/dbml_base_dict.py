from pprint import pprint
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas


from droughty.warehouse_target import dbml_schema
from droughty.config import ProjectVariables,ExploresVariables

def get_dbml_dict():

    pd.options.mode.chained_assignment = None

    credentials = ProjectVariables.service_account
    warehouse = ProjectVariables.warehouse
    project = ProjectVariables.project

    dimensional_inference_status = ExploresVariables.dimensional_inference

    #if dimensional_inference_status == 'enabled':

    if warehouse == 'big_query':

        sql = dbml_schema()

        df = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        df['description'] = df['description'].fillna('not available')

        df2 = df[['table_name','column_name','data_type','description','pk_table_name','pk_column_name']]

        df2['data_type'] = df2['data_type'].str.replace('TIMESTAMP','timestamp')
        df2['data_type'] = df2['data_type'].str.replace('DATE','date')
        df2['data_type'] = df2['data_type'].str.replace('INT64','numeric')
        df2['data_type'] = df2['data_type'].str.replace('FLOAT64','numeric')
        df2['data_type'] = df2['data_type'].str.replace('NUMERIC','numeric')
        df2['data_type'] = df2['data_type'].str.replace('STRING','varchar')
        df2['data_type'] = df2['data_type'].str.replace('BOOL','boolean')

        df3 = {n: grp.loc[n].to_dict('index')
            
        for n, grp in df2.set_index(['table_name', 'column_name','data_type','description','pk_table_name','pk_column_name']).groupby(level='table_name')}

        d1 = df3

        return(d1)



dbml_dict = get_dbml_dict()

##        elif warehouse == 'snowflake': 


#            url = URL(
#
#                account = config.snowflake_account,
#                user =  config.snowflake_user,
#                schema =  config.snowflake_schema,
#                database =  config.snowflake_database,
#                password =  config.snowflake_password,
#                warehouse= config.snowflake_warehouse,
#                role =  config.snowflake_role
#
#            )
#
#            engine = create_engine(url)
#
#            connection = engine.connect()
#
#            query = sql
#
#            df = pd.read_sql(query, connection)
#
#            df.drop_duplicates(keep=False, inplace=True)
#
#            df['description'] = df['comment'].fillna('not available')
#
#            df2 = df[['table_name','column_name','data_type','description','pk_table_name','pk_column_name']]
#
#            df2['table_name'] = df2['table_name'].str.lower()
#            df2['column_name'] = df2['column_name'].str.lower()    
#            df2['data_type'] = df2['data_type'].str.lower()
#            df2['pk_table_name'] = df2['pk_table_name'].str.lower()
#            df2['pk_column_name'] = df2['pk_column_name'].str.lower()
#
#            df2['data_type'] = df2['data_type'].str.replace('TIMESTAMP','timestamp')
#            df2['data_type'] = df2['data_type'].str.replace('DATE','date')
#            df2['data_type'] = df2['data_type'].str.replace('INT64','numeric')
#            df2['data_type'] = df2['data_type'].str.replace('FLOAT64','numeric')
#            df2['data_type'] = df2['data_type'].str.replace('NUMERIC','numeric')
#            df2['data_type'] = df2['data_type'].str.replace('NUMBER','numeric')
#            df2['data_type'] = df2['data_type'].str.replace('TEXT','varchar')
#            df2['data_type'] = df2['data_type'].str.replace('BOOL','boolean')
#
#            connection.close()
#            engine.dispose()



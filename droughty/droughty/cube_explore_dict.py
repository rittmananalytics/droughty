from pprint import pprint
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas

from droughty.config import ProjectVariables

class CubeExploreDictVariables():

    duplicate_explore_rows: str

def get_cube_explore_dict():

    from droughty.warehouse_target import cube_explore_schema

    pd.options.mode.chained_assignment = None

    credentials = ProjectVariables.service_account

    project = ProjectVariables.project

    explore_sql = cube_explore_schema

    if ProjectVariables.warehouse == 'big_query':

        explore_df = pandas.read_gbq(explore_sql, dialect='standard', project_id=project, credentials=credentials)

        #explore_df_2 = explore_df[['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']]

        pk_table_name_df = explore_df[['pk_table_name']]

        duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

        CubeExploreDictVariables.distinct_duplicate_explore_rows = duplicate_explore_rows

        df4 = {n: grp.loc[n].to_dict('index')
            
        for n, grp in explore_df.set_index(['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']).groupby(level='pk_table_name')}

        d2 = df4

        return(d2)

cube_explore_dict = get_cube_explore_dict()


#elif warehouse_name == 'snowflake': 
#
#    url = URL(
#
#        account = config.snowflake_account,
#        user =  config.snowflake_user,
#        schema =  config.snowflake_schema,
#        database =  config.snowflake_database,
#        password =  config.snowflake_password,
#        warehouse= config.snowflake_warehouse,
#        role =  config.snowflake_role
#
#    )
#
#    engine = create_engine(url)
#
#    connection = engine.connect()
#
#    explore_df = pd.read_sql(explore_sql, connection)
#
#    explore_df.drop_duplicates(keep=False, inplace=True)
#
#    explore_df_2 = explore_df[['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']]
#
#    pk_table_name_df = explore_df[['pk_table_name']]
#
#    duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]
#
#    distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()
#
#    df4 = {n: grp.loc[n].to_dict('index')
#        
#    for n, grp in explore_df.set_index(['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']).groupby(level='pk_table_name')}
#
#    d2 = df4
#
#    connection.close()
#    engine.dispose()
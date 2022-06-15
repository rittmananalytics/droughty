from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas

from droughty.droughty_core.config import (
    ProjectVariables,
    get_snowflake_connector_url
)
class CubeExploreDictVariables():

    duplicate_explore_rows: str

def get_cube_explore_dict():

    from droughty.droughty_core.warehouse_target import create_cube_explore_sql

    pd.options.mode.chained_assignment = None

    explore_sql = create_cube_explore_sql()

    if ProjectVariables.warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        explore_df = pandas.read_gbq(explore_sql, dialect='standard', project_id=project, credentials=credentials)

        pk_table_name_df = explore_df[['pk_table_name']]

        duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

        CubeExploreDictVariables.distinct_duplicate_explore_rows = duplicate_explore_rows

    elif ProjectVariables.warehouse == 'snowflake': 

        engine = create_engine(get_snowflake_connector_url())

        connection = engine.connect()

        explore_df = pd.read_sql(explore_sql, connection)

        explore_df['pk_table_name'] = explore_df['pk_table_name'].str.lower()
        explore_df['pk_column_name'] = explore_df['pk_column_name'].str.lower()
        explore_df['fk_table_name'] = explore_df['fk_table_name'].str.lower()
        explore_df['fk_column_name'] = explore_df['fk_column_name'].str.lower()
        explore_df['fk_column_name'] = explore_df['fk_column_name'].str.lower()

        ##explore_df.drop_duplicates(keep=False, inplace=True)

        pk_table_name_df = explore_df[['pk_table_name']]

        duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

        CubeExploreDictVariables.distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()

        connection.close()
        engine.dispose()

    df4 = {n: grp.loc[n].to_dict('index')
        
    for n, grp in explore_df.set_index(['pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','true_relationship']).groupby(level='pk_table_name')}

    d2 = df4

    return(d2)

from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas

from droughty.config import (
    ProjectVariables,
    get_snowflake_connector_url,
    ExploresVariables
)
class ExploreDictVariables():

    distinct_duplicate_explore_rows: str

def get_looker_explore_dict():

    from droughty.warehouse_target import create_lookml_explore_sql

    pd.options.mode.chained_assignment = None

    explore_sql = create_lookml_explore_sql()

    if ProjectVariables.warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        explore_df = pandas.read_gbq(explore_sql, dialect='standard', project_id=project, credentials=credentials)

        pk_table_name_df = explore_df[['pk_table_name']]

        duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

        distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()

        ExploreDictVariables.distinct_duplicate_explore_rows = distinct_duplicate_explore_rows

    elif ProjectVariables.warehouse == 'snowflake': 

        engine = create_engine(get_snowflake_connector_url())

        connection = engine.connect()

        explore_df = pd.read_sql(explore_sql, connection)

        explore_df.drop_duplicates(keep=False, inplace=True)

        explore_df = explore_df.apply(lambda col: col.str.lower())

        pk_table_name_df = explore_df[['pk_table_name']]

        duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

        distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()

        ExploreDictVariables.distinct_duplicate_explore_rows = distinct_duplicate_explore_rows

        connection.close()
        engine.dispose()

    df4 = {n: grp.loc[n].to_dict('index')
        
    for n, grp in explore_df.set_index(['parent_table_name','pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','looker_relationship']).groupby(level='parent_table_name')}

    d2 = df4

    return (d2)

looker_explore_dict = get_looker_explore_dict()



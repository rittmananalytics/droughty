from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas

from droughty.config import ProjectVariables
class ExploreDictVariables():

    distinct_duplicate_explore_rows: str

def get_looker_explore_dict():

    from droughty.warehouse_target import explore_sql

    pd.options.mode.chained_assignment = None

    credentials = ProjectVariables.service_account

    project = ProjectVariables.project

    explore_sql = explore_sql

    if ProjectVariables.warehouse == 'big_query':

        explore_df = pandas.read_gbq(explore_sql, dialect='standard', project_id=project, credentials=credentials)

        #explore_df_2 = explore_df[['parent_table_name','pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','looker_relationship']]

        pk_table_name_df = explore_df[['pk_table_name']]

        duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]

        distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()

        ExploreDictVariables.distinct_duplicate_explore_rows = distinct_duplicate_explore_rows

        df4 = {n: grp.loc[n].to_dict('index')
            
        for n, grp in explore_df.set_index(['parent_table_name','pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','looker_relationship']).groupby(level='parent_table_name')}

        d2 = df4

        return (d2)

looker_explore_dict = get_looker_explore_dict()

#    def recur_dictify(frame):
#        if len(frame.columns) == 1:
#            if frame.values.size == 1: return frame.values[0][0]
#            return frame.values.squeeze()
#        grouped = frame.groupby(frame.columns[0])
#        d = {k: recur_dictify(g.iloc[:,1:]) for k,g in grouped}
#        return d

#elif ProjectVariables.warehouse == 'snowflake': 
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
#    explore_df['parent_table_name'] = explore_df['parent_table_name'].str.lower()
#    explore_df['pk_table_name'] = explore_df['pk_table_name'].str.lower()
#    explore_df['pk_column_name'] = explore_df['pk_column_name'].str.lower()
#    explore_df['fk_table_name'] = explore_df['fk_table_name'].str.lower()
#    explore_df['fk_column_name'] = explore_df['fk_column_name'].str.lower()
#
#    explore_df_2 = explore_df[['parent_table_name','pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','looker_relationship']]
#
#    pk_table_name_df = explore_df[['pk_table_name']]
#
#    duplicate_explore_rows = pk_table_name_df[pk_table_name_df.duplicated(['pk_table_name'])]
#
#    distinct_duplicate_explore_rows = duplicate_explore_rows['pk_table_name'].drop_duplicates().to_list()
#
#    connection.close()
#    engine.dispose()
#
#    df4 = {n: grp.loc[n].to_dict('index')
#        
#    for n, grp in explore_df.set_index(['parent_table_name','pk_table_name', 'pk_column_name','fk_table_name','fk_column_name','looker_relationship']).groupby(level='parent_table_name')}
#
#    d2 = df4

#    def recur_dictify(frame):
#        if len(frame.columns) == 1:
#            if frame.values.size == 1: return frame.values[0][0]
#            return frame.values.squeeze()
#        grouped = frame.groupby(frame.columns[0])
#        d = {k: recur_dictify(g.iloc[:,1:]) for k,g in grouped}
#        return d
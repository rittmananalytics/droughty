from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas
from collections import defaultdict

from droughty.droughty_core.warehouse_target import create_base_sql
from droughty.droughty_core.config import (
    ProjectVariables,
    get_snowflake_connector_url
)
from droughty.droughty_core.droughty_data_prep import (
    wrangle_bigquery_dataframes,
    wrangle_snowflake_dataframes,
    wrangle_bigquery_dataframes_drill_sets,
    wrangle_snowflake_dataframes_drill_sets
)

def get_base_dict():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = create_base_sql()

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        dataframe = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        wrangled_dataframe = wrangle_bigquery_dataframes(dataframe)

    elif warehouse == 'snowflake': 

        engine = create_engine(get_snowflake_connector_url())

        connection = engine.connect()

        dataframe = pd.read_sql(sql, connection)

        wrangled_dataframe = wrangle_snowflake_dataframes(dataframe)

        connection.close()
        engine.dispose()

    wrangled_dataframe = {n: grp.loc[n].to_dict('index')
        
    for n, grp in wrangled_dataframe.set_index(['table_name', 'column_name','data_type','description']).groupby(level='table_name')}

    return(wrangled_dataframe)

def get_field_dict():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = create_base_sql()

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        dataframe = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        wrangled_dataframe = wrangle_bigquery_dataframes_drill_sets(dataframe)

    elif warehouse == 'snowflake': 

        engine = create_engine(get_snowflake_connector_url())

        connection = engine.connect()

        dataframe = pd.read_sql(sql, connection)

        wrangled_dataframe = wrangle_snowflake_dataframes_drill_sets(dataframe)

        connection.close()
        engine.dispose()

    wrangled_dataframe = wrangled_dataframe.groupby('table_name')['column_name'].apply(list).to_dict()

    return(wrangled_dataframe)
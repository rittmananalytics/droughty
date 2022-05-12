from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas

from droughty.warehouse_target import create_dbt_test_sql
from droughty.config import (
    ProjectVariables,
    get_snowflake_connector_url,
)
from droughty.droughty_data_prep import (
    wrangle_bigquery_dbt_test_dataframes,
    wrangle_snowflake_dbt_test_dataframes
)

def get_dbt_dict():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = create_dbt_test_sql()

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        dataframe = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        wrangled_dataframe = wrangle_bigquery_dbt_test_dataframes(dataframe)

    elif warehouse == 'snowflake': 

        engine = create_engine(get_snowflake_connector_url())

        connection = engine.connect()

        dataframe = pd.read_sql(sql, connection)

        wrangled_dataframe = wrangle_snowflake_dbt_test_dataframes(dataframe)

        connection.close()
        engine.dispose()

    return(wrangled_dataframe)

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
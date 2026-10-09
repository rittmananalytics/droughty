from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas

from droughty.droughty_core.warehouse_target import create_dbt_test_sql
from droughty.droughty_core.config import (
    ProjectVariables,
    get_snowflake_connector_url,
)
from droughty.droughty_core.droughty_data_prep import (
    wrangle_bigquery_dbt_test_dataframes,
    wrangle_snowflake_dbt_test_dataframes
)

def query_dbt_dataframe():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = create_dbt_test_sql()

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        dataframe = pandas_gbq.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

    elif warehouse == 'snowflake': 

        engine = create_engine(get_snowflake_connector_url())

        connection = engine.connect()

        dataframe = pd.read_sql(sql, connection)

        connection.close()
        engine.dispose()

    return(dataframe)

def wrangle_dbt_dataframe(dataframe):

    warehouse = ProjectVariables.warehouse

    if warehouse == 'big_query':

        wrangled_dataframe = wrangle_bigquery_dbt_test_dataframes(dataframe)

    elif warehouse == 'snowflake': 

        wrangled_dataframe = wrangle_snowflake_dbt_test_dataframes(dataframe)

    return(wrangled_dataframe)

def get_dbt_dict():

    return wrangle_dbt_dataframe(query_dbt_dataframe())

def table_schemas(dataframe):

    """Map each table name to its schema, used to assign tables to layers.

    Snowflake table names are lowercased when wrangled, so both spellings are kept.
    """

    schemas = {}

    if 'table_schema' not in dataframe.columns:

        return schemas

    for table_name, table_schema in zip(dataframe['table_name'], dataframe['table_schema']):

        schemas[table_name] = table_schema
        schemas[str(table_name).lower()] = table_schema

    return schemas

def recur_dictify(frame):
    if len(frame.columns) == 1:
        if frame.values.size == 1: return frame.values[0][0]
        return frame.values.squeeze()
    grouped = frame.groupby(frame.columns[0])
    d = {k: recur_dictify(g.iloc[:,1:]) for k,g in grouped}
    return d

model_name = 'model'

def dbt_test_dict():

    return recur_dictify(get_dbt_dict())

def dbt_test_dict_and_schemas():

    """Run the warehouse query once and return the test dict and each table's schema."""

    dataframe = query_dbt_dataframe()

    schemas = table_schemas(dataframe)

    return recur_dictify(wrangle_dbt_dataframe(dataframe)), schemas
from collections import defaultdict
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import pandas
from droughty.droughty_core.warehouse_target import create_base_sql
from droughty.droughty_core.config import ProjectVariables, get_snowflake_connector_url
from droughty.droughty_core.droughty_data_prep import (
    wrangle_bigquery_dataframes,
    wrangle_snowflake_dataframes,
    wrangle_bigquery_dataframes_drill_sets,
    wrangle_snowflake_dataframes_drill_sets
)

def flatten_dict(d, parent_key='', sep='.'):
    items = []
    for k, v in d.items():
        new_key = f'{parent_key}{sep}{k}' if parent_key else k
        if isinstance(v, dict):
            items.extend(flatten_dict(v, new_key, sep=sep).items())
        else:
            items.append((new_key, v))
    return dict(items)

def get_base_dict():
    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse
    sql = create_base_sql()

    if warehouse == 'big_query':
        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        dataframe = pd.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)
        wrangled_dataframe = wrangle_bigquery_dataframes(dataframe)

    elif warehouse == 'snowflake':
        engine = create_engine(get_snowflake_connector_url())
        connection = engine.connect()

        dataframe = pd.read_sql(sql, connection)
        wrangled_dataframe = wrangle_snowflake_dataframes(dataframe)

        connection.close()
        engine.dispose()

    wrangled_dataframe_dict = defaultdict(dict)
    for name, group in wrangled_dataframe.groupby('table_name'):
        for index, row in group.iterrows():
            unique_key = (row['column_name'], row['data_type'], row['description'])
            flattened_row = flatten_dict(row.to_dict())
            wrangled_dataframe_dict[name][unique_key] = flattened_row

    return wrangled_dataframe_dict

def get_field_dict():
    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse
    sql = create_base_sql()

    if warehouse == 'big_query':
        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        dataframe = pd.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)
        wrangled_dataframe = wrangle_bigquery_dataframes_drill_sets(dataframe)

    elif warehouse == 'snowflake':
        engine = create_engine(get_snowflake_connector_url())
        connection = engine.connect()

        dataframe = pd.read_sql(sql, connection)
        wrangled_dataframe = wrangle_snowflake_dataframes_drill_sets(dataframe)

        connection.close()
        engine.dispose()

    field_dict = wrangled_dataframe.groupby('table_name')['column_name'].apply(list).to_dict()

    return field_dict
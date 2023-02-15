from contextlib import redirect_stdout

import pandas as pd
import pandas_dedupe

import pandas as pd
import pandas
import pandas_gbq
import snowflake.connector
from google.oauth2 import service_account
from snowflake.sqlalchemy import URL
from snowflake.connector.pandas_tools import pd_writer
from sqlalchemy import create_engine
import os
import json
import sys
import yaml
import git


from droughty.droughty_resolve.resolve_base_dict import get_resolve_dataframe

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables,
    get_snowflake_resolution_connector_url,
    IdentifyConfigVariables
)

def entity_resolution_duplication():

    resolution_columns = list(ExploresVariables.resolution_tables.values())
    resolution_tables = list(ExploresVariables.resolution_tables.keys())

    table_name = ExploresVariables.write_table_name[0]
    cols = ExploresVariables.write_column_names

    cols.append("source_table")

    if ExploresVariables.resolution_read_schema != None:

        linked_dataframe = get_resolve_dataframe() 

        linked_dataframe.columns = cols

        linked_dataframe = pandas_dedupe.dedupe_dataframe(linked_dataframe,cols)

        linked_dataframe.columns = linked_dataframe.columns.str.replace(" ", "_")

        if ProjectVariables.warehouse == 'big_query':

            pandas_gbq.to_gbq(linked_dataframe,
            ExploresVariables.resolution_write_schema+'.'+table_name,
            project_id = ProjectVariables.project,
            credentials = ProjectVariables.service_account,
            if_exists='replace'
            )

        elif ProjectVariables.warehouse == 'snowflake': 

            linked_dataframe.columns = map(str.upper, linked_dataframe.columns)

            engine = create_engine(get_snowflake_resolution_connector_url())
            connection = engine.connect()

            if_exists = 'replace'

            with engine.connect() as con:
                linked_dataframe.to_sql(name=table_name.lower(), con=connection, if_exists=if_exists, method=pd_writer, index=False)

def resolve_output():

    entity_resolution_duplication()
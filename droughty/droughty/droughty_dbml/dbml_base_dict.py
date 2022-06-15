import json
from collections import defaultdict
from contextlib import redirect_stdout

import pandas
import pandas as pd
import pandas_gbq
import snowflake.connector
from google.oauth2 import service_account
from snowflake.sqlalchemy import URL
from sqlalchemy import create_engine

from droughty.droughty_core.config import ProjectVariables, get_snowflake_connector_url
from droughty.droughty_core.droughty_data_prep import (wrangle_bigquery_dbml_dataframes,
                                         wrangle_snowflake_dbml_dataframes)
from droughty.droughty_core.warehouse_target import create_dbml_sql


def get_dbml_dict():

    pd.options.mode.chained_assignment = None

    warehouse = ProjectVariables.warehouse

    sql = create_dbml_sql()

    if warehouse == 'big_query':

        credentials = ProjectVariables.service_account
        project = ProjectVariables.project

        dataframe = pandas.read_gbq(sql, dialect='standard', project_id=project, credentials=credentials)

        wrangled_dataframe = wrangle_bigquery_dbml_dataframes(dataframe)


    elif warehouse == 'snowflake': 

        engine = create_engine(get_snowflake_connector_url())
        connection = engine.connect()

        dataframe = pd.read_sql(sql, connection)

        wrangled_dataframe = wrangle_snowflake_dbml_dataframes(dataframe)

        connection.close()
        engine.dispose()

    wrangled_dataframe = {n: grp.loc[n].to_dict('index')
        
    for n, grp in wrangled_dataframe.set_index(['schema','table_name', 'column_name','data_type','description','pk_table_name','pk_column_name']).groupby(level=['schema','table_name'])}

    return(wrangled_dataframe)


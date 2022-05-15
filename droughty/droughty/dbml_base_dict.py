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

from droughty.config import ProjectVariables, get_snowflake_connector_url
from droughty.droughty_data_prep import (wrangle_bigquery_dbml_dataframes,
                                         wrangle_snowflake_dbml_dataframes)
from droughty.warehouse_target import create_dbml_sql


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

    print(wrangled_dataframe)

    df2 = wrangled_dataframe.drop_duplicates(keep=False)

    wrangled_dataframe = {n: grp.loc[n].to_dict('index')
        
    for n, grp in wrangled_dataframe.set_index(['schema','table_name', 'column_name','data_type','description','pk_table_name','pk_column_name']).groupby(level=['schema','table_name'])}

    return(wrangled_dataframe)

#    df2 = df2.groupby(['schema']) \
#    .apply(lambda x: x.set_index(['table_name']) \
#    .to_dict(orient='index')) \
#    .to_dict()

    # df2 = df2.groupby(by=["schema", "table_name"]) \ semi-functional
    #     .agg(lambda col: pd.DataFrame(data=col) \ semi-functional
    #         #.rename(columns={"schema": "table_name"})) \ semi-functional
    #     .reset_index() \ semi-functional
    #     .to_dict(orient="index")) semi-functional

    #df2 = df2.groupby(["schema","table_name"])[['column_name','data_type','description','pk_table_name','pk_column_name']] \
        #.apply(lambda x: x.set_index("schema") \
        #.to_dict(orient="index")) \
        #.to_dict()

    # working but only with two values
    # df2 = df2.groupby('schema') \
    # .apply(lambda a: dict(a.groupby('table_name') \
    # .apply(lambda x: dict(zip(x['column_name'],x['data_type'])))
    # ))
    # df2 = df2.to_dict()

    #.apply(lambda x: dict(zip(x['column_name'], x ['data_type'], x ['description'], x ['pk_table_name'], x ['pk_column_name'])))))

    print(df2)

    return(df2)

#    wrangled_dataframe = {n: grp.loc[n].to_dict('index')
#        
#    for n, grp in wrangled_dataframe.set_index(['table_name', 'column_name','data_type','description','pk_table_name','pk_column_name','schema']).groupby(level=['table_name'])}
#
#    return(wrangled_dataframe)

dbml_dict = get_dbml_dict()

print (dbml_dict)

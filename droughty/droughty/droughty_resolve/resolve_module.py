from contextlib import redirect_stdout

import pandas as pd
import pandas_dedupe

import pandas as pd
import pandas
import pandas_gbq
import os
import json
import sys
import yaml
import git

from droughty.droughty_resolve.resolve_base_dict import get_resolve_dataframe

from droughty.droughty_core.config import (
    ExploresVariables,
    ProjectVariables,
    IdentifyConfigVariables
)

def entity_resolution_duplication():

    resolution_columns = list(ExploresVariables.resolution_tables.values())
    resolution_tables = list(ExploresVariables.resolution_tables.keys())

    table_name = resolution_tables[0]

    if ExploresVariables.resolution_read_schema != None:

        linked_dataframe = pandas_dedupe.dedupe_dataframe(get_resolve_dataframe(),['harvest_client_pk','harvest_client_name'])

        linked_dataframe.columns = linked_dataframe.columns.str.replace(" ", "_")

        pandas_gbq.to_gbq(linked_dataframe,
        ExploresVariables.resolution_write_schema+'.'+table_name,
        ProjectVariables.project,
        if_exists='replace'
        )

        print(linked_dataframe)

def resolve_output():

    entity_resolution_duplication()

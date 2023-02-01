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
    IdentifyConfigVariables
)


def entity_resolution_duplication(dataframe):

    if ExploresVariables.resolution_read_schema != None:

        dataframe = pandas_dedupe.dedupe_dataframe(dataframe,['harvest_client_name'])

        pandas_gbq.to_gbq(dataframe, 'resolved'+ExploresVariables.table_name, project_id=ExploresVariables.project_id)

def resolve_output():

    entity_resolution_duplication(get_resolve_dataframe)

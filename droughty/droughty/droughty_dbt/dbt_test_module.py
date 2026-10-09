import lkml as looker
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import pandas as pd
import pandas
import os
import json
import sys
from itertools import chain

from collections import defaultdict


from droughty.droughty_dbt.dbt_test_base_dict import dbt_test_dict
from droughty.droughty_dbt.dbt_test_field_base import described_columns_list
from droughty.droughty_dbt.dbt_schema_builder import (
    build_schema_entries,
    render_schema,
    schema_file_path,
    write_schema
)
from droughty.droughty_core.config import (
    IdentifyConfigVariables,
    ExploresVariables
)

import sys
import ruamel.yaml
import git


def get_all_values(nested_dictionary):

    return build_schema_entries(
        nested_dictionary,
        ExploresVariables.test_overwrite,
        ExploresVariables.test_ignore,
        described_columns_list
    )

def schema_output():

    file_path = schema_file_path(
        IdentifyConfigVariables.git_path,
        ExploresVariables.dbt_path,
        ExploresVariables.dbt_tests_filename
    )

    write_schema(file_path, render_schema(get_all_values(dbt_test_dict())))

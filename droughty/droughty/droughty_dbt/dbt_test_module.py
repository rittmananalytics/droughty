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


from droughty.droughty_dbt.dbt_test_base_dict import dbt_test_dict_and_schemas
from droughty.droughty_dbt.dbt_test_field_base import described_columns_list
from droughty.droughty_dbt.dbt_schema_builder import (
    build_schema_entries,
    write_schema
)
from droughty.droughty_dbt.dbt_schema_layers import (
    layer_settings,
    schema_files,
    stale_schema_files,
    remove_or_report_stale
)
from droughty.droughty_core.config import (
    IdentifyConfigVariables,
    ExploresVariables,
    droughty_project
)
from droughty.droughty_core.config_cli import Common

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

    settings = layer_settings(droughty_project)

    nested_dictionary, schemas = dbt_test_dict_and_schemas()

    # the warehouse has no dbt file paths, so tables are assigned to layers by name prefix or schema
    model_info = {name: {'original_file_path': None, 'schema': schemas.get(name)} for name in nested_dictionary}

    files = schema_files(
        get_all_values(nested_dictionary),
        model_info,
        IdentifyConfigVariables.git_path,
        ExploresVariables.dbt_path,
        ExploresVariables.dbt_tests_filename,
        settings
    )

    for file_path, text in files.items():

        write_schema(file_path, text)

    remove_or_report_stale(
        stale_schema_files(
            files,
            IdentifyConfigVariables.git_path,
            ExploresVariables.dbt_path,
            ExploresVariables.dbt_tests_filename
        ),
        getattr(Common, 'clean', False)
    )

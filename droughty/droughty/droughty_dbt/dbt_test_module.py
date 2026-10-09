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
from droughty.droughty_dbt.dbt_schema_check import (
    ci_check_enabled,
    compare_schema_files,
    print_check_result
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

def generate_schema_files():

    """Return ({path: YAML text}, number of tables) for the schema files droughty would write."""

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

    return files, len(model_info)

def find_stale_files(files):

    return stale_schema_files(
        files,
        IdentifyConfigVariables.git_path,
        ExploresVariables.dbt_path,
        ExploresVariables.dbt_tests_filename
    )

def schema_output():

    files, table_count = generate_schema_files()

    for file_path, text in files.items():

        write_schema(file_path, text)

    remove_or_report_stale(find_stale_files(files), getattr(Common, 'clean', False))

def schema_check():

    """Compare the committed schema files with the warehouse without writing anything.

    Returns True if in sync, False if not, and None if dbt_ci_check is false.
    """

    if not ci_check_enabled(droughty_project):

        print("dbt_ci_check is false in droughty_project.yaml, so the check is skipped.")

        return None

    files, table_count = generate_schema_files()

    result = compare_schema_files(files, find_stale_files(files), IdentifyConfigVariables.git_path)

    print_check_result(result, table_count, len(files), 'droughty dbt --clean')

    return result['in_sync']

import os

from droughty.droughty_core.config import DbtTestVariables,IdentifyConfigVariables
from droughty.droughty_dbt.dbt_schema_builder import read_described_columns

droughty_project = os.path.join(IdentifyConfigVariables.git_path,DbtTestVariables.field_description_path,DbtTestVariables.field_description_file_name)

try:
    described_columns_list = read_described_columns(droughty_project)
except Exception as e:
    print(f"Exception creating described_columns_list: {e}")
    described_columns_list = []

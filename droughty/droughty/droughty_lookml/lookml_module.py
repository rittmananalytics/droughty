import lkml as looker
import os
from contextlib import redirect_stdout
from google.oauth2 import service_account
import pandas_gbq
from contextlib import redirect_stdout
import snowflake.connector
from sqlalchemy import create_engine
from snowflake.sqlalchemy import URL
import pandas as pd
import json
import sys
import yaml
import git

from droughty.droughty_lookml.lookml_base_dict import get_base_dict, get_field_dict
from droughty.droughty_core.config import ExploresVariables, IdentifyConfigVariables

def get_all_values(nested_dictionary, field_dict):

    for key, value in nested_dictionary.items():
        view = {
            "view": key + " {",
            "sql_table_name": key
        }
        yield looker.dump(view)

        if key in field_dict and field_dict[key]:
            non_nested_fields_set = set()  # Use a set to store unique field names
            for key1, value1 in value.items():
                # Exclude fields that are nested or contain "date", "timestamp", or "fk"
                if "ARRAY<STRUCT<" not in key1[1] and "date" not in key1[1] and "timestamp" not in key1[1] and "fk" not in key1[0]:
                    non_nested_fields_set.add(key1[0])  # Add field name to the set

            # Convert the set back to a list for LookML set block and sort it alphabetically
            non_nested_fields = sorted(list(non_nested_fields_set))

            if non_nested_fields:
                set_block = {
                    "set": {
                        "fields": non_nested_fields,
                        "name": key + "_set"
                    }
                }
                yield looker.dump(set_block)



        nested_views = []
        has_nested_fields = False
        processed_dimensions = set()  # Set to track processed dimensions

        for key1, value1 in value.items():
            if "ARRAY<STRUCT<" in key1[1]:
                has_nested_fields = True
                # Handle nested fields separately
                nested_view_name = f"{key}__{key1[0]}"
                nested_view = {
                    "view": nested_view_name + " {",
                    "sql_table_name": key
                }
                nested_views.append((nested_view_name, nested_view, key1[1]))
            
            elif "time" in key1[1] and "timestamp" not in key1[1] and "datetime" not in key1[1] and key1[0] not in processed_dimensions:
                processed_dimensions.add(key1[0])
                # Add a string dimension for 'time' type fields
                dimension = {
                    "dimension": {
                        "type": "string",  # Specify dimension type as string for time fields
                        "sql": "${TABLE}." + key1[0],  # Field reference
                        "name": key1[0],  # Field name
                        "description": key1[2],  # Field description
                        "drill_fields": [key + "_set*"]  # Add drill fields if needed
                    }
                }
                yield looker.dump(dimension)

            elif "pk" not in key1[0] and "fk" not in key1[0] and "date" not in key1[1] and "timestamp" not in key1[1] and "number" not in key1[1]:
                if key1[0] not in processed_dimensions:
                    processed_dimensions.add(key1[0])
                    dimension = {
                        "dimension": {
                            "type": key1[1],
                            "sql": "${TABLE}." + key1[0],
                            "name": key1[0],
                            "description": key1[2],
                            "drill_fields": [key + "_set*"]
                        }
                    }
                    yield looker.dump(dimension)

            elif "pk" in key1[0] and key1[0] not in processed_dimensions:
                processed_dimensions.add(key1[0])
                dimension = {
                    "dimension": {
                        "primary_key": "yes",
                        "hidden": "yes",
                        "type": key1[1],
                        "sql": "${TABLE}." + key1[0],
                        "name": key1[0],
                        "description": key1[2]
                    }
                }
                yield looker.dump(dimension)

            elif "date" in key1[1] and key1[0] not in processed_dimensions:
                processed_dimensions.add(key1[0])
                dimension = {
                    "dimension_group": {
                        "timeframes": "[raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]",
                        "type": "time",
                        "datatype": key1[1],
                        "sql": "${TABLE}." + key1[0],
                        "name": key1[0],
                        "description": key1[2]
                    }
                }
                yield looker.dump(dimension)

            elif "timestamp" in key1[1] and key1[0] not in processed_dimensions:
                processed_dimensions.add(key1[0])
                dimension = {
                    "dimension_group": {
                        "timeframes": "[time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]",
                        "type": "time",
                        "datatype": key1[1],
                        "sql": "${TABLE}." + key1[0],
                        "name": key1[0],
                        "description": key1[2]
                    }
                }
                yield looker.dump(dimension)
            else:
                if key1[0] not in processed_dimensions:
                    processed_dimensions.add(key1[0])
                    dimension = {
                        "dimension": {
                            "hidden": "yes",
                            "type": key1[1],
                            "sql": "${TABLE}." + key1[0],
                            "name": key1[0],
                            "description": key1[2]
                        }
                    }
                    yield looker.dump(dimension)
            

        yield "}"  # Close the base view

        for nested_view_name, nested_view, struct in nested_views:
            yield looker.dump(nested_view)
            nested_fields = {}
            start_index = struct.find('ARRAY<STRUCT<') + len('ARRAY<STRUCT<')
            end_index = struct.rfind('>') - 1
            struct_info = struct[start_index:end_index]
            field_infos = struct_info.split(',')
            for field_info in field_infos:
                field_info = field_info.strip()
                field_parts = field_info.split()
                if len(field_parts) == 2:
                    field_name = field_parts[0]
                    field_type = field_parts[1]
                    nested_fields[field_name] = (field_name, field_type, "")

            # Process the nested fields
            nested_processed_dimensions = set()  # Set to track nested processed dimensions


            for field_tuple in nested_fields.values():
                if field_tuple[0] not in nested_processed_dimensions:
                    nested_processed_dimensions.add(field_tuple[0])

                    if "pk" not in field_tuple[0]and "fk" not in field_tuple[0] and "date" not in field_tuple[1] and "timestamp" not in field_tuple[1] and "number" not in field_tuple[1]:
                        dimension = {
                            "dimension": {
                                "type": field_tuple[1],
                                "sql": "${TABLE}." + field_tuple[0],
                                "name": field_tuple[0],
                                "description": "",
                            }
                        }
                        yield looker.dump(dimension)

                    elif "pk" in field_tuple[0]:
                        dimension = {
                            "dimension": {
                                "primary_key": "yes",
                                "hidden": "yes",
                                "type": field_tuple[1],
                                "sql": "${TABLE}." + field_tuple[0],
                                "name": field_tuple[0],
                                "description": ""
                            }
                        }
                        yield looker.dump(dimension)

                    elif "date" in field_tuple[1]:
                        dimension = {
                            "dimension_group": {
                                "timeframes": "[raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]",
                                "type": "time",
                                "datatype": field_tuple[1],
                                "sql": "${TABLE}." + field_tuple[0],
                                "name": field_tuple[0],
                                "description": ""
                            }
                        }
                        yield looker.dump(dimension)

                    elif "timestamp" in field_tuple[1]:
                        dimension = {
                            "dimension_group": {
                                "timeframes": "[time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]",
                                "type": "time",
                                "datatype": field_tuple[1],
                                "sql": "${TABLE}." + field_tuple[0],
                                "name": field_tuple[0],
                                "description": ""
                            }
                        }
                        yield looker.dump(dimension)

                    else:
                        dimension = {
                            "dimension": {
                                "hidden": "no",
                                "type": field_tuple[1],
                                "sql": "${TABLE}." + field_tuple[0],
                                "name": field_tuple[0],
                                "description": ""
                            }
                        }
                        yield looker.dump(dimension)

            yield "}"  # Close the nested view

        # Generate explore for tables with nested fields
        if has_nested_fields:
            explore_name = key
            explore = {
                "explore": explore_name,
                "{hidden": "yes",
                "joins": []
            }

            for nested_view_name, _, __ in nested_views:
                join = {
                    "name": nested_view_name,
                    "view_label": f"{key}: {nested_view_name.replace('_', ' ').title()}",
                    "sql": f"left join unnest(${{{key}.{nested_view_name.split('__')[2]}}}) AS {nested_view_name}",
                    "relationship": "one_to_many"
                }
                explore["joins"].append(join)

            yield looker.dump(explore)
            yield "}"  # Close the explore

        # Generate explores for tables without nested fields
        if not has_nested_fields:
            explore = {
                "explore": key,
                "{ hidden": "yes }"
            }
            yield looker.dump(explore)

def output():
    if ExploresVariables.lookml_path is not None:
        path = os.path.join(IdentifyConfigVariables.git_path, ExploresVariables.lookml_path)
    else:
        git_path = IdentifyConfigVariables.git_path
        rel_path = "lookml/base"
        path = os.path.join(git_path, rel_path)

    if not os.path.exists(path):
        os.makedirs(path)

    if ExploresVariables.lookml_path is not None:
        filename = ExploresVariables.lookml_base_filename
    else:
        filename = '_base.layer'

    suffix = '.lkml'
    extension = filename + suffix

    with open(os.path.join(path, extension), 'w') as file:
        with redirect_stdout(file):
            for value in get_all_values(get_base_dict(), get_field_dict()):
                print(value)

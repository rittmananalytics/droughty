import json
import os
import time
import shutil
import re
import platform

from droughty.droughty_core.config_cli import Common
from droughty.droughty_core.config import ProjectVariables, ExploresVariables

def droughty_stage_main(gcp_project_id=Common.project_id, target_datasets=Common.datasets, target_table=Common.table):
    """This script will generate compatable sources.yml files + stage model .sql files 
    for each table within the datasets of the GCP project specified. Note this should only be
    used against source datasets, landed by e.g fivetran.
    These files will be output to directory specified by stage_path key in the droughty_project.yaml"""

    # OS discovery
    system = platform.system().lower()

    # Controls console output. Enable for debugging.
    output = False
    startTime = time.perf_counter()

    # formatting options
    indent = "    "
    charCount = 60

    def camel_to_snake(name):
        name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()


    def rchop(s, suffix):
        if suffix and s.lower().endswith(suffix.lower()):
            return s[:-len(suffix)]
        return s
    
    def lchop(s, prefix):
        if prefix and s.lower().startswith(prefix.lower()):
            return s[len(prefix):]
        return s
    
    def convert_to_stg(datasetName):
        """Converts a dataset name to its staging equivalent by replacing the prefix 
        with 'stg_' and preserving everything after the first underscore.
        Args: datasetName (str): The original dataset name, e.g., 'src_dataset', 'raw_data_set', 'dataset2'.
        Returns: str: The transformed dataset name prefixed with 'stg_', e.g., 'stg_dataset', 'stg_data_set', stg_dataset2."""
        parts = datasetName.split('_', 1)
        if len(parts) == 2:
            return f"stg_{parts[1]}"
        return f"stg_{datasetName}"

    # Set output to the current working directory
    scriptFolder = os.getcwd() + "/"
    if ExploresVariables.stage_path == None:
        ExploresVariables.stage_path = "stage_files/new/"
    output_dir = os.path.join(scriptFolder, ExploresVariables.stage_path)

    # pre-clean up
    try:
        shutil.rmtree(output_dir)
    except OSError as e:
        print("Nothing to clean up. {} does not exist".format(
            output_dir+"columns"))
        
        
    # Creates directories given the above
    if not os.path.exists(os.path.dirname(output_dir+"dump/shDump/")):
        os.makedirs(os.path.dirname(output_dir+"dump/shDump/"), exist_ok=True)

    if not os.path.exists(os.path.dirname(output_dir+"dump/jsonDump/")):
        os.makedirs(os.path.dirname(output_dir+"dump/jsonDump/"), exist_ok=True)

    if not os.path.exists(os.path.dirname(output_dir+"dump/tableDump/")):
        os.makedirs(os.path.dirname(output_dir+"dump/tableDump/"), exist_ok=True)

    if not os.path.exists(os.path.dirname(output_dir)):
        os.makedirs(output_dir, exist_ok=True)
    

    if output:
        print("Detected {} base operating system".format(system))

    if ProjectVariables.bq_sdk_path == None:
        raise Exception ("""You need to specify the file path to your google cloud SDK bin bq file in your profile.yaml. Example usage: 
        bq_sdk_path: /Users/username/.../google-cloud-sdk/bin/bq""")
        

    for targetSource in target_datasets:

        # MacOS
        if system in ['darwin', 'linux']:
            #####
            with open("{}{}{}_{}.sh".format(output_dir, "dump/shDump/", "tables", targetSource), "w") as file:
                file.write(f"{ProjectVariables.bq_sdk_path} ls --max_results=10000 {gcp_project_id}:{targetSource} | awk '{{print $1}}' | tail +3  > {output_dir}dump/tableDump/tableList_{targetSource}.txt")

                

            os.system("sh {}{}{}_{}.sh".format(
                output_dir, "dump/shDump/", "tables", targetSource))

            with open("{}{}tableList_{}.txt".format(output_dir, "dump/tableDump/", targetSource), "r") as tables:
                if output:
                    print("Extracting tables from dataset: {}".format(targetSource))
                tableList = {}
                tableList[targetSource] = []
                for table in tables:
                    if target_table:
                        if table.rstrip() in [target_table, ""]:
                            tableList[targetSource].append(table.rstrip())
                    else:
                        tableList[targetSource].append(table.rstrip())

            ######

            with open("{}{}{}_{}.sh".format(output_dir, "dump/shDump/", "tableCols", targetSource), "w") as f:
                for dataset in tableList.keys():
                    for table in tableList[dataset]:
                        if output:
                            print("Extracting columns from: {}.{}".format(
                                targetSource, table))
                        f.write(f"{ProjectVariables.bq_sdk_path} show --schema {gcp_project_id}:{dataset}.{table} > {output_dir}dump/jsonDump/{dataset}.{table}.json\n")

            os.system("sh {}{}{}_{}.sh".format(output_dir,
                                            "dump/shDump/", "tableCols", targetSource))
            if output:
                print("-"*25)

    # from here, operating system does not matter
    # Writes output
    datasetInfo = {}
    counter = set()

    for enum, file in enumerate(os.listdir(output_dir+"dump/jsonDump/")):
        datasetName = file.split(".")[0]
        tableName = file.split(".")[1]
        tableNameOrig = tableName

        # make sure the tableName is not plural
        if tableName.lower().endswith("s") and not tableName.lower().endswith("ss"):
            if tableName.lower().endswith("sses"):
                tableName = rchop(tableName, "es")
            else:
                tableName = rchop(tableName, "s")

        if datasetName not in datasetInfo.keys():
            datasetInfo[datasetName] = {"tableCount": 0, "columnCount": 0}
        datasetInfo[datasetName]["tableCount"] += 1

        dsColFolder = datasetName + "/"

        if not os.path.exists(os.path.dirname(output_dir+dsColFolder)):
            os.makedirs(os.path.dirname(
                output_dir+dsColFolder), exist_ok=True)

        with open(output_dir+"dump/jsonDump/"+"/"+file, "r") as f:
            data = json.load(f)
            with open("{}{}{}".format(output_dir, dsColFolder, "sources.yml"), 'a+') as columnTxt:
                if output:
                    print("Generating yml for {}:{}".format(
                        datasetName, tableName))

                if datasetName not in counter:
                    columnTxt.write("version: 2\n")
                    columnTxt.write("sources:\n")
                    columnTxt.write("  - name: {}\n".format(datasetName))
                    columnTxt.write("    database: {}\n".format(gcp_project_id))
                    columnTxt.write("    tables:\n")
                columnTxt.write("      - name: {}\n".format(tableNameOrig))
                columnTxt.write("        columns:\n")

                for dict in data:
                    columnTxt.write("          - name: {}\n".format(dict["name"]))
                    datasetInfo[datasetName]["columnCount"] += 1
                columnTxt.write("\n")
                counter.add(datasetName)

            # stage #
            if not os.path.exists(os.path.dirname("{}{}stage/".format(output_dir, dsColFolder))):
                os.makedirs(os.path.dirname(
                    "{}{}stage/".format(output_dir, dsColFolder)), exist_ok=True)

            # create file name prefix. expecting datasetName in format s
            dbt_model_name = convert_to_stg(datasetName) +"__" + tableNameOrig + ".sql"

            with open("{}{}stage/{}".format(output_dir, dsColFolder, dbt_model_name), 'w') as columnTxt:
                if output:
                    print("Generating select statement for {}:{}".format(
                        datasetName, tableNameOrig))

                columnTxt.write(f"""{{{{
    config(
        enabled = true
    )
}}}}
                        
with source as (

    select
        *,
        row_number() over (partition by {data[0]["name"]} order by _fivetran_synced desc) as row_deduplicate
    from {{{{ source('{datasetName}', '{tableNameOrig}') }}}} s

),

rename_and_deduplicate as (

    select

        -- TODO order as follows
        -- keys


        -- dates and timestamps


        -- attributes, bools


        -- metrics

""")

                for dict in data:

                    if dict["type"].lower() in ["timestamp","datetime"]:
                        col_name_chopped = rchop(rchop(rchop(rchop(rchop(dict["name"], "_date"), "_time"), "date"), "time"), "_at")
                        col_alias = f"{col_name_chopped}_at_ts"
                        wrapped_col_name = "timestamp(s." + dict['name'] + ")"

                    elif dict["type"].lower() == "date":
                        col_name_chopped = rchop(rchop(rchop(rchop(rchop(dict["name"], "_date"), "_time"), "date"), "time"), "_at")
                        col_alias = f"{col_name_chopped}_date"
                        wrapped_col_name = "date(s." + dict['name'] + ")"

                    elif dict["type"].lower() == "string":
                        col_alias = camel_to_snake(dict["name"])
                        wrapped_col_name = "{{ clean_string('s." + dict['name'] + "') }}"

                    elif dict["type"].lower() == "integer":
                        col_alias = camel_to_snake(dict["name"])
                        wrapped_col_name = "{{ clean_int64('s." + dict['name'] + "') }}"

                    elif dict["type"].lower() == "numeric":
                        col_alias = camel_to_snake(dict["name"])
                        wrapped_col_name = "{{ clean_numeric('s." + dict['name'] + "') }}"

                    elif dict["type"].lower() == "float":
                        col_alias = camel_to_snake(dict["name"])
                        wrapped_col_name = "{{ clean_float64('s." + dict['name'] + "') }}"

                    elif dict["type"].lower() == "boolean":
                        col_alias = "is_" + lchop(camel_to_snake(dict["name"]), "is_")
                        wrapped_col_name = "cast(s." + dict['name'] + " as boolean)"

                    elif dict["type"].lower() == "json":
                        col_alias = camel_to_snake(dict["name"]) + "_json"
                        wrapped_col_name = dict['name']

                    else:
                        col_alias = camel_to_snake(dict["name"])
                        wrapped_col_name = "s." + dict['name']
                    
                    alias_padding_len = charCount - len(wrapped_col_name)
                    alias_padding = " " * alias_padding_len 
                    columnTxt.write(f"{indent*2}{wrapped_col_name}{alias_padding} as {col_alias},\n")

                columnTxt.write(
                """
        --  metadata 
                
    from source s
    where row_deduplicate = 1

)

select *
from rename_and_deduplicate""")

    # Exit console output
    executionTime = time.perf_counter() - startTime
    if output:
        print("-"*25)
        print("Script execution time: {:.2f} seconds".format(executionTime))
        print("Extracted from {} bq datasets".format(len(datasetInfo)))
        print("-"*25)
        for dataset in datasetInfo.keys():
            print("Dataset name: {}".format(dataset))
            print("Number of tables: {}".format(
                datasetInfo[dataset]["tableCount"]))
            print("Number of columns: {}".format(
                datasetInfo[dataset]["columnCount"]))
            print("-"*25)


    # Clean up
    try:
       shutil.rmtree(output_dir+"dump")
    except OSError as e:
       print("Error: {} : {}".format(output_dir+"dump", e.strerror))

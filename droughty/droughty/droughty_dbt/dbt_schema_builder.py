"""Builds and renders the droughty dbt schema file.

Shared by the warehouse source (droughty dbt) and the manifest source
(droughty dbt manifest). Nothing here reads droughty config, so it can be
used and tested without a profile or warehouse connection.
"""

import io
import os

import markdown
import ruamel.yaml


def read_described_columns(file_path):

    """Return the column names that have a {% docs %} block in the field description file."""

    with open(file_path) as f:
        htmlmarkdown = markdown.markdown(f.read())

    def get_next_words(text, match, sep=' '):
        words = iter(text.split(sep))
        for word in words:
            if word == match:
                yield next(words)

    described_columns_list = []

    for w in get_next_words(htmlmarkdown, 'docs'):

        described_columns_list.append(w)

    return described_columns_list


def build_schema_entries(nested_dictionary, test_overwrite, test_ignore, described_columns_list):

    """Turn {model: {column: data_type}} into the list of items written to the schema file."""

    ignore_test_keys_and_values = []

    try:

        if test_overwrite != None:

            ignore_test_keys_and_values = []

            for key, value in test_overwrite.items():

                nested_dictionary[key].update(value)

                for sub_key in value.keys():
                    ignore_test_keys_and_values.append(key + "-" + sub_key)

        else:

            pass

    except:

        ignore_test_keys = "None"

    res = [{"version":2},{"models":None}]

    for key,value in nested_dictionary.items():

            seq = []

            for key1,value1 in value.items():

                if key + "-" + key1 not in ignore_test_keys_and_values and not key in test_ignore:

                    if key1 in described_columns_list:

                        if "pk" in key1 and "not_null" not in value1 and "unique" not in value1:

                            elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": ["not_null","unique"]}
                            seq.append(elem)

                        elif "fk" in key1:

                            elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": ["dbt_utils.at_least_one"]}
                            seq.append(elem)

                        elif "valid_to" in key1 or "valid_from" in key1:

                            elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": ["dbt_utils.expression_is_true"":""expression"":"" valid_from < valid_to","not_null","unique"]}
                            seq.append(elem)

                        elif "pk" not in key1 or "fk" not in key1:

                            elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": [""+"dbt_utils.at_least_one"]}
                            seq.append(elem)

                        elif "pk" not in key1 or "fk" not in key1:

                            elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}"}
                            seq.append(elem)

                    elif key1 not in described_columns_list:

                            if "pk" in key1:

                                elem = {"name": key1, "tests": ["not_null","unique"]}
                                seq.append(elem)

                            elif "fk" in key1:

                                elem = {"name": key1, "tests": ["dbt_utils.at_least_one"]}
                                seq.append(elem)

                            elif "valid_to" in key1 or "valid_from" in key1:

                                elem = {"name": key1, "tests": ["dbt_utils.expression_is_true"":""expression"":"" valid_from < valid_to","not_null","unique"]}
                                seq.append(elem)

                            elif "pk" not in key1 or "fk" not in key1:

                                elem = {"name": key1, "tests": [""+"dbt_utils.at_least_one"]}
                                seq.append(elem)

                elif key + "-" + key1 in ignore_test_keys_and_values and key not in test_ignore:

                    if key1 in described_columns_list:


                        elem = {"name": key1, "description": "{{doc("+'"'+key1+'"'+")}}", "tests": value1}
                        seq.append(elem)

                    elif key1 not in described_columns_list:

                        elem = {"name": key1, "tests": value1}
                        seq.append(elem)

            res.append([{"name": key, "columns": seq}])

    return res


def render_schema(entries):

    """Render schema entries to YAML text, exactly as droughty has always written them."""

    file = io.StringIO()

    for i in entries:
        yaml = ruamel.yaml.YAML()
        yaml.indent(mapping=2, sequence=4, offset=2)
        yaml.dump(i,file)

    return file.getvalue()


def schema_file_path(git_path, dbt_path, dbt_tests_filename):

    """Return the path of the schema file: <git root>/<dbt_path or models>/<filename or droughty_schema>.yml"""

    if dbt_path == None:

        path = os.path.join(git_path, "models")

    else:

        path = os.path.join(git_path, dbt_path)

    if dbt_tests_filename != None:

        filename = dbt_tests_filename

    else:

        filename = 'droughty_schema'

    return os.path.join(path, filename + '.yml')


def write_schema(file_path, text):

    os.makedirs(os.path.dirname(file_path), exist_ok=True)

    with open(file_path, 'w') as file:

        file.write(text)

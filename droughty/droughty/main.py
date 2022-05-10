from droughty.lookml_cli import (
    base,
    explore,
    measures
)
from droughty.cube_cli import (
    base,
    explore,
    measures
)
from droughty.dbt_test_cli import schema_output
from droughty.dbml_cli import dbml_output
from droughty.config_cli import Common

def start():

    if Common.args_command == 'lookml':

        base()
        explore()
        measures()

    elif Common.args_command == 'cube':

        base()
        explore()
        measures()

    elif Common.args_command == 'dbml':

        dbml_output()

    elif Common.args_command == 'dbt':

        schema_output()

    else:

        pass

if __name__ == '__main__':
    start()

from droughty.lookml_cli import (
    lookml_base,
    lookml_explore,
    lookml_measures
)
from droughty.cube_cli import (
    base,
    explore,
    measures
)
from droughty.dbt_test_cli import tests
from droughty.dbml_cli import erd
from droughty.config_cli import Common
from droughty.config import ExploresVariables

def start():

    if Common.args_command == 'lookml':

        if ExploresVariables.dimensional_inference == 'enabled':

            lookml_base()
            lookml_explore()
            lookml_measures()

        elif ExploresVariables.dimensional_inference != 'enabled':

            lookml_base()
            lookml_measures()

    elif Common.args_command == 'cube':

        base()
        explore()
        measures()

    elif Common.args_command == 'dbml':

        erd()

    elif Common.args_command == 'dbt':

        tests()

    else:

        lookml_base()
        lookml_explore()
        lookml_measures()
        base()
        explore()
        measures()
        erd()
        tests()


if __name__ == '__main__':
    start()

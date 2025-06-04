import warnings
import os

# Set environment variables to disable progress bars and ANSI colors
os.environ['TQDM_DISABLE'] = '1'
os.environ['NO_COLOR'] = '1'

# Configure warning filters
warnings.filterwarnings("ignore", "API key must be provided when using hosted LangSmith API")
warnings.filterwarnings("ignore", "pkg_resources is deprecated as an API")
warnings.filterwarnings("ignore", "Your application has authenticated using end user credentials from Google Cloud SDK without a quota project")
warnings.filterwarnings("once", "Project hasn't been configured, hence access to all projects")
warnings.filterwarnings("ignore", "read_gbq is deprecated and will be removed in a future version")

from droughty.droughty_lookml.lookml_cli import (
    lookml_base,
    lookml_explore,
    lookml_measures,
    lookml_pop
)
from droughty.droughty_cube.cube_cli import (
    base,
    explore,
    measures
)

from droughty.droughty_dbt.dbt_test_cli import tests
from droughty.droughty_dbml.dbml_cli import erd
from droughty.droughty_core.config_cli import Common
from droughty.droughty_core.config import ExploresVariables
from droughty.droughty_docs.docs_cli import docs
from droughty.droughty_qa.qa_agent_cli import qa
from droughty.droughty_stage.stage_cli import stage


def start():

    if Common.args_command == 'lookml':

        if ExploresVariables.explore_tables != None and ExploresVariables.lookml_pop != None :

            lookml_base()
            lookml_explore()
            lookml_measures()
            lookml_pop()

        elif hasattr(ExploresVariables,'lookml_pop') == True and ExploresVariables.explore_tables == None :

            lookml_base()
            lookml_measures()
            lookml_pop()

        elif ExploresVariables.explore_tables != None and ExploresVariables.lookml_pop == None :

            lookml_base()
            lookml_measures()
            lookml_explore()

        elif ExploresVariables.explore_tables == None and hasattr(ExploresVariables,'lookml_pop') == False :

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

    elif Common.args_command == 'docs':

        docs()
        
    elif Common.args_command == 'qa':

        qa()

    elif Common.args_command == 'stage':

        stage()

    else:

        lookml_base()
        lookml_explore()
        lookml_measures()
        lookml_pop()
        base()
        explore()
        measures()
        erd()
        tests()

if __name__ == '__main__':
    start()

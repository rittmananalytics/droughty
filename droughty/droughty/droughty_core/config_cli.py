from dataclasses import dataclass
import argparse

@dataclass
class Common:

    profile_dir: str
    project_dir: str
    assumptions_dir: str
    args_command: str
    env_vars: str
    project_id: str
    datasets: str
    table: str



def profile_func():

    # creating core parser

    profile_parser = argparse.ArgumentParser(description='Droughty, keeps your workflow dry')
    profile_parser.add_argument('--profile-dir', type=str, help='the directory of the droughty profile')
    profile_parser.add_argument('--project-dir', type=str, help='the directory of the droughty project')
    profile_parser.add_argument('--env-vars', type=str, help='enables the use of environment variables')

    # creating sub-parser 

    subparser = profile_parser.add_subparsers(dest='command')

    # lookml sub-parser 

    lookml = subparser.add_parser('lookml')
    lookml.add_argument('--profile-dir', type=str, required=False)
    lookml.add_argument('--project-dir', type=str, required=False, help='the directory of the droughty project')
    lookml.add_argument('--env-vars', type=str, choices=['enabled'], required=False, help='enables the use of environment variables')


    # cube sub-parser

    cube = subparser.add_parser('cube')
    cube.add_argument('--profile-dir', type=str, required=False)
    cube.add_argument('--project-dir', type=str, required=False, help='the directory of the droughty project')
    cube.add_argument('--env-vars', type=str, choices=['enabled'], required=False, help='enables the use of environment variables')


    # dbml 

    dbml = subparser.add_parser('dbml')
    dbml.add_argument('--profile-dir', type=str, required=False)
    dbml.add_argument('--project-dir', type=str, required=False, help='the directory of the droughty project')
    dbml.add_argument('--env-vars', type=str, choices=['enabled'], required=False, help='enables the use of environment variables')


    # dbt 

    dbt = subparser.add_parser('dbt')
    dbt.add_argument('--profile-dir', type=str, required=False)
    dbt.add_argument('--project-dir', type=str, required=False, help='the directory of the droughty project')
    dbt.add_argument('--env-vars', type=str, choices=['enabled'], required=False, help='enables the use of environment variables')

    # docs 

    docs = subparser.add_parser('docs')
    docs.add_argument('--profile-dir', type=str, required=False)
    docs.add_argument('--project-dir', type=str, required=False, help='the directory of the droughty project')
    docs.add_argument('--env-vars', type=str, choices=['enabled'], required=False, help='enables the use of environment variables')

    # QA
    
    docs = subparser.add_parser('qa')
    docs.add_argument('--profile-dir', type=str, required=False)
    docs.add_argument('--project-dir', type=str, required=False, help='the directory of the droughty project')
    docs.add_argument('--assumptions-dir', type=str, required=False, help='the directory of the qa assumptions for the project')
    docs.add_argument('--env-vars', type=str, choices=['enabled'], required=False, help='enables the use of environment variables')

    # stage
    
    stage = subparser.add_parser('stage')
    stage.add_argument('--profile-dir', type=str, required=False)
    stage.add_argument('--project-dir', type=str, required=False, help='the directory of the droughty project')
    stage.add_argument('--env-vars', type=str, choices=['enabled'], required=False, help='enables the use of environment variables')
    stage.add_argument('-p', '--project_id', type=str, required=True, help='e.g my-gcp-project')
    stage.add_argument('-d', '--datasets', nargs="+", type=str, required=True, help='dataset1, dataset2, ...')
    stage.add_argument('-t', '--table', required=False)

    # parsing arguments

    args = profile_parser.parse_args()

    #some_function_1(args.profile_dir)

    # assigning arguments to class
       
    Common.args_command = (args.command)
    Common.project_dir = (args.project_dir)
    Common.profile_dir = (args.profile_dir)
    Common.env_vars = (args.env_vars)
    Common.assumptions_dir = getattr(args, 'assumptions_dir', None)
    Common.project_id = getattr(args, 'project_id', None)
    Common.datasets = getattr(args, 'datasets', None)
    Common.table = getattr(args, 'table', None)

 
profile_func()
from dataclasses import dataclass
import argparse

@dataclass
class Common:

    profile_dir: str
    project_dir: str
    args_command: str
    env_vars: str

#def some_function_1(profile_dir):
#    """Some example funcion"""
#    msg = profile_dir
#    print(msg + "function test")

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

    # parsing arguments

    args = profile_parser.parse_args()

    #some_function_1(args.profile_dir)

    # assigning arguments to class
       
    Common.args_command = (args.command)

    Common.project_dir = (args.project_dir)
    Common.profile_dir = (args.profile_dir)
    Common.env_vars = (args.env_vars)
 
profile_func()
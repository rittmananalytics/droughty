from dataclasses import dataclass
import argparse

@dataclass
class Common:

    profile_dir: str
    args_command: str

#def some_function_1(profile_dir):
#    """Some example funcion"""
#    msg = profile_dir
#    print(msg + "function test")

def profile_func():

    # creating core parser

    profile_parser = argparse.ArgumentParser(description='Say hi.')
    profile_parser.add_argument('--profile-dir', type=str, help='the directory of the profile')

    # creating sub-parser 

    subparser = profile_parser.add_subparsers(dest='command')

    # lookml sub-parser 

    lookml = subparser.add_parser('lookml')
    lookml.add_argument('--profile-dir', type=str, required=False)

    # cube sub-parser

    cube = subparser.add_parser('cube')
    cube.add_argument('--profile-dir', type=str, required=False)

    # dbml 

    dbml = subparser.add_parser('dbml')
    dbml.add_argument('--profile-dir', type=str, required=False)

    # dbt 

    dbt = subparser.add_parser('dbt')
    dbt.add_argument('--profile-dir', type=str, required=False)   

    # parsing arguments

    args = profile_parser.parse_args()

    #some_function_1(args.profile_dir)

    # assigning arguments to class
       
    Common.args_command = (args.command)

    Common.profile_dir = (args.profile_dir)

 
profile_func()

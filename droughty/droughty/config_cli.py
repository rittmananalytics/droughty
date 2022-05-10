from dataclasses import dataclass
import argparse

import os
import yaml

@dataclass
class Common:

    profile_dir: str
    args_command: str

def some_function_1(profile_dir):
    """Some example funcion"""
    msg = profile_dir
    print(msg + "function test")

def profile_func():

    profile_parser = argparse.ArgumentParser(description='Say hi.')
    profile_parser.add_argument('--profile-dir', type=str, help='the directory of the profile')

    subparser = profile_parser.add_subparsers(dest='command')
    lookml = subparser.add_parser('lookml')
    lookml.add_argument('--profile-dir', type=str, required=False)

    args = profile_parser.parse_args()

    #some_function_1(args.profile_dir)

    if args.command == 'lookml':
        print('Logging in with username:')
    else:
        pass
       
    Common.args_command = (args.command)

    Common.profile_dir = (args.profile_dir)

 
profile_func()


from dataclasses import dataclass
import argparse

import os
import yaml

@dataclass
class Common:

    profile_dir: str

#Common.profile_dir = "/Users/lewischarlesbaker/.droughty/profile.yaml"

def some_function_1(profile_dir):
    """Some example funcion"""
    msg = profile_dir
    print(msg + "function test")
    #Common.profile_dir = profile_dir

def profile_func():

    profile_parser = argparse.ArgumentParser(description='Say hi.')
    profile_parser.add_argument('--profile-dir', type=str, help='the directory of the profile')

    args = profile_parser.parse_args()

    some_function_1(args.profile_dir)

    Common.profile_dir = (args.profile_dir)

    #Common.profile_dir = "/Users/lewischarlesbaker/.droughty/profile.yaml"
 
profile_func()


#def argument_profile(profile_dir):
#
#    profile_dir_test = profile_dir
#
#    return (profile_dir_test)
#
#Common.profile_dir = argument_profile()
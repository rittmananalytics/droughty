from dataclasses import dataclass
import argparse

import os
import yaml

@dataclass
class Common:

    profile_dir: str

Common.profile_dir = "/Users/lewischarlesbaker/.droughty/profile.yaml"

profile_parser = argparse.ArgumentParser(description='Say hi.')
profile_parser.add_argument('--profile-dir', type=str, help='the directory of the profile')

#def argument_profile(profile_dir):
#
#    profile_dir_test = profile_dir
#
#    return (profile_dir_test)
#
#Common.profile_dir = argument_profile()
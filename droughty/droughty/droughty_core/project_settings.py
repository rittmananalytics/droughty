"""Reads droughty_project.yaml without loading the profile or connecting to a warehouse.

Used by commands that work from local files only, such as droughty dbt manifest.
"""

import os

import git
import yaml


def get_git_root(path):
    git_repo = git.Repo(path, search_parent_directories=True)
    git_root = git_repo.git.rev_parse("--show-toplevel")
    return (git_root)


def project_file_path(project_dir, git_path):

    if project_dir != None:

        print ("Using optional project path")

        print (project_dir)

        return project_dir

    print ("Using default project path")

    return os.path.join(git_path, "droughty_project.yaml")


def load_project_settings(project_path):

    if not os.path.exists(project_path):

        raise FileNotFoundError(f"No droughty project file found at {project_path}")

    with open(project_path) as f:
        droughty_project = yaml.load(f, Loader=yaml.FullLoader)

    return droughty_project or {}


def nested_setting(droughty_project, key, sub_key):

    """Return droughty_project[key][sub_key], or None if either level is missing."""

    value = droughty_project.get(key)

    if isinstance(value, dict):

        return value.get(sub_key)

    return None

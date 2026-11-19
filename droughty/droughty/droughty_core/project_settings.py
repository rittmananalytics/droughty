"""Reads droughty_project.yaml without loading the profile or connecting to a warehouse.

Used by commands that work from local files only, such as droughty dbt manifest
and the droughty GitHub check.
"""

import os

import git
import yaml


def get_git_root(path):

    try:
        git_repo = git.Repo(path, search_parent_directories=True)
    except (git.InvalidGitRepositoryError, git.NoSuchPathError):
        raise FileNotFoundError(
            f"{path} is not inside a git repository. Run droughty from inside your dbt project's git repository."
        )

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


def dbt_project_dir(droughty_project, git_path, override=None):

    """The folder holding dbt_project.yml: override, then the dbt_project_dir setting, then the git root.

    override is relative to the current directory; the setting is relative to the git root.
    """

    if override != None:

        return os.path.abspath(override)

    setting = droughty_project.get('dbt_project_dir')

    if setting != None:

        return os.path.join(git_path, setting)

    return git_path


def read_dbt_project(dbt_dir):

    path = os.path.join(dbt_dir, 'dbt_project.yml')

    if not os.path.exists(path):

        raise FileNotFoundError(f"No dbt_project.yml in {dbt_dir}. Set dbt_project_dir in droughty_project.yaml.")

    with open(path) as f:
        return yaml.safe_load(f) or {}


def dbt_target_path(dbt_dir):

    """The folder dbt writes manifest.json to: DBT_TARGET_PATH, then target-path in dbt_project.yml, then target."""

    target_path = os.environ.get('DBT_TARGET_PATH')

    if not target_path and os.path.exists(os.path.join(dbt_dir, 'dbt_project.yml')):

        target_path = read_dbt_project(dbt_dir).get('target-path')

    return os.path.join(dbt_dir, target_path or 'target')


def resolve_manifest_path(cli_path, dbt_dir):

    """--manifest-path (relative to the current directory), or <dbt project>/<target-path>/manifest.json."""

    if cli_path != None:

        return os.path.abspath(cli_path)

    return os.path.join(dbt_target_path(dbt_dir), 'manifest.json')

"""The droughty GitHub check, run by the droughty GitHub Action (action.yml in the repo root).

It is not a droughty command. The action calls it as:

    python -m droughty.droughty_dbt.dbt_ci_check enabled
    python -m droughty.droughty_dbt.dbt_ci_check profile --adapter dbt-bigquery --dbt-project-dir . --out DIR
    python -m droughty.droughty_dbt.dbt_ci_check run --manifest-path target/manifest.json

The check fails when:
- a dbt model has no entry in the droughty schema
- the droughty schema lists a model that is not in the dbt project
- a model's entry in the droughty schema has no tests

Models in test_ignore are skipped. It runs only when droughty_project.yaml has
droughty_dbt_ci_check: true. It needs the manifest only, not a profile or warehouse.
"""

import argparse
import os
import re
import sys

import git
import yaml

from droughty.droughty_core.project_settings import (
    get_git_root,
    project_file_path,
    load_project_settings,
    nested_setting
)
from droughty.droughty_dbt.dbt_manifest_base_dict import (
    ManifestError,
    load_manifest,
    select_models
)
from droughty.droughty_dbt.dbt_manifest_module import resolve_manifest_path
from droughty.droughty_dbt.dbt_schema_layers import schema_files_on_disk


class CheckError(Exception):
    pass


ERRORS = (CheckError, ManifestError, FileNotFoundError, git.InvalidGitRepositoryError)

# dbt adapter package -> placeholder outputs for a profiles.yml that dbt parse can read.
# dbt parse does not connect to the warehouse, so none of these values are used.
PLACEHOLDER_OUTPUTS = {
    'dbt-bigquery': {
        'type': 'bigquery',
        'method': 'oauth',
        'project': 'placeholder-project',
        'dataset': 'placeholder_dataset',
        'threads': 1,
    },
    'dbt-snowflake': {
        'type': 'snowflake',
        'account': 'placeholder',
        'user': 'placeholder',
        'password': 'placeholder',
        'role': 'placeholder',
        'database': 'placeholder',
        'warehouse': 'placeholder',
        'schema': 'placeholder',
        'threads': 1,
    },
}


def ci_check_enabled(droughty_project):

    """droughty_dbt_ci_check must be set to true for the check to run. It is off when missing."""

    enabled = droughty_project.get('droughty_dbt_ci_check', False)

    if not isinstance(enabled, bool):
        raise CheckError(f"droughty_dbt_ci_check must be true or false, not {enabled}.")

    return enabled


def _has_tests(model):

    """True if the model, or any of its columns, has at least one test."""

    def tests(item):
        return (item.get('tests') or []) + (item.get('data_tests') or [])

    if tests(model):
        return True

    return any(tests(column) for column in (model.get('columns') or []) if isinstance(column, dict))


def committed_models(paths):

    """Return {model name: {'path': ..., 'model': entry}} from the droughty schema files on disk."""

    models = {}

    for path in paths:

        with open(path) as f:

            try:
                document = yaml.safe_load(f)
            except yaml.YAMLError as e:
                raise CheckError(f"{path} is not valid YAML: {str(e).splitlines()[0]}")

        if not isinstance(document, dict):
            continue

        for model in document.get('models') or []:

            if isinstance(model, dict) and model.get('name'):
                models.setdefault(model['name'], {'path': path, 'model': model})

    return models


def find_problems(dbt_models, schema_models, ignored, git_path):

    """Return a list of problems. dbt_models is the set of model names in the dbt project."""

    def rel(path):
        return os.path.relpath(path, git_path)

    problems = []

    for name in sorted(dbt_models - set(schema_models)):

        if name not in ignored:
            problems.append(f"{name}: no entry in the droughty schema.")

    for name in sorted(set(schema_models) - dbt_models):

        problems.append(f"{name}: in {rel(schema_models[name]['path'])} but not a model in the dbt project.")

    for name in sorted(dbt_models & set(schema_models)):

        if name not in ignored and not _has_tests(schema_models[name]['model']):
            problems.append(
                f"{name}: in {rel(schema_models[name]['path'])} but has no tests. "
                f"Declare its columns in dbt YAML, or add it to test_ignore."
            )

    return problems


def run_check(project_dir=None, manifest_path=None, cwd=None):

    """Print the result and return True if the check passes or is switched off."""

    git_path = get_git_root(cwd or os.getcwd())

    droughty_project = load_project_settings(project_file_path(project_dir, git_path))

    if not ci_check_enabled(droughty_project):

        print("droughty_dbt_ci_check is not true in droughty_project.yaml, so the droughty check is skipped.")

        return True

    path = resolve_manifest_path(manifest_path, droughty_project.get('dbt_manifest_path'), git_path)

    print(f"Using dbt manifest {path}")

    dbt_models = set(select_models(load_manifest(path)))

    files = schema_files_on_disk(git_path, droughty_project.get('dbt_path'), droughty_project.get('dbt_tests_filename'))

    schema_models = committed_models(files)

    ignored = set(nested_setting(droughty_project, 'test_ignore', 'models') or [])

    problems = find_problems(dbt_models, schema_models, ignored, git_path)

    if not problems:

        print(f"droughty check passed: all {len(dbt_models - ignored)} dbt models have droughty tests.")

        return True

    print(f"droughty check failed ({len(problems)} problem{'' if len(problems) == 1 else 's'}):")
    print()

    for problem in problems:

        print(f"  - {problem}")

        # shows each problem as an error on the pull request's checks page
        if os.environ.get('GITHUB_ACTIONS') == 'true':
            print(f"::error title=droughty check::{problem}")

    print()
    print("To fix, run `dbt parse` and `droughty dbt manifest --clean`, then commit the changed schema files.")

    return False


def placeholder_profile(adapter, dbt_project_dir):

    """Return the text of a profiles.yml that lets dbt parse run without warehouse credentials."""

    # the action input can carry a version, for example dbt-bigquery==1.8.2
    adapter = re.split(r'[=<>~!\[ ]', adapter.strip())[0].lower()

    if adapter not in PLACEHOLDER_OUTPUTS:
        raise CheckError(
            f"No placeholder profile for {adapter}. "
            f"Supported: {', '.join(PLACEHOLDER_OUTPUTS)}. Pass profiles-dir to the action instead."
        )

    dbt_project_file = os.path.join(dbt_project_dir, 'dbt_project.yml')

    if not os.path.exists(dbt_project_file):
        raise CheckError(f"No dbt_project.yml in {dbt_project_dir}. Set dbt-project-dir on the action.")

    with open(dbt_project_file) as f:
        profile_name = (yaml.safe_load(f) or {}).get('profile')

    if not profile_name:
        raise CheckError(f"{dbt_project_file} has no profile name.")

    profile = {profile_name: {'target': 'ci', 'outputs': {'ci': PLACEHOLDER_OUTPUTS[adapter]}}}

    return yaml.safe_dump(profile, sort_keys=False)


def main(argv=None):

    parser = argparse.ArgumentParser(prog='droughty_ci_check', description='droughty GitHub check')
    parser.add_argument('--project-dir', help='path to droughty_project.yaml, default the git root')

    subparsers = parser.add_subparsers(dest='step', required=True)

    subparsers.add_parser('enabled', help='print true if droughty_dbt_ci_check is true, otherwise false')

    profile = subparsers.add_parser('profile', help='write a placeholder profiles.yml for dbt parse')
    profile.add_argument('--adapter', required=True)
    profile.add_argument('--dbt-project-dir', default='.')
    profile.add_argument('--out', required=True)

    run = subparsers.add_parser('run', help='run the check')
    run.add_argument('--manifest-path')

    args = parser.parse_args(argv)

    try:

        if args.step == 'enabled':

            git_path = get_git_root(os.getcwd())
            droughty_project = load_project_settings(project_file_path(args.project_dir, git_path))
            print('true' if ci_check_enabled(droughty_project) else 'false')

            return 0

        if args.step == 'profile':

            os.makedirs(args.out, exist_ok=True)

            with open(os.path.join(args.out, 'profiles.yml'), 'w') as f:
                f.write(placeholder_profile(args.adapter, args.dbt_project_dir))

            return 0

        return 0 if run_check(project_dir=args.project_dir, manifest_path=args.manifest_path) else 1

    except ERRORS as e:

        print(f"Error: {e}")

        if os.environ.get('GITHUB_ACTIONS') == 'true':
            print(f"::error title=droughty check::{e}")

        return 2


if __name__ == '__main__':

    sys.exit(main())

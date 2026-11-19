"""Shared helpers for the droughty tests."""

import json
import os
import shlex
import subprocess
import sys

FIXTURES = os.path.join(os.path.dirname(__file__), 'fixtures')
PACKAGE_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

FAKE_DBT = f"{shlex.quote(sys.executable)} {shlex.quote(os.path.join(FIXTURES, 'fake_dbt.py'))}"

# droughty dbt manifest needs dbt_build_changed; the tests use the stand-in dbt
# and the saved manifest in state/, so no git history is needed
BUILD = (
    "dbt_build_changed:\n"
    "  target: scratch\n"
    "  state_path: state\n"
    f"  dbt_command: {json.dumps(FAKE_DBT)}\n"
)


def fixture_manifest():

    with open(os.path.join(FIXTURES, 'manifest.json')) as f:
        return json.load(f)


def write_json(path, data):

    os.makedirs(os.path.dirname(path), exist_ok=True)

    with open(path, 'w') as f:
        json.dump(data, f)


def run_droughty(cwd, *args):

    """Run the droughty command line in cwd, with no ~/.droughty profile available."""

    env = dict(os.environ, PYTHONPATH=PACKAGE_ROOT, HOME=str(cwd / 'home'))

    return subprocess.run(
        [sys.executable, '-m', 'droughty.main', *args],
        cwd=cwd, env=env, capture_output=True, text=True
    )


def write_project(repo, text=''):

    """Write droughty_project.yaml with text plus the dbt_build_changed setting the tests need."""

    (repo / 'droughty_project.yaml').write_text(text + BUILD)


def set_fake_dbt(repo, **config):

    write_json(str(repo / 'fake_dbt.json'), config)


def fake_dbt_calls(repo):

    path = repo / 'fake_dbt_calls.jsonl'

    if not path.exists():
        return []

    return [json.loads(line) for line in path.read_text().splitlines()]


def dbt_commands(repo):

    """The dbt commands the stand-in dbt was asked to run, for example ['parse', 'ls', 'run', 'docs']."""

    return [[a for a in call['args'] if a != '--quiet'][0] for call in fake_dbt_calls(repo)]

"""Shared helpers for the droughty tests."""

import json
import os
import subprocess
import sys

FIXTURES = os.path.join(os.path.dirname(__file__), 'fixtures')
PACKAGE_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


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

"""A stand-in for the dbt program, used by the tests through dbt_build_changed.dbt_command.

It reads fake_dbt.json and appends each call to fake_dbt_calls.jsonl, both in the
folder named by FAKE_DBT_DIR (default: the current folder). fake_dbt.json can hold:

    changed:        unique_ids that dbt ls reports as changed
    columns:        {unique_id: {column: type}} written to catalog.json
    relations:      {unique_id: relation name} reported by dbt ls
    state_manifest: path of the manifest that dbt parse --target-path writes
    fail:           a dbt command name that should fail
"""

import json
import os
import shutil
import sys

args = sys.argv[1:]
cwd = os.getcwd()
fake_dir = os.environ.get('FAKE_DBT_DIR') or cwd

config_path = os.path.join(fake_dir, 'fake_dbt.json')
config = {}

if os.path.exists(config_path):
    with open(config_path) as f:
        config = json.load(f)

with open(os.path.join(fake_dir, 'fake_dbt_calls.jsonl'), 'a') as f:
    f.write(json.dumps({'cwd': cwd, 'args': args}) + '\n')

args = [a for a in args if a != '--quiet']
command = args[0] if args else ''


def option(name):

    return args[args.index(name) + 1] if name in args else None


def selected():

    if '--select' not in args:
        return []

    values = []

    for value in args[args.index('--select') + 1:]:
        if value.startswith('--'):
            break
        values.append(value)

    return values


def selectors_for(node):

    return {node['name'], 'fqn:' + '.'.join(node.get('fqn') or [])}


if config.get('fail') == command:
    print(f"Runtime Error: dbt {command} failed on purpose")
    sys.exit(1)

if command == 'parse' and option('--target-path'):

    source = config.get('state_manifest') or os.path.join(cwd, 'target', 'manifest.json')
    os.makedirs(option('--target-path'), exist_ok=True)
    shutil.copy(source, os.path.join(option('--target-path'), 'manifest.json'))

elif command == 'ls':

    with open(os.path.join(cwd, 'target', 'manifest.json')) as f:
        manifest = json.load(f)

    for uid, node in sorted(manifest['nodes'].items()):

        if node.get('resource_type') != 'model':
            continue

        if uid in config.get('changed', []) or selectors_for(node) & set(selected()):
            relation = config.get('relations', {}).get(uid, f"scratch.{node['name']}")
            print(json.dumps({'unique_id': uid, 'relation_name': relation}))

elif command == 'docs':

    with open(os.path.join(cwd, 'target', 'manifest.json')) as f:
        manifest = json.load(f)

    wanted = set(selected())
    nodes = {}

    for uid, columns in config.get('columns', {}).items():

        node = manifest['nodes'].get(uid)

        if node and selectors_for(node) & wanted:
            nodes[uid] = {'columns': {name: {'name': name, 'type': kind} for name, kind in columns.items()}}

    os.makedirs(option('--target-path'), exist_ok=True)

    with open(os.path.join(option('--target-path'), 'catalog.json'), 'w') as f:
        json.dump({'nodes': nodes}, f)

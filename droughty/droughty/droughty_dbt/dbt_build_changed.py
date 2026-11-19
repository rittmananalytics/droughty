"""Gets real columns for new and changed dbt models by building them empty in a scratch target.

Used by droughty dbt manifest. Steps:

1. Get an older manifest to compare with: a saved one (state_path), or one made by
   running dbt parse on the main branch in a temporary git worktree.
2. dbt ls finds new models, models whose SQL or macros changed, models whose
   droughty entry differs from the older manifest, and everything downstream of
   them. Models with no columns yet are added.
3. dbt run --empty builds only those models in the scratch target, with no rows.
   Unchanged upstream models are read from the older manifest's tables (--defer).
   droughty only builds into schemas whose name contains "droughty", so it can
   never empty a real table.
4. dbt docs generate reads their columns into catalog.json.

Settings in droughty_project.yaml:

    dbt_build_changed:
      target: droughty_scratch   # required: dbt target that writes to a scratch dataset
      defer_target: prod         # optional: target whose tables unchanged models are read from
      compare_branch: main       # optional: default is origin's default branch
      state_path: prod-artifacts # optional: folder with a saved manifest.json, used instead of compare_branch
      dbt_command: dbt           # optional: how to run dbt

dbt runs as a separate program, so it can be installed in a different Python
environment from droughty.
"""

import json
import os
import shlex
import subprocess

import git

from droughty.droughty_core.project_settings import read_dbt_project
from droughty.droughty_dbt.dbt_manifest_base_dict import load_manifest


SETTING = 'dbt_build_changed'
SETTING_KEYS = ('target', 'defer_target', 'compare_branch', 'state_path', 'dbt_command')

# new models, models whose SQL or macros changed, and everything downstream of them.
# Changes to YAML only (such as droughty's own schema files) do not change columns.
CHANGED_SELECTOR = ['state:modified.body+', 'state:modified.macros+', 'state:new+']

# droughty only builds into schemas whose name contains this, so a wrong target can never empty a real table
SCRATCH_MARK = 'droughty'

EXAMPLE = (
    f"{SETTING}:\n"
    f"  target: droughty_scratch   # a dbt target in profiles.yml that writes to a scratch dataset"
)


class BuildError(Exception):
    pass


def build_settings(droughty_project):

    """Read and check dbt_build_changed. It is required by droughty dbt manifest."""

    value = droughty_project.get(SETTING)

    if value == None:
        raise BuildError(
            f"droughty dbt manifest needs {SETTING} in droughty_project.yaml, so it can build new and "
            f"changed models and read their columns. For example:\n\n{EXAMPLE}"
        )

    if not isinstance(value, dict):
        raise BuildError(f"{SETTING} must have a target. For example:\n\n{EXAMPLE}")

    unknown = set(value) - set(SETTING_KEYS)

    if unknown:
        raise BuildError(f"{SETTING} has unknown keys: {', '.join(sorted(unknown))}. Use {', '.join(SETTING_KEYS)}.")

    for key in SETTING_KEYS:
        if value.get(key) != None and not isinstance(value[key], str):
            raise BuildError(f"{SETTING}.{key} must be text.")

    if not value.get('target'):
        raise BuildError(f"{SETTING}.target is missing. For example:\n\n{EXAMPLE}")

    if value.get('defer_target') == value['target']:
        raise BuildError(
            f"{SETTING}.target and defer_target are both {value['target']}. "
            f"The target must write to its own scratch dataset."
        )

    return {
        'target': value['target'],
        'defer_target': value.get('defer_target'),
        'compare_branch': value.get('compare_branch'),
        'state_path': value.get('state_path'),
        'dbt_command': value.get('dbt_command') or 'dbt',
    }


class Dbt:

    """Runs dbt as a separate program in the dbt project folder."""

    def __init__(self, command, cwd):

        self.command = shlex.split(command)
        self.cwd = cwd

    def run(self, args, cwd=None):

        try:
            result = subprocess.run(
                self.command + ['--quiet'] + args,
                cwd=cwd or self.cwd, capture_output=True, text=True
            )
        except FileNotFoundError:
            raise BuildError(
                f"Could not run {' '.join(self.command)}. Install dbt, or set {SETTING}.dbt_command."
            )

        if result.returncode != 0:

            output = (result.stdout + result.stderr).strip()
            tail = '\n'.join(output.splitlines()[-20:])

            hint = ''
            if 'No such option' in output and ('--empty' in output or '--favor-state' in output):
                hint = '\ndroughty dbt manifest needs dbt 1.8 or later.'

            raise BuildError(f"dbt {args[0]} failed:\n{tail}{hint}")

        return result.stdout


def _json_lines(text):

    rows = []

    for line in text.splitlines():

        line = line.strip()

        if line.startswith('{'):
            try:
                rows.append(json.loads(line))
            except json.JSONDecodeError:
                continue

    return rows


def _selectors(models, downstream=False):

    """dbt --select values for the given models, by full name so a folder with the same name is not picked up."""

    suffix = '+' if downstream else ''

    return [('fqn:' + '.'.join(model['fqn']) if model.get('fqn') else model['name']) + suffix for model in models]


def default_compare_branch(repo):

    try:
        return repo.git.symbolic_ref('--short', 'refs/remotes/origin/HEAD')
    except git.GitCommandError:
        pass

    for name in ('origin/main', 'origin/master', 'main', 'master'):
        try:
            repo.git.rev_parse('--verify', '--quiet', name + '^{commit}')
            return name
        except git.GitCommandError:
            continue

    raise BuildError(f"Could not find the main branch to compare with. Set {SETTING}.compare_branch.")


def _link_packages(dbt, dbt_dir, tree_dbt_dir):

    """Reuse installed dbt packages in the worktree, or install them. Returns the link made, if any."""

    packages_dir = read_dbt_project(dbt_dir).get('packages-install-path') or 'dbt_packages'

    source = os.path.join(dbt_dir, packages_dir)
    link = os.path.join(tree_dbt_dir, packages_dir)

    if os.path.isdir(source) and not os.path.exists(link):
        os.symlink(source, link)
        return link

    if any(os.path.exists(os.path.join(tree_dbt_dir, f)) for f in ('packages.yml', 'dependencies.yml')):
        dbt.run(['deps'], cwd=tree_dbt_dir)

    return None


def state_from_branch(dbt, settings, git_path, dbt_dir, work_dir):

    """Run dbt parse on the main branch in a temporary worktree and return the folder holding its manifest."""

    repo = git.Repo(git_path)

    branch = settings['compare_branch'] or default_compare_branch(repo)

    try:
        base = repo.git.merge_base('HEAD', branch)
    except git.GitCommandError as e:
        raise BuildError(f"Could not compare with {branch}: {e.stderr.strip() or e}")

    print(f"Comparing with {branch} (commit {base[:8]})")

    tree = os.path.join(work_dir, 'compare')
    state_dir = os.path.join(work_dir, 'state')

    repo.git.worktree('add', '--detach', tree, base)

    link = None

    try:

        tree_dbt_dir = os.path.join(tree, os.path.relpath(dbt_dir, git_path))

        if not os.path.exists(os.path.join(tree_dbt_dir, 'dbt_project.yml')):
            raise BuildError(f"{branch} has no dbt_project.yml in {os.path.relpath(dbt_dir, git_path)}.")

        link = _link_packages(dbt, dbt_dir, tree_dbt_dir)

        args = ['parse', '--target-path', state_dir]

        if settings['defer_target']:
            args += ['--target', settings['defer_target']]

        dbt.run(args, cwd=tree_dbt_dir)

    finally:

        # remove the link first, so removing the worktree cannot touch the real packages folder
        if link != None and os.path.islink(link):
            os.unlink(link)

        repo.git.worktree('remove', '--force', tree)

    return state_dir


def state_from_path(settings, git_path):

    path = os.path.join(git_path, settings['state_path'])

    if os.path.isfile(path):
        path = os.path.dirname(path)

    if not os.path.exists(os.path.join(path, 'manifest.json')):
        raise BuildError(f"No manifest.json in {path}. Check {SETTING}.state_path.")

    print(f"Comparing with the manifest in {path}")

    return path


def list_models_to_build(dbt, settings, state_dir, extra_models, drifted_models, scratch_path):

    """Return {unique_id: {'relation_name', 'schema'} in the scratch target} for the models to build.

    That is changed models and everything downstream, extra_models, and
    drifted_models and everything downstream.
    """

    output = dbt.run(
        ['ls', '--resource-type', 'model',
         '--select', *CHANGED_SELECTOR, *_selectors(extra_models), *_selectors(drifted_models, downstream=True),
         '--state', state_dir,
         '--target', settings['target'], '--target-path', scratch_path,
         '--output', 'json', '--output-keys', 'unique_id relation_name schema']
    )

    return {
        row['unique_id']: {'relation_name': row.get('relation_name'), 'schema': row.get('schema')}
        for row in _json_lines(output) if row.get('unique_id')
    }


def drifted(models, state_manifest):

    """Models whose columns differ from the older manifest although dbt may not count them as changed.

    Columns come from the droughty schema files. If they differ from the older
    manifest, they were written on this branch from SQL that may since have
    changed back, so they cannot be trusted.
    """

    state_nodes = state_manifest.get('nodes', {})

    found = []

    for name in sorted(models):

        old = state_nodes.get(models[name]['unique_id'])

        if old != None and set(models[name]['columns']) != set((old.get('columns') or {})):
            found.append(dict(models[name], name=name))

    return found


def _same_relation(a, b):

    def norm(name):
        return (name or '').replace('`', '').replace('"', '').lower()

    return bool(a) and bool(b) and norm(a) == norm(b)


def check_scratch_is_separate(settings, names, models, scratch_relations, state_manifest):

    """Stop before dbt run --empty could replace a real table with an empty one.

    Every model must land in a schema whose name contains "droughty", and not on
    the same table as the default target or the compare manifest.
    """

    state_nodes = state_manifest.get('nodes', {})

    outside = [
        f"{name} ({scratch_relations.get(models[name]['unique_id'], {}).get('schema')})"
        for name in names
        if SCRATCH_MARK not in str(scratch_relations.get(models[name]['unique_id'], {}).get('schema') or '').lower()
    ]

    if outside:
        raise BuildError(
            f"The {settings['target']} target would build {len(outside)} models in schemas without "
            f"'{SCRATCH_MARK}' in the name: {', '.join(outside[:10])}{' ...' if len(outside) > 10 else ''}. "
            f"droughty builds models empty, so it only builds into a scratch dataset named like droughty_scratch. "
            f"Check {SETTING}.target and your generate_schema_name macro."
        )

    for name in names:

        uid = models[name]['unique_id']
        scratch = scratch_relations.get(uid, {}).get('relation_name')

        for label, relation in (
            ('your default dbt target', models[name].get('relation_name')),
            ('the compare manifest', (state_nodes.get(uid) or {}).get('relation_name')),
        ):

            if _same_relation(scratch, relation):
                raise BuildError(
                    f"The {settings['target']} target would build {name} as {scratch}, the same table as "
                    f"{label}. droughty builds models empty, so the target must write to its own scratch dataset."
                )


def build_and_read_columns(dbt, settings, models_to_build, state_dir, scratch_path, adapter_type):

    """Build the models empty in the scratch target and return {unique_id: {column: data type}}."""

    selectors = _selectors(models_to_build)

    dbt.run(
        ['run', '--empty', '--full-refresh', '--select', *selectors,
         '--defer', '--favor-state', '--state', state_dir,
         '--target', settings['target'], '--target-path', scratch_path]
    )

    dbt.run(
        ['docs', 'generate', '--no-compile', '--select', *selectors,
         '--target', settings['target'], '--target-path', scratch_path]
    )

    with open(os.path.join(scratch_path, 'catalog.json')) as f:
        catalog = json.load(f)

    columns = {}

    for uid, node in (catalog.get('nodes') or {}).items():

        found = {}

        for column in (node.get('columns') or {}).values():

            name = column.get('name') or ''

            # Snowflake returns upper case names; droughty has always written them in lower case
            if adapter_type == 'snowflake':
                name = name.lower()

            found[name] = column.get('type') or ''

        columns[uid] = found

    return columns


def columns_for_changed_models(dbt, settings, git_path, dbt_dir, models, skip, adapter_type, work_dir):

    """Return {model name: {column: data type}} for new and changed models, read from the warehouse.

    models is the output of select_models for the current manifest. Models in skip
    are not built. Models with no columns are built as well as changed ones.
    """

    if settings['state_path']:
        state_dir = state_from_path(settings, git_path)
    else:
        state_dir = state_from_branch(dbt, settings, git_path, dbt_dir, work_dir)

    state_manifest = load_manifest(os.path.join(state_dir, 'manifest.json'))

    no_columns = [dict(models[name], name=name) for name in sorted(models) if not models[name]['columns'] and name not in skip]

    scratch_path = os.path.join(work_dir, 'scratch')

    changed_entries = [model for model in drifted(models, state_manifest) if model['name'] not in skip]

    listed = list_models_to_build(dbt, settings, state_dir, no_columns, changed_entries, scratch_path)

    by_uid = {model['unique_id']: name for name, model in models.items()}

    names = sorted(by_uid[uid] for uid in listed if uid in by_uid and by_uid[uid] not in skip)

    if not names:
        print("No new or changed models, so nothing to build.")
        return {}

    check_scratch_is_separate(settings, names, models, listed, state_manifest)

    shown = ', '.join(names[:10]) + (' ...' if len(names) > 10 else '')
    print(f"Building {len(names)} of {len(models)} models empty in the {settings['target']} target: {shown}")

    columns = build_and_read_columns(
        dbt, settings, [dict(models[name], name=name) for name in names], state_dir, scratch_path, adapter_type
    )

    found = {}

    for name in names:

        uid = models[name]['unique_id']

        if uid in columns:
            found[name] = columns[uid]
        else:
            print(f"Warning: dbt did not return columns for {name}. Using the columns in the manifest.")

    return found

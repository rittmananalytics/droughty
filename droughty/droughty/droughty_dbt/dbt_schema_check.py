"""Checks that the committed droughty dbt schema files match what droughty would generate now.

In sync means:
- every schema file droughty would write exists and has the same content once
  read as YAML (so formatting and comments are ignored, but models, columns,
  tests and descriptions must all match)
- no old droughty schema files are left over

Nothing is written. Nothing here reads droughty config or the warehouse.
"""

import difflib
import os

import yaml


# stop very long diffs, such as the first check on a large project, flooding CI logs
MAX_DIFF_LINES = 500


class CheckError(Exception):
    pass


def ci_check_enabled(droughty_project):

    enabled = droughty_project.get('dbt_ci_check', True)

    if not isinstance(enabled, bool):
        raise CheckError(f"dbt_ci_check must be true or false, not {enabled}.")

    return enabled


def _read(path):

    if not os.path.exists(path):
        return None

    with open(path) as f:
        return f.read()


def _parse(text):

    """Return (parsed YAML, error message)."""

    try:
        return yaml.safe_load(text), None
    except yaml.YAMLError as e:
        return None, str(e).splitlines()[0]


def _models(document):

    """Return {model name: model entry} from a parsed schema file."""

    if not isinstance(document, dict) or not isinstance(document.get('models'), list):
        return {}

    return {m.get('name'): m for m in document['models'] if isinstance(m, dict)}


def _column_names(model):

    return [c.get('name') for c in (model.get('columns') or []) if isinstance(c, dict)]


def compare_schema_files(files, stale, git_path):

    """Compare generated files with the files on disk.

    files is {path: generated text}; stale is a list of old droughty files on
    disk. Returns {'in_sync': bool, 'problems': [str], 'diff': [str]}.
    """

    def rel(path):
        return os.path.relpath(path, git_path)

    problems = []
    diff = []
    files_out_of_sync = []

    expected_models = {}
    committed_models = {}

    for path, generated_text in files.items():

        generated, _ = _parse(generated_text)

        for name, model in _models(generated).items():
            expected_models[name] = (path, model)

        committed_text = _read(path)

        if committed_text == None:

            problems.append(f"{rel(path)} does not exist.")
            files_out_of_sync.append(path)
            diff += _diff('', generated_text, rel(path))
            continue

        committed, error = _parse(committed_text)

        if error:

            problems.append(f"{rel(path)} is not valid YAML: {error}")
            files_out_of_sync.append(path)
            diff += _diff(committed_text, generated_text, rel(path))
            continue

        for name, model in _models(committed).items():
            committed_models.setdefault(name, []).append((path, model))

        if committed != generated:

            files_out_of_sync.append(path)
            diff += _diff(committed_text, generated_text, rel(path))

    for path in stale:

        problems.append(f"{rel(path)} is an old droughty file and should be deleted (run with --clean).")
        diff += _diff(_read(path) or '', '', rel(path))

        committed, error = _parse(_read(path) or '')

        for name, model in _models(committed).items():
            committed_models.setdefault(name, []).append((path, model))

    # explain the differences model by model

    model_problems_by_file = set()

    for name in sorted(set(expected_models) | set(committed_models)):

        expected = expected_models.get(name)
        committed = committed_models.get(name, [])

        if expected == None:

            places = ', '.join(rel(p) for p, _ in committed)
            problems.append(f"{name}: in {places} but no longer generated (model deleted, renamed or ignored).")
            model_problems_by_file.update(p for p, _ in committed)
            continue

        expected_path, expected_model = expected

        if not committed:

            problems.append(f"{name}: missing, expected in {rel(expected_path)}.")
            model_problems_by_file.add(expected_path)
            continue

        in_expected_file = [m for p, m in committed if p == expected_path]
        elsewhere = [p for p, _ in committed if p != expected_path]

        if elsewhere and not in_expected_file:

            problems.append(f"{name}: in {', '.join(rel(p) for p in elsewhere)}, expected in {rel(expected_path)}.")
            model_problems_by_file.update(elsewhere + [expected_path])
            continue

        if elsewhere:

            problems.append(f"{name}: also in {', '.join(rel(p) for p in elsewhere)}. dbt fails if a model is described in two files.")
            model_problems_by_file.update(elsewhere)

        committed_model = in_expected_file[0]

        if committed_model == expected_model:
            continue

        model_problems_by_file.add(expected_path)

        expected_columns = _column_names(expected_model)
        committed_columns = _column_names(committed_model)

        to_add = [c for c in expected_columns if c not in committed_columns]
        to_remove = [c for c in committed_columns if c not in expected_columns]

        if to_add or to_remove:

            parts = []
            if to_add:
                parts.append(f"columns to add: {', '.join(to_add)}")
            if to_remove:
                parts.append(f"columns to remove: {', '.join(to_remove)}")
            problems.append(f"{name}: {'; '.join(parts)}.")

        elif expected_columns != committed_columns:

            problems.append(f"{name}: columns are in a different order.")

        else:

            problems.append(f"{name}: tests or descriptions differ.")

    # anything else, such as model order or the version key
    for path in files_out_of_sync:
        if path not in model_problems_by_file and _read(path) != None and not _parse(_read(path))[1]:
            problems.append(f"{rel(path)} differs from the generated output.")

    in_sync = not files_out_of_sync and not stale

    return {'in_sync': in_sync, 'problems': problems, 'diff': diff}


def _diff(committed_text, generated_text, label):

    return list(difflib.unified_diff(
        committed_text.splitlines(keepends=True),
        generated_text.splitlines(keepends=True),
        fromfile='committed/' + label,
        tofile='generated/' + label,
    ))


def print_check_result(result, model_count, file_count, regenerate_command):

    if result['in_sync']:

        print(f"droughty schema is in sync: {model_count} models in {file_count} files.")

        return

    print(f"droughty schema is out of sync with the dbt models ({len(result['problems'])} problems):")
    print()

    for problem in result['problems']:
        print(f"  - {problem}")

    print()
    print(f"To fix, run `{regenerate_command}` and commit the changed files.")
    print()
    print("Diff between the committed and generated files:")
    print()

    lines = result['diff']

    for line in lines[:MAX_DIFF_LINES]:
        print(line, end='' if line.endswith('\n') else '\n')

    if len(lines) > MAX_DIFF_LINES:
        print(f"... {len(lines) - MAX_DIFF_LINES} more diff lines not shown.")

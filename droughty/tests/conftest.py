"""Shared pytest fixtures for the droughty tests."""

import os
import shutil

import git
import pytest

from helpers import FIXTURES, fixture_manifest, write_json


@pytest.fixture
def dbt_repo(tmp_path):

    """A git repo holding a droughty project, field descriptions and target/manifest.json."""

    git.Repo.init(tmp_path)

    (tmp_path / 'droughty_project.yaml').write_text(
        "profile: does_not_exist\n"
        "field_description_path: docs\n"
        "field_description_file_name: field_descriptions.md\n"
    )
    (tmp_path / 'docs').mkdir()
    shutil.copy(os.path.join(FIXTURES, 'field_descriptions.md'), tmp_path / 'docs' / 'field_descriptions.md')
    write_json(str(tmp_path / 'target' / 'manifest.json'), fixture_manifest())

    return tmp_path

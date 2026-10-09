Commands
========

All commands follow the pattern ``droughty <command> [options]`` and must be run from inside a git repository.

----

Global Options
--------------

These options work on every command:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Option
     - Description
   * - ``--profile-dir <path>``
     - Path to ``profile.yaml``. Defaults to ``~/.droughty/profile.yaml``
   * - ``--project-dir <path>``
     - Path to ``droughty_project.yaml``. Defaults to the git repository root
   * - ``--env-vars enabled``
     - Read all config from environment variables instead of local YAML files (useful for CI/CD)

----

.. _cmd-lookml:

lookml
------

.. code-block:: bash

   droughty lookml

**Why this exists**

Your Looker semantic layer is just a reflection of your warehouse schema. But every time a column changes, gets added, or gets removed, someone has to go and manually update the LookML view. In a project with 30+ views across 3 schemas, that's hours of mechanical work per sprint — and the work that doesn't get done turns into stale dimensions, missing fields, and Looker views that silently reference columns that no longer exist.

Droughty removes this entirely. Run it as a pre-commit hook and your LookML base layer stays permanently in sync with the warehouse, with zero manual effort.

**What it does**

Reads every column from your analytics schema via ``INFORMATION_SCHEMA`` and generates:

- A **base views** file with a LookML view for each table, containing dimensions for every column
- An **explores** file with explore definitions and joins (if the ``explores`` section is configured)
- A **measures** file with measure definitions

Data type mapping from warehouse → LookML:

.. list-table::
   :header-rows: 1
   :widths: 40 30 30

   * - Warehouse type
     - BigQuery
     - Snowflake
   * - ``number``
     - ``INT64``, ``NUMERIC``, ``FLOAT64``
     - ``NUMBER``, ``INTEGER``, ``FLOAT``
   * - ``string``
     - ``STRING``
     - ``TEXT``, ``VARCHAR``
   * - ``time``
     - ``TIMESTAMP``, ``DATETIME``
     - ``TIMESTAMP``, ``TIMESTAMP_TZ``
   * - ``date``
     - ``DATE``
     - ``DATE``
   * - ``yesno``
     - ``BOOL``
     - ``BOOLEAN``

Primary key fields (``_pk`` suffix) and foreign key fields (``_fk`` suffix) are hidden by default. Column descriptions from the warehouse are included where available.

**Output**

.. code-block:: text

   lookml/base.lkml        # Views with all dimensions
   lookml/explores.lkml    # Explore definitions and joins
   lookml/measures.lkml    # Measure definitions

Output paths are configured via ``lookml_path``, ``lookml_base_filename``, ``lookml_explore_filename``, ``lookml_measures_filename`` in ``droughty_project.yaml``.

**Examples**

.. code-block:: bash

   droughty lookml

   # Custom config paths
   droughty lookml --profile-dir /custom/path --project-dir ./

   # In CI/CD with environment variables
   droughty lookml --env-vars enabled

**Optional config in droughty_project.yaml**

Add explores with dimensional inference:

.. code-block:: yaml

   explores:
     parent_table:
       - my_fact_table
     dimensions:
       - my_dim_table
     facts:
       - my_fact_table

Add Period-over-Period dashboard parameters:

.. code-block:: yaml

   lookml_pop:
     views:
       orders_view:
         - orders_daily_fact

----

.. _cmd-dbt:

dbt
---

.. code-block:: bash

   droughty dbt

**Why this exists**

Writing ``schema.yml`` tests is the task that always gets pushed to "later" and then never happens. Without baseline tests, you don't find out about broken primary keys or unexpected nulls until a dashboard shows a problem to a stakeholder — at which point the data has been wrong for weeks.

Droughty generates test coverage for every single table in your schemas instantly. There's no longer any reason not to have it.

**What it does**

Scans all tables in your ``test_schemas`` (defined in ``profile.yaml``) and generates a ``schema.yml`` file with:

- A model definition for every table
- Column definitions with types and descriptions
- ``unique`` test on every primary key column (``_pk`` suffix)
- ``not_null`` test on every column
- ``expression_is_true: valid_from <= valid_to`` where both columns exist

**Output**

.. code-block:: text

   models/schema.yml

Path is configured via ``dbt_path`` and ``dbt_tests_filename`` in ``droughty_project.yaml``.

**Examples**

.. code-block:: bash

   droughty dbt

   # CI/CD
   droughty dbt --env-vars enabled

**Customising tests**

Override the generated tests for specific columns:

.. code-block:: yaml

   # droughty_project.yaml
   test_overwrite:
     models:
       my_table_name:
         my_pk_field:
           - not_null
           - unique

Skip all test generation for specific tables entirely:

.. code-block:: yaml

   test_ignore:
     models:
       - raw_events_table
       - temp_staging_table

.. _cmd-dbt-manifest:

**Building from the dbt manifest**

.. code-block:: bash

   dbt parse                 # or dbt compile
   droughty dbt manifest

``droughty dbt`` lists every table in your ``test_schemas``. That includes tables left behind by models that were deleted or renamed but never dropped from the warehouse. ``droughty dbt manifest`` takes the list of models from ``target/manifest.json`` instead, so only models that exist in your dbt project are included.

- No ``profile.yaml`` and no warehouse login are needed. Only ``droughty_project.yaml`` is read.
- Columns are the ones declared in your dbt YAML files. A model with no declared columns is listed without columns, and droughty prints a warning naming it. A column added to a model's SQL appears once it is declared in a YAML file and ``dbt parse`` is run again.
- Package models (for example ``dbt_utils``), ephemeral models, seeds and snapshots are skipped.
- The output path, ``test_overwrite``, ``test_ignore`` and field descriptions work as they do for ``droughty dbt``.
- Needs dbt 1.0 or later. Tested with dbt 1.8 (manifest v12). ``dbt parse`` writes the manifest from dbt 1.5; on earlier versions use ``dbt compile``.

The manifest is read from ``target/manifest.json`` in the git root by default. To change this, set ``dbt_manifest_path`` in ``droughty_project.yaml`` (relative to the git root) or pass ``--manifest-path`` (relative to the current folder):

.. code-block:: bash

   droughty dbt manifest --manifest-path dbt/target/manifest.json

If the manifest is missing, is not valid, or comes from dbt older than 1.0, droughty prints the reason and exits with code 2.

.. _cmd-dbt-layers:

**One file per layer**

By default all models go into one file. To write one file per layer instead, set:

.. code-block:: yaml

   # droughty_project.yaml
   dbt_schema_output: per_layer      # default: single

This works with both ``droughty dbt`` and ``droughty dbt manifest``. Files are written to ``dbt_path``, named after ``dbt_tests_filename`` and the layer:

.. code-block:: text

   models/droughty_schema_staging.yml
   models/droughty_schema_integration.yml
   models/droughty_schema_warehouse.yml
   models/droughty_schema_unassigned.yml    # only if some models match no layer

A model goes to the first layer that matches, checked in this order:

1. A folder in the model's file path, for example ``models/staging/stg_orders.sql``. Only ``droughty dbt manifest`` can use this, because the warehouse does not know file paths.
2. The start of the model name, for example ``stg_``.
3. The warehouse schema the model is built in.

The default layers are:

.. list-table::
   :header-rows: 1
   :widths: 25 25 25 25

   * - Layer
     - Folders
     - Prefixes
     - Schemas
   * - ``staging``
     - ``staging``
     - ``stg_``
     - none
   * - ``integration``
     - ``integration``
     - ``int_``
     - none
   * - ``warehouse``
     - ``warehouse``
     - ``wh_``
     - none

To use your own layers, set ``dbt_layers``. This replaces the defaults:

.. code-block:: yaml

   dbt_layers:
     staging:
       folders: [staging]
       prefixes: [stg_]
     warehouse:
       folders: [marts]
       prefixes: [fct_, dim_]
       schemas: [analytics]

Models that match no layer are written to the ``unassigned`` file with a warning. To stop with an error instead, set ``dbt_layer_unmatched: fail``.

A layer with no models gets no file. Each layer file starts with the line ``# Generated by droughty. Changes made here will be overwritten.`` The single file has no such line, so its content is the same as before.

.. _cmd-dbt-clean:

**Removing old files**

Switching between ``single`` and ``per_layer``, or removing a layer, leaves old droughty files behind. dbt fails if a model is described in two files, so droughty lists any old files it finds and prints a warning. Add ``--clean`` to delete them:

.. code-block:: bash

   droughty dbt --clean
   droughty dbt manifest --clean

``--clean`` only deletes the single file at ``dbt_path``/``dbt_tests_filename`` and layer files that start with droughty's header line. Files you wrote yourself are never touched.

.. _cmd-dbt-check:

**Checking the schema in CI**

.. code-block:: bash

   droughty dbt manifest --check
   droughty dbt --check

``--check`` builds the schema in memory and compares it with the committed files. It writes nothing. The schema is in sync when:

- every file droughty would write exists and has the same content once read as YAML. Formatting and comments are ignored; models, columns, tests and descriptions must all match.
- no old droughty files are left over (see ``--clean`` above).

When the schema is out of sync, droughty lists each problem, prints a diff of the committed and generated files, and exits with code 1:

.. code-block:: text

   droughty schema is out of sync with the dbt models (3 problems):

     - misc_lookup: in models/droughty_schema.yml but no longer generated (model deleted, renamed or ignored).
     - stg_customers: missing, expected in models/droughty_schema.yml.
     - stg_orders: columns to add: discount.

   To fix, run `droughty dbt manifest --clean` and commit the changed files.

.. list-table::
   :header-rows: 1
   :widths: 20 80

   * - Exit code
     - Meaning
   * - ``0``
     - In sync, or the check is switched off
   * - ``1``
     - Out of sync
   * - ``2``
     - Error, such as a missing manifest or an invalid setting

Use ``droughty dbt manifest --check`` in CI. ``droughty dbt --check`` reads the warehouse, so it needs warehouse credentials, and it cannot spot models that were deleted while their tables remain in the warehouse.

To switch the check off without changing your CI job, set ``dbt_ci_check: false`` in ``droughty_project.yaml``. ``--check`` then prints that it is skipped and exits with code 0.

Example GitHub Actions job. ``dbt parse`` needs a ``profiles.yml`` (here in ``ci/``), but it does not connect to the warehouse:

.. code-block:: yaml

   # .github/workflows/droughty-check.yml
   name: droughty schema check

   on: pull_request

   jobs:
     droughty-check:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4

         - uses: actions/setup-python@v5
           with:
             python-version: "3.11"

         - name: Install dbt and droughty
           run: pip install dbt-bigquery droughty

         - name: Build the dbt manifest
           run: dbt deps && dbt parse
           env:
             DBT_PROFILES_DIR: ./ci

         - name: Check the droughty schema is in sync
           run: droughty dbt manifest --check

If your dbt project is in a subfolder, run ``dbt parse`` there and pass ``--manifest-path`` or set ``dbt_manifest_path``.

----

.. _cmd-dbml:

dbml
----

.. code-block:: bash

   droughty dbml

**Why this exists**

Nobody updates the ERD. It was accurate when the project kicked off and it's been wrong ever since. When an engineer needs to understand how tables relate to each other — which happens constantly — they either dig through dbt YAML files, ask someone, or guess. All three options waste time.

Droughty generates the ERD directly from the live warehouse on demand. Run it before raising a PR and your documentation is always current.

**What it does**

Reads all tables and columns from your ``dbml_schemas`` (defined in ``profile.yaml``) and generates DBML files that:

- Define a ``Table`` for every table in the schema
- Add a ``Column`` for every field, with correct data types
- Add ``Ref`` relationships by matching ``_pk`` and ``_fk`` column suffixes across tables

The output is ready to use with `dbdocs.io <https://dbdocs.io>`_ or `dbdiagram.io <https://dbdiagram.io>`_.

**Output**

.. code-block:: text

   db_docs/<filename>.dbml

Path is configured via ``dbml_path`` and ``dbml_filenames`` in ``droughty_project.yaml``. Multiple filenames generate multiple files.

**Example**

.. code-block:: bash

   droughty dbml

----

.. _cmd-cube:

cube
----

.. code-block:: bash

   droughty cube

**Why this exists**

The same schema drift problem that affects Looker affects Cube. When your warehouse schema changes, your Cube cubes need updating. Without automation, that work gets skipped and the Cube semantic layer quietly falls out of sync with what's actually in the warehouse. Droughty keeps it in sync the same way it keeps LookML in sync.

**What it does**

Reads your analytics schema and generates Cube.js schema files with:

- A cube for every table, with dimensions for every column
- Data type mappings from warehouse types to Cube types
- Explore and join definitions (based on the ``explores`` config)
- Measure definitions

**Output**

.. code-block:: text

   schema/base.yml             # Cube definitions with dimensions
   schema/integrations.yml     # Join/integration definitions
   schema/measures.yml         # Measure definitions

Paths configured via ``cube_path``, ``cube_base_filename``, ``cube_integration_filename``, ``cube_measures_filename`` in ``droughty_project.yaml``.

**Example**

.. code-block:: bash

   droughty cube

----

.. _cmd-docs:

docs
----

.. code-block:: bash

   droughty docs

**Why this exists**

Undocumented fields are the silent enemy of self-service analytics. When a column has no description, analysts either guess what it means, file a Slack question, or just avoid using it altogether. The reason fields go undocumented isn't that people don't care — it's that writing a description for every single column in a 300-column warehouse is mind-numbing work.

Droughty uses OpenAI to infer a reasonable first-pass description for every undocumented field in seconds. It won't be perfect, but "probably correct and worth reviewing" is infinitely better than nothing.

**What it does**

- Reads existing field descriptions from your warehouse and from a local ``field_descriptions.md`` file
- For every field that **does not already have a description**, calls the OpenAI API to infer one from the column name and data type
- Writes the results to a markdown file for review

.. note::

   Always review AI-generated descriptions before using them in production documentation. The model makes reasonable guesses but can be wrong about domain-specific terminology.

**Requirements**

- ``openai_secret`` must be set in ``~/.droughty/profile.yaml``

**Output**

.. code-block:: text

   warehouse_docs/openai_field_descriptions.md

Path configured via ``openai_field_descriptions_path`` and ``openai_field_descriptions_filename`` in ``droughty_project.yaml``.

**Example**

.. code-block:: bash

   droughty docs

----

.. _cmd-qa:

qa
--

.. code-block:: bash

   droughty qa

   # With a custom assumptions file
   droughty qa --assumptions-dir ./droughty_qa_assumptions.yaml

**Why this exists**

Data quality issues are almost always found by end users, not by the team that built the pipeline. By the time someone files a ticket saying "these numbers look wrong", the bad data has usually been sitting in the warehouse for days or weeks.

The QA agent runs a set of validation checks against your actual warehouse data, using an LLM to interpret results and flag anomalies. It catches problems proactively — before they become stakeholder complaints.

**What it does**

Builds a `LangGraph <https://www.langchain.com/langgraph>`_ state machine that:

- Validates your warehouse data against a set of assumptions you define
- Uses the OpenAI API to interpret results and identify anomalies
- Outputs a Mermaid diagram of the validation DAG for traceability
- (Optional) traces all LLM calls through LangSmith for observability

**Additional option**

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - Option
     - Description
   * - ``--assumptions-dir <path>``
     - Path to a YAML file defining your QA validation rules and assumptions

**Requirements**

- ``openai_secret`` in ``~/.droughty/profile.yaml``
- ``langsmith_secret`` and ``langsmith_project`` (optional — enables LangSmith tracing)

**Output**

Mermaid DAG files in the ``langgraph/`` directory.

**Example**

.. code-block:: bash

   droughty qa --assumptions-dir ./droughty_qa_assumptions.yaml

----

.. _cmd-stage:

stage
-----

.. code-block:: bash

   droughty stage -p <gcp_project_id> -d <dataset1> [dataset2 ...] [-t <table>]

**Why this exists**

Onboarding a new data source in dbt means writing the same boilerplate every single time: a ``sources.yml`` block, a ``stg_`` SQL model that selects and renames columns, type casts, maybe a ``_pk`` surrogate key. It's completely mechanical. For a source with 20 tables you're looking at an afternoon of copy-paste work.

Droughty reads the source schema from BigQuery and generates all of it in one command.

.. note::

   This command is **BigQuery only** and currently requires **macOS or Linux**.

**What it does**

Reads the specified BigQuery datasets and generates:

- A ``sources.yml`` with source definitions for every table
- A ``stg_<table_name>.sql`` dbt model for each table

**Options**

.. list-table::
   :header-rows: 1
   :widths: 20 15 65

   * - Option
     - Required
     - Description
   * - ``-p <project_id>``
     - Yes
     - GCP project ID
   * - ``-d <datasets...>``
     - Yes
     - One or more BigQuery dataset names to generate staging models for
   * - ``-t <table>``
     - No
     - Target a single table within the dataset instead of all tables

**Output**

.. code-block:: text

   models/staging/sources.yml
   models/staging/stg_<table_name>.sql

Path configured via ``stage_path`` in ``droughty_project.yaml``.

**Examples**

.. code-block:: bash

   # Stage all tables in a dataset
   droughty stage -p my-gcp-project -d raw_data

   # Stage tables across multiple datasets
   droughty stage -p my-gcp-project -d raw_data events_data

   # Stage a single table
   droughty stage -p my-gcp-project -d raw_data -t orders

----

Command Quick Reference
-----------------------

.. list-table::
   :header-rows: 1
   :widths: 12 28 30 30

   * - Command
     - The problem it solves
     - Run it when...
     - Primary output
   * - :ref:`lookml <cmd-lookml>`
     - Looker drifting from the warehouse
     - Schema changes, pre-commit
     - ``lookml/base.lkml``
   * - :ref:`dbt <cmd-dbt>`
     - No test coverage on warehouse tables
     - After building models
     - ``models/schema.yml``
   * - :ref:`dbt manifest <cmd-dbt-manifest>`
     - Schema includes tables from deleted models
     - After ``dbt parse`` or ``dbt compile``; with ``--check`` in CI
     - ``models/schema.yml``
   * - :ref:`dbml <cmd-dbml>`
     - ERD is always out of date
     - Before raising a PR
     - ``db_docs/*.dbml``
   * - :ref:`cube <cmd-cube>`
     - Cube drifting from the warehouse
     - Schema changes
     - ``schema/base.yml``
   * - :ref:`docs <cmd-docs>`
     - Fields have no descriptions
     - When documentation is lacking
     - ``warehouse_docs/*.md``
   * - :ref:`qa <cmd-qa>`
     - Data issues found by stakeholders
     - Before data releases
     - ``langgraph/`` Mermaid DAG
   * - :ref:`stage <cmd-stage>`
     - Boilerplate staging models
     - Onboarding a new source
     - ``models/staging/``

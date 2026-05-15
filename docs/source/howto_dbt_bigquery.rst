How to Use — dbt & BigQuery
===========================

This guide walks through using droughty end-to-end with a dbt project on Google BigQuery. It covers everything from initial setup through to an ongoing development workflow.

.. note::

   This guide is specific to **dbt + BigQuery**. For Snowflake usage see :doc:`warehouse_support`, and for the general command reference see :doc:`commands`.

----

Prerequisites
-------------

Before you start, you need:

- A Google Cloud project with BigQuery enabled
- ``gcloud`` CLI installed — `install guide <https://cloud.google.com/sdk/docs/install>`_
- dbt installed (``pip install dbt-bigquery``)
- droughty installed (``pip install droughty``)
- A dbt project with at least a staging schema deployed to BigQuery

Your BigQuery project should have at least two datasets. Three is the full setup droughty is built for:

.. code-block:: text

   myproject_staging         ← raw source data, lightly transformed
   myproject_integration     ← cleaned and joined data
   myproject_analytics       ← final analytics layer (what Looker/Cube reads)

----

Step 1 — Authenticate with BigQuery
-------------------------------------

The simplest local setup uses Application Default Credentials:

.. code-block:: bash

   gcloud auth application-default login

Follow the browser prompts. Once complete, droughty will use these credentials automatically — no key file needed.

For CI/CD or shared environments, use a service account instead. See :doc:`authentication` for full details.

----

Step 2 — Set up your dbt project for droughty
------------------------------------------------

Droughty reads ``INFORMATION_SCHEMA`` metadata, including column descriptions. To make sure your dbt column descriptions flow through to the warehouse (and back into droughty), add ``persist_docs`` to your ``dbt_project.yml``:

.. code-block:: yaml

   # dbt_project.yml
   models:
     +persist_docs:
       relation: true
       columns: true

     my_project:
       staging:
         materialized: view
         schema: staging
       integration:
         materialized: view
         schema: integration
       warehouse:
         materialized: table

With ``persist_docs`` enabled, any ``description`` you write in your dbt YAML files gets written into BigQuery's table and column metadata. Droughty picks this up and includes it in generated LookML views, Cube cubes, and docs — so your descriptions only need to live in one place.

.. tip::

   Run ``dbt run`` after enabling ``persist_docs`` to push your existing descriptions into BigQuery before running droughty.

----

Step 3 — Create your droughty profile
----------------------------------------

Create the file ``~/.droughty/profile.yaml``:

.. code-block:: bash

   mkdir -p ~/.droughty
   touch ~/.droughty/profile.yaml

Add your project configuration:

.. code-block:: yaml

   my_profile:
     warehouse_name: big_query
     project_name: my-gcp-project           # your GCP project ID
     schema_name: myproject_analytics        # your analytics / warehouse dataset

     openai_secret: sk-...                   # only needed for `droughty docs` and `droughty qa`

     test_schemas:                           # datasets droughty dbt will scan
       - myproject_staging
       - myproject_integration
       - myproject_analytics

     dbml_schemas:                           # datasets droughty dbml will scan
       - myproject_staging
       - myproject_integration
       - myproject_analytics

.. tip::

   ``test_schemas`` controls which BigQuery datasets get scanned for dbt test generation. Include every dataset you want test coverage on — typically all three layers.

----

Step 4 — Create your project file
------------------------------------

Create ``droughty_project.yaml`` at the **root of your dbt git repository**:

.. code-block:: yaml

   profile: my_profile

   # dbt test output
   dbt_path: models/
   dbt_tests_filename: schema

   # LookML output
   lookml_path: lookml/
   lookml_base_filename: base
   lookml_explore_filename: explores
   lookml_measures_filename: measures
   lookml_base_path: views/

   # DBML / ERD output
   dbml_path: db_docs/
   dbml_filenames:
     - analytics_erd

   # Cube output (if using Cube)
   cube_path: schema/
   cube_base_filename: base
   cube_integration_filename: integrations
   cube_measures_filename: measures

   # Staging model output
   stage_path: models/staging/

   # AI field descriptions
   openai_field_descriptions_path: warehouse_docs
   openai_field_descriptions_filename: openai_field_descriptions

----

Step 5 — Generate your staging layer
---------------------------------------

When you add a new raw data source to BigQuery, use ``droughty stage`` to generate the dbt staging boilerplate automatically instead of writing it by hand.

.. code-block:: bash

   droughty stage -p my-gcp-project -d raw_source_dataset

This reads every table in ``raw_source_dataset`` and generates:

.. code-block:: text

   models/staging/sources.yml           ← BigQuery source definitions
   models/staging/stg_orders.sql        ← one staging model per table
   models/staging/stg_customers.sql
   models/staging/stg_products.sql
   ...

The staging SQL models select all columns from the source and cast types where appropriate. From here, you refine the models — renaming columns, adding business logic, defining surrogate keys — rather than starting from a blank file.

To target a single table instead of the whole dataset:

.. code-block:: bash

   droughty stage -p my-gcp-project -d raw_source_dataset -t orders

----

Step 6 — Generate dbt tests
------------------------------

After running your dbt models (``dbt run``), generate schema tests for all your schemas:

.. code-block:: bash

   droughty dbt

This scans every table in your ``test_schemas`` and writes ``models/schema.yml`` with:

- A ``unique`` test on every column ending in ``_pk``
- A ``not_null`` test on every column
- An ``expression_is_true: valid_from <= valid_to`` test where those columns exist

**Example output** (excerpt from ``models/schema.yml``):

.. code-block:: yaml

   version: 2

   models:
     - name: dim_customers
       columns:
         - name: customer_pk
           tests:
             - unique
             - not_null
         - name: customer_name
           tests:
             - not_null
         - name: email
           tests:
             - not_null

     - name: fct_orders
       columns:
         - name: order_pk
           tests:
             - unique
             - not_null
         - name: customer_fk
           tests:
             - not_null

Run the tests with:

.. code-block:: bash

   dbt test

**Customising what gets tested**

To override the tests on a specific column:

.. code-block:: yaml

   # droughty_project.yaml
   test_overwrite:
     models:
       fct_orders:
         order_pk:
           - not_null
           - unique
           - dbt_utils.at_least_one

To skip test generation for a table entirely:

.. code-block:: yaml

   test_ignore:
     models:
       - raw_events_log
       - tmp_dedupe_working

----

Step 7 — Generate LookML
--------------------------

Once your analytics layer is deployed in BigQuery, generate the Looker base layer:

.. code-block:: bash

   droughty lookml

This reads your ``schema_name`` dataset (``myproject_analytics``) from BigQuery and generates:

.. code-block:: text

   lookml/views/base.lkml       ← one LookML view per table
   lookml/explores.lkml         ← explore definitions
   lookml/measures.lkml         ← measure definitions

**What the generated views look like** (excerpt):

.. code-block:: text

   view: dim_customers {
     sql_table_name: `my-gcp-project.myproject_analytics.dim_customers` ;;

     dimension: customer_pk {
       type: number
       sql: ${TABLE}.customer_pk ;;
       hidden: yes
     }

     dimension: customer_name {
       type: string
       sql: ${TABLE}.customer_name ;;
       label: "Customer Name"
     }

     dimension_group: created {
       type: time
       timeframes: [raw, date, week, month, quarter, year]
       sql: ${TABLE}.created_at ;;
     }
   }

PKs and FKs are hidden automatically. Timestamps get ``dimension_group`` with standard timeframes. If your dbt column descriptions flowed through via ``persist_docs``, they appear as ``description:`` fields in the view.

**The right way to extend the base layer**

Don't edit the generated files directly — droughty will overwrite them next time you run. Instead, use Looker `refinements <https://cloud.google.com/looker/docs/lookml-refinements>`_ in a separate file:

.. code-block:: text

   lookml/
   ├── views/
   │   └── base.lkml              ← generated — do not edit
   ├── explores.lkml               ← generated — do not edit
   ├── measures.lkml               ← generated — do not edit
   └── refinements/
       └── dim_customers.lkml     ← your customisations go here

----

Step 8 — Generate your ERD
-----------------------------

Before raising a pull request, regenerate the ERD:

.. code-block:: bash

   droughty dbml

This generates ``db_docs/analytics_erd.dbml`` containing all tables across your ``dbml_schemas``, with primary key and foreign key relationships inferred from ``_pk`` / ``_fk`` column suffixes.

Upload it to `dbdocs.io <https://dbdocs.io>`_ for a browsable ERD:

.. code-block:: bash

   npx dbdocs build db_docs/analytics_erd.dbml

Or paste it directly into `dbdiagram.io <https://dbdiagram.io>`_ for a quick visual.

----

Step 9 — Generate AI field descriptions (optional)
----------------------------------------------------

If your warehouse has undocumented fields, droughty can use OpenAI to infer a first-pass description for every column that doesn't already have one:

.. code-block:: bash

   droughty docs

This writes ``warehouse_docs/openai_field_descriptions.md``. Review the output, then copy approved descriptions back into your dbt column YAML. With ``persist_docs`` enabled, they'll flow back into BigQuery ``INFORMATION_SCHEMA`` and be picked up by droughty on the next run.

Requires ``openai_secret`` in your ``profile.yaml``.

.. warning::

   Always review AI-generated descriptions before adding them to production documentation. The model makes reasonable guesses but can be wrong about domain-specific terminology.

----

Step 10 — Run QA validation (optional)
-----------------------------------------

Before a data release or stakeholder demo, run the QA agent to validate your warehouse data against a set of assumptions:

.. code-block:: bash

   droughty qa --assumptions-dir ./droughty_qa_assumptions.yaml

Requires ``openai_secret`` in your ``profile.yaml``. Optionally add ``langsmith_secret`` and ``langsmith_project`` to trace all LLM calls through LangSmith.

----

Putting it all together — Recommended workflow
------------------------------------------------

Here is how droughty fits into a day-to-day dbt + BigQuery development cycle:

**When onboarding a new source:**

.. code-block:: bash

   # 1. Generate staging boilerplate from the raw BigQuery dataset
   droughty stage -p my-gcp-project -d new_source_dataset

   # 2. Refine the generated staging models in your editor

   # 3. Run dbt to deploy the new models
   dbt run --select staging.new_source+

**When building or modifying models:**

.. code-block:: bash

   # 1. Build your models
   dbt run

   # 2. Regenerate schema tests to cover new tables/columns
   droughty dbt

   # 3. Run tests
   dbt test

**Before committing:**

.. code-block:: bash

   # Regenerate the Looker base layer so it reflects current warehouse
   droughty lookml

   # Regenerate the ERD for the PR description
   droughty dbml

**Before a release or QA checkpoint:**

.. code-block:: bash

   droughty qa --assumptions-dir ./droughty_qa_assumptions.yaml

**As a pre-commit hook** (keep Looker permanently in sync):

.. code-block:: bash

   # .git/hooks/pre-commit
   #!/bin/bash
   set -e
   droughty lookml
   git add lookml/

----

CI/CD with BigQuery
--------------------

In a CI/CD pipeline, use environment variables instead of local files:

.. code-block:: yaml

   # .github/workflows/droughty.yml (example)
   name: Droughty

   on:
     push:
       branches: [main]

   jobs:
     generate:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3

         - name: Set up Python
           uses: actions/setup-python@v4
           with:
             python-version: '3.11'

         - name: Install droughty
           run: pip install droughty

         - name: Generate dbt tests
           env:
             PROFILE_NAME: my_profile
             WAREHOUSE_NAME: big_query
             PROJECT_NAME: ${{ secrets.GCP_PROJECT_ID }}
             SCHEMA_NAME: myproject_analytics
             KEY_FILE: /tmp/key.json
           run: |
             echo '${{ secrets.GCP_SA_KEY }}' > /tmp/key.json
             droughty dbt --env-vars enabled
             droughty lookml --env-vars enabled

         - name: Commit generated files
           run: |
             git config user.name "droughty-bot"
             git config user.email "bot@example.com"
             git add models/schema.yml lookml/
             git diff --staged --quiet || git commit -m "chore: regenerate droughty outputs"
             git push

----

Naming conventions reference
------------------------------

Droughty's BigQuery integration depends on these column naming conventions:

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - Convention
     - Effect
   * - Column ends in ``_pk``
     - Treated as primary key — hidden in LookML, tested with ``unique`` + ``not_null`` in dbt, adds ``Ref`` source in DBML
   * - Column ends in ``_fk``
     - Treated as foreign key — hidden in LookML, adds ``Ref`` target in DBML
   * - Column named ``valid_from`` + ``valid_to``
     - Adds an ``expression_is_true: valid_from <= valid_to`` test in dbt
   * - Column type ``TIMESTAMP`` / ``DATETIME``
     - Generates a ``dimension_group`` with time, date, week, month, quarter, year timeframes in LookML
   * - Column description in BigQuery (via ``persist_docs``)
     - Included as ``description:`` in LookML views and Cube cubes

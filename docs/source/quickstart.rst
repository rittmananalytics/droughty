Quick Start
===========

Get droughty running in five minutes.

----

Step 1 — Install
----------------

.. code-block:: bash

   pip install droughty

Requires Python ``>=3.9, <3.12.4``. See :doc:`installation` for virtual environment setup.

----

Step 2 — Create your profile
-----------------------------

Create ``~/.droughty/profile.yaml`` with your warehouse credentials.

**BigQuery (using Application Default Credentials — recommended):**

First authenticate with Google Cloud:

.. code-block:: bash

   gcloud auth application-default login

Then create the profile — no key file needed:

.. code-block:: yaml

   my_project:
     warehouse_name: big_query
     project_name: my-gcp-project
     schema_name: analytics
     test_schemas:
       - my_staging_schema
       - my_integration_schema
       - my_analytics_schema
     dbml_schemas:
       - my_staging_schema
       - my_integration_schema
       - my_analytics_schema

**Snowflake:**

.. code-block:: yaml

   my_project:
     warehouse_name: snowflake
     account: myaccount.us-east-1
     user: myuser
     password: mypassword
     warehouse: compute_wh
     database: my_database
     schema: analytics
     role: my_role
     test_schemas:
       - staging
       - integration
       - analytics
     dbml_schemas:
       - staging
       - integration
       - analytics

See :doc:`authentication` for all authentication options including service account keys and OAuth.

----

Step 3 — Create your project file
-----------------------------------

Create ``droughty_project.yaml`` at the **root of your git repository**:

.. code-block:: yaml

   profile: my_project

   lookml_path: lookml/
   lookml_base_filename: base
   lookml_explore_filename: explores
   lookml_measures_filename: measures

   dbt_path: models/
   dbt_tests_filename: schema

   dbml_path: db_docs/
   dbml_filenames:
     - analytics_layer

   cube_path: schema/

.. note::

   The ``profile`` value must exactly match a key in your ``~/.droughty/profile.yaml``.

----

Step 4 — Run a command
-----------------------

.. code-block:: bash

   # Generate dbt tests for all your schemas
   droughty dbt

   # Generate LookML views, explores and measures
   droughty lookml

   # Generate a DBML ERD
   droughty dbml

Droughty writes files to paths relative to the root of your git repository.

----

What to expect
--------------

After running ``droughty dbt``, you'll find a new (or updated) ``models/schema.yml`` containing:

- Every table in your ``test_schemas`` as a model
- Column definitions with data types
- ``unique`` and ``not_null`` tests on every primary key column
- ``not_null`` tests on all other columns
- ``expression_is_true: valid_from <= valid_to`` where those columns exist

After running ``droughty lookml``, you'll find LookML ``.lkml`` files in ``lookml/`` with:

- A view for every table in your analytics schema
- Dimensions mapped to the correct LookML types
- PKs and FKs automatically hidden
- Column descriptions pulled from the warehouse where available

----

Naming conventions
------------------

Droughty identifies keys by column name suffix:

- Columns ending in ``_pk`` → treated as primary keys (hidden in LookML, tested for uniqueness in dbt)
- Columns ending in ``_fk`` → treated as foreign keys (hidden in LookML, used for DBML relationships)

----

Next steps
----------

- :doc:`commands` — full reference for all commands and options
- :doc:`configuration` — all configuration keys explained
- :doc:`usage` — recommended workflows and patterns

Warehouse Support
=================

Droughty currently supports **Google BigQuery** and **Snowflake**. Both warehouses are supported across all commands except ``droughty stage``, which is BigQuery/GCP-only.

----

Google BigQuery
---------------

**Status:** Fully supported

**Authentication options:**

- Application Default Credentials (ADC) via ``gcloud auth application-default login``
- Interactive browser OAuth (automatic fallback)
- Service account JSON key file
- Explicit OAuth client configuration

See :doc:`authentication` for full setup instructions.

**Required permissions:**

The authenticated identity needs at minimum:

- ``roles/bigquery.dataViewer`` — to read ``INFORMATION_SCHEMA``
- ``roles/bigquery.jobUser`` — to run queries

**What droughty reads from BigQuery:**

- ``INFORMATION_SCHEMA.COLUMNS`` — column names, data types, and descriptions
- ``INFORMATION_SCHEMA.TABLES`` — table names and schema membership

**Profile configuration:**

.. code-block:: yaml

   my_profile:
     warehouse_name: big_query
     project_name: my-gcp-project     # GCP project ID
     schema_name: analytics            # Primary dataset (analytics layer)
     key_file: /path/to/key.json       # Optional — only if not using ADC/OAuth
     test_schemas:
       - staging
       - integration
       - analytics
     dbml_schemas:
       - staging
       - integration
       - analytics

----

Snowflake
---------

**Status:** Fully supported

**Authentication:** Username and password specified in ``profile.yaml``.

**Required permissions:**

The Snowflake role must have:

- ``USAGE`` on the database and schemas
- ``SELECT`` on ``INFORMATION_SCHEMA`` views (granted by default to account admin and similar roles)

**What droughty reads from Snowflake:**

- ``INFORMATION_SCHEMA.COLUMNS`` — column names, data types, and comments/descriptions
- ``INFORMATION_SCHEMA.TABLES`` — table names and schema membership

**Profile configuration:**

.. code-block:: yaml

   my_profile:
     warehouse_name: snowflake
     account: myaccount.us-east-1     # Include region suffix
     user: myuser
     password: mypassword
     warehouse: compute_wh             # Virtual warehouse for running queries
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

.. note::

   The ``droughty stage`` command (staging layer generation) is currently only available for BigQuery/GCP projects.

----

Planned Support
---------------

- **Firebolt** — planned for a future release

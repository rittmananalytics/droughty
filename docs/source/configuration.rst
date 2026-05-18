Configuration
=============

Droughty uses two configuration files:

1. **profile.yaml** — warehouse credentials, stored at ``~/.droughty/profile.yaml``
2. **droughty_project.yaml** — project settings, stored at the root of your git repository

----

profile.yaml
------------

The profile file contains your warehouse credentials and connection details. It lives in the ``.droughty`` directory in your home folder:

.. code-block:: bash

   ~/.droughty/profile.yaml

You can have multiple named profiles in one file. The profile used for a given project is selected via the ``profile`` key in ``droughty_project.yaml``.

BigQuery Profile
~~~~~~~~~~~~~~~~

Minimal example (using ADC or browser OAuth — no key file needed):

.. code-block:: yaml

   my_profile:
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

Full example with all options:

.. code-block:: yaml

   my_profile:
     warehouse_name: big_query
     project_name: my-gcp-project        # GCP project ID
     schema_name: analytics              # Primary analytics dataset

     key_file: /path/to/key.json         # Service account key (optional if using OAuth/ADC)

     openai_secret: sk-...               # OpenAI API key — required for `droughty docs` and `droughty qa`
     langsmith_secret: ls-...            # LangSmith API key — optional, enables QA tracing
     langsmith_project: my-project       # LangSmith project name — optional

     test_schemas:                       # Schemas scanned by `droughty dbt`
       - my_staging_schema
       - my_integration_schema
       - my_analytics_schema

     dbml_schemas:                       # Schemas scanned by `droughty dbml`
       - my_staging_schema
       - my_integration_schema
       - my_analytics_schema

Snowflake Profile
~~~~~~~~~~~~~~~~~

.. code-block:: yaml

   my_profile:
     warehouse_name: snowflake
     account: myaccount.us-east-1       # Snowflake account identifier (include region)
     user: myuser
     password: mypassword
     warehouse: compute_wh              # Snowflake virtual warehouse name
     database: my_database
     schema: analytics
     role: my_role                      # Role with INFORMATION_SCHEMA SELECT access

     test_schemas:
       - staging
       - integration
       - analytics

     dbml_schemas:
       - staging
       - integration
       - analytics

.. note::

   The profile name key (e.g. ``my_profile``) must exactly match the ``profile:`` value in your ``droughty_project.yaml``.

----

droughty_project.yaml
---------------------

The project file controls output paths, filenames, and optional features. Place it at the root of your git repository (or specify a custom location with ``--project-dir``).

Minimal example
~~~~~~~~~~~~~~~

.. code-block:: yaml

   profile: my_profile

   lookml_path: lookml/
   dbt_path: models/
   dbml_path: db_docs/
   cube_path: schema/

Full reference
~~~~~~~~~~~~~~

.. code-block:: yaml

   profile: my_profile           # Must match a key in ~/.droughty/profile.yaml

   # --- LookML output ---
   lookml_path: lookml/                        # Directory for LookML output files
   lookml_base_filename: base                  # Filename for base views file
   lookml_explore_filename: explores           # Filename for explores file
   lookml_measures_filename: measures          # Filename for measures file
   lookml_base_path: views/                    # Sub-path within lookml_path for views

   # --- dbt output ---
   dbt_path: models/                           # Directory for dbt schema.yml output
   dbt_tests_filename: schema                  # Filename for schema tests file

   # --- DBML output ---
   dbml_path: db_docs/                         # Directory for DBML output files
   dbml_filenames:                             # One output file per entry
     - analytics_layer

   # --- Cube output ---
   cube_path: schema/                          # Directory for Cube schema output
   cube_base_filename: base                    # Filename for base cubes file
   cube_integration_filename: integrations     # Filename for integration file
   cube_measures_filename: measures            # Filename for measures file

   # --- Staging output (GCP only) ---
   stage_path: models/staging/                 # Directory for staging model output

   # --- Documentation output ---
   field_description_path: warehouse_docs
   field_description_file_name: field_descriptions.md
   openai_field_descriptions_path: warehouse_docs
   openai_field_descriptions_filename: openai_field_descriptions

   # --- Explores (optional) ---
   # Enables dimensional inference for LookML/Cube explore generation.
   # parent_table is joined to dimensions and facts.
   explores:
     parent_table:
       - my_fact_table
     dimensions:
       - my_dim_table
     facts:
       - my_fact_table

   # --- LookML Period-over-Period parameters (optional) ---
   # Adds PoP dashboard parameters to specified views.
   lookml_pop:
     views:
       orders_view:
         - orders_daily_fact

   # --- dbt test overrides (optional) ---
   # Replace the auto-generated tests for specific columns.
   test_overwrite:
     models:
       my_table:
         my_pk_field:
           - not_null
           - unique

   # --- dbt test ignore (optional) ---
   # Skip all test generation for these tables entirely.
   test_ignore:
     models:
       - raw_events_table
       - temp_staging_table

   # --- Entity resolution (optional) ---
   # Used by `droughty resolve` for entity deduplication.
   entity_resolution:
     read_schema: resolution_schema
     write_schema: resolution_schema
     read_table_names:
       customer:
         - customer_col1
         - customer_col2
     write_column_names:
       - merge_key
     write_table_name:
       - resolved_customer

----

Configuration Key Reference
----------------------------

profile.yaml keys
~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 25 15 60

   * - Key
     - Required
     - Description
   * - ``warehouse_name``
     - Yes
     - ``big_query`` or ``snowflake``
   * - ``project_name``
     - BigQuery only
     - GCP project ID
   * - ``schema_name``
     - BigQuery only
     - Primary analytics dataset name
   * - ``key_file``
     - No
     - Path to BigQuery service account JSON key
   * - ``account``
     - Snowflake only
     - Snowflake account identifier (include region suffix)
   * - ``user``
     - Snowflake only
     - Snowflake username
   * - ``password``
     - Snowflake only
     - Snowflake password
   * - ``warehouse``
     - Snowflake only
     - Snowflake virtual warehouse name
   * - ``database``
     - Snowflake only
     - Snowflake database name
   * - ``schema``
     - Snowflake only
     - Snowflake schema name
   * - ``role``
     - Snowflake only
     - Snowflake role with INFORMATION_SCHEMA access
   * - ``test_schemas``
     - Yes
     - List of schemas scanned by ``droughty dbt``
   * - ``dbml_schemas``
     - Yes
     - List of schemas scanned by ``droughty dbml``
   * - ``openai_secret``
     - For docs/qa
     - OpenAI API key (required for ``droughty docs`` and ``droughty qa``)
   * - ``langsmith_secret``
     - No
     - LangSmith API key for QA tracing
   * - ``langsmith_project``
     - No
     - LangSmith project name for QA tracing

droughty_project.yaml keys
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 30 15 55

   * - Key
     - Required
     - Description
   * - ``profile``
     - Yes
     - Name of the profile in ``~/.droughty/profile.yaml``
   * - ``lookml_path``
     - No
     - Output directory for LookML files (default: ``lookml/``)
   * - ``lookml_base_filename``
     - No
     - Base views filename (default: ``base``)
   * - ``lookml_explore_filename``
     - No
     - Explores filename (default: ``explores``)
   * - ``lookml_measures_filename``
     - No
     - Measures filename (default: ``measures``)
   * - ``lookml_base_path``
     - No
     - Sub-path for views within ``lookml_path``
   * - ``dbt_path``
     - No
     - Output directory for dbt schema (default: ``models/``)
   * - ``dbt_tests_filename``
     - No
     - dbt schema filename (default: ``schema``)
   * - ``dbml_path``
     - No
     - Output directory for DBML files (default: ``db_docs/``)
   * - ``dbml_filenames``
     - No
     - List of DBML output filenames
   * - ``cube_path``
     - No
     - Output directory for Cube files (default: ``schema/``)
   * - ``cube_base_filename``
     - No
     - Base cubes filename
   * - ``cube_integration_filename``
     - No
     - Integrations filename
   * - ``cube_measures_filename``
     - No
     - Measures filename
   * - ``stage_path``
     - No
     - Output directory for staging models (default: ``models/staging/``)
   * - ``openai_field_descriptions_path``
     - No
     - Output directory for AI descriptions
   * - ``openai_field_descriptions_filename``
     - No
     - Output filename for AI descriptions
   * - ``explores``
     - No
     - Dimensional inference config for LookML/Cube explores
   * - ``lookml_pop``
     - No
     - Period-over-Period parameter config for Looker
   * - ``test_overwrite``
     - No
     - Per-column test overrides for ``droughty dbt``
   * - ``test_ignore``
     - No
     - Tables to skip entirely in ``droughty dbt``
   * - ``entity_resolution``
     - No
     - Entity deduplication config for ``droughty resolve``

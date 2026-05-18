Usage & Workflows
=================

Droughty is most valuable when it's woven into your regular development workflow rather than run as a one-off. This page covers the conventions it expects, the workflow patterns that work well, and how it fits alongside dbt and Looker.

----

Prerequisites
-------------

**Must be inside a git repository**

Droughty uses Git to determine default output paths. Always run it from within your project's git repository root.

**Naming conventions**

Droughty identifies keys by column name suffix. These conventions must be followed in your warehouse:

- Primary keys end in ``_pk`` — e.g. ``customer_pk``, ``order_pk``
- Foreign keys end in ``_fk`` — e.g. ``customer_fk``, ``product_fk``

Without these suffixes, droughty cannot distinguish keys from regular dimensions and won't apply the correct tests, hiding logic, or DBML relationships.

**Schema layer structure**

Droughty is built around a layered warehouse structure. You need at least three separate schemas or datasets:

- **Staging** — raw source data, lightly transformed (e.g. ``myproject_staging``)
- **Integration** — cleaned and integrated data (e.g. ``myproject_integration``)
- **Analytics / Warehouse** — the final analytics layer (e.g. ``myproject_analytics``)

Reference these in ``test_schemas`` and ``dbml_schemas`` in your ``profile.yaml``.

**Column descriptions (optional but high-value)**

If you use dbt with ``persist_docs`` enabled, column descriptions from your YAML files are written through to ``INFORMATION_SCHEMA``. Droughty picks them up and includes them in generated LookML views and Cube cubes:

.. code-block:: yaml

   # dbt_project.yml
   models:
     +persist_docs:
       relation: true
       columns: true

This means your descriptions only need to live in one place — your dbt YAML — and flow everywhere else automatically.

----

dbt Project Setup
-----------------

For the layered schema structure to work with dbt, configure schema separation in ``dbt_project.yml``:

.. code-block:: yaml

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
       data_quality:
         materialized: table
         schema: data_quality

----

Recommended Workflows
---------------------

Local development with dbt + Looker
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The most common usage pattern — running droughty as part of regular dbt development:

.. code-block:: bash

   # After building or modifying dbt models, regenerate dbt tests
   droughty dbt

   # Regenerate the Looker base layer before committing
   droughty lookml

   # Update the ERD before raising a PR
   droughty dbml

This way, every PR that changes the warehouse schema automatically ships with updated tests, an updated Looker layer, and an updated ERD. The reviewer gets accurate documentation without anyone having to remember to write it.

Pre-commit hook (keep Looker in sync automatically)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The most robust pattern for Looker — add droughty to ``.git/hooks/pre-commit`` so the LookML base layer is regenerated before every commit:

.. code-block:: bash

   #!/bin/bash
   set -e
   droughty lookml
   git add lookml/

Make it executable:

.. code-block:: bash

   chmod +x .git/hooks/pre-commit

With this in place, it is literally impossible to commit a schema change without the Looker layer being updated to match.

CI/CD pipeline
~~~~~~~~~~~~~~~

Use environment variables so no local credential files are needed in the pipeline:

.. code-block:: bash

   export PROFILE_NAME="my_profile"
   export WAREHOUSE_NAME="big_query"
   export PROJECT_NAME="my-gcp-project"
   export SCHEMA_NAME="analytics"
   export KEY_FILE="/path/to/key.json"

   droughty dbt --env-vars enabled
   droughty lookml --env-vars enabled

Onboarding a new data source
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When you're adding a new source to the warehouse, use ``droughty stage`` to generate the staging layer rather than writing boilerplate by hand:

.. code-block:: bash

   droughty stage -p my-gcp-project -d new_source_dataset

This creates ``_sources.yml`` and a ``stg_`` model for every table in the dataset. From there you refine the models rather than starting from a blank file. Note that all generated YAML files include ``version: 2`` at the top, as required by dbt.

Documenting your warehouse
~~~~~~~~~~~~~~~~~~~~~~~~~~~

When fields are missing descriptions, use ``droughty docs`` to generate a first pass:

.. code-block:: bash

   # Generate AI descriptions for undocumented fields
   droughty docs

   # Review the output
   cat warehouse_docs/openai_field_descriptions.md

Then copy approved descriptions back into your dbt YAML column definitions. With ``persist_docs`` enabled, they'll flow through to ``INFORMATION_SCHEMA`` where droughty and other tools can pick them up.

----

Looker Development Approach
---------------------------

Droughty generates a **base layer** of LookML views and explores. The right way to use this is to build Looker `refinements <https://cloud.google.com/looker/docs/lookml-refinements>`_ or `extends <https://cloud.google.com/looker/docs/reusing-code-with-extends>`_ on top of the base layer — never edit the generated files directly.

**Why?** Because the whole value of automation is that the base layer can be regenerated any time the warehouse schema changes. If you've edited it by hand, that work gets overwritten. Refinements survive a regeneration.

Suggested file structure:

.. code-block:: text

   lookml/
   ├── views/
   │   └── base.lkml           # Generated by droughty — do not edit
   ├── explores.lkml            # Generated by droughty — do not edit
   ├── measures.lkml            # Generated by droughty — do not edit
   └── refinements/
       └── my_view.lkml         # Your customisations go here

----

When to run each command
------------------------

.. list-table::
   :header-rows: 1
   :widths: 45 55

   * - Situation
     - Command(s) to run
   * - After building or modifying dbt models
     - ``droughty dbt``
   * - Before committing changes that affect the warehouse schema
     - ``droughty lookml``, ``droughty dbt``
   * - Before raising a PR (for documentation)
     - ``droughty dbml``
   * - When the analytics schema changes significantly
     - ``droughty lookml``, ``droughty cube``, ``droughty dbt``
   * - Onboarding a new data source
     - ``droughty stage -p <project> -d <dataset>``
   * - When warehouse fields have no descriptions
     - ``droughty docs``
   * - Before a data release or stakeholder demo
     - ``droughty qa``

Questions or issues? `Raise them on GitHub <https://github.com/rittmananalytics/droughty/issues>`_.

Overview
========

**droughty** — *adjective, drought·i·er, drought·i·est.* dry.

Droughty helps keep your analytics workflow **DRY** — Don't Repeat Yourself.

----

The problem
-----------

Analytics engineering is full of mechanical, repetitive work that nobody loves doing but everyone has to do:

- Your Looker views fall behind your warehouse because manually updating 40 views when a column changes isn't anyone's idea of a good time.
- Your dbt ``schema.yml`` tests are either missing or out of date because writing them from scratch is tedious.
- Your ERD diagram on Confluence hasn't been updated since the project kicked off.
- Your Cube schema drifted from the warehouse two sprints ago and nobody noticed.
- Half your warehouse fields have no description, so new analysts waste hours asking "what does this column mean?"

The real cost isn't just time — it's the bugs and confusion that creep in when your semantic layer doesn't match your warehouse. Dimensions in Looker that reference columns that no longer exist. dbt tests that were never written, so a broken primary key makes it to production. ERDs that mislead rather than inform.

The solution
------------

Droughty reads your data warehouse's ``INFORMATION_SCHEMA`` and generates these files automatically. Your warehouse schema becomes the single source of truth, and every tool downstream stays in sync with it.

.. code-block:: bash

   droughty lookml    # → LookML views, explores, measures
   droughty dbt       # → schema.yml with tests for every table
   droughty dbml      # → ERD with all PK/FK relationships
   droughty cube      # → Cube schema with dimensions and measures
   droughty docs      # → AI-generated field descriptions
   droughty qa        # → LLM-powered data quality validation
   droughty stage     # → dbt staging models from source tables

Run these commands as part of your development workflow and the mechanical stuff takes care of itself — so you can focus on the work that actually requires thinking.

What droughty generates
-----------------------

.. list-table::
   :header-rows: 1
   :widths: 15 35 25 25

   * - Command
     - Why it exists
     - What it generates
     - Target tool
   * - ``lookml``
     - Looker views drift from the warehouse every time a schema changes. Droughty keeps them in sync automatically.
     - LookML views, explores & measures
     - Looker
   * - ``dbt``
     - Writing ``schema.yml`` tests is the task that always gets skipped. Droughty generates baseline coverage for every table instantly.
     - ``schema.yml`` with uniqueness, not-null & validity tests
     - dbt
   * - ``dbml``
     - No one updates the ERD. Droughty generates it from the live warehouse, so it's always accurate.
     - DBML ERD with PK/FK relationships
     - dbdocs / dbdiagram.io
   * - ``cube``
     - Same as LookML — schema drift is silent and expensive. Droughty keeps Cube in sync.
     - Cube dimensions, measures & joins
     - Cube.js
   * - ``docs``
     - Undocumented fields kill self-service analytics. AI gives you a first-pass description for every field in seconds.
     - Markdown field descriptions via OpenAI
     - Any
   * - ``qa``
     - Data issues are usually found by stakeholders, not the team that built the pipeline. Droughty validates your data proactively.
     - LangGraph QA agent + Mermaid DAG
     - Any
   * - ``stage``
     - Writing boilerplate staging SQL for new sources is pure mechanical work. Droughty does it from the source schema.
     - dbt staging models and ``sources.yml``
     - dbt + BigQuery

Supported warehouses
--------------------

- **Google BigQuery**
- **Snowflake**

Quick links
-----------

- `PyPI <https://pypi.org/project/droughty>`_
- `GitHub <https://github.com/rittmananalytics/droughty>`_
- `Issues <https://github.com/rittmananalytics/droughty/issues>`_

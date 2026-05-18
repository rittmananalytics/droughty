How to Use — QA Assumptions
============================

``droughty qa`` runs an AI agent that validates your warehouse data against a set of rules you define. Those rules live in a YAML file called the **assumptions file**. This guide explains what goes in it, where to put it, and how to write good expectations.

----

Where the file goes
--------------------

By default droughty looks for the assumptions file at the root of your git repository:

.. code-block:: text

   my-analytics-repo/
   ├── droughty_qa_assumptions.yaml    ← default location
   ├── droughty_project.yaml
   ├── dbt_project.yml
   └── models/

You can override the path with the ``--assumptions-dir`` flag:

.. code-block:: bash

   droughty qa --assumptions-dir ./qa/my_assumptions.yaml

If the file does not exist at the expected path and no override is provided, the command exits without running any checks.

----

File structure
--------------

The assumptions file is a YAML document with this structure:

.. code-block:: yaml

   datasets:
     <dataset_name>:
       tables:
         <table_name>:
           columns:
             <column_name>:
               - expectation: "natural language description of what to check"

Each level maps directly to your warehouse:

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - Key
     - What it refers to
   * - ``datasets``
     - Top-level key — always required
   * - ``<dataset_name>``
     - BigQuery dataset name (or Snowflake schema). Must match the actual name in the warehouse.
   * - ``tables``
     - Required under each dataset
   * - ``<table_name>``
     - Table name within the dataset. Must match the actual table name.
   * - ``columns``
     - Required under each table
   * - ``<column_name>``
     - Column name to evaluate. Must exist in the table.
   * - ``expectation``
     - A natural language description of what the data should look like. Passed to the LLM as-is.

----

Full example
-------------

.. code-block:: yaml

   datasets:
     my_analytics_dataset:
       tables:
         fct_orders:
           columns:
             order_pk:
               - expectation: "Check if all order PKs are unique and not null"
             order_status:
               - expectation: "Check that order_status only contains the values: pending, processing, shipped, delivered, cancelled"
             order_value:
               - expectation: "Check that order_value is always greater than zero"

         dim_customers:
           columns:
             customer_email:
               - expectation: "Check if all emails are in valid email format. Flag any that look like test or dummy addresses."
             customer_pk:
               - expectation: "Check if all customer PKs are unique and not null"
             persona_type:
               - expectation: "Check that all customers have a persona type assigned and that the values align with ISO 8000 standards for data quality"

     my_staging_dataset:
       tables:
         stg_orders:
           columns:
             raw_order_id:
               - expectation: "Check for duplicate raw_order_ids which would indicate the source is sending duplicate records"

----

Writing good expectations
--------------------------

The expectation string is passed verbatim to an LLM (GPT-4), which queries sample data from the warehouse and interprets the results against what you described. This means expectations can be written in plain English and can express complex rules — you are not limited to simple SQL checks.

**Be specific about what a violation looks like:**

.. code-block:: yaml

   # Vague — the LLM will make assumptions about what "correct" means
   - expectation: "Check the email column"

   # Better — tells the LLM exactly what to look for
   - expectation: "Check that all email addresses match the pattern user@domain.tld and flag any nulls, blank strings, or addresses without an @ sign"

**Reference domain knowledge the LLM might not have:**

.. code-block:: yaml

   - expectation: "Check that country_code only contains ISO 3166-1 alpha-2 codes (two-letter country codes like GB, US, DE). Flag anything that is longer than 2 characters or contains numbers."

**Ask for PII detection:**

.. code-block:: yaml

   - expectation: "Check if this column exposes PII. Flag any values that look like names, email addresses, phone numbers, or national ID numbers."

**Check business rules:**

.. code-block:: yaml

   - expectation: "Check that shipped_date is never earlier than order_date. Any row where shipped_date < order_date is a data error."

**Check for expected value ranges:**

.. code-block:: yaml

   - expectation: "Order values should be between £0.01 and £10,000. Flag any values outside this range as potential data entry errors or test records."

----

Running the QA agent
---------------------

.. code-block:: bash

   # Using the default file location (git root)
   droughty qa

   # Using a custom path
   droughty qa --assumptions-dir ./qa/droughty_qa_assumptions.yaml

   # With CI/CD environment variables
   droughty qa --assumptions-dir ./droughty_qa_assumptions.yaml --env-vars enabled

The agent:

1. Loads the assumptions file
2. For each column expectation, queries sample data from the warehouse
3. Passes the data and expectation to GPT-4
4. GPT-4 returns a structured verdict: ``met`` or ``violated``, with evidence
5. Prints a summary report to the terminal
6. Writes a Mermaid diagram of the agent DAG to ``langgraph/droughty_qa_agent_dag.mmd``

**Example output:**

.. code-block:: text

   QA Results
   ----------
   ✓  fct_orders.order_pk — uniqueness check: met
      All 50,000 sampled values are unique.

   ✗  fct_orders.order_status — allowed values check: violated
      Found unexpected values: ['refunded', 'hold']. These are not in the
      expected set [pending, processing, shipped, delivered, cancelled].

   ✓  dim_customers.customer_email — email format check: met
      All sampled email addresses match the expected format.

   ✗  dim_customers.persona_type — completeness check: violated
      1,243 rows (2.5% of sample) have a null persona_type.

----

Requirements
-------------

The QA agent requires:

- ``openai_secret`` set in ``~/.droughty/profile.yaml`` — used to call GPT-4
- BigQuery or Snowflake credentials configured in the same profile
- (Optional) ``langsmith_secret`` and ``langsmith_project`` in the profile for LLM call tracing via LangSmith

.. code-block:: yaml

   # ~/.droughty/profile.yaml
   my_profile:
     warehouse_name: big_query
     project_name: my-gcp-project
     schema_name: my_analytics_dataset

     openai_secret: sk-...
     langsmith_secret: ls-...         # optional
     langsmith_project: my-project    # optional

----

Multi-dataset checks
---------------------

You can check tables across multiple datasets in a single file:

.. code-block:: yaml

   datasets:
     analytics:
       tables:
         fct_orders:
           columns:
             order_pk:
               - expectation: "Check for uniqueness and nulls"

     staging:
       tables:
         stg_raw_events:
           columns:
             event_id:
               - expectation: "Check for duplicate event IDs which indicate deduplication has not run"
             session_id:
               - expectation: "Check that session_id is not null — a null here means the session attribution failed"

----

When to run QA
---------------

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - Situation
     - Why
   * - Before a stakeholder demo or data release
     - Catch data quality issues before they're visible to end users
   * - After a significant dbt model change
     - Validate that business rules still hold after the refactor
   * - On a schedule (e.g. daily in CI/CD)
     - Proactive monitoring for data drift or upstream source issues
   * - When onboarding a new data source
     - Validate the source data quality before building models on top of it

Installation
============

Requirements
------------

Before installing droughty, ensure you have:

- **Python** ``>=3.9, <3.12.4``
- **Git** — droughty must be run from inside a git repository
- **pip** or **Poetry**

Install via pip
---------------

.. code-block:: bash

   pip install droughty

To pin to a specific version:

.. code-block:: bash

   pip install droughty==0.20.1

Using a virtual environment (recommended)
------------------------------------------

.. code-block:: bash

   python -m venv .venv
   source .venv/bin/activate       # Windows: .venv\Scripts\activate
   pip install droughty

Verify the installation
-----------------------

.. code-block:: bash

   droughty --help

You should see the list of available sub-commands.

Dependencies
------------

Droughty installs the following packages automatically:

.. list-table::
   :header-rows: 1
   :widths: 30 20 50

   * - Package
     - Version
     - Purpose
   * - ``lkml``
     - 1.3.1
     - LookML parser
   * - ``ruamel.yaml``
     - 0.17.21
     - YAML processing
   * - ``pandas``
     - >=2.2.0
     - Data transformation
   * - ``pandas_gbq``
     - ^0.20.0
     - BigQuery integration
   * - ``google-auth``
     - ^2.28.1
     - GCP authentication
   * - ``snowflake-connector-python``
     - ^3.13.0
     - Snowflake connection
   * - ``snowflake-sqlalchemy``
     - ^1.4.6
     - Snowflake SQLAlchemy dialect
   * - ``sqlalchemy``
     - ^1.4.54
     - SQL abstraction layer
   * - ``openai``
     - 1.59.8
     - AI field descriptions and QA
   * - ``langchain-core``
     - ^0.3.30
     - LLM orchestration
   * - ``langchain-openai``
     - ^0.3.0
     - OpenAI LangChain integration
   * - ``langgraph``
     - ^0.2.64
     - QA agent state machine
   * - ``langsmith``
     - ^0.2.11
     - LLM observability
   * - ``GitPython``
     - 3.1.44
     - Git repository detection
   * - ``jinja2``
     - 3.1.5
     - SQL template generation
   * - ``pydantic``
     - ^2.10.5
     - Data validation
   * - ``pyarrow``
     - >=14.0.1,<19.0.0
     - Arrow format support
   * - ``protobuf``
     - >=6.0,<7.0
     - Protocol buffer support
   * - ``PyYAML``
     - 6.0.2
     - YAML parsing

Optional dependencies
---------------------

Entity deduplication (``droughty resolve``) requires an extra:

.. code-block:: bash

   pip install droughty[dedupe]

Next steps
----------

Once installed, head to the :doc:`configuration` page to set up your profile and project files.

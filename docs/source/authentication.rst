Authentication
==============

The droughty.yaml File
----------------------

The ``droughty.yaml`` file is the central configuration file for your Droughty project. It defines:

- Your project profile
- Warehouse connection details
- Authentication methods
- Schema/dataset information

Basic Structure
~~~~~~~~~~~~~~

A basic ``droughty.yaml`` file follows this structure:

.. code-block:: yaml

    # Project profile to use
    profile: my_project_profile

    # Define profiles
    profiles:
      my_project_profile:
        # Warehouse configuration
        warehouse_name: big_query  # Options: big_query, snowflake
        project_name: your-gcp-project-id  # For BigQuery
        schema_name: your_dataset
        
        # Authentication (all optional - will use automatic browser auth if omitted)
        # key_file: /path/to/service-account.json  # Option 1: Service account
        # oauth:                                    # Option 2: Manual OAuth configuration
        #   token_file: token.json
        #   client_secrets: client_secrets.json

    # Project configuration
    project:
      # Output paths
      lookml_path: lookml/
      dbml_path: dbml/
      dbt_path: dbt/
      
      # Schema configuration
      test_schemas: ['your_dataset']
      dbml_schemas: ['your_dataset']

BigQuery Configuration Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For BigQuery, the following options are available:

+----------------+--------------------------------------+----------+
| Option         | Description                          | Required |
+================+======================================+==========+
| warehouse_name | Set to ``big_query``                 | Yes      |
+----------------+--------------------------------------+----------+
| project_name   | Your Google Cloud project ID         | Yes      |
+----------------+--------------------------------------+----------+
| schema_name    | Your BigQuery dataset name           | Yes      |
+----------------+--------------------------------------+----------+
| key_file       | Path to service account JSON key file| No       |
+----------------+--------------------------------------+----------+
| oauth          | OAuth configuration (see below)      | No       |
+----------------+--------------------------------------+----------+

If neither ``key_file`` nor ``oauth`` is specified, Droughty will automatically use Application Default Credentials (ADC) or launch a browser for authentication.

Snowflake Configuration Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Snowflake, the following options are available:

+----------------+--------------------------------------+----------+
| Option         | Description                          | Required |
+================+======================================+==========+
| warehouse_name | Set to ``snowflake``                 | Yes      |
+----------------+--------------------------------------+----------+
| account        | Your Snowflake account identifier    | Yes      |
+----------------+--------------------------------------+----------+
| user           | Snowflake username                   | Yes      |
+----------------+--------------------------------------+----------+
| password       | Snowflake password                   | Yes      |
+----------------+--------------------------------------+----------+
| warehouse      | Snowflake warehouse name             | Yes      |
+----------------+--------------------------------------+----------+
| database       | Snowflake database name              | Yes      |
+----------------+--------------------------------------+----------+
| schema         | Snowflake schema name                | Yes      |
+----------------+--------------------------------------+----------+
| role           | Snowflake role name                  | Yes      |
+----------------+--------------------------------------+----------+

Authentication Methods
---------------------

Droughty supports multiple authentication methods for Google BigQuery, tried in the following order:

1. **Application Default Credentials (ADC)** - Uses credentials from ``gcloud auth application-default login``
2. **Interactive Browser Authentication** - Launches a browser for you to log in with your Google account
3. **Service Account Key File** - Uses a JSON key file specified in your droughty.yaml
4. **OAuth Configuration** - Uses OAuth credentials specified in your droughty.yaml

Step-by-Step Authentication Guide
--------------------------------

Method 1: Browser-Based Authentication (Recommended)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the simplest method - just run Droughty and it will handle authentication for you:

1. Run Droughty command (e.g., ``droughty dbt``)
2. If no credentials are found, a browser window will automatically open
3. Log in with your Google account and grant the requested permissions
4. Credentials will be saved to ``~/.droughty/google_oauth_token.json`` for future use

.. code-block:: bash

    droughty dbt
    # Output: No credentials found. Launching interactive authentication flow...
    # A browser window will open for you to authenticate with Google.

Method 2: Application Default Credentials (ADC)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For developers who prefer using Google Cloud SDK:

1. Install `Google Cloud SDK <https://cloud.google.com/sdk/docs/install>`_
2. Run the following command:

   .. code-block:: bash

       gcloud auth application-default login

3. Follow the browser prompts to authenticate
4. Run Droughty commands as normal - they'll use your ADC credentials

Method 3: Service Account Key File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For production environments or CI/CD pipelines:

1. Create a service account in Google Cloud Console with appropriate permissions
2. Download the JSON key file
3. Add the key file path to your droughty.yaml:

   .. code-block:: yaml

       profiles:
         my_project_profile:
           warehouse_name: big_query
           project_name: your-gcp-project-id
           schema_name: your_dataset
           key_file: /path/to/service-account.json

4. Run Droughty commands as normal

Example droughty.yaml Files
--------------------------

BigQuery with Browser Authentication (Simplest)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: yaml

    profile: my_bigquery_project

    profiles:
      my_bigquery_project:
        warehouse_name: big_query
        project_name: my-gcp-project
        schema_name: my_dataset

    project:
      lookml_path: lookml/
      dbml_path: dbml/
      dbt_path: dbt/
      test_schemas: ['my_dataset']
      dbml_schemas: ['my_dataset']

BigQuery with Service Account
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: yaml

    profile: my_bigquery_project

    profiles:
      my_bigquery_project:
        warehouse_name: big_query
        project_name: my-gcp-project
        schema_name: my_dataset
        key_file: /path/to/service-account.json

    project:
      lookml_path: lookml/
      dbml_path: dbml/
      dbt_path: dbt/
      test_schemas: ['my_dataset']
      dbml_schemas: ['my_dataset']

Snowflake Configuration
~~~~~~~~~~~~~~~~~~~~~

.. code-block:: yaml

    profile: my_snowflake_project

    profiles:
      my_snowflake_project:
        warehouse_name: snowflake
        account: myaccount
        user: myuser
        password: mypassword
        warehouse: compute_wh
        database: mydatabase
        schema: myschema
        role: myrole

    project:
      lookml_path: lookml/
      dbml_path: dbml/
      dbt_path: dbt/
      test_schemas: ['myschema']
      dbml_schemas: ['myschema']

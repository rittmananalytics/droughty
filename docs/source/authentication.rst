Authentication
==============

BigQuery Authentication
-----------------------

Droughty supports multiple authentication methods for Google BigQuery. It tries them in the following order:

1. **Application Default Credentials (ADC)** — credentials from ``gcloud auth application-default login``
2. **Interactive browser OAuth** — automatic browser popup if no credentials are found
3. **Service account key file** — JSON key file specified via ``key_file`` in ``profile.yaml``
4. **OAuth client config** — explicit OAuth credentials specified via ``oauth`` block in ``profile.yaml``

Method 1: Application Default Credentials (Recommended for local dev)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The simplest setup for local development. Requires the `Google Cloud SDK <https://cloud.google.com/sdk/docs/install>`_.

.. code-block:: bash

   gcloud auth application-default login

Follow the browser prompts, then run droughty normally — no ``key_file`` needed in your profile:

.. code-block:: yaml

   my_profile:
     warehouse_name: big_query
     project_name: my-gcp-project
     schema_name: analytics

Method 2: Interactive Browser OAuth (Automatic fallback)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If droughty finds no credentials, it will automatically open a browser window for you to log in with your Google account. Credentials are saved to ``~/.droughty/google_oauth_token.json`` and reused on subsequent runs.

.. code-block:: bash

   droughty dbt
   # Output: No credentials found. Launching interactive authentication flow...
   # A browser window will open for you to authenticate with Google.

No configuration needed — this is the automatic fallback.

Method 3: Service Account Key File (Recommended for CI/CD)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Best for production environments and automated pipelines.

1. Create a service account in the `Google Cloud Console <https://console.cloud.google.com/>`_ with at least ``BigQuery Data Viewer`` and ``BigQuery Job User`` roles.
2. Download the JSON key file.
3. Add the path to your ``profile.yaml``:

.. code-block:: yaml

   my_profile:
     warehouse_name: big_query
     project_name: my-gcp-project
     schema_name: analytics
     key_file: /path/to/service-account.json

Method 4: OAuth Client Config
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For environments where you want to manage OAuth credentials explicitly:

1. Create a Google Cloud OAuth 2.0 client ID (Desktop application type) in the Cloud Console.
2. Download the client secrets JSON file.
3. Configure your ``profile.yaml``:

.. code-block:: yaml

   my_profile:
     warehouse_name: big_query
     project_name: my-gcp-project
     schema_name: analytics
     oauth:
       client_secrets: /path/to/client_secrets.json
       token_file: ~/.droughty/token.json

On first run, a browser will open for authentication. The token is saved to ``token_file`` and reused.

----

Snowflake Authentication
------------------------

Snowflake uses username and password authentication specified directly in ``profile.yaml``.

.. code-block:: yaml

   my_profile:
     warehouse_name: snowflake
     account: myaccount.us-east-1
     user: myuser
     password: mypassword
     warehouse: compute_wh
     database: my_database
     schema: analytics
     role: my_role

Ensure the role has ``SELECT`` access on ``INFORMATION_SCHEMA`` for all schemas you want droughty to read.

----

Environment Variables
---------------------

When running droughty with ``--env-vars enabled``, credentials are read from environment variables instead of local files. This is useful for CI/CD pipelines where you cannot store files on disk.

.. code-block:: bash

   export PROFILE_NAME="my_profile"
   export WAREHOUSE_NAME="big_query"
   export PROJECT_NAME="my-gcp-project"
   export SCHEMA_NAME="my_dataset"
   export KEY_FILE="/path/to/key.json"

   droughty dbt --env-vars enabled

See :doc:`commands` for the full ``--env-vars`` reference.

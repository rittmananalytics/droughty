Configuration
=============

Setting up droughty to run is pretty easy. It depends on two files, a droughty_project.yaml file within the root of your repo and a profile.yaml file within a .droughty/ dir within your user dir

OAuth Authentication for BigQuery
--------------------------------

As an alternative to service account authentication, you can use OAuth for BigQuery. This allows users to authenticate with their own Google credentials instead of using a service account key file.

To use OAuth, modify your profile.yaml as follows::

    droughty_demo:
      oauth:
        client_secrets: /path/to/client_secrets.json
        token_file: ~/.droughty/token.json
      
      project_name: example-project
      schema_name: analytics_qa
      warehouse_name: big_query
      
      # Other configuration options remain the same
      test_schemas:
        - analytics_dev_staging
        - analytics_dev_integration
        - analytics_dev
      
      dbml_schemas:
        - analytics_dev_staging
        - analytics_dev_integration
        - analytics_dev

To set up OAuth:

1. Create a Google Cloud OAuth client ID (Desktop application type) in the Google Cloud Console
2. Download the client secrets JSON file
3. Specify the path to this file in your profile.yaml
4. Specify where you want the token to be saved (token_file)
5. When running droughty for the first time with OAuth, a browser window will open for authentication
6. After authenticating, tokens will be saved to the specified path and reused for future sessions

The OAuth method is recommended for local development environments and when you prefer not to use service account keys.

**droughty_project.yaml set-up**

To differentiate between multiple warehouse targets within the profiles.yaml file, droughty uses a droughty_project.yaml to specify a project specific target. Find an droughty_project.yaml file below::

  profile: example_project

  dimensional_inference: enabled

  field_description_path: warehouse_docs
  field_description_file_name: field_descriptions.md

  openai_field_descriptions_path: warehouse_docs
  openai_field_descriptions_filename: openai_field_descriptions 

  test_overwrite:
      models: 
        wh_marketing__web_event_items_fact:
          web_event_item_pk:
              - not_null
              - dbt_utils.at_least_one
              - unique
          web_event_parameter_float_value:
              - dbt_utils.at_least_one

  test_ignore:
      models:
        - base_backend__web_events
        - base_ga4__web_events

  
  dbml_filenames:
      - test_10
      - test_11
      - test_12

  explores:
    parent_table: 
      - example_parent
    dimensions: 
      - example_dim
    facts:
      - example_fact

  lookml_pop: 
      views: 
          example_1: 
                  - example_2
          example_3:
                  - example_4
                  - example_5

  lookml_base_filename: example__1
  lookml_explore_filename: example__2
  lookml_measures_filename: example__3
  cube_base_filename: example__4
  cube_integration_filename: example__5
  cube_measures_filename: example__6
  lookml_base_path: example__7
  dbt_tests_filename: example__8

  entity_resolution:
    read_schema:
      example_1
    write_schema:
      example_1
    read_table_names:
      example_1:
        - example_3
        - example_4
      example_2:
        - example_5
        - example_6
    write_column_names:
      - example_7
      - example_8
    write_table_name:
      - example_9

Create this file in the root of your git repo (unless you are specifying the path through the --project-dir argument)

Optional variables
==================

**Overwriting and ignoring model tests**

Using the test_overwrite and test_ignore project parameters, you can overwrite tests or leave them blank using the test_overwrite parameter or ignore all model tests using the test_ignore parameter

**Defining relative file outputs**

Just add these variables to your droughty_project.yaml and it will write to the path name starting from the root of your git repo::

  dbt_path: example_path
  dbml_path: example_path
  lookml_path: example_path
  cube_path: example_path

**It's important that the profile name with the droughty_project.yaml aligns with the paired entry within your profile.yaml.**


--------------

**profile.yaml set-up**

A profile.yaml file is used to pass warehouse permissions to droughty, such as warehouse key files, project, schema names and other permissions. 


This file should be created in a .droughty dir, such as::

      /Users/titus_groan/.droughty/profile.yaml

Below is an example of what the profile should contain

profile example::

    droughty_demo:

      host:

      key_file: /Users/droughty_user/[key_file]

      password:

      port:

      project_name: example-project

      schema_name: analytics_qa

      user: 

      warehouse_name: big_query

      openai_secret: sk-wdfnwfw40t493t304t9340t94wet0et90edf (example)

      test_schemas:
        - lewis_analytics_dev_staging
        - lewis_analytics_dev_integration
        - lewis_analytics_dev

      dbml_schemas:
        - lewis_analytics_dev_staging
        - lewis_analytics_dev_integration
        - lewis_analytics_dev

--------------

**warehouse_name options**

At the moment, only 'big_query' and 'snowflake' are supported


**Configuration Considerations**

droughty has been developed to work with dbt, db docs and looker. However, it only really depends accessing the information schema within a supported warehouse.

When using droughty it's assumed that the warehouse structure it points towards has at least three data sets, staging, integration and a analytics layer. Look at the usage page for further information.
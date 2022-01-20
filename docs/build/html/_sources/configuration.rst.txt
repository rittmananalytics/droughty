Configuration
=============


drought_project.yaml


To allow for multiple warehouse targets, droughty uses a drought_project.yaml to specify a project specific target. At the moment, the only requirement is to define a project name.::

   profile: example_project


Profile.yaml


A profile.yaml file is used to provide target information to droughty, such as warehouse key files, project, schema and general permissions. 

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

      test_schemas:

        - example_dev_staging

        - example_dev_integration

        - example_analytics_dev

Configuration Considerations

droughty has been developed to work with dbt, db docs and looker. However, it only really depends accessing the information schema within a supported warehouse.

When using droughty it's assumed that the warehouse structure it points towards has at least three data sets, staging, integration and a analytics layer.
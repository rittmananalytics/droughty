Commands
==================

The three tools within this toolkit (lookml, dbt-test and dbml) each have a sub-command. These commands must be predicated by the droughty command.

**lookml**

Generates lookml based of the analytics layer of your warehouse, run::

    droughty lookml 

in your terminal.

This will output a file within the root of your active git repo as follows::

    /lookml/base...

This file will contain explores and measures based on the multiple layers in your warehouse, defined by the targets within your profile.yaml file. It assigns dimension datatypes, descriptions (if available). It also assigns pk's, hides pk(s) and fk's by default.

**dbt**

run::

    droughty dbt

Generates standard schema tests, currently coverage is::

    unicity of pk's
    at least one value in all columns
    valid_from <= valid_to

It will output a schema.yml file in the follow dir at the root of your active repo:: 

    /models/schema.yml

The target for your test schemas is defined in your profiles.yaml file within the /.droughty dir. Find an example below::

      test_schemas:

        - example_dev_staging

        - example_dev_integration

        - example_analytics_dev


**dbml**

Generates dbml based on the analytics layer within your warehouse, run::

    droughty dbml

It will output the dbml model into the follow dir::

     /db_docs/....

As with lookml, this assigns data types and also identifies pk, fk references and assigns them

**cube**

Generates cube based on the analytics layer within your warehouse, run::

    droughty cube

It will output the cube models into the follow dir::

     /schema/....

As with lookml, this assigns data types and also identifies pk, fk references and assigns them

**docs**

Generates inferred warehouse descriptions using openai, run::

    droughty docs

By default, it will output the inferred metadata into::

    /warehouse_docs/openai_field_descriptions.md

Droughty docs will read from your field_descriptions.md file and only create descriptions that are absent for entities in the warehouse.

Openai isn't prefect so make sure you sanity check the output

**arguments**

  - --profiles-dir 
    - This allows you to specify the profile directory if you don't want to use the default
  - --project-dir 
    - This allows you to specify the project directory if you don't want to use the default
  - --env-vars (enabled)
    - This allows you to enable the use of environment variables 
  

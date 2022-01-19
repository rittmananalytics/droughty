.. droughty documentation master file, created by
   sphinx-quickstart on Wed Jan 19 11:39:42 2022.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to droughty's documentation!
====================================

.. toctree::
   :maxdepth: 2
   :caption: Contents:



Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

# droughty
#### adjective, drought·i·er, drought·i·est.
#### dry.

droughty is an analytics engineering toolkit, helping keep your workflow dry. Current tools are:

- lookml - generates a base layer.lkml file with views and explores from a warehouse schema 
- dbt-tests - generates a base schema from specified warehouse schemas. Includes standard testing routines
- dbml - generates an ERD based on the warehouse layer of your warehouse. Includes pk, fk relationships

The purpose of this project is to automate the repetitive, dull elements of analytics engineering in the modern data stack. It turns out this also leads to cleaner projects, less human error and increases the likelihood of the basics getting done...

## Dependencies

droughty uses a number of open-source projects to work properly:

- [lkml](https://pypi.org/project/lkml/) - This project uses lkml  as its base parser - John Temple
- [ruamel.yaml](https://pypi.org/project/ruamel.yaml/) - Yaml parser -  Anthon van der Neut

some more generic:

- Pandas
- Python Git
- Click
- Pandas GBQ
- Protobuf
- snowflake_connector_python

##Considerations

You need to run Droughty from a git repo. It uses the Git package to control certain relative dirs
Currently the cli sub-commands have an issue where all they are not mutally exclusive. This needs to be resolved but doesn't impact usage dramatically.

## Installation

- pip install droughty
- profile.yaml set-up


## Profile.yaml example 

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

     example_dev_staging

     example_dev_integration

     example_analytics_dev
      
      
Droughty depends on a droughty_project.yaml file. There are plans to extend the variables available within a project but for the moment it simply instructs Droughty what profile.yaml project you want to run against.

## droughty_project.yaml example 

profile: droughty_demo

## License

MIT

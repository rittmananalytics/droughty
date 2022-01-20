.. droughty documentation master file, created by
   sphinx-quickstart on Wed Jan 19 11:39:42 2022.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to droughty's documentation!
====================================

.. toctree::
   :maxdepth: 2

   installation
   configuration
   warehouse_support
   usage
   commands


**What's with the name?**

# droughty
#### adjective, drought·i·er, drought·i·est.
#### dry.

It helps keep your workflow *ah hem* dry 

==================

**What is droughty?**

droughty is an analytics engineering toolkit, helping keep your workflow dry. Current tools are:

- lookml - generates a base layer.lkml file with views and explores from a warehouse schema 
- dbt-tests - generates a base schema from specified warehouse schemas. Includes standard testing routines
- dbml - generates an ERD based on the warehouse layer of your warehouse. Includes pk, fk relationships

Please read the usage section for details on how to use these tools

The purpose of this project is to automate the repetitive, dull elements of analytics engineering in the modern data stack. It turns out this also leads to cleaner projects, less human error and increases the likelihood of the basics getting done...


==================

**Dependencies**

droughty uses a number of open-source projects to work properly:

- [lkml](https://pypi.org/project/lkml/) - This project uses lkml  as its base parser - John Temple
- [ruamel.yaml](https://pypi.org/project/ruamel.yaml/) - Yaml parser -  Anthon van der Neut
- Pandas
- Python Git
- Click
- Pandas GBQ
- Protobuf
- snowflake_connector_python

==================

**Considerations**

You need to run Droughty from a git repo. It uses the Git package to control certain relative dirs
Currently the cli sub-commands have an issue where all they are not mutually exclusive. This needs to be resolved but doesn't impact usage dramatically.



## License

MIT

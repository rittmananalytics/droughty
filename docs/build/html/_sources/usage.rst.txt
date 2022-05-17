Usage
============

Droughty depends on a number factors to be useful. These factors can be split into two considerations, tooling and development approaches.

-------------

**Tooling**

Droughty is most useful when using one of the supported warehouses (goes without saying), dbt, looker and dbml. With these all being present, droughty can nicely fit within a development workflow and automate some of the boring stuff.

-------------

**Development approaches**



**Looker approaches**

Droughty outputs a base.layer which contains dimensions from the analytics layer. This is most useful when using either a series of refinements or extends that sit over the base layer. It's best then paired with a layered modelling approach with a staging, integration and aggregate layer.

**Why is this useful?**

- it allows you to have a floating base layer that's coupled to the warehouse through machine generated code, saving time and perhaps reducing error
- it ensures that the labelling and descriptions are identical within the warehouse and looker. 
- there's scope to automate the generation of measures

**Warehousing approaches**

Droughty outputs lookml, dbml and dbt schemas based on an dataset/schema warehouse structure. It depends on a separate dataset/schema for the staging, integration and the warehouse/analytics layer. This is pretty easy to achieve with these dbt_project.yml configs::

    models:
    +persist_docs:
        relation: true
        columns: true

    example_dw:
        staging:
            materialized: view
            schema: staging
        integration:
            materialized: view
            schema: integration
        warehouse:
            materialized: table
        data_quality:
            materialized: table
            schema: data_quality
        utils:
            materialized: table
            schema: logs

Droughty also depends on some naming conventions

    * primary key's end in pk
    * foreign key's end in fk 

**Summary**

If you meet the majority of the requirements above, there's a chance this will be useful... I personally use droughty with the following steps:

* I run dbt-test to generate tests as I go throughout my dbt dev work
* I run dbml before raising a PR so that there's an update ERD of the warehouse for documentation and to include in the PR Summary
* I run lookml as a pre-commit hook so that looker is always up-to-date with the warehouse 

Any questions, raise them in GitHub. Thanks.


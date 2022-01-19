[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Read the Docs](https://img.shields.io/readthedocs/lkml)](https://droughty.readthedocs.io/en/latest/)

# droughty

droughty is an analytics engineering toolkit, helping keep your workflow dry.

**Read the documentation on [Read the Docs](https://droughty.readthedocs.io/en/latest/).**

`lkml.load` parses LookML strings to Python objects or JSON strings. `lkml.dump` serializes (generates) LookML strings from Python objects.

- lookml - generates a base layer.lkml file with views and explores from a warehouse schema 
- dbt-tests - generates a base schema from specified warehouse schemas. Includes standard testing routines
- dbml - generates an ERD based on the warehouse layer of your warehouse. Includes pk, fk relationships

The purpose of this project is to automate the repetitive, dull elements of analytics engineering in the modern data stack. It turns out this also leads to cleaner projects, less human error and increases the likelihood of the basics getting done...

Interested in contributing to `droughty`? Check out the [contributor guidelines](CONTRIBUTING.md).

## How do I install it?

`lkml` is available to install on [pip](https://pypi.org/project/droughty/) via the following command:

```
pip install droughty
```
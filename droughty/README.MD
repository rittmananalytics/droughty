# droughty

**droughty** — *adjective, drought·i·er, drought·i·est.* dry.

Droughty helps keep your analytics workflow **DRY** (Don't Repeat Yourself).

---

## What is droughty?

Droughty is an analytics engineering toolkit that reads your data warehouse's `INFORMATION_SCHEMA` and automatically generates semantic layer files. Stop writing boilerplate — let your warehouse metadata drive your tooling.

### What it generates

| Command | Output | Target Tool |
|---------|--------|-------------|
| `droughty lookml` | LookML views, explores & measures | Looker |
| `droughty dbt` | `schema.yml` with standard tests | dbt |
| `droughty dbml` | ERD with PK/FK relationships | dbdocs / dbdiagram.io |
| `droughty cube` | Cube schema with dimensions & measures | Cube.js |
| `droughty docs` | AI-generated field descriptions | Any |
| `droughty qa` | LLM-powered QA validation agent | Any |
| `droughty stage` | dbt staging layer models from source tables | dbt + GCP |

### Supported warehouses

- **Google BigQuery**
- **Snowflake**

---

## Prerequisites

Before using droughty you need:

1. **Python** `>=3.9, <3.12.4`
2. **Git** — droughty must be run from inside a git repository
3. **A supported data warehouse** — BigQuery or Snowflake
4. **Warehouse access credentials** — service account key, OAuth, or Application Default Credentials (BigQuery); username/password (Snowflake)
5. **Naming conventions in your warehouse**:
   - Primary keys end in `_pk` (e.g. `customer_pk`)
   - Foreign keys end in `_fk` (e.g. `customer_fk`)
6. **Schema structure** — at least three schemas/datasets: staging, integration, and analytics

---

## Installation

```bash
pip install droughty
```

If you run into version conflicts, pin to the latest release:

```bash
pip install droughty==0.20.1
```

We recommend installing in a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install droughty
```

---

## Quick Start

### 1. Set up your profile

Create `~/.droughty/profile.yaml` with your warehouse credentials:

**BigQuery (OAuth — recommended for local dev):**
```yaml
my_project:
  warehouse_name: big_query
  project_name: my-gcp-project
  schema_name: analytics
  openai_secret: sk-...           # required for `droughty docs`
  langsmith_secret: ls-...        # optional — for QA tracing
  langsmith_project: my-project   # optional — for QA tracing
  test_schemas:
    - my_staging_schema
    - my_integration_schema
    - my_analytics_schema
  dbml_schemas:
    - my_staging_schema
    - my_integration_schema
    - my_analytics_schema
```

**BigQuery (Service Account — for CI/CD):**
```yaml
my_project:
  warehouse_name: big_query
  project_name: my-gcp-project
  schema_name: analytics
  key_file: /path/to/service-account.json
  test_schemas:
    - my_staging_schema
    - my_integration_schema
  dbml_schemas:
    - my_staging_schema
    - my_integration_schema
```

**Snowflake:**
```yaml
my_project:
  warehouse_name: snowflake
  account: myaccount.region
  user: myuser
  password: mypassword
  warehouse: compute_wh
  database: my_database
  schema: analytics
  role: my_role
  test_schemas:
    - staging
    - integration
  dbml_schemas:
    - staging
    - integration
```

### 2. Set up your project file

Create `droughty_project.yaml` in the root of your git repository:

```yaml
profile: my_project

lookml_path: lookml/
lookml_base_filename: base
lookml_explore_filename: explores
lookml_measures_filename: measures
lookml_base_path: views/

dbt_path: models/
dbt_tests_filename: schema

dbml_path: db_docs/
dbml_filenames:
  - analytics_layer

cube_path: schema/
cube_base_filename: base
cube_integration_filename: integrations
cube_measures_filename: measures

field_description_path: warehouse_docs
field_description_file_name: field_descriptions.md
openai_field_descriptions_path: warehouse_docs
openai_field_descriptions_filename: openai_field_descriptions
```

### 3. Run a command

```bash
droughty dbt
droughty lookml
droughty dbml
```

---

## Commands

All commands follow the pattern: `droughty <command> [options]`

### Global Options

These options are available on every command:

| Option | Description | Default |
|--------|-------------|---------|
| `--profile-dir <path>` | Path to `profile.yaml` | `~/.droughty/profile.yaml` |
| `--project-dir <path>` | Path to `droughty_project.yaml` | Git repository root |
| `--env-vars enabled` | Read all config from environment variables | Disabled |

---

### `droughty lookml`

Generates LookML views, explores, and measures from your analytics schema.

```bash
droughty lookml
droughty lookml --profile-dir /custom/path --project-dir ./
droughty lookml --env-vars enabled
```

**Output files** (paths configured in `droughty_project.yaml`):
```
lookml/base.lkml       # Views with dimensions
lookml/explores.lkml   # Explore definitions and joins
lookml/measures.lkml   # Measure definitions
```

**What it does:**
- Reads all columns from your analytics schema via `INFORMATION_SCHEMA`
- Maps warehouse data types to LookML types (`INT64` → `number`, `STRING` → `string`, `TIMESTAMP` → `time`, `BOOL` → `yesno`)
- Hides primary key and foreign key fields by default
- Attaches column descriptions from the warehouse where available
- Generates explores and joins based on the `explores` section of your project file
- Supports Looker Period-over-Period (PoP) parameters via `lookml_pop` config

---

### `droughty dbt`

Generates a `schema.yml` file with standard dbt tests for all tables in your `test_schemas`.

```bash
droughty dbt
droughty dbt --env-vars enabled
```

**Output file** (path configured in `droughty_project.yaml`):
```
models/schema.yml
```

**Tests generated:**
- `unique` — on all primary key fields (`_pk` suffix)
- `not_null` — on all columns
- `expression_is_true` — `valid_from <= valid_to` where both fields exist

**Customising tests** in `droughty_project.yaml`:

```yaml
# Override tests on specific columns
test_overwrite:
  models:
    my_table:
      my_pk_field:
        - not_null
        - unique

# Skip all tests for specific tables
test_ignore:
  models:
    - table_to_skip
    - another_table_to_skip
```

---

### `droughty dbml`

Generates DBML (Database Markup Language) files describing your warehouse schema, including primary key and foreign key relationships.

```bash
droughty dbml
```

**Output** (path configured in `droughty_project.yaml`):
```
db_docs/<filename>.dbml
```

Schemas included are controlled by `dbml_schemas` in your `profile.yaml`.

---

### `droughty cube`

Generates Cube.js schema files including cubes, dimensions, and measures.

```bash
droughty cube
```

**Output files** (paths configured in `droughty_project.yaml`):
```
schema/base.yml          # Cube definitions
schema/integrations.yml  # Join/integration definitions
schema/measures.yml      # Measure definitions
```

---

### `droughty docs`

Uses the OpenAI API to infer and generate field descriptions for your warehouse columns. Only creates descriptions for fields that do not already have one.

```bash
droughty docs
```

**Output** (path configured in `droughty_project.yaml`):
```
warehouse_docs/openai_field_descriptions.md
```

**Requires** `openai_secret` in `profile.yaml`.

> **Note:** AI-generated descriptions are a starting point — always sanity-check the output before using in production.

---

### `droughty qa`

Runs a LangGraph-powered QA validation agent against your warehouse data. Generates a Mermaid diagram of the validation DAG.

```bash
droughty qa
droughty qa --assumptions-dir ./droughty_qa_assumptions.yaml
```

**Options:**
| Option | Description |
|--------|-------------|
| `--assumptions-dir <path>` | Path to QA assumptions YAML file |

**Output:** Mermaid DAG files in `langgraph/` directory.

**Requires** `openai_secret` (and optionally `langsmith_secret`, `langsmith_project`) in `profile.yaml`.

---

### `droughty stage`

Generates dbt staging layer models from source tables in a GCP project. Creates `sources.yml` and model SQL files.

> **Note:** This command currently requires **macOS or Linux**.

```bash
droughty stage -p <gcp_project_id> -d <dataset1> [dataset2 ...] [-t <table_name>]
```

**Options:**
| Option | Description | Required |
|--------|-------------|----------|
| `-p <project_id>` | GCP project ID | Yes |
| `-d <datasets...>` | One or more BigQuery dataset names | Yes |
| `-t <table>` | Optional — target a single table within the dataset | No |

**Examples:**
```bash
# Stage all tables in a dataset
droughty stage -p my-gcp-project -d raw_data

# Stage tables across multiple datasets
droughty stage -p my-gcp-project -d raw_data events_data

# Stage a single table
droughty stage -p my-gcp-project -d raw_data -t my_table
```

**Output** (path configured in `droughty_project.yaml`):
```
models/staging/sources.yml
models/staging/stg_<table_name>.sql
```

---

## Configuration Reference

### `profile.yaml` — Warehouse Credentials

Located at `~/.droughty/profile.yaml`. Contains one or more named profiles.

#### BigQuery — Full Example

```yaml
my_profile:
  warehouse_name: big_query
  project_name: my-gcp-project        # GCP project ID
  schema_name: analytics              # Primary analytics dataset
  key_file: /path/to/key.json         # Service account key (optional if using OAuth/ADC)

  openai_secret: sk-...               # OpenAI API key (for `docs` and `qa` commands)
  langsmith_secret: ls-...            # LangSmith API key (optional, for `qa` tracing)
  langsmith_project: my-project       # LangSmith project name (optional)

  test_schemas:                       # Schemas included in `droughty dbt`
    - my_staging_schema
    - my_integration_schema
    - my_analytics_schema

  dbml_schemas:                       # Schemas included in `droughty dbml`
    - my_staging_schema
    - my_integration_schema
    - my_analytics_schema
```

#### Snowflake — Full Example

```yaml
my_profile:
  warehouse_name: snowflake
  account: myaccount.us-east-1       # Snowflake account identifier
  user: myuser
  password: mypassword
  warehouse: compute_wh              # Snowflake virtual warehouse
  database: my_database
  schema: analytics
  role: my_role

  test_schemas:
    - staging
    - integration
    - analytics

  dbml_schemas:
    - staging
    - integration
    - analytics
```

---

### `droughty_project.yaml` — Project Settings

Located at the root of your git repository (or specify with `--project-dir`).

#### Full Example

```yaml
profile: my_profile                # Must match a key in profile.yaml

# --- LookML output paths ---
lookml_path: lookml/
lookml_base_filename: base
lookml_explore_filename: explores
lookml_measures_filename: measures
lookml_base_path: views/

# --- dbt output paths ---
dbt_path: models/
dbt_tests_filename: schema

# --- DBML output paths ---
dbml_path: db_docs/
dbml_filenames:
  - analytics_layer

# --- Cube output paths ---
cube_path: schema/
cube_base_filename: base
cube_integration_filename: integrations
cube_measures_filename: measures

# --- Staging output path ---
stage_path: models/staging/

# --- Documentation paths ---
field_description_path: warehouse_docs
field_description_file_name: field_descriptions.md
openai_field_descriptions_path: warehouse_docs
openai_field_descriptions_filename: openai_field_descriptions

# --- Explores (optional) ---
# Enables dimensional inference for LookML/Cube explores
explores:
  parent_table:
    - my_fact_table
  dimensions:
    - my_dim_table
  facts:
    - my_fact_table

# --- LookML Period-over-Period parameters (optional) ---
lookml_pop:
  views:
    orders_view:
      - orders_daily_fact

# --- dbt test overrides (optional) ---
test_overwrite:
  models:
    my_table:
      my_pk_field:
        - not_null
        - unique

# --- dbt test ignore (optional) ---
test_ignore:
  models:
    - raw_table_to_skip

# --- Entity resolution (optional) ---
entity_resolution:
  read_schema: resolution_schema
  write_schema: resolution_schema
  read_table_names:
    customer:
      - customer_col1
      - customer_col2
  write_column_names:
    - merge_key
  write_table_name:
    - resolved_customer
```

---

## Authentication

### BigQuery

Droughty tries authentication methods in this order:

1. **Application Default Credentials (ADC)** — recommended for local development
2. **Interactive browser OAuth** — automatic fallback if no credentials found
3. **Service account key file** — recommended for CI/CD (`key_file` in profile.yaml)
4. **OAuth client config** — explicit OAuth (`oauth` block in profile.yaml)

**Set up ADC (recommended for local dev):**
```bash
gcloud auth application-default login
```

Then just run droughty — no `key_file` needed.

**Use a service account (CI/CD):**
```yaml
my_profile:
  warehouse_name: big_query
  project_name: my-gcp-project
  schema_name: analytics
  key_file: /path/to/service-account.json
```

**Use browser OAuth (automatic):**
Just run any droughty command — it will open a browser window automatically if no other credentials are found.

### Snowflake

Snowflake uses username/password authentication specified directly in `profile.yaml`. Ensure the role specified has `SELECT` access on `INFORMATION_SCHEMA`.

---

## Environment Variables

Pass `--env-vars enabled` to read configuration from environment variables instead of local YAML files. Useful for CI/CD pipelines.

```bash
export PROFILE_NAME="my_profile"
export WAREHOUSE_NAME="big_query"
export PROJECT_NAME="my-gcp-project"
export SCHEMA_NAME="my_dataset"
export KEY_FILE="/path/to/key.json"

droughty lookml --env-vars enabled
droughty dbt --env-vars enabled
```

---

## Typical Workflows

### Local development with dbt + Looker

```bash
# Generate dbt tests as you build models
droughty dbt

# Regenerate Looker base layer before committing
droughty lookml

# Update ERD before raising a PR
droughty dbml
```

### Pre-commit hook (auto-update Looker)

Add to `.git/hooks/pre-commit`:
```bash
#!/bin/bash
droughty lookml
git add lookml/
```

### CI/CD pipeline

```bash
# Use env vars — no local files needed
droughty dbt --env-vars enabled
droughty lookml --env-vars enabled
```

---

## dbt Project Setup

For droughty to work correctly with dbt, configure schema separation in `dbt_project.yml`:

```yaml
models:
  +persist_docs:
    relation: true
    columns: true   # This ensures column descriptions flow through to INFORMATION_SCHEMA

  my_project:
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
```

---

## Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `lkml` | 1.3.1 | LookML parser |
| `ruamel.yaml` | 0.17.21 | YAML processing |
| `pandas` | >=2.2.0 | Data transformation |
| `pandas_gbq` | ^0.20.0 | BigQuery integration |
| `google-auth` | ^2.28.1 | GCP authentication |
| `snowflake-connector-python` | ^3.13.0 | Snowflake connection |
| `snowflake-sqlalchemy` | ^1.4.6 | Snowflake SQLAlchemy dialect |
| `sqlalchemy` | ^1.4.54 | SQL abstraction |
| `openai` | 1.59.8 | AI field descriptions & QA |
| `langchain-core` | ^0.3.30 | LLM orchestration |
| `langchain-openai` | ^0.3.0 | OpenAI LangChain integration |
| `langgraph` | ^0.2.64 | QA agent state machine |
| `langsmith` | ^0.2.11 | LLM observability |
| `GitPython` | 3.1.44 | Git repo detection |
| `jinja2` | 3.1.5 | SQL template generation |
| `pydantic` | ^2.10.5 | Data validation |
| `pyarrow` | >=14.0.1,<19.0.0 | Arrow format support |
| `protobuf` | >=6.0,<7.0 | Protocol buffer support |
| `PyYAML` | 6.0.2 | YAML parsing |

---

## Documentation

Full documentation: [droughty.readthedocs.io](https://droughty.readthedocs.io/en/latest/)

Source: [github.com/rittmananalytics/droughty](https://github.com/rittmananalytics/droughty)

PyPI: [pypi.org/project/droughty](https://pypi.org/project/droughty)

---

## License

MIT — see [LICENSE](LICENSE) for details.

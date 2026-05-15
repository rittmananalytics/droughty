How to Use — LookML Period-over-Period (PoP)
============================================

Period-over-Period (PoP) is a Looker pattern that lets dashboard users compare any metric across two time windows — this month vs last month, this year vs last year, and so on — without hardcoding the comparison into the view. Droughty generates the full LookML layer needed to enable this in a single command.

.. note::

   PoP generation is currently supported for **BigQuery** and **Snowflake**. The generated LookML is identical; only the SQL dialect inside each dimension differs.

----

Where the config goes
----------------------

The ``lookml_pop`` block lives inside ``droughty_project.yaml``, which sits at the **root of your git repository** alongside your dbt project files:

.. code-block:: text

   my-analytics-repo/
   ├── droughty_project.yaml        ← lookml_pop goes here
   ├── dbt_project.yml
   ├── models/
   └── lookml/

Add it at the top level of the file, alongside your other droughty settings:

.. code-block:: yaml

   profile: my_profile

   lookml_path: lookml/base
   lookml_base_filename: _base.layer

   lookml_pop:
     views:
       fct_orders:
         - order_date

The ``lookml_pop`` key is optional. If it is absent, droughty skips PoP generation entirely.

----

Where the generated file lands
--------------------------------

The PoP layer is written to the same directory as your other base LookML files, controlled by ``lookml_path`` in ``droughty_project.yaml``.

With the :doc:`recommended folder structure <howto_lookml_structure>`, that is ``lookml/base/``:

.. code-block:: text

   lookml/
   └── base/
       ├── _base.layer.lkml                  ← base views (droughty lookml)
       ├── _aggregate.layer.lkml             ← aggregate views (droughty lookml)
       └── _base_parameters.layer.lkml       ← PoP layer (droughty lookml, if configured)

The default filename is ``_base_parameters.layer``. Override it with ``lookml_base_filename`` in ``droughty_project.yaml`` if you need a different name.

Include all three files in your model:

.. code-block:: text

   # my_project.model.lkml
   include: "/lookml/base/_base.layer.lkml"
   include: "/lookml/base/_aggregate.layer.lkml"
   include: "/lookml/base/_base_parameters.layer.lkml"

----

What gets generated
-------------------

For each view you configure, droughty writes a Looker `refinement <https://cloud.google.com/looker/docs/lookml-refinements>`_ (``+view_name``) into a single ``.lkml`` file. The refinement adds:

**Four user-facing parameters**

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - Parameter
     - What it does
   * - ``select_timeframe_advanced``
     - Picks the comparison grain: day, week, month, quarter, year, or YTD. Default: month.
   * - ``select_comparison``
     - Picks what to compare against: the previous period of the same length, or the same period one year ago. Default: previous period.
   * - ``apply_to_date_filter_advanced``
     - Yesno. When Yes, restricts both periods to rows that fall on or before today's equivalent position in the period (e.g. "month to date"). Default: No.
   * - ``select_reference_date_advanced``
     - Optional date picker. Overrides "today" with any date — useful for comparing historical periods.

**Per-date-field dimensions** (one set for each date field you list in the config)

.. list-table::
   :header-rows: 1
   :widths: 40 60

   * - Dimension
     - Purpose
   * - ``{field}_date``
     - Hidden dimension_group casting the field to date, with all standard timeframes.
   * - ``is_to_date_advanced``
     - Yesno. True if the row falls within the current partial period (respects ``apply_to_date_filter_advanced``).
   * - ``selected_dynamic_timeframe_advanced``
     - The x-axis label for a chart — returns the right grain (e.g. "2024-03" for months) driven by the timeframe parameter.
   * - ``selected_dynamic_day_of_advanced``
     - The position within the period (day of month, day of week, month of year, etc.) — use on the x-axis when you want both periods to share the same axis.
   * - ``current_vs_previous_period_advanced``
     - String dimension returning the timeframe label for rows in either window, null for all others. Use this as the series breakdown on a chart.
   * - ``current_vs_previous_period_hidden_advanced``
     - Hidden. Returns ``"reference"`` or ``"comparison"``. Used to filter the paired measures below.

**Paired measures** (auto-generated from your table schema)

For every ``_pk`` and ``_fk`` column, droughty generates a ``count_distinct`` pair. For every numeric column it generates a ``sum_distinct`` pair:

.. list-table::
   :header-rows: 1
   :widths: 45 55

   * - Measure name pattern
     - Filters on
   * - ``count_of_{column}_reference_advanced``
     - ``current_vs_previous_period_hidden_advanced = "reference"``
   * - ``count_of_{column}_previous_advanced``
     - ``current_vs_previous_period_hidden_advanced = "comparison"``
   * - ``sum_of_{column}_reference_advanced``
     - ``current_vs_previous_period_hidden_advanced = "reference"``
   * - ``sum_of_{column}_previous_advanced``
     - ``current_vs_previous_period_hidden_advanced = "comparison"``

The label on the reference measures changes dynamically: it reads *Current* when no reference date is set and *Reference* when one is.

----

Step 1 — Add the config to droughty_project.yaml
--------------------------------------------------

Under ``lookml_pop``, list each view you want PoP on and the date/timestamp columns in that table that should drive the comparison:

.. code-block:: yaml

   lookml_pop:
     views:
       fct_orders:
         - order_date
         - shipped_date

- The key (``fct_orders``) must match your LookML view name exactly.
- The list items (``order_date``, ``shipped_date``) are column names in the underlying table. You can list as many as you like.

.. tip::

   You only need to list the columns you actually want to pivot on in a dashboard. One date field per view is the most common setup.

----

Step 2 — Run droughty lookml
------------------------------

.. code-block:: bash

   droughty lookml

Droughty generates the PoP layer alongside the base views and explores. The output file is written to:

.. code-block:: text

   {lookml_path}/_base_parameters.layer.lkml

Or, if you have set ``lookml_base_filename`` in your project config, that filename is used instead.

With the default paths this looks like:

.. code-block:: text

   lookml/
   └── base/
       └── _base_parameters.layer.lkml    ← PoP refinements live here

----

Step 3 — Include the file in your LookML project
--------------------------------------------------

The generated file expects to be included from a manifest or model file. Add an include at the top of your model:

.. code-block:: text

   # my_model.model.lkml
   include: "/lookml/base/_base_parameters.layer.lkml"

Because the file uses view refinements (``view: +fct_orders { ... }``), the base view must already be defined elsewhere — typically in the ``_base.layer.lkml`` that droughty also generates. The PoP file includes that automatically:

.. code-block:: text

   include: "/lookml/base/_base.layer.lkml"

----

Example — fct_orders with order_date
--------------------------------------

Given this config:

.. code-block:: yaml

   lookml_pop:
     views:
       fct_orders:
         - order_date

Droughty generates a refinement that looks like this (abbreviated):

.. code-block:: text

   include: "/lookml/base/_base.layer.lkml"

   view: +fct_orders {

     # --- User-facing parameters ---

     parameter: select_timeframe_advanced {
       label: "select timeframe"
       type: unquoted
       default_value: "month"
       allowed_value: { value: "year"    label: "years"    }
       allowed_value: { value: "quarter" label: "quarters" }
       allowed_value: { value: "month"   label: "months"   }
       allowed_value: { value: "week"    label: "weeks"    }
       allowed_value: { value: "day"     label: "days"     }
       allowed_value: { value: "ytd"     label: "ytd"      }
     }

     parameter: select_comparison {
       label: "select comparison type"
       type: unquoted
       default_value: "period"
       allowed_value: { label: "previous year"   value: "year"   }
       allowed_value: { label: "previous period" value: "period" }
     }

     parameter: apply_to_date_filter_advanced {
       label: "apply to date filter advanced"
       type: yesno
       default_value: "false"
     }

     parameter: select_reference_date_advanced {
       label: "select reference date"
       type: date
       convert_tz: no
     }

     # --- Hidden date infrastructure ---

     dimension_group: current_timestamp_advanced {
       type: time
       hidden: yes
       timeframes: [raw, hour, date, week, month, month_name, month_num,
                    year, hour_of_day, day_of_week_index, day_of_month, day_of_year]
       sql: current_timestamp() ;;
     }

     # --- Per-field dimensions for order_date ---

     dimension_group: order_date_date {
       label: "date surrogate"
       hidden: yes
       type: time
       datatype: datetime
       timeframes: [time, hour_of_day, raw, date, day_of_month, day_of_week,
                    day_of_week_index, day_of_year, week, week_of_year,
                    month, month_name, month_num, quarter, quarter_of_year, year]
       sql: cast(${TABLE}.order_date as date) ;;
     }

     dimension: is_to_date_advanced {
       hidden: yes
       type: yesno
       sql:
         {% if apply_to_date_filter_advanced._parameter_value == 'true' %}
           {% if select_timeframe_advanced._parameter_value == 'week' %}
             ${fct_orders.order_date_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index}
           {% elsif select_timeframe_advanced._parameter_value == 'month' %}
             ${fct_orders.order_date_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
           {% elsif select_timeframe_advanced._parameter_value == 'year' %}
             ${fct_orders.order_date_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
           {% else %} true
           {% endif %}
         {% else %} true
         {% endif %} ;;
     }

     dimension: selected_dynamic_timeframe_advanced {
       hidden: yes
       type: string
       label_from_parameter: select_timeframe_advanced
       sql:
         {% if select_timeframe_advanced._parameter_value == 'day' %}   ${fct_orders.order_date_date_date}
         {% elsif select_timeframe_advanced._parameter_value == 'week' %} ${fct_orders.order_date_date_week}
         {% elsif select_timeframe_advanced._parameter_value == 'year' %} ${fct_orders.order_date_date_year}
         {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} ${fct_orders.order_date_date_quarter}
         {% else %} ${fct_orders.order_date_date_month}
         {% endif %} ;;
     }

     dimension: current_vs_previous_period_advanced {
       label: "current vs previous period"
       type: string
       sql:
         {% if select_comparison._parameter_value == 'year' %}
           case
             when date_trunc(${fct_orders.order_date_date_raw}, {% parameter select_timeframe_advanced %})
               = date_trunc(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %})
               then ${selected_dynamic_timeframe_advanced}
             when date_trunc(${fct_orders.order_date_date_raw}, {% parameter select_timeframe_advanced %})
               = date_trunc(date_sub(${selected_reference_date_default_today_advanced_raw}, interval 1 year), {% parameter select_timeframe_advanced %})
               then ${selected_dynamic_timeframe_advanced}
             else null
           end
         {% elsif select_comparison._parameter_value == 'period' %}
           case
             when date_trunc(${fct_orders.order_date_date_raw}, {% parameter select_timeframe_advanced %})
               = date_trunc(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %})
               then ${selected_dynamic_timeframe_advanced}
             when date_trunc(${fct_orders.order_date_date_raw}, {% parameter select_timeframe_advanced %})
               = date_trunc(date_sub(${selected_reference_date_default_today_advanced_raw}, interval 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %})
               then ${selected_dynamic_timeframe_advanced}
             else null
           end
         {% endif %} ;;
     }

     dimension: current_vs_previous_period_hidden_advanced {
       hidden: yes
       type: string
       sql: /* same logic as above but returns 'reference' / 'comparison' instead of the date label */ ;;
     }

     # --- Auto-generated paired measures (from schema inspection) ---

     measure: count_of_order_pk_reference_advanced {
       label: "order_pk count ({% if select_reference_date_advanced._is_filtered %}Reference{% else %}Current{% endif %} {% parameter fct_orders.select_timeframe_advanced %})"
       type: count_distinct
       sql: ${TABLE}.order_pk ;;
       filters: [current_vs_previous_period_hidden_advanced: "reference"]
     }

     measure: count_of_order_pk_previous_advanced {
       label: "order_pk count (Previous {% parameter fct_orders.select_timeframe_advanced %})"
       type: count_distinct
       sql: ${TABLE}.order_pk ;;
       filters: [current_vs_previous_period_hidden_advanced: "comparison"]
     }

     measure: sum_of_order_total_reference_advanced {
       label: "order_total sum ({% if select_reference_date_advanced._is_filtered %}Reference{% else %}Current{% endif %} {% parameter fct_orders.select_timeframe_advanced %})"
       type: sum_distinct
       sql: ${TABLE}.order_total ;;
       filters: [current_vs_previous_period_hidden_advanced: "reference"]
     }

     measure: sum_of_order_total_previous_advanced {
       label: "order_total sum (Previous {% parameter fct_orders.select_timeframe_advanced %})"
       type: sum_distinct
       sql: ${TABLE}.order_total ;;
       filters: [current_vs_previous_period_hidden_advanced: "comparison"]
     }

   }

----

Building a PoP dashboard in Looker
------------------------------------

Once the LookML is loaded into your Looker project, follow these steps to build a period-comparison tile.

**Step 1 — Add dashboard filters**

Add four dashboard filters mapped to the PoP parameters on your explore:

.. list-table::
   :header-rows: 1
   :widths: 30 30 40

   * - Filter label
     - Type
     - Maps to parameter
   * - Timeframe
     - String (dropdown)
     - ``fct_orders.select_timeframe_advanced``
   * - Comparison type
     - String (dropdown)
     - ``fct_orders.select_comparison``
   * - Apply to-date logic
     - Boolean
     - ``fct_orders.apply_to_date_filter_advanced``
   * - Reference date
     - Date
     - ``fct_orders.select_reference_date_advanced``

**Step 2 — Build a line or bar chart**

In the Looker Explore, add:

- **X-axis (Dimension):** ``selected_dynamic_day_of_advanced`` — this gives the position within the period (day 1, day 2, …) on a shared axis so both periods overlay correctly
- **Series breakdown (Pivot):** ``current_vs_previous_period_advanced`` — splits rows into "current" and "previous" series
- **Y-axis (Measure):** one of the ``_reference_advanced`` or ``_previous_advanced`` measures, e.g. ``count_of_order_pk_reference_advanced``

.. tip::

   Use ``selected_dynamic_day_of_advanced`` (positional) on the x-axis when overlaying two periods. Use ``selected_dynamic_timeframe_advanced`` (absolute date label) on the x-axis when showing both periods side by side in a bar chart.

**Step 3 — Filter out null rows**

The ``current_vs_previous_period_advanced`` dimension returns null for any row that doesn't fall in either window. Add a filter on the explore to exclude nulls:

.. code-block:: text

   current_vs_previous_period_advanced  is not null

This keeps only the two comparison windows in the result set.

----

How the comparison windows are calculated
------------------------------------------

The core logic lives in ``current_vs_previous_period_advanced`` and its hidden counterpart. Here is the decision tree in plain language:

.. code-block:: text

   ┌─ YTD mode?  ─────────────────────────────────────────────────────────┐
   │  Reference window: Jan 1 of this year → today                        │
   │  Comparison window: Jan 1 of last year → this day last year          │
   └───────────────────────────────────────────────────────────────────────┘

   ┌─ Comparison = "previous year"  ──────────────────────────────────────┐
   │  Reference window: the full {timeframe} containing the reference date │
   │  Comparison window: the same {timeframe} one year earlier             │
   │  e.g. timeframe=month, date=2024-05-14 →                             │
   │    reference:   May 2024                                              │
   │    comparison:  May 2023                                              │
   └───────────────────────────────────────────────────────────────────────┘

   ┌─ Comparison = "previous period"  ────────────────────────────────────┐
   │  Reference window: the full {timeframe} containing the reference date │
   │  Comparison window: the immediately preceding {timeframe}             │
   │  e.g. timeframe=month, date=2024-05-14 →                             │
   │    reference:   May 2024                                              │
   │    comparison:  April 2024                                            │
   └───────────────────────────────────────────────────────────────────────┘

When ``apply_to_date_filter_advanced`` is **Yes**, both windows are truncated at today's equivalent position — so "May 2024" only includes days 1–14 if today is the 14th.

When ``select_reference_date_advanced`` is set, "today" is replaced by that date throughout the calculation.

----

Multiple date fields on one view
----------------------------------

You can list multiple date columns for a single view:

.. code-block:: yaml

   lookml_pop:
     views:
       fct_orders:
         - order_date
         - shipped_date

Each field in the list gets its own full set of dimensions (``order_date_date``, ``shipped_date_date``, ``is_to_date_advanced``, etc.) and the paired measures are generated once using the table's schema. Use the ``order_date``-based dimensions for a "placed orders" comparison, and the ``shipped_date``-based dimensions for a "shipped orders" comparison.

.. warning::

   The parameters (``select_timeframe_advanced``, ``select_comparison``, etc.) are shared across all date fields — they are added once to the view, not once per field. Both field sets will respond to the same dashboard filter.

----

Multiple views
--------------

Each view listed under ``lookml_pop.views`` gets its own independent set of parameters and dimensions:

.. code-block:: yaml

   lookml_pop:
     views:
       fct_orders:
         - order_date
       fct_sessions:
         - session_start_date

Parameters on ``fct_orders`` are entirely separate from those on ``fct_sessions``, so dashboard filters need to be mapped to the correct explore.

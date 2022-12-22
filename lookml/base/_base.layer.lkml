explore: wh_core__clients_bridge
{ hidden: yes }
explore: wh_core__people_bridge
{ hidden: yes }
explore: wh_core__sprints_bridge
{ hidden: yes }
explore: wh_delivery__harvest_clients_dim
{ hidden: yes }
explore: wh_delivery__harvest_clients_fact
{ hidden: yes }
explore: wh_delivery__harvest_employees_dim
{ hidden: yes }
explore: wh_delivery__harvest_employees_fact
{ hidden: yes }
explore: wh_delivery__harvest_expenses_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoice_line_items_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoices_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoices_xa
{ hidden: yes }
explore: wh_delivery__harvest_projects_dim
{ hidden: yes }
explore: wh_delivery__harvest_projects_fact
{ hidden: yes }
explore: wh_delivery__harvest_tasks_dim
{ hidden: yes }
explore: wh_delivery__harvest_tasks_fact
{ hidden: yes }
explore: wh_delivery__harvest_time_sheets_fact
{ hidden: yes }
explore: wh_delivery__jira_daily_issue_field_history_fact
{ hidden: yes }
explore: wh_delivery__jira_epics_dim
{ hidden: yes }
explore: wh_delivery__jira_fields_dim
{ hidden: yes }
explore: wh_delivery__jira_issues_fact
{ hidden: yes }
explore: wh_delivery__jira_issues_field_history_fact
{ hidden: yes }
explore: wh_delivery__jira_issues_xa
{ hidden: yes }
explore: wh_delivery__jira_projects_dim
{ hidden: yes }
explore: wh_delivery__jira_projects_fact
{ hidden: yes }
explore: wh_delivery__jira_sprints_dim
{ hidden: yes }
explore: wh_delivery__jira_sprints_fact
{ hidden: yes }
explore: wh_delivery__jira_users_dim
{ hidden: yes }
view: wh_core__clients_bridge {
sql_table_name: wh_core__clients_bridge ;;
set: wh_core__clients_bridge_set {
  fields: [nk]
}
dimension: client_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.client_pk ;;
  description: ""
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: ""
}
dimension: jira_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_project_fk ;;
  description: ""
}
dimension: nk {
  hidden: yes 
  type: number
  sql: ${TABLE}.nk ;;
  description: ""
}
}
view: wh_core__people_bridge {
sql_table_name: wh_core__people_bridge ;;
set: wh_core__people_bridge_set {
  fields: [nk]
}
dimension: person_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.person_pk ;;
  description: ""
}
dimension: jira_user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_user_fk ;;
  description: ""
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: ""
}
dimension: nk {
  hidden: yes 
  type: number
  sql: ${TABLE}.nk ;;
  description: ""
}
}
view: wh_core__sprints_bridge {
sql_table_name: wh_core__sprints_bridge ;;
set: wh_core__sprints_bridge_set {
  fields: [nk]
}
dimension: sprint_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.sprint_pk ;;
  description: ""
}
dimension: jira_sprint_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_sprint_fk ;;
  description: ""
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: ""
}
dimension: nk {
  hidden: yes 
  type: number
  sql: ${TABLE}.nk ;;
  description: ""
}
}
view: wh_delivery__harvest_clients_dim {
sql_table_name: wh_delivery__harvest_clients_dim ;;
set: wh_delivery__harvest_clients_dim_set {
  fields: [harvest_client_currency, harvest_client_name, harvest_client_is_active]
}
dimension: harvest_client_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_client_pk ;;
  description: "not available"
}
dimension: harvest_client_currency {
  type: string
  sql: ${TABLE}.harvest_client_currency ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension: harvest_client_name {
  type: string
  sql: ${TABLE}.harvest_client_name ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension: harvest_client_is_active {
  type: yesno
  sql: ${TABLE}.harvest_client_is_active ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension_group: harvest_client_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_created_at_ts ;;
  description: "not available"
}
dimension_group: harvest_client_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_updated_at_ts ;;
  description: "not available"
}
}
view: wh_delivery__harvest_clients_fact {
sql_table_name: wh_delivery__harvest_clients_fact ;;
set: wh_delivery__harvest_clients_fact_set {
  fields: [harvest_client_currency, harvest_client_name, harvest_client_is_active]
}
dimension: harvest_client_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_client_pk ;;
  description: ""
}
dimension: harvest_client_currency {
  type: string
  sql: ${TABLE}.harvest_client_currency ;;
  description: ""
  drill_fields: [wh_delivery__harvest_clients_fact_set*]
}
dimension: harvest_client_name {
  type: string
  sql: ${TABLE}.harvest_client_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_clients_fact_set*]
}
dimension: harvest_client_is_active {
  type: yesno
  sql: ${TABLE}.harvest_client_is_active ;;
  description: ""
  drill_fields: [wh_delivery__harvest_clients_fact_set*]
}
dimension_group: harvest_client_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_created_at_ts ;;
  description: ""
}
dimension_group: harvest_client_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_updated_at_ts ;;
  description: ""
}
}
view: wh_delivery__harvest_employees_dim {
sql_table_name: wh_delivery__harvest_employees_dim ;;
set: wh_delivery__harvest_employees_dim_set {
  fields: [
    harvest_employee_first_name,
    harvest_employee_last_name,
    harvest_employee_full_name,
    harvest_employee_email,
    harvest_employee_weekly_capacity,
    harvest_employee_cost_rate,
    harvest_employee_default_hourly_rate,
    harvest_employee_is_contractor,
    harvest_employee_is_active,
  ]
}
dimension: harvest_employee_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_employee_pk ;;
  description: "not available"
}
dimension: harvest_employee_first_name {
  type: string
  sql: ${TABLE}.harvest_employee_first_name ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_last_name {
  type: string
  sql: ${TABLE}.harvest_employee_last_name ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_full_name {
  type: string
  sql: ${TABLE}.harvest_employee_full_name ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_email {
  type: string
  sql: ${TABLE}.harvest_employee_email ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_weekly_capacity {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_weekly_capacity ;;
  description: "not available"
}
dimension: harvest_employee_cost_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_cost_rate ;;
  description: "not available"
}
dimension: harvest_employee_default_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_default_hourly_rate ;;
  description: "not available"
}
dimension: harvest_employee_is_contractor {
  type: yesno
  sql: ${TABLE}.harvest_employee_is_contractor ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_is_active {
  type: yesno
  sql: ${TABLE}.harvest_employee_is_active ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension_group: harvest_employee_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_employee_created_at_ts ;;
  description: "not available"
}
dimension_group: harvest_employee_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_employee_updated_at_ts ;;
  description: "not available"
}
}
view: wh_delivery__harvest_employees_fact {
sql_table_name: wh_delivery__harvest_employees_fact ;;
set: wh_delivery__harvest_employees_fact_set {
  fields: [
    harvest_employee_first_name,
    harvest_employee_last_name,
    harvest_employee_full_name,
    harvest_employee_email,
    harvest_employee_weekly_capacity,
    harvest_employee_cost_rate,
    harvest_employee_default_hourly_rate,
    harvest_employee_is_contractor,
    harvest_employee_is_active,
  ]
}
dimension: harvest_employee_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_employee_pk ;;
  description: ""
}
dimension: harvest_employee_first_name {
  type: string
  sql: ${TABLE}.harvest_employee_first_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
dimension: harvest_employee_last_name {
  type: string
  sql: ${TABLE}.harvest_employee_last_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
dimension: harvest_employee_full_name {
  type: string
  sql: ${TABLE}.harvest_employee_full_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
dimension: harvest_employee_email {
  type: string
  sql: ${TABLE}.harvest_employee_email ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
dimension: harvest_employee_weekly_capacity {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_weekly_capacity ;;
  description: ""
}
dimension: harvest_employee_cost_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_cost_rate ;;
  description: ""
}
dimension: harvest_employee_default_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_default_hourly_rate ;;
  description: ""
}
dimension: harvest_employee_is_contractor {
  type: yesno
  sql: ${TABLE}.harvest_employee_is_contractor ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
dimension: harvest_employee_is_active {
  type: yesno
  sql: ${TABLE}.harvest_employee_is_active ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
dimension_group: harvest_employee_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_employee_created_at_ts ;;
  description: ""
}
dimension_group: harvest_employee_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_employee_updated_at_ts ;;
  description: ""
}
}
view: wh_delivery__harvest_expenses_fact {
sql_table_name: wh_delivery__harvest_expenses_fact ;;
set: wh_delivery__harvest_expenses_fact_set {
  fields: [
    harvest_expense_notes,
    harvest_expense_receipt_file_name,
    harvest_expense_locked_reason,
    harvest_expense_receipt_content_type,
    harvest_expense_receipt_url,
    harvest_expense_total_cost,
    harvest_expense_receipt_file_size,
    harvest_expense_units,
    harvest_expense_is_closed,
    harvest_expense_billable,
    harvest_expense_is_billed,
    harvest_expense_is_locked,
  ]
}
dimension: harvest_expense_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_expense_pk ;;
  description: "not available"
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: "not available"
}
dimension: harvest_invoice_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_invoice_fk ;;
  description: "not available"
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: "not available"
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: "not available"
}
dimension: harvest_expense_category_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_category_natural_key ;;
  description: "not available"
}
dimension: harvest_employee_assignment_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: "not available"
}
dimension: harvest_expense_notes {
  type: string
  sql: ${TABLE}.harvest_expense_notes ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_file_name {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_file_name ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_locked_reason {
  type: string
  sql: ${TABLE}.harvest_expense_locked_reason ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_content_type {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_content_type ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_url {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_url ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_total_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_total_cost ;;
  description: "not available"
}
dimension: harvest_expense_receipt_file_size {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_receipt_file_size ;;
  description: "not available"
}
dimension: harvest_expense_units {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_units ;;
  description: "not available"
}
dimension: harvest_expense_is_closed {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_closed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_billable {
  type: yesno
  sql: ${TABLE}.harvest_expense_billable ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_is_billed {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_billed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_is_locked {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_locked ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension_group: harvest_expense_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_created_at ;;
  description: "not available"
}
dimension_group: harvest_expense_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_updated_at ;;
  description: "not available"
}
dimension_group: harvest_expense_spent_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_spent_date ;;
  description: "not available"
}
}
view: wh_delivery__harvest_invoice_line_items_fact {
sql_table_name: wh_delivery__harvest_invoice_line_items_fact ;;
set: wh_delivery__harvest_invoice_line_items_fact_set {
  fields: [
    harvest_invoice_line_item_kind,
    harvest_invoice_line_item_description,
    harvest_invoice_line_item_amount,
    harvest_invoice_line_item_unit_price,
    harvest_invoice_line_item_quantity,
    harvest_invoice_line_item_services_amount_billed,
    harvest_invoice_line_item_license_referral_fee_amount_billed,
    harvest_invoice_line_item_expenses_amount_billed,
    harvest_invoice_line_item_support_amount_billed,
    harvest_invoice_line_item_is_taxed,
  ]
}
dimension: harvest_invoice_line_item_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_pk ;;
  description: "not available"
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: "not available"
}
dimension: harvest_invoice_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_invoice_fk ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_kind {
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_kind ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
dimension: harvest_invoice_line_item_description {
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_description ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
dimension: harvest_invoice_line_item_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_amount ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_unit_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_unit_price ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_quantity ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_services_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_services_amount_billed ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_license_referral_fee_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_license_referral_fee_amount_billed ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_expenses_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_expenses_amount_billed ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_support_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_support_amount_billed ;;
  description: "not available"
}
dimension: harvest_invoice_line_item_is_taxed {
  type: yesno
  sql: ${TABLE}.harvest_invoice_line_item_is_taxed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
}
view: wh_delivery__harvest_invoices_fact {
sql_table_name: wh_delivery__harvest_invoices_fact ;;
set: wh_delivery__harvest_invoices_fact_set {
  fields: [
    harvest_invoice_client_key,
    harvest_invoice_number,
    harvest_invoice_purchase_order,
    harvest_invoice_state,
    harvest_invoice_notes,
    harvest_invoice_subject,
    harvest_invoice_currency,
    harvest_invoice_payment_term,
    harvest_invoice_amount,
    harvest_invoice_due_amount,
    harvest_invoice_discount_amount,
    harvest_invoice_discount,
    harvest_invoice_tax_amount,
    harvest_invoice_tax,
  ]
}
dimension: harvest_invoice_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "not available"
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: "not available"
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: "not available"
}
dimension: harvest_invoice_client_key {
  type: string
  sql: ${TABLE}.harvest_invoice_client_key ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_number {
  type: string
  sql: ${TABLE}.harvest_invoice_number ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_purchase_order {
  type: string
  sql: ${TABLE}.harvest_invoice_purchase_order ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_state {
  type: string
  sql: ${TABLE}.harvest_invoice_state ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_notes {
  type: string
  sql: ${TABLE}.harvest_invoice_notes ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_subject {
  type: string
  sql: ${TABLE}.harvest_invoice_subject ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_currency {
  type: string
  sql: ${TABLE}.harvest_invoice_currency ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_payment_term {
  type: string
  sql: ${TABLE}.harvest_invoice_payment_term ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_amount ;;
  description: "not available"
}
dimension: harvest_invoice_due_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_due_amount ;;
  description: "not available"
}
dimension: harvest_invoice_discount_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_discount_amount ;;
  description: "not available"
}
dimension: harvest_invoice_discount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_discount ;;
  description: "not available"
}
dimension: harvest_invoice_tax_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_tax_amount ;;
  description: "not available"
}
dimension: harvest_invoice_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_tax ;;
  description: "not available"
}
dimension_group: harvest_invoice_period_start {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_period_start ;;
  description: "not available"
}
dimension_group: harvest_invoice_period_end {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_period_end ;;
  description: "not available"
}
dimension_group: harvest_invoice_paid_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_paid_date ;;
  description: "not available"
}
dimension_group: harvest_invoice_issue_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_issue_date ;;
  description: "not available"
}
dimension_group: harvest_invoice_due_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_due_date ;;
  description: "not available"
}
dimension_group: harvest_invoice_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_created_at ;;
  description: "not available"
}
dimension_group: harvest_invoice_sent_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_sent_at ;;
  description: "not available"
}
dimension_group: harvest_invoice_paid_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_paid_at ;;
  description: "not available"
}
dimension_group: harvest_invoice_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_updated_at ;;
  description: "not available"
}
}
view: wh_delivery__harvest_invoices_xa {
sql_table_name: wh_delivery__harvest_invoices_xa ;;
set: wh_delivery__harvest_invoices_xa_set {
  fields: [harvest_invoice_net_amount, harvest_invoice_revenue_amount_billed, harvest_client_invoice_sequence_nunber]
}
dimension: harvest_invoice_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "not available"
}
dimension: harvest_invoice_net_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_net_amount ;;
  description: "not available"
}
dimension: harvest_invoice_revenue_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_revenue_amount_billed ;;
  description: "not available"
}
dimension: harvest_client_invoice_sequence_nunber {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_client_invoice_sequence_nunber ;;
  description: "not available"
}
}
view: wh_delivery__harvest_projects_dim {
sql_table_name: wh_delivery__harvest_projects_dim ;;
set: wh_delivery__harvest_projects_dim_set {
  fields: [
    harvest_project_name,
    harvest_project_code,
    harvest_project_notes,
    harvest_project_bill_by,
    harvest_project_budget_by,
    harvest_project_hourly_rate,
    harvest_project_cost_budget,
    harvest_project_fee,
    harvest_project_budget,
    harvest_project_over_budget_notification_percentage,
    harvest_project_show_budget_to_all,
    harvest_project_cost_budget_include_expenses,
    harvest_project_budget_is_monthly,
    harvest_project_notify_when_over_budget,
    harvest_project_is_billable,
    harvest_project_is_fixed_fee,
    harvest_project_is_active,
  ]
}
dimension: harvest_project_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_project_pk ;;
  description: ""
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: ""
}
dimension: harvest_project_name {
  type: string
  sql: ${TABLE}.harvest_project_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_code {
  type: string
  sql: ${TABLE}.harvest_project_code ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_notes {
  type: string
  sql: ${TABLE}.harvest_project_notes ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_bill_by {
  type: string
  sql: ${TABLE}.harvest_project_bill_by ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_budget_by {
  type: string
  sql: ${TABLE}.harvest_project_budget_by ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: ""
}
dimension: harvest_project_cost_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: ""
}
dimension: harvest_project_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_fee ;;
  description: ""
}
dimension: harvest_project_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_budget ;;
  description: ""
}
dimension: harvest_project_over_budget_notification_percentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: ""
}
dimension: harvest_project_show_budget_to_all {
  type: yesno
  sql: ${TABLE}.harvest_project_show_budget_to_all ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_cost_budget_include_expenses {
  type: yesno
  sql: ${TABLE}.harvest_project_cost_budget_include_expenses ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_budget_is_monthly {
  type: yesno
  sql: ${TABLE}.harvest_project_budget_is_monthly ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_notify_when_over_budget {
  type: yesno
  sql: ${TABLE}.harvest_project_notify_when_over_budget ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_is_billable {
  type: yesno
  sql: ${TABLE}.harvest_project_is_billable ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_is_fixed_fee {
  type: yesno
  sql: ${TABLE}.harvest_project_is_fixed_fee ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension: harvest_project_is_active {
  type: yesno
  sql: ${TABLE}.harvest_project_is_active ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
dimension_group: harvest_project_over_budget_notification_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_over_budget_notification_date ;;
  description: ""
}
dimension_group: harvest_project_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_created_at ;;
  description: ""
}
dimension_group: harvest_project_ends_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_ends_on ;;
  description: ""
}
dimension_group: harvest_project_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_updated_at ;;
  description: ""
}
dimension_group: harvest_project_starts_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_starts_on ;;
  description: ""
}
}
view: wh_delivery__harvest_projects_fact {
sql_table_name: wh_delivery__harvest_projects_fact ;;
set: wh_delivery__harvest_projects_fact_set {
  fields: [
    harvest_project_name,
    harvest_project_code,
    harvest_project_notes,
    harvest_project_bill_by,
    harvest_project_budget_by,
    harvest_project_hourly_rate,
    harvest_project_cost_budget,
    harvest_project_fee,
    harvest_project_budget,
    harvest_project_over_budget_notification_percentage,
    harvest_project_show_budget_to_all,
    harvest_project_cost_budget_include_expenses,
    harvest_project_budget_is_monthly,
    harvest_project_notify_when_over_budget,
    harvest_project_is_billable,
    harvest_project_is_fixed_fee,
    harvest_project_is_active,
  ]
}
dimension: harvest_project_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_project_pk ;;
  description: "not available"
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: "not available"
}
dimension: harvest_project_name {
  type: string
  sql: ${TABLE}.harvest_project_name ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_code {
  type: string
  sql: ${TABLE}.harvest_project_code ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_notes {
  type: string
  sql: ${TABLE}.harvest_project_notes ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_bill_by {
  type: string
  sql: ${TABLE}.harvest_project_bill_by ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_budget_by {
  type: string
  sql: ${TABLE}.harvest_project_budget_by ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: "not available"
}
dimension: harvest_project_cost_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: "not available"
}
dimension: harvest_project_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_fee ;;
  description: "not available"
}
dimension: harvest_project_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_budget ;;
  description: "not available"
}
dimension: harvest_project_over_budget_notification_percentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: "not available"
}
dimension: harvest_project_show_budget_to_all {
  type: yesno
  sql: ${TABLE}.harvest_project_show_budget_to_all ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_cost_budget_include_expenses {
  type: yesno
  sql: ${TABLE}.harvest_project_cost_budget_include_expenses ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_budget_is_monthly {
  type: yesno
  sql: ${TABLE}.harvest_project_budget_is_monthly ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_notify_when_over_budget {
  type: yesno
  sql: ${TABLE}.harvest_project_notify_when_over_budget ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_billable {
  type: yesno
  sql: ${TABLE}.harvest_project_is_billable ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_fixed_fee {
  type: yesno
  sql: ${TABLE}.harvest_project_is_fixed_fee ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_active {
  type: yesno
  sql: ${TABLE}.harvest_project_is_active ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension_group: harvest_project_over_budget_notification_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_over_budget_notification_date ;;
  description: "not available"
}
dimension_group: harvest_project_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_created_at ;;
  description: "not available"
}
dimension_group: harvest_project_ends_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_ends_on ;;
  description: "not available"
}
dimension_group: harvest_project_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_updated_at ;;
  description: "not available"
}
dimension_group: harvest_project_starts_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_starts_on ;;
  description: "not available"
}
}
view: wh_delivery__harvest_tasks_dim {
sql_table_name: wh_delivery__harvest_tasks_dim ;;
set: wh_delivery__harvest_tasks_dim_set {
  fields: [
    harvest_task_name,
    harvest_task_default_hourly_rate,
    harvest_task_is_billable_by_default,
    harvest_task_is_default,
    harvest_task_is_active,
  ]
}
dimension: harvest_task_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_task_pk ;;
  description: "not available"
}
dimension: harvest_task_name {
  type: string
  sql: ${TABLE}.harvest_task_name ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_default_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_task_default_hourly_rate ;;
  description: "not available"
}
dimension: harvest_task_is_billable_by_default {
  type: yesno
  sql: ${TABLE}.harvest_task_is_billable_by_default ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_is_default {
  type: yesno
  sql: ${TABLE}.harvest_task_is_default ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_is_active {
  type: yesno
  sql: ${TABLE}.harvest_task_is_active ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension_group: harvest_task_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_task_created_at_ts ;;
  description: "not available"
}
dimension_group: harvest_task_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_task_updated_at_ts ;;
  description: "not available"
}
}
view: wh_delivery__harvest_tasks_fact {
sql_table_name: wh_delivery__harvest_tasks_fact ;;
set: wh_delivery__harvest_tasks_fact_set {
  fields: [
    harvest_task_name,
    harvest_task_default_hourly_rate,
    harvest_task_is_billable_by_default,
    harvest_task_is_default,
    harvest_task_is_active,
  ]
}
dimension: harvest_task_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_task_pk ;;
  description: ""
}
dimension: harvest_task_name {
  type: string
  sql: ${TABLE}.harvest_task_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_fact_set*]
}
dimension: harvest_task_default_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_task_default_hourly_rate ;;
  description: ""
}
dimension: harvest_task_is_billable_by_default {
  type: yesno
  sql: ${TABLE}.harvest_task_is_billable_by_default ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_fact_set*]
}
dimension: harvest_task_is_default {
  type: yesno
  sql: ${TABLE}.harvest_task_is_default ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_fact_set*]
}
dimension: harvest_task_is_active {
  type: yesno
  sql: ${TABLE}.harvest_task_is_active ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_fact_set*]
}
dimension_group: harvest_task_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_task_created_at_ts ;;
  description: ""
}
dimension_group: harvest_task_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_task_updated_at_ts ;;
  description: ""
}
}
view: wh_delivery__harvest_time_sheets_fact {
sql_table_name: wh_delivery__harvest_time_sheets_fact ;;
set: wh_delivery__harvest_time_sheets_fact_set {
  fields: [
    harvest_external_reference_jira_issue_key,
    harvest_timesheet_notes,
    harvest_timesheet_locked_reason,
    harvest_timesheet_billable_rate,
    harvest_timesheet_cost_rate,
    harvest_timesheet_hours,
    harvest_timesheet_hours_budgeted,
    harvest_timesheet_is_billable,
    harvest_timesheet_is_closed,
    harvest_timesheet_is_running,
    harvest_timesheet_is_billed,
    harvest_timesheet_is_locked,
    harvest_timesheet_started_at,
    harvest_external_reference_permalink,
    harvest_external_reference_platform,
  ]
}
dimension: harvest_timesheet_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_timesheet_pk ;;
  description: ""
}
dimension: harvest_external_reference_jira_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_external_reference_jira_fk ;;
  description: ""
}
dimension: harvest_task_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_task_fk ;;
  description: ""
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: ""
}
dimension: harvest_external_reference_jira_issue_key {
  type: string
  sql: ${TABLE}.harvest_external_reference_jira_issue_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_natural_key ;;
  description: ""
}
dimension: harvest_employee_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_natural_key ;;
  description: ""
}
dimension: harvest_task_assignment_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_task_assignment_natural_key ;;
  description: ""
}
dimension: harvest_employee_assignment_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: ""
}
dimension: harvest_invoice_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_natural_key ;;
  description: ""
}
dimension: harvest_client_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_client_natural_key ;;
  description: ""
}
dimension: harvest_timesheet_notes {
  type: string
  sql: ${TABLE}.harvest_timesheet_notes ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_locked_reason {
  type: string
  sql: ${TABLE}.harvest_timesheet_locked_reason ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_billable_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_billable_rate ;;
  description: ""
}
dimension: harvest_timesheet_cost_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_cost_rate ;;
  description: ""
}
dimension: harvest_timesheet_hours {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_hours ;;
  description: ""
}
dimension: harvest_timesheet_hours_budgeted {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_hours_budgeted ;;
  description: ""
}
dimension: harvest_timesheet_is_billable {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_billable ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_closed {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_closed ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_running {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_running ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_billed {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_billed ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_locked {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_locked ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension_group: harvest_timesheet_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_created_at_ts ;;
  description: ""
}
dimension_group: harvest_timesheet_timer_started_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_timer_started_at_ts ;;
  description: ""
}
dimension: harvest_timesheet_started_at {
  type: string
  sql: ${TABLE}.harvest_timesheet_started_at ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension_group: harvest_timesheet_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_updated_at_ts ;;
  description: ""
}
dimension_group: harvest_timesheet_spent_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_spent_at_ts ;;
  description: ""
}
dimension: harvest_external_reference_permalink {
  type: string
  sql: ${TABLE}.harvest_external_reference_permalink ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_external_reference_platform {
  type: string
  sql: ${TABLE}.harvest_external_reference_platform ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
}
view: wh_delivery__jira_daily_issue_field_history_fact {
sql_table_name: wh_delivery__jira_daily_issue_field_history_fact ;;
set: wh_delivery__jira_daily_issue_field_history_fact_set {
  fields: [jira_daily_issue_field_history_status, jira_daily_issue_field_history_sprint]
}
dimension: jira_daily_issue_field_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_pk ;;
  description: "not available"
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: "not available"
}
dimension: jira_daily_issue_field_history_status {
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_status ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
dimension: jira_daily_issue_field_history_sprint {
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_sprint ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
dimension_group: jira_daily_issue_field_history_date_day {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_daily_issue_field_history_date_day ;;
  description: "not available"
}
}
view: wh_delivery__jira_epics_dim {
sql_table_name: wh_delivery__jira_epics_dim ;;
set: wh_delivery__jira_epics_dim_set {
  fields: [jira_epic_name, jira_epic_summary, jira_epic_is_done, jira_epic_key]
}
dimension: jira_epic_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_epic_pk ;;
  description: ""
}
dimension: jira_epic_name {
  type: string
  sql: ${TABLE}.jira_epic_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_summary {
  type: string
  sql: ${TABLE}.jira_epic_summary ;;
  description: ""
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_is_done {
  type: yesno
  sql: ${TABLE}.jira_epic_is_done ;;
  description: ""
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_key {
  type: string
  sql: ${TABLE}.jira_epic_key ;;
  description: ""
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
}
view: wh_delivery__jira_fields_dim {
sql_table_name: wh_delivery__jira_fields_dim ;;
set: wh_delivery__jira_fields_dim_set {
  fields: [jira_field_name, jira_field_is_array, jira_field_is_custom]
}
dimension: jira_field_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_field_pk ;;
  description: ""
}
dimension: jira_field_name {
  type: string
  sql: ${TABLE}.jira_field_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
dimension: jira_field_is_array {
  type: yesno
  sql: ${TABLE}.jira_field_is_array ;;
  description: ""
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
dimension: jira_field_is_custom {
  type: yesno
  sql: ${TABLE}.jira_field_is_custom ;;
  description: ""
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
}
view: wh_delivery__jira_issues_fact {
sql_table_name: wh_delivery__jira_issues_fact ;;
set: wh_delivery__jira_issues_fact_set {
  fields: [
    jira_issue_summary,
    jira_issue_description,
    jira_issue_project,
    jira_issue_assignee,
    jira_issue_reporter,
    jira_issue_priority,
    jira_issue_creator,
    jira_issue_issue_type,
    jira_issue_key,
    jira_issue_status_description,
    jira_issue_status_name,
    jira_issue_status_stage,
    jira_issue_is_done,
    jira_issue_type,
    jira_issue_parent_issue_type,
    jira_issue_parent_issue_name,
    jira_issue_is_parent_epic,
    jira_issue_resolution_type,
    jira_issue_environment,
    jira_issue_work_ratio,
    jira_issue_status,
    jira_issue_conversation,
    jira_issue_current_status,
    jira_issue_current_status_category,
    jira_issue_current_priority,
    jira_issue_sprint,
    jira_issue_current_sprint_name,
    jira_issue_is_active_sprint,
    jira_issue_fixes_versions,
    jira_issue_affects_versions,
    jira_issue_count_sprint_changes,
    jira_issue_time_spent_seconds,
    jira_issue_count_comments,
    jira_issue_open_duration_seconds,
    jira_issue_any_assignment_duration_seconds,
    jira_issue_last_assignment_duration_seconds,
    jira_issue_story_point_estimate,
    jira_issue_original_estimate,
    jira_issue_remaining_estimate,
  ]
}
dimension: jira_issue_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_pk ;;
  description: ""
}
dimension: jira_issue_parent_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_parent_fk ;;
  description: ""
}
dimension: jira_user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_user_fk ;;
  description: ""
}
dimension: jira_creator_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_creator_fk ;;
  description: ""
}
dimension: jira_reporter_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_reporter_fk ;;
  description: ""
}
dimension: jira_resolution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_resolution_fk ;;
  description: ""
}
dimension: jira_current_sprint_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_current_sprint_fk ;;
  description: ""
}
dimension: jira_external_reference_jira_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_external_reference_jira_fk ;;
  description: ""
}
dimension: jira_issue_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_natural_key ;;
  description: ""
}
dimension: jira_issue_summary {
  type: string
  sql: ${TABLE}.jira_issue_summary ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_description {
  type: string
  sql: ${TABLE}.jira_issue_description ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_project {
  type: string
  sql: ${TABLE}.jira_issue_project ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_assignee {
  type: string
  sql: ${TABLE}.jira_issue_assignee ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_reporter {
  type: string
  sql: ${TABLE}.jira_issue_reporter ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_priority {
  type: string
  sql: ${TABLE}.jira_issue_priority ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_creator {
  type: string
  sql: ${TABLE}.jira_issue_creator ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_issue_type {
  type: string
  sql: ${TABLE}.jira_issue_issue_type ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_key {
  type: string
  sql: ${TABLE}.jira_issue_key ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_status_description {
  type: string
  sql: ${TABLE}.jira_issue_status_description ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_status_name {
  type: string
  sql: ${TABLE}.jira_issue_status_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_status_stage {
  type: string
  sql: ${TABLE}.jira_issue_status_stage ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_is_done {
  type: yesno
  sql: ${TABLE}.jira_issue_is_done ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_type {
  type: string
  sql: ${TABLE}.jira_issue_type ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_parent_issue_type {
  type: string
  sql: ${TABLE}.jira_issue_parent_issue_type ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_parent_issue_name {
  type: string
  sql: ${TABLE}.jira_issue_parent_issue_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_is_parent_epic {
  type: yesno
  sql: ${TABLE}.jira_issue_is_parent_epic ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_resolution_type {
  type: string
  sql: ${TABLE}.jira_issue_resolution_type ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_environment {
  type: string
  sql: ${TABLE}.jira_issue_environment ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_work_ratio {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_work_ratio ;;
  description: ""
}
dimension: jira_issue_status {
  type: string
  sql: ${TABLE}.jira_issue_status ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_conversation {
  type: string
  sql: ${TABLE}.jira_issue_conversation ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_status {
  type: string
  sql: ${TABLE}.jira_issue_current_status ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_status_category {
  type: string
  sql: ${TABLE}.jira_issue_current_status_category ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_priority {
  type: string
  sql: ${TABLE}.jira_issue_current_priority ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_sprint {
  type: string
  sql: ${TABLE}.jira_issue_sprint ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_sprint_name {
  type: string
  sql: ${TABLE}.jira_issue_current_sprint_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_is_active_sprint {
  type: yesno
  sql: ${TABLE}.jira_issue_is_active_sprint ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_fixes_versions {
  type: string
  sql: ${TABLE}.jira_issue_fixes_versions ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_affects_versions {
  type: string
  sql: ${TABLE}.jira_issue_affects_versions ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_count_sprint_changes {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_count_sprint_changes ;;
  description: ""
}
dimension: jira_issue_time_spent_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_time_spent_seconds ;;
  description: ""
}
dimension: jira_issue_count_comments {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_count_comments ;;
  description: ""
}
dimension: jira_issue_open_duration_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_open_duration_seconds ;;
  description: ""
}
dimension: jira_issue_any_assignment_duration_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_any_assignment_duration_seconds ;;
  description: ""
}
dimension: jira_issue_last_assignment_duration_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_last_assignment_duration_seconds ;;
  description: ""
}
dimension: jira_issue_story_point_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_story_point_estimate ;;
  description: ""
}
dimension: jira_issue_original_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_original_estimate ;;
  description: ""
}
dimension: jira_issue_remaining_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_remaining_estimate ;;
  description: ""
}
dimension_group: jira_issue_sprint_started_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_sprint_started_at ;;
  description: ""
}
dimension_group: jira_issue_sprint_ended_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_sprint_ended_at ;;
  description: ""
}
dimension_group: jira_issue_sprint_completed_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_sprint_completed_at ;;
  description: ""
}
dimension_group: jira_issue_first_assigned_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_first_assigned_at ;;
  description: ""
}
dimension_group: jira_issue_last_assigned_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_last_assigned_at ;;
  description: ""
}
dimension_group: jira_issue_first_resolved_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_first_resolved_at ;;
  description: ""
}
dimension_group: jira_issue_status_category_changed_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_status_category_changed_at_ts ;;
  description: ""
}
dimension_group: jira_issue_resolved_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_resolved_at_ts ;;
  description: ""
}
dimension_group: jira_issue_last_viewed_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_last_viewed_at_ts ;;
  description: ""
}
dimension_group: jira_issue_due_date_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_due_date_at_ts ;;
  description: ""
}
dimension_group: jira_issue_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_created_at_ts ;;
  description: ""
}
dimension_group: jira_issue_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_updated_at_ts ;;
  description: ""
}
}
view: wh_delivery__jira_issues_field_history_fact {
sql_table_name: wh_delivery__jira_issues_field_history_fact ;;
set: wh_delivery__jira_issues_field_history_fact_set {
  fields: [jira_issue_field_history_is_active, jira_issue_field_history_story_point_estimate, jira_issue_field_history_status_description, jira_issue_field_history_status_name]
}
dimension: jira_issues_field_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issues_field_history_pk ;;
  description: ""
}
dimension: jira_field_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_field_fk ;;
  description: ""
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: ""
}
dimension: jira_issue_field_history_is_active {
  type: yesno
  sql: ${TABLE}.jira_issue_field_history_is_active ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
dimension: jira_issue_field_history_story_point_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_field_history_story_point_estimate ;;
  description: ""
}
dimension: jira_issue_field_history_status_description {
  type: string
  sql: ${TABLE}.jira_issue_field_history_status_description ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
dimension: jira_issue_field_history_status_name {
  type: string
  sql: ${TABLE}.jira_issue_field_history_status_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
dimension_group: jira_issue_field_history_timestamp {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_field_history_timestamp ;;
  description: ""
}
}
view: wh_delivery__jira_issues_xa {
sql_table_name: wh_delivery__jira_issues_xa ;;
set: wh_delivery__jira_issues_xa_set {
  fields: [jira_issue_duration, jira_issue_age_in_days, jira_issue_summary_story_point_estimate, jira_issue_development_stage]
}
dimension: jira_issue_summary_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_summary_pk ;;
  description: ""
}
dimension: jira_issue_duration {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_duration ;;
  description: ""
}
dimension: jira_issue_age_in_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_age_in_days ;;
  description: ""
}
dimension: jira_issue_summary_story_point_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_summary_story_point_estimate ;;
  description: ""
}
dimension: jira_issue_development_stage {
  type: string
  sql: ${TABLE}.jira_issue_development_stage ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
}
view: wh_delivery__jira_projects_dim {
sql_table_name: wh_delivery__jira_projects_dim ;;
set: wh_delivery__jira_projects_dim_set {
  fields: [
    jira_project_name,
    jira_project_description,
    jira_project_key,
    jira_project_project_type_key,
    jira_project_board_name,
    jira_project_board_type,
    jira_project_epics,
    jira_project_components,
    jira_project_count_closed_issues,
    jira_project_count_open_issues,
    jira_project_count_open_assigned_issues,
    jira_project_avg_close_time_days,
    jira_project_avg_assigned_close_time_days,
    jira_project_avg_age_currently_open_days,
    jira_project_avg_age_currently_open_assigned_days,
    jira_project_median_close_time_days,
    jira_project_median_age_currently_open_days,
    jira_project_median_assigned_close_time_days,
    jira_project_median_age_currently_open_assigned_days,
    jira_project_avg_close_time_seconds,
    jira_project_avg_assigned_close_time_seconds,
    jira_project_avg_age_currently_open_seconds,
    jira_project_avg_age_currently_open_assigned_seconds,
    jira_project_median_close_time_seconds,
    jira_project_median_age_currently_open_seconds,
    jira_project_median_assigned_close_time_seconds,
    jira_project_median_age_currently_open_assigned_seconds,
  ]
}
dimension: jira_project_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_project_pk ;;
  description: ""
}
dimension: jira_user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_user_fk ;;
  description: ""
}
dimension: jira_project_name {
  type: string
  sql: ${TABLE}.jira_project_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_description {
  type: string
  sql: ${TABLE}.jira_project_description ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_key {
  type: string
  sql: ${TABLE}.jira_project_key ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_project_type_key {
  type: string
  sql: ${TABLE}.jira_project_project_type_key ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_board_name {
  type: string
  sql: ${TABLE}.jira_project_board_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_board_type {
  type: string
  sql: ${TABLE}.jira_project_board_type ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_epics {
  type: string
  sql: ${TABLE}.jira_project_epics ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_components {
  type: string
  sql: ${TABLE}.jira_project_components ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
dimension: jira_project_count_closed_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_closed_issues ;;
  description: ""
}
dimension: jira_project_count_open_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: ""
}
dimension: jira_project_count_open_assigned_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: ""
}
dimension: jira_project_avg_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: ""
}
dimension: jira_project_avg_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: ""
}
dimension: jira_project_median_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: ""
}
dimension: jira_project_median_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: ""
}
dimension: jira_project_avg_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: ""
}
dimension: jira_project_avg_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: ""
}
dimension: jira_project_median_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: ""
}
dimension: jira_project_median_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: ""
}
}
view: wh_delivery__jira_projects_fact {
sql_table_name: wh_delivery__jira_projects_fact ;;
set: wh_delivery__jira_projects_fact_set {
  fields: [
    jira_project_name,
    jira_project_description,
    jira_project_key,
    jira_project_project_type_key,
    jira_project_board_name,
    jira_project_board_type,
    jira_project_epics,
    jira_project_components,
    jira_project_count_closed_issues,
    jira_project_count_open_issues,
    jira_project_count_open_assigned_issues,
    jira_project_avg_close_time_days,
    jira_project_avg_assigned_close_time_days,
    jira_project_avg_age_currently_open_days,
    jira_project_avg_age_currently_open_assigned_days,
    jira_project_median_close_time_days,
    jira_project_median_age_currently_open_days,
    jira_project_median_assigned_close_time_days,
    jira_project_median_age_currently_open_assigned_days,
    jira_project_avg_close_time_seconds,
    jira_project_avg_assigned_close_time_seconds,
    jira_project_avg_age_currently_open_seconds,
    jira_project_avg_age_currently_open_assigned_seconds,
    jira_project_median_close_time_seconds,
    jira_project_median_age_currently_open_seconds,
    jira_project_median_assigned_close_time_seconds,
    jira_project_median_age_currently_open_assigned_seconds,
  ]
}
dimension: jira_project_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_project_pk ;;
  description: ""
}
dimension: jira_user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_user_fk ;;
  description: ""
}
dimension: jira_project_name {
  type: string
  sql: ${TABLE}.jira_project_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_description {
  type: string
  sql: ${TABLE}.jira_project_description ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_key {
  type: string
  sql: ${TABLE}.jira_project_key ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_project_type_key {
  type: string
  sql: ${TABLE}.jira_project_project_type_key ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_board_name {
  type: string
  sql: ${TABLE}.jira_project_board_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_board_type {
  type: string
  sql: ${TABLE}.jira_project_board_type ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_epics {
  type: string
  sql: ${TABLE}.jira_project_epics ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_components {
  type: string
  sql: ${TABLE}.jira_project_components ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_count_closed_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_closed_issues ;;
  description: ""
}
dimension: jira_project_count_open_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: ""
}
dimension: jira_project_count_open_assigned_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: ""
}
dimension: jira_project_avg_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: ""
}
dimension: jira_project_avg_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: ""
}
dimension: jira_project_median_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: ""
}
dimension: jira_project_median_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: ""
}
dimension: jira_project_avg_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: ""
}
dimension: jira_project_avg_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: ""
}
dimension: jira_project_avg_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: ""
}
dimension: jira_project_median_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: ""
}
dimension: jira_project_median_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: ""
}
dimension: jira_project_median_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: ""
}
}
view: wh_delivery__jira_sprints_dim {
sql_table_name: wh_delivery__jira_sprints_dim ;;
set: wh_delivery__jira_sprints_dim_set {
  fields: [jira_sprint_name, jira_sprint_goal, jira_sprint_state]
}
dimension: jira_sprint_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_sprint_pk ;;
  description: "not available"
}
dimension: jira_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_project_fk ;;
  description: "not available"
}
dimension: jira_sprint_name {
  type: string
  sql: ${TABLE}.jira_sprint_name ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension: jira_sprint_goal {
  type: string
  sql: ${TABLE}.jira_sprint_goal ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension: jira_sprint_state {
  type: string
  sql: ${TABLE}.jira_sprint_state ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension_group: jira_start_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_start_at_date ;;
  description: "not available"
}
dimension_group: jira_complete_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_complete_at_date ;;
  description: "not available"
}
dimension_group: jira_end_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_end_at_date ;;
  description: "not available"
}
}
view: wh_delivery__jira_sprints_fact {
sql_table_name: wh_delivery__jira_sprints_fact ;;
set: wh_delivery__jira_sprints_fact_set {
  fields: [jira_sprint_name, jira_sprint_goal, jira_sprint_state]
}
dimension: jira_sprint_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_sprint_pk ;;
  description: ""
}
dimension: jira_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_project_fk ;;
  description: ""
}
dimension: jira_sprint_name {
  type: string
  sql: ${TABLE}.jira_sprint_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_sprints_fact_set*]
}
dimension: jira_sprint_goal {
  type: string
  sql: ${TABLE}.jira_sprint_goal ;;
  description: ""
  drill_fields: [wh_delivery__jira_sprints_fact_set*]
}
dimension: jira_sprint_state {
  type: string
  sql: ${TABLE}.jira_sprint_state ;;
  description: ""
  drill_fields: [wh_delivery__jira_sprints_fact_set*]
}
dimension_group: jira_start_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_start_at_date ;;
  description: ""
}
dimension_group: jira_complete_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_complete_at_date ;;
  description: ""
}
dimension_group: jira_end_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_end_at_date ;;
  description: ""
}
}
view: wh_delivery__jira_users_dim {
sql_table_name: wh_delivery__jira_users_dim ;;
set: wh_delivery__jira_users_dim_set {
  fields: [
    jira_user_username,
    jira_user_name,
    jira_user_email,
    jira_user_locale,
    jira_user_time_zone,
    jira_user_projects,
    jira_user_count_closed_issues,
    jira_user_count_open_issues,
    jira_user_avg_close_time_days,
    jira_user_avg_age_currently_open_days,
    jira_user_median_close_time_days,
    jira_user_median_age_currently_open_days,
    jira_user_avg_close_time_seconds,
    jira_user_avg_age_currently_open_seconds,
    jira_user_median_close_time_seconds,
    jira_user_median_age_currently_open_seconds,
  ]
}
dimension: jira_user_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_user_pk ;;
  description: ""
}
dimension: jira_user_username {
  type: string
  sql: ${TABLE}.jira_user_username ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_name {
  type: string
  sql: ${TABLE}.jira_user_name ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_email {
  type: string
  sql: ${TABLE}.jira_user_email ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_locale {
  type: string
  sql: ${TABLE}.jira_user_locale ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_time_zone {
  type: string
  sql: ${TABLE}.jira_user_time_zone ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_projects {
  type: string
  sql: ${TABLE}.jira_user_projects ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_count_closed_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_count_closed_issues ;;
  description: ""
}
dimension: jira_user_count_open_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_count_open_issues ;;
  description: ""
}
dimension: jira_user_avg_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_close_time_days ;;
  description: ""
}
dimension: jira_user_avg_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_age_currently_open_days ;;
  description: ""
}
dimension: jira_user_median_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_close_time_days ;;
  description: ""
}
dimension: jira_user_median_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_age_currently_open_days ;;
  description: ""
}
dimension: jira_user_avg_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_close_time_seconds ;;
  description: ""
}
dimension: jira_user_avg_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_age_currently_open_seconds ;;
  description: ""
}
dimension: jira_user_median_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_close_time_seconds ;;
  description: ""
}
dimension: jira_user_median_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_age_currently_open_seconds ;;
  description: ""
}
}

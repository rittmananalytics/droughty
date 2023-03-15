explore: wh_core__clients_bridge
{ hidden: yes }
explore: wh_core__people_bridge
{ hidden: yes }
explore: wh_core__sprints_bridge
{ hidden: yes }
explore: wh_delivery__harvest_clients_dim
{ hidden: yes }
explore: wh_delivery__harvest_employees_dim
{ hidden: yes }
explore: wh_delivery__harvest_expenses_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoice_line_items_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoices_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoices_xa
{ hidden: yes }
explore: wh_delivery__harvest_projects_fact
{ hidden: yes }
explore: wh_delivery__harvest_tasks_dim
{ hidden: yes }
explore: wh_delivery__harvest_time_sheets_fact
{ hidden: yes }
explore: wh_delivery__jira_daily_issue_field_history_fact
{ hidden: yes }
explore: wh_delivery__jira_epics_dim
{ hidden: yes }
explore: wh_delivery__jira_fields_dim
{ hidden: yes }
explore: wh_delivery__jira_issues_board_bridge
{ hidden: yes }
explore: wh_delivery__jira_issues_fact
{ hidden: yes }
explore: wh_delivery__jira_issues_field_history_fact
{ hidden: yes }
explore: wh_delivery__jira_issues_sprint_bridge
{ hidden: yes }
explore: wh_delivery__jira_issues_xa
{ hidden: yes }
explore: wh_delivery__jira_projects_fact
{ hidden: yes }
explore: wh_delivery__jira_sprints_dim
{ hidden: yes }
explore: wh_delivery__jira_users_dim
{ hidden: yes }
view: wh_core__clients_bridge {
sql_table_name: wh_core__clients_bridge ;;
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
}
view: wh_core__people_bridge {
sql_table_name: wh_core__people_bridge ;;
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
}
view: wh_core__sprints_bridge {
sql_table_name: wh_core__sprints_bridge ;;
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
  description: ""
}
dimension: harvest_client_currency {
  type: string
  sql: ${TABLE}.harvest_client_currency ;;
  description: "Harvest Client Currency is the currency that clients will be invoiced in when using the Harvest software. This currency can be set in the Client Settings menu in the Harvest dashboard."
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension: harvest_client_name {
  type: string
  sql: ${TABLE}.harvest_client_name ;;
  description: "The Harvest Client is an online time tracking, invoicing, and expense reporting software and mobile application."
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension: harvest_client_is_active {
  type: yesno
  sql: ${TABLE}.harvest_client_is_active ;;
  description: "Harvest Client is active is an online time tracking and invoicing tool used by many businesses and organizations. It is used to accurately track time and expenses related to any project, invoice customers, and generate detailed reports. It also integrates with popular services like Asana, Basecamp, and Slack. Harvest Client helps streamline processes, provide insights into project performance, and help make sure you get paid on time."
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension_group: harvest_client_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_created_at_ts ;;
  description: "Harvest Client Created At TS is a tool designed to help companies manage their time tracking data. It allows users to track employee time and work hours, see the amount of time each active employee has logged, and generate reports with the data."
}
dimension_group: harvest_client_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_updated_at_ts ;;
  description: "Harvest Client is a time tracking and project management application that helps users track time and generate invoices, while keeping everyone on the same page. It was last updated on August 12, 2020."
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
  description: ""
}
dimension: harvest_employee_first_name {
  type: string
  sql: ${TABLE}.harvest_employee_first_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_last_name {
  type: string
  sql: ${TABLE}.harvest_employee_last_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_full_name {
  type: string
  sql: ${TABLE}.harvest_employee_full_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_email {
  type: string
  sql: ${TABLE}.harvest_employee_email ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
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
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_is_active {
  type: yesno
  sql: ${TABLE}.harvest_employee_is_active ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
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
  description: ""
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: ""
}
dimension: harvest_invoice_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_invoice_fk ;;
  description: ""
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: ""
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: ""
}
dimension: harvest_expense_category_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_category_natural_key ;;
  description: ""
}
dimension: harvest_employee_assignment_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: ""
}
dimension: harvest_expense_notes {
  type: string
  sql: ${TABLE}.harvest_expense_notes ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_file_name {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_file_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_locked_reason {
  type: string
  sql: ${TABLE}.harvest_expense_locked_reason ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_content_type {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_content_type ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_url {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_url ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_total_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_total_cost ;;
  description: ""
}
dimension: harvest_expense_receipt_file_size {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_receipt_file_size ;;
  description: ""
}
dimension: harvest_expense_units {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_units ;;
  description: ""
}
dimension: harvest_expense_is_closed {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_closed ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_billable {
  type: yesno
  sql: ${TABLE}.harvest_expense_billable ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_is_billed {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_billed ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_is_locked {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_locked ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension_group: harvest_expense_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_created_at ;;
  description: ""
}
dimension_group: harvest_expense_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_updated_at ;;
  description: ""
}
dimension_group: harvest_expense_spent_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_spent_date ;;
  description: ""
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
  description: ""
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: ""
}
dimension: harvest_invoice_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_invoice_fk ;;
  description: ""
}
dimension: harvest_invoice_line_item_kind {
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_kind ;;
  description: "A harvest invoice line item kind is a type of item added to a goods and services invoice created in the Harvest invoicing software. Such item types can include project, description of the goods or services, type of the taxes, hours worked, quantity of items, unit rate, and the total amount to be charged."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
dimension: harvest_invoice_line_item_description {
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_description ;;
  description: "A harvest invoice line item description is a brief explanation of each item included on an invoice. It typically includes pertinent information such as the item price, quantity, and total cost."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
dimension: harvest_invoice_line_item_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_amount ;;
  description: "A harvest invoice line item amount is the total monetary amount of an individual line item on an invoice. This amount can include subtotals, sales tax, and shipping charges."
}
dimension: harvest_invoice_line_item_unit_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_unit_price ;;
  description: "A harvest invoice line item unit price is the price of an individual item on a harvest invoice. It is calculated by dividing the total price of the invoice line item by the quantity purchased."
}
dimension: harvest_invoice_line_item_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_quantity ;;
  description: "A harvest invoice line item quantity is the number of items included in a single line item on an invoice from a business. It might refer to the exact number of units of product that a customer purchased, or to the number of hours of service provided by a business."
}
dimension: harvest_invoice_line_item_services_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_services_amount_billed ;;
  description: "The amount billed for harvest invoice line item services depends on the particular services included in the invoice. Generally, harvest invoices will include a full breakdown of the services provided along with the amount billed for each service."
}
dimension: harvest_invoice_line_item_license_referral_fee_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_license_referral_fee_amount_billed ;;
  description: "A harvest invoice line item license referral fee amount billed is the total fee charged for a referral made when the customer purchases a license for a product or service. The amount charged for the referral fee is based on the terms of the agreement between the referring individual or entity and the organization providing the license."
}
dimension: harvest_invoice_line_item_expenses_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_expenses_amount_billed ;;
  description: "A harvest invoice line item expense amount billed is the total amount that is charged to the customer for the item listed on the invoice. This amount includes any applicable taxes and other fees."
}
dimension: harvest_invoice_line_item_support_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_support_amount_billed ;;
  description: ""
}
dimension: harvest_invoice_line_item_is_taxed {
  type: yesno
  sql: ${TABLE}.harvest_invoice_line_item_is_taxed ;;
  description: ""
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
  description: ""
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: ""
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: ""
}
dimension: harvest_invoice_client_key {
  type: string
  sql: ${TABLE}.harvest_invoice_client_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_number {
  type: string
  sql: ${TABLE}.harvest_invoice_number ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_purchase_order {
  type: string
  sql: ${TABLE}.harvest_invoice_purchase_order ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_state {
  type: string
  sql: ${TABLE}.harvest_invoice_state ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_notes {
  type: string
  sql: ${TABLE}.harvest_invoice_notes ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_subject {
  type: string
  sql: ${TABLE}.harvest_invoice_subject ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_currency {
  type: string
  sql: ${TABLE}.harvest_invoice_currency ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_payment_term {
  type: string
  sql: ${TABLE}.harvest_invoice_payment_term ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_amount ;;
  description: ""
}
dimension: harvest_invoice_due_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_due_amount ;;
  description: ""
}
dimension: harvest_invoice_discount_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_discount_amount ;;
  description: ""
}
dimension: harvest_invoice_discount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_discount ;;
  description: ""
}
dimension: harvest_invoice_tax_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_tax_amount ;;
  description: ""
}
dimension: harvest_invoice_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_tax ;;
  description: ""
}
dimension_group: harvest_invoice_period_start {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_period_start ;;
  description: ""
}
dimension_group: harvest_invoice_period_end {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_period_end ;;
  description: ""
}
dimension_group: harvest_invoice_paid_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_paid_date ;;
  description: ""
}
dimension_group: harvest_invoice_issue_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_issue_date ;;
  description: ""
}
dimension_group: harvest_invoice_due_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_due_date ;;
  description: ""
}
dimension_group: harvest_invoice_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_created_at ;;
  description: ""
}
dimension_group: harvest_invoice_sent_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_sent_at ;;
  description: ""
}
dimension_group: harvest_invoice_paid_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_paid_at ;;
  description: ""
}
dimension_group: harvest_invoice_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_updated_at ;;
  description: ""
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
  description: ""
}
dimension: harvest_invoice_net_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_net_amount ;;
  description: ""
}
dimension: harvest_invoice_revenue_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_revenue_amount_billed ;;
  description: ""
}
dimension: harvest_client_invoice_sequence_nunber {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_client_invoice_sequence_nunber ;;
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
  description: "Harvest project names can vary depending on the type of project, but some examples include Harvest Solutions, Croptime, HarvestFarms, AgroHarvest, and FieldLogic."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_code {
  type: string
  sql: ${TABLE}.harvest_project_code ;;
  description: "Harvest Project Code is a website that provides open-source software development tools specifically designed to increase the efficiency, speed, and accuracy of projects. The code is designed to help software developers work together more effectively and quickly in a collaborative, distributed manner. The tools are primarily focused on task management, bug tracking, and source control, although other features also exist."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_notes {
  type: string
  sql: ${TABLE}.harvest_project_notes ;;
  description: "Harvest Project Notes is a mobile web platform that serves as a knowledge tool and central hub for education, evaluation and program planning for community organizations and non-profit agencies. It provides a secure environment for collaboration and central access to a shared set of resources and tools for agency staff to better manage their data. It offers an array of applications including assessment and tracking, monetary and technical resources, workflow automation, reporting and analytics, and more."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_bill_by {
  type: string
  sql: ${TABLE}.harvest_project_bill_by ;;
  description: "The Harvest Project bill is supported and funded by the United States Department of Agriculture's Farm Service Agency and the Natural Resources Conservation Service."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_budget_by {
  type: string
  sql: ${TABLE}.harvest_project_budget_by ;;
  description: "The budget for a harvest project will vary depending on factors such as the size and scope of the project, any equipment that needs to be purchased or rented, and the amount of labor required. Generally speaking, a harvest project budget should include a balance of funds for labor, materials, overhead costs, and contingency funds."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: "The hourly rate for the Harvest project varies depending on the type of work being done and a number of factors, including the location of the project and the skills of the worker. If you are interested in working on a Harvest project, you should contact the project manager to find out their exact rate."
}
dimension: harvest_project_cost_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: "The cost of a harvest project will depend on the complexity of the project and other factors, such as the number of people involved, the materials and equipment needed, and the duration of the project. Thus, there is no standard budget for a harvest project. Instead, each project should be evaluated individually in order to determine what a reasonable budget should be."
}
dimension: harvest_project_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_fee ;;
  description: "Harvest project fees are the fees that a farmer pays for the services of a harvester hired to collect their crop at harvest time. The fee can include the cost of labor, supplies, and equipment used to harvest the crop. There may also be additional fees for personnel, vehicles, and storage containers required for certain crops."
}
dimension: harvest_project_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_budget ;;
  description: "The budget of a harvest project will depend on the scope of the project, the services and equipment needed, the length of the project and any other applicable factors. It is best to work with a qualified project manager to determine the exact cost for a specific project."
}
dimension: harvest_project_over_budget_notification_percentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: "There is no standard percentage for Harvest Project over budget notifications. Each project manager must determine the percentage that they believe is appropriate for their specific project."
}
dimension: harvest_project_show_budget_to_all {
  type: yesno
  sql: ${TABLE}.harvest_project_show_budget_to_all ;;
  description: "The Harvest Project show budget will depend on the type of show, location, production elements, and other factors. The best way to get an estimate is to contact the Harvest Project and discuss your needs with their staff."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_cost_budget_include_expenses {
  type: yesno
  sql: ${TABLE}.harvest_project_cost_budget_include_expenses ;;
  description: "The cost of a harvest project will vary greatly depending on the type of harvest, the size and scope of the project, and other factors. A basic harvesting project cost budget will typically include materials and supplies, equipment rental or purchasing, labor costs, transport and accommodation, consultant fees, and other related expenses. Other costs may include permits, marketing, and any contingencies."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_budget_is_monthly {
  type: yesno
  sql: ${TABLE}.harvest_project_budget_is_monthly ;;
  description: "The budget for Harvest projects can vary greatly depending on what is involved. Some projects may require minimal costs, such as purchasing seed and equipment, while others could require more significant investments, such as hiring people to help with the project and buying land. It is best to determine your budget before getting started so that you can plan accordingly."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_notify_when_over_budget {
  type: yesno
  sql: ${TABLE}.harvest_project_notify_when_over_budget ;;
  description: "Harvest Project Notify is a feature of the Harvest Project Management tool that sends notifications when projects exceed their budgets. It helps project managers to monitor the progress of their projects and be informed if they are going over budget. The notifications will include information about the current project cost versus its budgeted cost, and will alert managers to potential financial issues with their projects."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_billable {
  type: yesno
  sql: ${TABLE}.harvest_project_is_billable ;;
  description: "No, the Harvest Project is not billable. The Harvest Project is a research effort initiated by the National Center for Aerospace and Transportation Technologies (NCATT) to identify and collect data on the economic and environmental benefits of sustainable aviation biofuel production and use. It is funded by the Federal Aviation Administration (FAA) and a coalition of industry partners. The project includes research activities such as socio-economic impact analysis and policy development, as well as educational outreach."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_fixed_fee {
  type: yesno
  sql: ${TABLE}.harvest_project_is_fixed_fee ;;
  description: "Harvest project fixed-fee is a per-project basis that is structured upfront. This fee is used to provide customers with an agreed-upon project timeline, budget, deliverables, and resources. This allows clients to know before a project starts that they are paying a fixed fee and that there will be no surprises or hidden costs. The fixed-fee option also allows customers to rest assured that their project is completed on time and on budget."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_active {
  type: yesno
  sql: ${TABLE}.harvest_project_is_active ;;
  description: "Yes, the Harvest Project is currently active and operating in several locations in the United States. The Harvest Project works to provide immediate, tangible resources to families facing crisis, and works to build trust, referrals and connections to lead to pathways to end poverty and to increase self-sufficiency."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension_group: harvest_project_over_budget_notification_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_over_budget_notification_date ;;
  description: "The exact date for a harvest project over budget notification depends on the particular project and its budget guidelines. In most cases, over budget notifications are issued as soon as it is identified that the project is unable to meet its budget."
}
dimension_group: harvest_project_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_created_at ;;
  description: "Harvest Project was created at the University of Calgary in Canada."
}
dimension_group: harvest_project_ends_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_ends_on ;;
  description: "The Harvest Project typically ends on the last day of October, or Halloween."
}
dimension_group: harvest_project_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_updated_at ;;
  description: "The latest version of Harvest Project was updated on June 10, 2020."
}
dimension_group: harvest_project_starts_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_starts_on ;;
  description: "The Harvest Project typically starts in late summer and continues until the end of fall or early winter. However, the exact starting date for the project is determined by the region's growing season and can vary from year to year."
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
  description: ""
}
dimension: harvest_task_name {
  type: string
  sql: ${TABLE}.harvest_task_name ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
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
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_is_default {
  type: yesno
  sql: ${TABLE}.harvest_task_is_default ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_is_active {
  type: yesno
  sql: ${TABLE}.harvest_task_is_active ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
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
  description: "A harvest invoice natural key is a unique identifier associated with a particular harvest invoice. It typically consists of a combination of the supplier’s name, the invoice number, and the invoice date. This unique combination of information can be used to quickly and easily match a particular harvest invoice to its corresponding records in other systems."
}
dimension: harvest_client_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_client_natural_key ;;
  description: "The harvest client natural key is the unique identifier used by Harvest to identify each client. It typically starts with a \"c\" followed by some numbers, such as c452985."
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
  description: ""
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: ""
}
dimension: jira_daily_issue_field_history_status {
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_status ;;
  description: ""
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
dimension: jira_daily_issue_field_history_sprint {
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_sprint ;;
  description: ""
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
dimension_group: jira_daily_issue_field_history_date_day {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_daily_issue_field_history_date_day ;;
  description: ""
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
  description: "In Jira, an Epic is a large body of work that is broken down into a number of smaller stories, or sometimes called \"Issues\" in Jira. It is often a narrative or large user story that captures the intent of the work to be carried out. Epic names, however, rely mainly on the discretion of the user."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_summary {
  type: string
  sql: ${TABLE}.jira_epic_summary ;;
  description: "A Jira Epic Summary is a summary associated with each Epic in the project. It allows users to quickly review the scope and purpose of the Epic and its linked issues. The Epic Summary is found on the Epic's details page, and includes the Epic Name, Summary, Status, Priority, and team associated with the Epic."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_is_done {
  type: yesno
  sql: ${TABLE}.jira_epic_is_done ;;
  description: "A Jira epic is done when all of the tasks and stories within the epic have been completed and all of the acceptance criteria have been met. The project team can then review the completed epic and sign off on it."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_key {
  type: string
  sql: ${TABLE}.jira_epic_key ;;
  description: "An Epic key is a unique identifier used in Jira to represent an Epic. It has a format of ‘EPIC-key#’, where key# is usually given by the user or else automatically generated."
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
  description: "The Jira field name is a way of labeling the various custom fields that can be created and utilized in Jira, such as Priority, Assignee, Reporter, and more."
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
dimension: jira_field_is_array {
  type: yesno
  sql: ${TABLE}.jira_field_is_array ;;
  description: "A Jira field is an array of information stored on an issue within a Jira project. It can contain information about a certain part of the project such as project details, systems, tasks, subtasks, custom fields, and more. Each array contains key-value pairs that are stored on an issue depending on the type of data it stores."
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
dimension: jira_field_is_custom {
  type: yesno
  sql: ${TABLE}.jira_field_is_custom ;;
  description: "Jira Field is Custom refers to the ability to make custom fields in Jira software. This feature gives admins control over the types of data they track in their project, allowing them to create additional fields of information that meet their project needs. Custom fields can be used to store a wide range of data and help make your Jira workflow even more efficient."
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
}
view: wh_delivery__jira_issues_board_bridge {
sql_table_name: wh_delivery__jira_issues_board_bridge ;;
set: wh_delivery__jira_fields_dim_set {
  fields: [jira_field_name, jira_field_is_array, jira_field_is_custom]
}
dimension: jira_issue_board_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_board_bridge_pk ;;
  description: ""
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: ""
}
dimension: jira_board_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_board_fk ;;
  description: ""
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
  description: "A JIRA issue natural key is a unique identifier assigned to each issue created in JIRA. It is a concatenation of the project key and the issue number. It takes the format <PROJECT_KEY>-<ISSUE_NUMBER>. For example, ‘ABC-123’ might be the JIRA issue natural key for an issue in a project with the key ‘ABC’."
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
  description: "Yes, the Jira Issue Field History is active. The Issue Field History provides information about changes made to the specific field in an issue. It shows when, who and what value the field had at that point in time."
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
dimension: jira_issue_field_history_story_point_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_field_history_story_point_estimate ;;
  description: "Jira issue field history story point estimate is a field that stores the estimated story points of a given issue at different points throughout its lifetime. It allows teams to view and understand why and how the estimates of an issue have changed over time."
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
  description: "A Jira Issue Field History Timestamp is a timestamp that records the last time the value of a field was changed in a JIRA issue. It is used to track the latest changes made to any field value within the JIRA issue."
}
}
view: wh_delivery__jira_issues_sprint_bridge {
sql_table_name: wh_delivery__jira_issues_sprint_bridge ;;
set: wh_delivery__jira_issues_field_history_fact_set {
  fields: [jira_issue_field_history_is_active, jira_issue_field_history_story_point_estimate, jira_issue_field_history_status_description, jira_issue_field_history_status_name]
}
dimension: jira_issue_sprint_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_sprint_bridge_pk ;;
  description: ""
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: ""
}
dimension: jira_sprint_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_sprint_fk ;;
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
  description: ""
  drill_fields: [wh_delivery__jira_issues_xa_set*]
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
  description: "A Jira project name is the name used to identify a specific project that is being managed through Jira. The project name typically reflects the project's purpose and or what is being worked on."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_description {
  type: string
  sql: ${TABLE}.jira_project_description ;;
  description: "Jira is a project management and collaboration tool that helps teams manage and prioritize their work. It allows teams to create projects, assign tasks, track progress, and collaborate on and prioritize issues. Jira is widely used by organizations in a variety of industries, ranging from software development to IT operations, marketing, and more."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_key {
  type: string
  sql: ${TABLE}.jira_project_key ;;
  description: "A Jira project key is a unique identifier for your Jira project. It is formed from the two or three letters that appear at the beginning of the issue key for all issues created within a single Jira project. For example, if you created an issue in a project called \"Project X\", its issue key might begin with \"PX-12345\". In this case, \"PX\" would be the project key."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_project_type_key {
  type: string
  sql: ${TABLE}.jira_project_project_type_key ;;
  description: "The Jira Project Type Key is a unique identifier associated with a specific project type. It can be used to make queries to extract project-type-specific attributes and to quickly identify project types in a variety of contexts."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_epics {
  type: string
  sql: ${TABLE}.jira_project_epics ;;
  description: "Jira Project Epics are features, stories or tasks that belong to a single project and can span multiple teams, departments, or business units. Epics can also be used to help break down a project into a set of manageable tasks. This allows project managers to better plan and execute a project, by visualizing and tracking the progress of their tasks."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_components {
  type: string
  sql: ${TABLE}.jira_project_components ;;
  description: "Jira Project Components are the various parts that make up a Jira Project. Common components include Issue Types, Issue Statuses, Schemes, Reports, Dashboards, JQL Filters, and an Issue Collector. Components are customizable and can be used to allow teams to track the progress of a project and help manage workflow."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_count_closed_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_closed_issues ;;
  description: "The exact number of closed issues for a given Jira project depends on the specific project and all of the issues that have been previously submitted and closed. However, you can view the number of closed issues in a Jira project at any time by navigating to the project's Summary page. On the left side of the page, you will see an Overview tab with a Closure Count subsection. This should show the current number of closed issues in the project."
}
dimension: jira_project_count_open_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: "It is not possible to give an exact number, as this will depend on the individual Jira projects and the types of open issues associated with them. The best way to determine the number of open issues for a Jira project is to access the project from the Jira dashboard and use the issue search function to view all current open issues."
}
dimension: jira_project_count_open_assigned_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: "Jira doesn't provide a single metric that displays the count of open assigned issues. Depending on what you are trying to achieve, you can use different Jira queries or tools to display the number of open assigned issues."
}
dimension: jira_project_avg_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: "The average Jira project close time depends on the complexity of the project, the resources available, and other factors. Generally, it can take anywhere from one to several weeks or even longer depending on the type of project."
}
dimension: jira_project_avg_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: "Jira does not have an exact answer to this question since the amount of time it takes to close a project can vary drastically based on the complexity of the assigned tasks, the number of people assigned to the project, and the number of contingencies. Generally speaking, complex projects may take weeks or months to complete, while simpler projects may take just a few days."
}
dimension: jira_project_avg_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: "Unfortunately, this is not a statistic that can be easily answered as there are many different factors that contribute to the average age of open projects in Jira. Factors such as complexity, priority level, resources, and size of the project can all affect the number of days that a project remains open."
}
dimension: jira_project_avg_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: "Unfortunately, there is no definitive answer to this question, as it will depend largely on the organization and the specific Jira project in question. However, it is likely to vary greatly between different organizations and Jira projects, so it is best to ask your specific organization or Jira project administrator for more details on their particular project's average age of open assigned tasks."
}
dimension: jira_project_median_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: "The median close time for Jira projects is not a single set number as it fluctuates based on the project and its requirements. However, a general rule of thumb is that most Jira projects should be able to close within 4-8 days."
}
dimension: jira_project_median_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: "Jira does not calculate or report the median age for open projects. Instead, Jira allows administrators to manually set a desired project age in the project configuration settings. Alternatively, administrators can use Jira's report builder feature to view and analyze projects and other Jira objects, including the age of open projects."
}
dimension: jira_project_median_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: "There is no definitive answer to this question, as the median assigned close time for a Jira project can vary significantly depending on factors such as the size and complexity of the project, the product or services involved, and other variables."
}
dimension: jira_project_median_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: "There is no one single answer to this question, as the median age of Jira projects can vary depending on the scope of the project, the workflow, and the number of people assigned to the project. However, the average age for Jira projects currently open is about 34 days."
}
dimension: jira_project_avg_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: "Jira does not have a specific time metric associated with project close time, as it depends on the complexity of the project and the individual workflow setup."
}
dimension: jira_project_avg_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: "Jira does not provide an average assigned-close time in seconds. However, it does track the average close time for all issues set to a specific status. Jira users can view this average close time by navigating to the Projects link in the sidebar menu and selecting the Reports tab."
}
dimension: jira_project_avg_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: "There is no definitive answer to this question as the average age of open JIRA projects will depend on a variety of factors. This includes the complexity of the project, the amount of resources available, and the types of tasks associated with the project."
}
dimension: jira_project_avg_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no single answer to this question, as the age of a Jira project depends on many factors. Depending on the size of the project, the complexity of the tasks and workflows, as well as the number of people involved and how quickly tasks are completed, the average open assigned time of a Jira project can vary greatly."
}
dimension: jira_project_median_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: "There is no single answer to this question, as it varies depending on numerous factors including the specific project, requirements, and goals. Furthermore, Jira does not calculate a median close time as it is not a metric that it collects. A best practice is to use Jira's filter and reporting functions to analyze the individual issue close times and then create your own median metric."
}
dimension: jira_project_median_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: "The median age of Jira projects currently open cannot be determined as this information is not tracked or stored by Jira. However, you may be able to approximate it by looking through your open projects and measuring the time that has elapsed since they were opened."
}
dimension: jira_project_median_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: "Jira project median assigned close time cannot be specified in seconds, as the close time varies depending on the complexity and size of each project."
}
dimension: jira_project_median_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no definitive answer to this question as the median age of Jira projects open and assigned can vary greatly depending on the individual project and its associated tasks and durations."
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
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension: jira_sprint_goal {
  type: string
  sql: ${TABLE}.jira_sprint_goal ;;
  description: ""
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension: jira_sprint_state {
  type: string
  sql: ${TABLE}.jira_sprint_state ;;
  description: ""
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
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

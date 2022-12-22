include: "/lookml/base/_base.layer.lkml"
view: +wh_core__clients_bridge {
measure: count_of_client_pk {
  type: count_distinct
  sql: ${TABLE}.client_pk ;;
  description: ""
  drill_fields: [wh_core__clients_bridge_set*]
}
measure: sum_of_nk {
  type: sum_distinct
  sql: ${TABLE}.nk ;;
  description: ""
  drill_fields: [wh_core__clients_bridge_set*]
}
}
view: +wh_core__people_bridge {
measure: count_of_person_pk {
  type: count_distinct
  sql: ${TABLE}.person_pk ;;
  description: ""
  drill_fields: [wh_core__people_bridge_set*]
}
measure: sum_of_nk {
  type: sum_distinct
  sql: ${TABLE}.nk ;;
  description: ""
  drill_fields: [wh_core__people_bridge_set*]
}
}
view: +wh_core__sprints_bridge {
measure: count_of_sprint_pk {
  type: count_distinct
  sql: ${TABLE}.sprint_pk ;;
  description: ""
  drill_fields: [wh_core__sprints_bridge_set*]
}
measure: sum_of_nk {
  type: sum_distinct
  sql: ${TABLE}.nk ;;
  description: ""
  drill_fields: [wh_core__sprints_bridge_set*]
}
}
view: +wh_delivery__harvest_clients_dim {
measure: count_of_harvest_client_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_client_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
}
view: +wh_delivery__harvest_clients_fact {
measure: count_of_harvest_client_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_client_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_clients_fact_set*]
}
}
view: +wh_delivery__harvest_employees_dim {
measure: count_of_harvest_employee_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_employee_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_weekly_capacity {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_weekly_capacity ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_cost_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_cost_rate ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_default_hourly_rate ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
}
view: +wh_delivery__harvest_employees_fact {
measure: count_of_harvest_employee_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_employee_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
measure: sum_of_harvest_employee_weekly_capacity {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_weekly_capacity ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
measure: sum_of_harvest_employee_cost_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_cost_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
measure: sum_of_harvest_employee_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_default_hourly_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_fact_set*]
}
}
view: +wh_delivery__harvest_expenses_fact {
measure: count_of_harvest_expense_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_expense_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_category_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_category_natural_key ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_employee_assignment_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_total_cost {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_total_cost ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_receipt_file_size {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_receipt_file_size ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_units {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_units ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
}
view: +wh_delivery__harvest_invoice_line_items_fact {
measure: count_of_harvest_invoice_line_item_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_line_item_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_amount ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_unit_price {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_unit_price ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_quantity {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_quantity ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_services_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_services_amount_billed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_license_referral_fee_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_license_referral_fee_amount_billed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_expenses_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_expenses_amount_billed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_support_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_support_amount_billed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
}
view: +wh_delivery__harvest_invoices_fact {
measure: count_of_harvest_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_amount ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_due_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_due_amount ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_discount_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_discount_amount ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_discount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_discount ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_tax_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_tax_amount ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_tax {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_tax ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
}
view: +wh_delivery__harvest_invoices_xa {
measure: count_of_harvest_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_invoice_net_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_net_amount ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_invoice_revenue_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_revenue_amount_billed ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_client_invoice_sequence_nunber {
  type: sum_distinct
  sql: ${TABLE}.harvest_client_invoice_sequence_nunber ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
}
view: +wh_delivery__harvest_projects_dim {
measure: count_of_harvest_project_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_project_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
measure: sum_of_harvest_project_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
measure: sum_of_harvest_project_cost_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
measure: sum_of_harvest_project_fee {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_fee ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
measure: sum_of_harvest_project_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_budget ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
measure: sum_of_harvest_project_over_budget_notification_percentage {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_dim_set*]
}
}
view: +wh_delivery__harvest_projects_fact {
measure: count_of_harvest_project_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_project_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_cost_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_fee {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_fee ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_budget ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_over_budget_notification_percentage {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
}
view: +wh_delivery__harvest_tasks_dim {
measure: count_of_harvest_task_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_task_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
measure: sum_of_harvest_task_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_task_default_hourly_rate ;;
  description: "not available"
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
}
view: +wh_delivery__harvest_tasks_fact {
measure: count_of_harvest_task_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_task_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_fact_set*]
}
measure: sum_of_harvest_task_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_task_default_hourly_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_fact_set*]
}
}
view: +wh_delivery__harvest_time_sheets_fact {
measure: count_of_harvest_timesheet_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_timesheet_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_employee_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_task_assignment_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_task_assignment_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_employee_assignment_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_invoice_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_client_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_client_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_billable_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_billable_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_cost_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_cost_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_hours {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_hours ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_hours_budgeted {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_hours_budgeted ;;
  description: ""
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
}
view: +wh_delivery__jira_daily_issue_field_history_fact {
measure: count_of_jira_daily_issue_field_history_pk {
  type: count_distinct
  sql: ${TABLE}.jira_daily_issue_field_history_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
}
view: +wh_delivery__jira_epics_dim {
measure: count_of_jira_epic_pk {
  type: count_distinct
  sql: ${TABLE}.jira_epic_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
}
view: +wh_delivery__jira_fields_dim {
measure: count_of_jira_field_pk {
  type: count_distinct
  sql: ${TABLE}.jira_field_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
}
view: +wh_delivery__jira_issues_fact {
measure: count_of_jira_issue_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_natural_key {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_work_ratio {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_work_ratio ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_count_sprint_changes {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_count_sprint_changes ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_time_spent_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_time_spent_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_count_comments {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_count_comments ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_open_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_open_duration_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_any_assignment_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_any_assignment_duration_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_last_assignment_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_last_assignment_duration_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_story_point_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_story_point_estimate ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_original_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_original_estimate ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_remaining_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_remaining_estimate ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
}
view: +wh_delivery__jira_issues_field_history_fact {
measure: count_of_jira_issues_field_history_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issues_field_history_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
measure: sum_of_jira_issue_field_history_story_point_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_field_history_story_point_estimate ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
}
view: +wh_delivery__jira_issues_xa {
measure: count_of_jira_issue_summary_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_summary_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
measure: sum_of_jira_issue_duration {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_duration ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
measure: sum_of_jira_issue_age_in_days {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_age_in_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
measure: sum_of_jira_issue_summary_story_point_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_summary_story_point_estimate ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
}
view: +wh_delivery__jira_projects_dim {
measure: count_of_jira_project_pk {
  type: count_distinct
  sql: ${TABLE}.jira_project_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_count_closed_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_closed_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_count_open_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_count_open_assigned_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_dim_set*]
}
}
view: +wh_delivery__jira_projects_fact {
measure: count_of_jira_project_pk {
  type: count_distinct
  sql: ${TABLE}.jira_project_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_closed_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_closed_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_open_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_open_assigned_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
}
view: +wh_delivery__jira_sprints_dim {
measure: count_of_jira_sprint_pk {
  type: count_distinct
  sql: ${TABLE}.jira_sprint_pk ;;
  description: "not available"
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
}
view: +wh_delivery__jira_sprints_fact {
measure: count_of_jira_sprint_pk {
  type: count_distinct
  sql: ${TABLE}.jira_sprint_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_sprints_fact_set*]
}
}
view: +wh_delivery__jira_users_dim {
measure: count_of_jira_user_pk {
  type: count_distinct
  sql: ${TABLE}.jira_user_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_count_closed_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_user_count_closed_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_count_open_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_user_count_open_issues ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_age_currently_open_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_close_time_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_age_currently_open_days ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_age_currently_open_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_close_time_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_age_currently_open_seconds ;;
  description: ""
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
}

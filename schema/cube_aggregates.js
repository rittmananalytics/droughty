cube (`wh_core__clients_bridge_extended`, {
sql: `select * from lewis_analytics_dev.wh_core__clients_bridge`,
extends: wh_core__clients_bridge,
measures: {
count_of_client_pk:  {
  sql: `client_pk`,
  type: `count`,
} ,
}});
cube (`wh_core__people_bridge_extended`, {
sql: `select * from lewis_analytics_dev.wh_core__people_bridge`,
extends: wh_core__people_bridge,
measures: {
count_of_person_pk:  {
  sql: `person_pk`,
  type: `count`,
} ,
}});
cube (`wh_core__sprints_bridge_extended`, {
sql: `select * from lewis_analytics_dev.wh_core__sprints_bridge`,
extends: wh_core__sprints_bridge,
measures: {
count_of_sprint_pk:  {
  sql: `sprint_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__harvest_clients_dim_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_clients_dim`,
extends: wh_delivery__harvest_clients_dim,
measures: {
count_of_harvest_client_pk:  {
  sql: `harvest_client_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__harvest_employees_dim_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_employees_dim`,
extends: wh_delivery__harvest_employees_dim,
measures: {
count_of_harvest_employee_pk:  {
  sql: `harvest_employee_pk`,
  type: `count`,
} ,
sum_of_harvest_employee_weekly_capacity:  {
  sql: `harvest_employee_weekly_capacity`,
  type: `sum`,
} ,
sum_of_harvest_employee_cost_rate:  {
  sql: `harvest_employee_cost_rate`,
  type: `sum`,
} ,
sum_of_harvest_employee_default_hourly_rate:  {
  sql: `harvest_employee_default_hourly_rate`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__harvest_expenses_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_expenses_fact`,
extends: wh_delivery__harvest_expenses_fact,
measures: {
count_of_harvest_expense_pk:  {
  sql: `harvest_expense_pk`,
  type: `count`,
} ,
sum_of_harvest_expense_category_natural_key:  {
  sql: `harvest_expense_category_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_employee_assignment_natural_key:  {
  sql: `harvest_employee_assignment_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_expense_total_cost:  {
  sql: `harvest_expense_total_cost`,
  type: `sum`,
} ,
sum_of_harvest_expense_receipt_file_size:  {
  sql: `harvest_expense_receipt_file_size`,
  type: `sum`,
} ,
sum_of_harvest_expense_units:  {
  sql: `harvest_expense_units`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__harvest_invoice_line_items_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_invoice_line_items_fact`,
extends: wh_delivery__harvest_invoice_line_items_fact,
measures: {
count_of_harvest_invoice_line_item_pk:  {
  sql: `harvest_invoice_line_item_pk`,
  type: `count`,
} ,
sum_of_harvest_invoice_line_item_amount:  {
  sql: `harvest_invoice_line_item_amount`,
  type: `sum`,
} ,
sum_of_harvest_invoice_line_item_unit_price:  {
  sql: `harvest_invoice_line_item_unit_price`,
  type: `sum`,
} ,
sum_of_harvest_invoice_line_item_quantity:  {
  sql: `harvest_invoice_line_item_quantity`,
  type: `sum`,
} ,
sum_of_harvest_invoice_line_item_services_amount_billed:  {
  sql: `harvest_invoice_line_item_services_amount_billed`,
  type: `sum`,
} ,
sum_of_harvest_invoice_line_item_license_referral_fee_amount_billed:  {
  sql: `harvest_invoice_line_item_license_referral_fee_amount_billed`,
  type: `sum`,
} ,
sum_of_harvest_invoice_line_item_expenses_amount_billed:  {
  sql: `harvest_invoice_line_item_expenses_amount_billed`,
  type: `sum`,
} ,
sum_of_harvest_invoice_line_item_support_amount_billed:  {
  sql: `harvest_invoice_line_item_support_amount_billed`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__harvest_invoices_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_invoices_fact`,
extends: wh_delivery__harvest_invoices_fact,
measures: {
count_of_harvest_invoice_pk:  {
  sql: `harvest_invoice_pk`,
  type: `count`,
} ,
sum_of_harvest_invoice_amount:  {
  sql: `harvest_invoice_amount`,
  type: `sum`,
} ,
sum_of_harvest_invoice_due_amount:  {
  sql: `harvest_invoice_due_amount`,
  type: `sum`,
} ,
sum_of_harvest_invoice_discount_amount:  {
  sql: `harvest_invoice_discount_amount`,
  type: `sum`,
} ,
sum_of_harvest_invoice_discount:  {
  sql: `harvest_invoice_discount`,
  type: `sum`,
} ,
sum_of_harvest_invoice_tax_amount:  {
  sql: `harvest_invoice_tax_amount`,
  type: `sum`,
} ,
sum_of_harvest_invoice_tax:  {
  sql: `harvest_invoice_tax`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__harvest_invoices_xa_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_invoices_xa`,
extends: wh_delivery__harvest_invoices_xa,
measures: {
count_of_harvest_invoice_pk:  {
  sql: `harvest_invoice_pk`,
  type: `count`,
} ,
sum_of_harvest_invoice_revenue_amount_billed:  {
  sql: `harvest_invoice_revenue_amount_billed`,
  type: `sum`,
} ,
sum_of_harvest_client_invoice_sequence_nunber:  {
  sql: `harvest_client_invoice_sequence_nunber`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__harvest_projects_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_projects_fact`,
extends: wh_delivery__harvest_projects_fact,
measures: {
count_of_harvest_project_pk:  {
  sql: `harvest_project_pk`,
  type: `count`,
} ,
sum_of_harvest_project_hourly_rate:  {
  sql: `harvest_project_hourly_rate`,
  type: `sum`,
} ,
sum_of_harvest_project_cost_budget:  {
  sql: `harvest_project_cost_budget`,
  type: `sum`,
} ,
sum_of_harvest_project_fee:  {
  sql: `harvest_project_fee`,
  type: `sum`,
} ,
sum_of_harvest_project_budget:  {
  sql: `harvest_project_budget`,
  type: `sum`,
} ,
sum_of_harvest_project_over_budget_notification_percentage:  {
  sql: `harvest_project_over_budget_notification_percentage`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__harvest_tasks_dim_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_tasks_dim`,
extends: wh_delivery__harvest_tasks_dim,
measures: {
count_of_harvest_task_pk:  {
  sql: `harvest_task_pk`,
  type: `count`,
} ,
sum_of_harvest_task_default_hourly_rate:  {
  sql: `harvest_task_default_hourly_rate`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__harvest_time_sheets_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_time_sheets_fact`,
extends: wh_delivery__harvest_time_sheets_fact,
measures: {
count_of_harvest_timesheet_pk:  {
  sql: `harvest_timesheet_pk`,
  type: `count`,
} ,
sum_of_harvest_timesheet_natural_key:  {
  sql: `harvest_timesheet_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_employee_natural_key:  {
  sql: `harvest_employee_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_task_assignment_natural_key:  {
  sql: `harvest_task_assignment_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_employee_assignment_natural_key:  {
  sql: `harvest_employee_assignment_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_invoice_natural_key:  {
  sql: `harvest_invoice_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_client_natural_key:  {
  sql: `harvest_client_natural_key`,
  type: `sum`,
} ,
sum_of_harvest_timesheet_billable_rate:  {
  sql: `harvest_timesheet_billable_rate`,
  type: `sum`,
} ,
sum_of_harvest_timesheet_cost_rate:  {
  sql: `harvest_timesheet_cost_rate`,
  type: `sum`,
} ,
sum_of_harvest_timesheet_hours:  {
  sql: `harvest_timesheet_hours`,
  type: `sum`,
} ,
sum_of_harvest_timesheet_hours_budgeted:  {
  sql: `harvest_timesheet_hours_budgeted`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__jira_daily_issue_field_history_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_daily_issue_field_history_fact`,
extends: wh_delivery__jira_daily_issue_field_history_fact,
measures: {
count_of_jira_daily_issue_field_history_pk:  {
  sql: `jira_daily_issue_field_history_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__jira_epics_dim_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_epics_dim`,
extends: wh_delivery__jira_epics_dim,
measures: {
count_of_jira_epic_pk:  {
  sql: `jira_epic_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__jira_fields_dim_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_fields_dim`,
extends: wh_delivery__jira_fields_dim,
measures: {
count_of_jira_field_pk:  {
  sql: `jira_field_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__jira_issues_board_bridge_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_board_bridge`,
extends: wh_delivery__jira_issues_board_bridge,
measures: {
count_of_jira_issue_board_bridge_pk:  {
  sql: `jira_issue_board_bridge_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__jira_issues_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_fact`,
extends: wh_delivery__jira_issues_fact,
measures: {
count_of_jira_issue_pk:  {
  sql: `jira_issue_pk`,
  type: `count`,
} ,
sum_of_jira_issue_natural_key:  {
  sql: `jira_issue_natural_key`,
  type: `sum`,
} ,
sum_of_jira_issue_work_ratio:  {
  sql: `jira_issue_work_ratio`,
  type: `sum`,
} ,
sum_of_jira_issue_count_sprint_changes:  {
  sql: `jira_issue_count_sprint_changes`,
  type: `sum`,
} ,
sum_of_jira_issue_time_spent_seconds:  {
  sql: `jira_issue_time_spent_seconds`,
  type: `sum`,
} ,
sum_of_jira_issue_count_comments:  {
  sql: `jira_issue_count_comments`,
  type: `sum`,
} ,
sum_of_jira_issue_open_duration_seconds:  {
  sql: `jira_issue_open_duration_seconds`,
  type: `sum`,
} ,
sum_of_jira_issue_any_assignment_duration_seconds:  {
  sql: `jira_issue_any_assignment_duration_seconds`,
  type: `sum`,
} ,
sum_of_jira_issue_last_assignment_duration_seconds:  {
  sql: `jira_issue_last_assignment_duration_seconds`,
  type: `sum`,
} ,
sum_of_jira_issue_story_point_estimate:  {
  sql: `jira_issue_story_point_estimate`,
  type: `sum`,
} ,
sum_of_jira_issue_original_estimate:  {
  sql: `jira_issue_original_estimate`,
  type: `sum`,
} ,
sum_of_jira_issue_remaining_estimate:  {
  sql: `jira_issue_remaining_estimate`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__jira_issues_field_history_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_field_history_fact`,
extends: wh_delivery__jira_issues_field_history_fact,
measures: {
count_of_jira_issues_field_history_pk:  {
  sql: `jira_issues_field_history_pk`,
  type: `count`,
} ,
sum_of_jira_issue_field_history_story_point_estimate:  {
  sql: `jira_issue_field_history_story_point_estimate`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__jira_issues_sprint_bridge_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_sprint_bridge`,
extends: wh_delivery__jira_issues_sprint_bridge,
measures: {
count_of_jira_issue_sprint_bridge_pk:  {
  sql: `jira_issue_sprint_bridge_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__jira_issues_xa_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_xa`,
extends: wh_delivery__jira_issues_xa,
measures: {
count_of_jira_issue_summary_pk:  {
  sql: `jira_issue_summary_pk`,
  type: `count`,
} ,
sum_of_jira_issue_duration:  {
  sql: `jira_issue_duration`,
  type: `sum`,
} ,
sum_of_jira_issue_age_in_days:  {
  sql: `jira_issue_age_in_days`,
  type: `sum`,
} ,
sum_of_jira_issue_summary_story_point_estimate:  {
  sql: `jira_issue_summary_story_point_estimate`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__jira_projects_fact_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_projects_fact`,
extends: wh_delivery__jira_projects_fact,
measures: {
count_of_jira_project_pk:  {
  sql: `jira_project_pk`,
  type: `count`,
} ,
sum_of_jira_project_count_closed_issues:  {
  sql: `jira_project_count_closed_issues`,
  type: `sum`,
} ,
sum_of_jira_project_count_open_issues:  {
  sql: `jira_project_count_open_issues`,
  type: `sum`,
} ,
sum_of_jira_project_count_open_assigned_issues:  {
  sql: `jira_project_count_open_assigned_issues`,
  type: `sum`,
} ,
sum_of_jira_project_avg_close_time_days:  {
  sql: `jira_project_avg_close_time_days`,
  type: `sum`,
} ,
sum_of_jira_project_avg_assigned_close_time_days:  {
  sql: `jira_project_avg_assigned_close_time_days`,
  type: `sum`,
} ,
sum_of_jira_project_avg_age_currently_open_days:  {
  sql: `jira_project_avg_age_currently_open_days`,
  type: `sum`,
} ,
sum_of_jira_project_avg_age_currently_open_assigned_days:  {
  sql: `jira_project_avg_age_currently_open_assigned_days`,
  type: `sum`,
} ,
sum_of_jira_project_median_close_time_days:  {
  sql: `jira_project_median_close_time_days`,
  type: `sum`,
} ,
sum_of_jira_project_median_age_currently_open_days:  {
  sql: `jira_project_median_age_currently_open_days`,
  type: `sum`,
} ,
sum_of_jira_project_median_assigned_close_time_days:  {
  sql: `jira_project_median_assigned_close_time_days`,
  type: `sum`,
} ,
sum_of_jira_project_median_age_currently_open_assigned_days:  {
  sql: `jira_project_median_age_currently_open_assigned_days`,
  type: `sum`,
} ,
sum_of_jira_project_avg_close_time_seconds:  {
  sql: `jira_project_avg_close_time_seconds`,
  type: `sum`,
} ,
sum_of_jira_project_avg_assigned_close_time_seconds:  {
  sql: `jira_project_avg_assigned_close_time_seconds`,
  type: `sum`,
} ,
sum_of_jira_project_avg_age_currently_open_seconds:  {
  sql: `jira_project_avg_age_currently_open_seconds`,
  type: `sum`,
} ,
sum_of_jira_project_avg_age_currently_open_assigned_seconds:  {
  sql: `jira_project_avg_age_currently_open_assigned_seconds`,
  type: `sum`,
} ,
sum_of_jira_project_median_close_time_seconds:  {
  sql: `jira_project_median_close_time_seconds`,
  type: `sum`,
} ,
sum_of_jira_project_median_age_currently_open_seconds:  {
  sql: `jira_project_median_age_currently_open_seconds`,
  type: `sum`,
} ,
sum_of_jira_project_median_assigned_close_time_seconds:  {
  sql: `jira_project_median_assigned_close_time_seconds`,
  type: `sum`,
} ,
sum_of_jira_project_median_age_currently_open_assigned_seconds:  {
  sql: `jira_project_median_age_currently_open_assigned_seconds`,
  type: `sum`,
} ,
}});
cube (`wh_delivery__jira_sprints_dim_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_sprints_dim`,
extends: wh_delivery__jira_sprints_dim,
measures: {
count_of_jira_sprint_pk:  {
  sql: `jira_sprint_pk`,
  type: `count`,
} ,
}});
cube (`wh_delivery__jira_users_dim_extended`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
extends: wh_delivery__jira_users_dim,
measures: {
count_of_jira_user_pk:  {
  sql: `jira_user_pk`,
  type: `count`,
} ,
sum_of_jira_user_count_closed_issues:  {
  sql: `jira_user_count_closed_issues`,
  type: `sum`,
} ,
sum_of_jira_user_count_open_issues:  {
  sql: `jira_user_count_open_issues`,
  type: `sum`,
} ,
sum_of_jira_user_avg_close_time_days:  {
  sql: `jira_user_avg_close_time_days`,
  type: `sum`,
} ,
sum_of_jira_user_avg_age_currently_open_days:  {
  sql: `jira_user_avg_age_currently_open_days`,
  type: `sum`,
} ,
sum_of_jira_user_median_close_time_days:  {
  sql: `jira_user_median_close_time_days`,
  type: `sum`,
} ,
sum_of_jira_user_median_age_currently_open_days:  {
  sql: `jira_user_median_age_currently_open_days`,
  type: `sum`,
} ,
sum_of_jira_user_avg_close_time_seconds:  {
  sql: `jira_user_avg_close_time_seconds`,
  type: `sum`,
} ,
sum_of_jira_user_avg_age_currently_open_seconds:  {
  sql: `jira_user_avg_age_currently_open_seconds`,
  type: `sum`,
} ,
sum_of_jira_user_median_close_time_seconds:  {
  sql: `jira_user_median_close_time_seconds`,
  type: `sum`,
} ,
sum_of_jira_user_median_age_currently_open_seconds:  {
  sql: `jira_user_median_age_currently_open_seconds`,
  type: `sum`,
} ,
}});

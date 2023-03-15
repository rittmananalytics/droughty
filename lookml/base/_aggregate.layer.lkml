include: "/lookml/base/_base.layer.lkml"
view: +wh_core__clients_bridge {
measure: count_of_client_pk {
  type: count_distinct
  sql: ${TABLE}.client_pk ;;
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
}
view: +wh_core__sprints_bridge {
measure: count_of_sprint_pk {
  type: count_distinct
  sql: ${TABLE}.sprint_pk ;;
  description: ""
  drill_fields: [wh_core__sprints_bridge_set*]
}
}
view: +wh_delivery__harvest_clients_dim {
measure: count_of_harvest_client_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_client_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
}
view: +wh_delivery__harvest_employees_dim {
measure: count_of_harvest_employee_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_employee_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_weekly_capacity {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_weekly_capacity ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_cost_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_cost_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_default_hourly_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
}
view: +wh_delivery__harvest_expenses_fact {
measure: count_of_harvest_expense_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_expense_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_category_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_category_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_employee_assignment_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_total_cost {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_total_cost ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_receipt_file_size {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_receipt_file_size ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_units {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_units ;;
  description: ""
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
}
view: +wh_delivery__harvest_invoice_line_items_fact {
measure: count_of_harvest_invoice_line_item_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_line_item_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_amount ;;
  description: "A harvest invoice line item amount is the total monetary amount of an individual line item on an invoice. This amount can include subtotals, sales tax, and shipping charges."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_unit_price {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_unit_price ;;
  description: "A harvest invoice line item unit price is the price of an individual item on a harvest invoice. It is calculated by dividing the total price of the invoice line item by the quantity purchased."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_quantity {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_quantity ;;
  description: "A harvest invoice line item quantity is the number of items included in a single line item on an invoice from a business. It might refer to the exact number of units of product that a customer purchased, or to the number of hours of service provided by a business."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_services_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_services_amount_billed ;;
  description: "The amount billed for harvest invoice line item services depends on the particular services included in the invoice. Generally, harvest invoices will include a full breakdown of the services provided along with the amount billed for each service."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_license_referral_fee_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_license_referral_fee_amount_billed ;;
  description: "A harvest invoice line item license referral fee amount billed is the total fee charged for a referral made when the customer purchases a license for a product or service. The amount charged for the referral fee is based on the terms of the agreement between the referring individual or entity and the organization providing the license."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_expenses_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_expenses_amount_billed ;;
  description: "A harvest invoice line item expense amount billed is the total amount that is charged to the customer for the item listed on the invoice. This amount includes any applicable taxes and other fees."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_support_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_support_amount_billed ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
}
view: +wh_delivery__harvest_invoices_fact {
measure: count_of_harvest_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_amount ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_due_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_due_amount ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_discount_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_discount_amount ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_discount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_discount ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_tax_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_tax_amount ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_tax {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_tax ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
}
view: +wh_delivery__harvest_invoices_xa {
measure: count_of_harvest_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_invoice_net_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_net_amount ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_invoice_revenue_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_revenue_amount_billed ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_client_invoice_sequence_nunber {
  type: sum_distinct
  sql: ${TABLE}.harvest_client_invoice_sequence_nunber ;;
  description: ""
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
}
view: +wh_delivery__harvest_projects_fact {
measure: count_of_harvest_project_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_project_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: "The hourly rate for the Harvest project varies depending on the type of work being done and a number of factors, including the location of the project and the skills of the worker. If you are interested in working on a Harvest project, you should contact the project manager to find out their exact rate."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_cost_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: "The cost of a harvest project will depend on the complexity of the project and other factors, such as the number of people involved, the materials and equipment needed, and the duration of the project. Thus, there is no standard budget for a harvest project. Instead, each project should be evaluated individually in order to determine what a reasonable budget should be."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_fee {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_fee ;;
  description: "Harvest project fees are the fees that a farmer pays for the services of a harvester hired to collect their crop at harvest time. The fee can include the cost of labor, supplies, and equipment used to harvest the crop. There may also be additional fees for personnel, vehicles, and storage containers required for certain crops."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_budget ;;
  description: "The budget of a harvest project will depend on the scope of the project, the services and equipment needed, the length of the project and any other applicable factors. It is best to work with a qualified project manager to determine the exact cost for a specific project."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_over_budget_notification_percentage {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: "There is no standard percentage for Harvest Project over budget notifications. Each project manager must determine the percentage that they believe is appropriate for their specific project."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
}
view: +wh_delivery__harvest_tasks_dim {
measure: count_of_harvest_task_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_task_pk ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
measure: sum_of_harvest_task_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_task_default_hourly_rate ;;
  description: ""
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
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
  description: "A harvest invoice natural key is a unique identifier associated with a particular harvest invoice. It typically consists of a combination of the supplier’s name, the invoice number, and the invoice date. This unique combination of information can be used to quickly and easily match a particular harvest invoice to its corresponding records in other systems."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_client_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_client_natural_key ;;
  description: "The harvest client natural key is the unique identifier used by Harvest to identify each client. It typically starts with a \"c\" followed by some numbers, such as c452985."
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
  description: ""
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
view: +wh_delivery__jira_issues_board_bridge {
measure: count_of_jira_issue_board_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_board_bridge_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_board_bridge_set*]
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
  description: "A JIRA issue natural key is a unique identifier assigned to each issue created in JIRA. It is a concatenation of the project key and the issue number. It takes the format <PROJECT_KEY>-<ISSUE_NUMBER>. For example, ‘ABC-123’ might be the JIRA issue natural key for an issue in a project with the key ‘ABC’."
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
  description: "Jira issue field history story point estimate is a field that stores the estimated story points of a given issue at different points throughout its lifetime. It allows teams to view and understand why and how the estimates of an issue have changed over time."
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
}
view: +wh_delivery__jira_issues_sprint_bridge {
measure: count_of_jira_issue_sprint_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_sprint_bridge_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_issues_sprint_bridge_set*]
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
  description: "The exact number of closed issues for a given Jira project depends on the specific project and all of the issues that have been previously submitted and closed. However, you can view the number of closed issues in a Jira project at any time by navigating to the project's Summary page. On the left side of the page, you will see an Overview tab with a Closure Count subsection. This should show the current number of closed issues in the project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_open_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: "It is not possible to give an exact number, as this will depend on the individual Jira projects and the types of open issues associated with them. The best way to determine the number of open issues for a Jira project is to access the project from the Jira dashboard and use the issue search function to view all current open issues."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_open_assigned_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: "Jira doesn't provide a single metric that displays the count of open assigned issues. Depending on what you are trying to achieve, you can use different Jira queries or tools to display the number of open assigned issues."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: "The average Jira project close time depends on the complexity of the project, the resources available, and other factors. Generally, it can take anywhere from one to several weeks or even longer depending on the type of project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: "Jira does not have an exact answer to this question since the amount of time it takes to close a project can vary drastically based on the complexity of the assigned tasks, the number of people assigned to the project, and the number of contingencies. Generally speaking, complex projects may take weeks or months to complete, while simpler projects may take just a few days."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: "Unfortunately, this is not a statistic that can be easily answered as there are many different factors that contribute to the average age of open projects in Jira. Factors such as complexity, priority level, resources, and size of the project can all affect the number of days that a project remains open."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: "Unfortunately, there is no definitive answer to this question, as it will depend largely on the organization and the specific Jira project in question. However, it is likely to vary greatly between different organizations and Jira projects, so it is best to ask your specific organization or Jira project administrator for more details on their particular project's average age of open assigned tasks."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: "The median close time for Jira projects is not a single set number as it fluctuates based on the project and its requirements. However, a general rule of thumb is that most Jira projects should be able to close within 4-8 days."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: "Jira does not calculate or report the median age for open projects. Instead, Jira allows administrators to manually set a desired project age in the project configuration settings. Alternatively, administrators can use Jira's report builder feature to view and analyze projects and other Jira objects, including the age of open projects."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: "There is no definitive answer to this question, as the median assigned close time for a Jira project can vary significantly depending on factors such as the size and complexity of the project, the product or services involved, and other variables."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: "There is no one single answer to this question, as the median age of Jira projects can vary depending on the scope of the project, the workflow, and the number of people assigned to the project. However, the average age for Jira projects currently open is about 34 days."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: "Jira does not have a specific time metric associated with project close time, as it depends on the complexity of the project and the individual workflow setup."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: "Jira does not provide an average assigned-close time in seconds. However, it does track the average close time for all issues set to a specific status. Jira users can view this average close time by navigating to the Projects link in the sidebar menu and selecting the Reports tab."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: "There is no definitive answer to this question as the average age of open JIRA projects will depend on a variety of factors. This includes the complexity of the project, the amount of resources available, and the types of tasks associated with the project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no single answer to this question, as the age of a Jira project depends on many factors. Depending on the size of the project, the complexity of the tasks and workflows, as well as the number of people involved and how quickly tasks are completed, the average open assigned time of a Jira project can vary greatly."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: "There is no single answer to this question, as it varies depending on numerous factors including the specific project, requirements, and goals. Furthermore, Jira does not calculate a median close time as it is not a metric that it collects. A best practice is to use Jira's filter and reporting functions to analyze the individual issue close times and then create your own median metric."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: "The median age of Jira projects currently open cannot be determined as this information is not tracked or stored by Jira. However, you may be able to approximate it by looking through your open projects and measuring the time that has elapsed since they were opened."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: "Jira project median assigned close time cannot be specified in seconds, as the close time varies depending on the complexity and size of each project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no definitive answer to this question as the median age of Jira projects open and assigned can vary greatly depending on the individual project and its associated tasks and durations."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
}
view: +wh_delivery__jira_sprints_dim {
measure: count_of_jira_sprint_pk {
  type: count_distinct
  sql: ${TABLE}.jira_sprint_pk ;;
  description: ""
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
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

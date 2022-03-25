include: "/base/_base.layer.lkml"
view: +budgets_sales {
measure: count_of_budget_pk {
  type: count_distinct
  sql: ${TABLE}.budget_pk ;;
  description: "not available"
}
measure: sum_of_budget_amt {
  type: sum_distinct
  sql: ${TABLE}.budget_amt ;;
  description: "not available"
}
}
view: +core_agents {
measure: count_of_agent_pk {
  type: count_distinct
  sql: ${TABLE}.agent_pk ;;
  description: "The key and link to an agent"
}
measure: sum_of_agent_natural_key {
  type: sum_distinct
  sql: ${TABLE}.agent_natural_key ;;
  description: "The key and link to an agent from a record"
}
measure: sum_of_country_natural_key {
  type: sum_distinct
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country from a record"
}
}
view: +core_countries {
measure: count_of_country_pk {
  type: count_distinct
  sql: ${TABLE}.country_pk ;;
  description: "The key and link to a country"
}
measure: sum_of_country_natural_key {
  type: sum_distinct
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country"
}
}
view: +core_country_mapping {
measure: count_of_country_mapping_pk {
  type: count_distinct
  sql: ${TABLE}.country_mapping_pk ;;
  description: "The key to link countries to other records"
}
measure: sum_of_country_natural_key {
  type: sum_distinct
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country"
}
}
view: +core_institutions {
measure: count_of_institution_pk {
  type: count_distinct
  sql: ${TABLE}.institution_pk ;;
  description: "The key and link to an institution"
}
measure: sum_of_institution_natural_key {
  type: sum_distinct
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key and link to an institution"
}
measure: sum_of_country_natural_key {
  type: sum_distinct
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country"
}
}
view: +core_program_intakes {
measure: count_of_program_intake_pk {
  type: count_distinct
  sql: ${TABLE}.program_intake_pk ;;
  description: "The key to link a record to a program intake"
}
measure: sum_of_program_intake_natural_key {
  type: sum_distinct
  sql: ${TABLE}.program_intake_natural_key ;;
  description: "The key to link a record to a program intake"
}
measure: sum_of_program_natural_key {
  type: sum_distinct
  sql: ${TABLE}.program_natural_key ;;
  description: "The key to link a record to a program"
}
measure: sum_of_program_fee {
  type: sum_distinct
  sql: ${TABLE}.program_fee ;;
  description: "Cost of a program"
}
measure: sum_of_intake_quota_exists {
  type: sum_distinct
  sql: ${TABLE}.intake_quota_exists ;;
  description: "Confirms if there's a quota on the intake"
}
}
view: +core_programs {
measure: count_of_program_pk {
  type: count_distinct
  sql: ${TABLE}.program_pk ;;
  description: "The key to link to a certain program"
}
measure: sum_of_program_natural_key {
  type: sum_distinct
  sql: ${TABLE}.program_natural_key ;;
  description: "The key to link to a certain program"
}
measure: sum_of_institution_natural_key {
  type: sum_distinct
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link to a certain institution"
}
}
view: +core_scholarship_reason_owners {
measure: count_of_scholarship_reason_owner_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_reason_owner_pk ;;
  description: "The key to link the core_scholarship_reasons_owner record to another record"
}
}
view: +core_scholarship_reasons {
measure: count_of_scholarship_reason_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_reason_pk ;;
  description: "The key to link the scholarship reason to another record"
}
}
view: +core_sponsors {
measure: count_of_sponsor_pk {
  type: count_distinct
  sql: ${TABLE}.sponsor_pk ;;
  description: "The key to link a sponsor to a certain record"
}
measure: sum_of_sponsor_natural_key {
  type: sum_distinct
  sql: ${TABLE}.sponsor_natural_key ;;
  description: "The key to link a sponsor to a certain record"
}
measure: sum_of_country_natural_key {
  type: sum_distinct
  sql: ${TABLE}.country_natural_key ;;
  description: "The key to link a country to a certain record"
}
}
view: +core_subjects {
measure: count_of_program_subject_pk {
  type: count_distinct
  sql: ${TABLE}.program_subject_pk ;;
  description: "The key to link the program's subject to a record"
}
measure: sum_of_program_natural_key {
  type: sum_distinct
  sql: ${TABLE}.program_natural_key ;;
  description: "The key to link a program to a record"
}
}
view: +core_user_mapping {
measure: count_of_user_mapping_pk {
  type: count_distinct
  sql: ${TABLE}.user_mapping_pk ;;
  description: "not available"
}
}
view: +core_users {
measure: count_of_user_pk {
  type: count_distinct
  sql: ${TABLE}.user_pk ;;
  description: "The key to link an user to a record"
}
}
view: +product_progression_plans {
measure: count_of_progression_plan_pk {
  type: count_distinct
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
measure: sum_of_institution_natural_key {
  type: sum_distinct
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
measure: sum_of_progression_plan_program_natural_key {
  type: sum_distinct
  sql: ${TABLE}.progression_plan_program_natural_key ;;
  description: "The key to link a record to a progression plan's program"
}
measure: sum_of_version_number {
  type: sum_distinct
  sql: ${TABLE}.version_number ;;
  description: "The progression plan's version number"
}
}
view: +product_progression_plans_history {
measure: count_of_study_plan_history_pk {
  type: count_distinct
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
measure: count_of_progression_plan_pk {
  type: count_distinct
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
measure: sum_of_institution_natural_key {
  type: sum_distinct
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
measure: sum_of_progression_plan_program_natural_key {
  type: sum_distinct
  sql: ${TABLE}.progression_plan_program_natural_key ;;
  description: "The key to link a record to a progression plan's program"
}
measure: sum_of_progression_plan_version_number {
  type: sum_distinct
  sql: ${TABLE}.progression_plan_version_number ;;
  description: "not available"
}
measure: sum_of_progression_plan_index {
  type: sum_distinct
  sql: ${TABLE}.progression_plan_index ;;
  description: "The index for the progression plan historical records to help organise"
}
}
view: +product_study_plans {
measure: count_of_study_plan_pk {
  type: count_distinct
  sql: ${TABLE}.study_plan_pk ;;
  description: "The key to link a record to a study plan"
}
measure: sum_of_study_plan_natural_key {
  type: sum_distinct
  sql: ${TABLE}.study_plan_natural_key ;;
  description: "The key to link a record to a study plan"
}
measure: sum_of_institution_natural_key {
  type: sum_distinct
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
measure: sum_of_study_plan_program_natural_key {
  type: sum_distinct
  sql: ${TABLE}.study_plan_program_natural_key ;;
  description: "The key to link a record to a study plan's program"
}
measure: sum_of_version_number {
  type: sum_distinct
  sql: ${TABLE}.version_number ;;
  description: "The study plan's version number"
}
}
view: +product_study_plans_history {
measure: count_of_study_plan_history_pk {
  type: count_distinct
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
measure: sum_of_study_plan_natural_key {
  type: sum_distinct
  sql: ${TABLE}.study_plan_natural_key ;;
  description: "The key to link a record to a study plan"
}
measure: sum_of_institution_natural_key {
  type: sum_distinct
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
measure: sum_of_study_plan_program_natural_key {
  type: sum_distinct
  sql: ${TABLE}.study_plan_program_natural_key ;;
  description: "The key to link a record to a study plan's program"
}
measure: sum_of_study_plan_version_number {
  type: sum_distinct
  sql: ${TABLE}.study_plan_version_number ;;
  description: "not available"
}
measure: sum_of_study_plan_index {
  type: sum_distinct
  sql: ${TABLE}.study_plan_index ;;
  description: "The index for the study plan historical records to help organise"
}
}
view: +sales_application_agent_bridge {
measure: count_of_application_agent_pk {
  type: count_distinct
  sql: ${TABLE}.application_agent_pk ;;
  description: "Unique id to link an agent with an application"
}
}
view: +sales_application_history {
measure: count_of_application_history_pk {
  type: count_distinct
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
measure: sum_of_study_plan_version_number {
  type: sum_distinct
  sql: ${TABLE}.study_plan_version_number ;;
  description: "The number to indicate what type of study plan the application is following"
}
measure: sum_of_applications {
  type: sum_distinct
  sql: ${TABLE}.applications ;;
  description: "Full list/count of applications"
}
measure: sum_of_offers {
  type: sum_distinct
  sql: ${TABLE}.offers ;;
  description: "Full list/count of offers"
}
measure: sum_of_deposits {
  type: sum_distinct
  sql: ${TABLE}.deposits ;;
  description: "Full list/count of deposits"
}
measure: sum_of_enrolled {
  type: sum_distinct
  sql: ${TABLE}.enrolled ;;
  description: "Full list/count of enrolled"
}
measure: sum_of_lost {
  type: sum_distinct
  sql: ${TABLE}.lost ;;
  description: "Full list/count of lost records"
}
measure: sum_of_change_count {
  type: sum_distinct
  sql: ${TABLE}.change_count ;;
  description: "Counts the amount of changes to the applicant (Such as switched program and intake etc)"
}
}
view: +sales_applications {
measure: count_of_application_pk {
  type: count_distinct
  sql: ${TABLE}.application_pk ;;
  description: "Unique id for an application. Keep in mind that a student may have multiple applications"
}
measure: sum_of_application_natural_key {
  type: sum_distinct
  sql: ${TABLE}.application_natural_key ;;
  description: "not available"
}
measure: sum_of_sponsor_natural_key {
  type: sum_distinct
  sql: ${TABLE}.sponsor_natural_key ;;
  description: "The key to indicate and link the record to the sponsor"
}
measure: sum_of_class_application_id {
  type: sum_distinct
  sql: ${TABLE}.class_application_id ;;
  description: "Confirm the id for the class"
}
measure: sum_of_weighting {
  type: sum_distinct
  sql: ${TABLE}.weighting ;;
  description: "The percentage of offers per student (all offers add up too one)"
}
measure: sum_of_weighting_non_deferred {
  type: sum_distinct
  sql: ${TABLE}.weighting_non_deferred ;;
  description: "The percentage of offers per student excluding deferred (all offers add up too one)"
}
}
view: +sales_applications_history {
measure: count_of_application_history_pk {
  type: count_distinct
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
measure: sum_of_application_natural_key {
  type: sum_distinct
  sql: ${TABLE}.application_natural_key ;;
  description: "not available"
}
measure: sum_of_sponsor_natural_key {
  type: sum_distinct
  sql: ${TABLE}.sponsor_natural_key ;;
  description: "not available"
}
measure: sum_of_class_application_id {
  type: sum_distinct
  sql: ${TABLE}.class_application_id ;;
  description: "not available"
}
measure: sum_of_application_index {
  type: sum_distinct
  sql: ${TABLE}.application_index ;;
  description: "The index format of the row of applications"
}
measure: sum_of_application_status_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.application_status_duration_seconds ;;
  description: "The time the application was kept on each status"
}
measure: sum_of_application_weight {
  type: sum_distinct
  sql: ${TABLE}.application_weight ;;
  description: "not available"
}
}
view: +sales_applications_quota {
measure: count_of_application_quota_pk {
  type: count_distinct
  sql: ${TABLE}.application_quota_pk ;;
  description: "not available"
}
}
view: +sales_applications_summary {
measure: count_of_application_summary_pk {
  type: count_distinct
  sql: ${TABLE}.application_summary_pk ;;
  description: "not available"
}
measure: sum_of_sales_applications_application_count {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_application_count ;;
  description: "The weighted count of applications. In other words, the number of students who have applied including offers, deposits, and enrollments."
}
measure: sum_of_sales_applications_unweighted_offer_count {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_unweighted_offer_count ;;
  description: "not available"
}
measure: sum_of_sales_applications_application_offer_count {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_application_offer_count ;;
  description: "The weighted count of applications in offer state. In other words, the number of students who have received an offer but not yet made a deposit."
}
measure: sum_of_sales_applications_unconverted_application_count {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_unconverted_application_count ;;
  description: "The weighted count of applications in application state. In other words, the number of students who have applied but not yet received an offer."
}
measure: sum_of_sales_applications_application_count_non_deferred {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_application_count_non_deferred ;;
  description: "not available"
}
measure: sum_of_sales_applications_application_offer_count_non_deferred {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_application_offer_count_non_deferred ;;
  description: "not available"
}
measure: sum_of_sales_applications_unconverted_application_count_non_deferred {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_unconverted_application_count_non_deferred ;;
  description: "not available"
}
measure: sum_of_sales_applications_application_deposit_count {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_application_deposit_count ;;
  description: "The number of applications that have converted to deposits."
}
measure: sum_of_sales_applications_application_enrolled_count {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_application_enrolled_count ;;
  description: "The number of applications that have converted to enrolled students."
}
measure: sum_of_sales_applications_enrollments_and_deposit_count {
  type: sum_distinct
  sql: ${TABLE}.sales_applications_enrollments_and_deposit_count ;;
  description: "not available"
}
}
view: +sales_new_programs {
measure: count_of_program_launch_pk {
  type: count_distinct
  sql: ${TABLE}.program_launch_pk ;;
  description: ""
}
}
view: +sales_priority_programs {
measure: count_of_priority_program_pk {
  type: count_distinct
  sql: ${TABLE}.priority_program_pk ;;
  description: "not available"
}
}
view: +sales_quota_allocations {
measure: count_of_quota_allocation_pk {
  type: count_distinct
  sql: ${TABLE}.quota_allocation_pk ;;
  description: "not available"
}
measure: sum_of_quota_year {
  type: sum_distinct
  sql: ${TABLE}.quota_year ;;
  description: "not available"
}
measure: sum_of_deposits_amt {
  type: sum_distinct
  sql: ${TABLE}.deposits_amt ;;
  description: "not available"
}
measure: sum_of_cas_enrolment_amt {
  type: sum_distinct
  sql: ${TABLE}.cas_enrolment_amt ;;
  description: "not available"
}
measure: sum_of_progression_amt {
  type: sum_distinct
  sql: ${TABLE}.progression_amt ;;
  description: "not available"
}
}
view: +sales_scholarships {
measure: count_of_scholarships_pk {
  type: count_distinct
  sql: ${TABLE}.scholarships_pk ;;
  description: "not available"
}
measure: sum_of_student_ledger_sop_line_item_actual_amount {
  type: sum_distinct
  sql: ${TABLE}.student_ledger_sop_line_item_actual_amount ;;
  description: "The amount of the course after the scholarship has been given"
}
}
view: +sales_student {
measure: count_of_student_pk {
  type: count_distinct
  sql: ${TABLE}.student_pk ;;
  description: "The key to link to/indicate a certain student"
}
measure: sum_of_country_natural_key {
  type: sum_distinct
  sql: ${TABLE}.country_natural_key ;;
  description: "The key to indicate the country linked to the student"
}
}
view: +scholarship_budgets {
measure: count_of_scholarship_budgets_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_budgets_pk ;;
  description: "The key to link to the scholarship budget records"
}
measure: sum_of_budget_amt {
  type: sum_distinct
  sql: ${TABLE}.budget_amt ;;
  description: "The amount of budget"
}
}
view: +scholarship_targets {
measure: count_of_scholarship_targets_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_targets_pk ;;
  description: "not available"
}
measure: sum_of_target_amt {
  type: sum_distinct
  sql: ${TABLE}.target_amt ;;
  description: "not available"
}
measure: sum_of_budget_amt {
  type: sum_distinct
  sql: ${TABLE}.budget_amt ;;
  description: "not available"
}
}
view: +targets_institutions {
measure: count_of_institution_target_pk {
  type: count_distinct
  sql: ${TABLE}.institution_target_pk ;;
  description: "not available"
}
measure: sum_of_target_amt {
  type: sum_distinct
  sql: ${TABLE}.target_amt ;;
  description: "not available"
}
}
view: +targets_sales_regions {
measure: count_of_sales_region_target_pk {
  type: count_distinct
  sql: ${TABLE}.sales_region_target_pk ;;
  description: "The key to link to the target sales region"
}
measure: sum_of_target_amt {
  type: sum_distinct
  sql: ${TABLE}.target_amt ;;
  description: "The target amount of enrolments"
}
}

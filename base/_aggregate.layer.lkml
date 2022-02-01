view: +budgets_sales
measure: count_of_budget_pk {
  type: count_distinct
  sql: ${TABLE}.budget_pk ;;
  description: "not available"
}
measure: sum_of_budget_pk {
  type: sum_distinct
  sql: ${TABLE}.budget_pk ;;
  description: "not available"
}
}
view: +core_agents
measure: count_of_agent_pk {
  type: count_distinct
  sql: ${TABLE}.agent_pk ;;
  description: "The key and link to an agent"
}
measure: sum_of_agent_pk {
  type: sum_distinct
  sql: ${TABLE}.agent_pk ;;
  description: "The key and link to an agent"
}
}
view: +core_countries
measure: count_of_country_pk {
  type: count_distinct
  sql: ${TABLE}.country_pk ;;
  description: "The key and link to a country"
}
measure: sum_of_country_pk {
  type: sum_distinct
  sql: ${TABLE}.country_pk ;;
  description: "The key and link to a country"
}
}
view: +core_country_mapping
measure: count_of_country_mapping_pk {
  type: count_distinct
  sql: ${TABLE}.country_mapping_pk ;;
  description: "The key to link countries to other records"
}
measure: sum_of_country_mapping_pk {
  type: sum_distinct
  sql: ${TABLE}.country_mapping_pk ;;
  description: "The key to link countries to other records"
}
}
view: +core_institutions
measure: count_of_institution_pk {
  type: count_distinct
  sql: ${TABLE}.institution_pk ;;
  description: "The key and link to an institution"
}
measure: sum_of_institution_pk {
  type: sum_distinct
  sql: ${TABLE}.institution_pk ;;
  description: "The key and link to an institution"
}
}
view: +core_program_intakes
measure: count_of_program_intake_pk {
  type: count_distinct
  sql: ${TABLE}.program_intake_pk ;;
  description: "The key to link a record to a program intake"
}
measure: sum_of_program_intake_pk {
  type: sum_distinct
  sql: ${TABLE}.program_intake_pk ;;
  description: "The key to link a record to a program intake"
}
}
view: +core_programs
measure: count_of_program_pk {
  type: count_distinct
  sql: ${TABLE}.program_pk ;;
  description: "The key to link to a certain program"
}
measure: sum_of_program_pk {
  type: sum_distinct
  sql: ${TABLE}.program_pk ;;
  description: "The key to link to a certain program"
}
}
view: +core_scholarship_reason_owners
measure: count_of_scholarship_reason_owner_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_reason_owner_pk ;;
  description: "The key to link the core_scholarship_reasons_owner record to another record"
}
measure: sum_of_scholarship_reason_owner_pk {
  type: sum_distinct
  sql: ${TABLE}.scholarship_reason_owner_pk ;;
  description: "The key to link the core_scholarship_reasons_owner record to another record"
}
}
view: +core_scholarship_reasons
measure: count_of_scholarship_reason_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_reason_pk ;;
  description: "The key to link the scholarship reason to another record"
}
measure: sum_of_scholarship_reason_pk {
  type: sum_distinct
  sql: ${TABLE}.scholarship_reason_pk ;;
  description: "The key to link the scholarship reason to another record"
}
}
view: +core_sponsors
measure: count_of_sponsor_pk {
  type: count_distinct
  sql: ${TABLE}.sponsor_pk ;;
  description: "The key to link a sponsor to a certain record"
}
measure: sum_of_sponsor_pk {
  type: sum_distinct
  sql: ${TABLE}.sponsor_pk ;;
  description: "The key to link a sponsor to a certain record"
}
}
view: +core_subjects
measure: count_of_program_subject_pk {
  type: count_distinct
  sql: ${TABLE}.program_subject_pk ;;
  description: "The key to link the program's subject to a record"
}
measure: sum_of_program_subject_pk {
  type: sum_distinct
  sql: ${TABLE}.program_subject_pk ;;
  description: "The key to link the program's subject to a record"
}
}
view: +core_user_mapping
measure: count_of_user_mapping_pk {
  type: count_distinct
  sql: ${TABLE}.user_mapping_pk ;;
  description: "not available"
}
measure: sum_of_user_mapping_pk {
  type: sum_distinct
  sql: ${TABLE}.user_mapping_pk ;;
  description: "not available"
}
}
view: +core_users
measure: count_of_user_pk {
  type: count_distinct
  sql: ${TABLE}.user_pk ;;
  description: "The key to link an user to a record"
}
measure: sum_of_user_pk {
  type: sum_distinct
  sql: ${TABLE}.user_pk ;;
  description: "The key to link an user to a record"
}
}
view: +product_progression_plans
measure: count_of_progression_plan_pk {
  type: count_distinct
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
measure: sum_of_progression_plan_pk {
  type: sum_distinct
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
}
view: +product_progression_plans_history
measure: count_of_study_plan_history_pk {
  type: count_distinct
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
measure: sum_of_study_plan_history_pk {
  type: sum_distinct
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
measure: count_of_progression_plan_pk {
  type: count_distinct
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
measure: sum_of_progression_plan_pk {
  type: sum_distinct
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
}
view: +product_study_plans
measure: count_of_study_plan_pk {
  type: count_distinct
  sql: ${TABLE}.study_plan_pk ;;
  description: "The key to link a record to a study plan"
}
measure: sum_of_study_plan_pk {
  type: sum_distinct
  sql: ${TABLE}.study_plan_pk ;;
  description: "The key to link a record to a study plan"
}
}
view: +product_study_plans_history
measure: count_of_study_plan_history_pk {
  type: count_distinct
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
measure: sum_of_study_plan_history_pk {
  type: sum_distinct
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
}
view: +sales_application_agent_bridge
measure: count_of_application_agent_pk {
  type: count_distinct
  sql: ${TABLE}.application_agent_pk ;;
  description: "Unique id to link an agent with an application"
}
measure: sum_of_application_agent_pk {
  type: sum_distinct
  sql: ${TABLE}.application_agent_pk ;;
  description: "Unique id to link an agent with an application"
}
}
view: +sales_application_history
measure: count_of_application_history_pk {
  type: count_distinct
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
measure: sum_of_application_history_pk {
  type: sum_distinct
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
}
view: +sales_applications
measure: count_of_application_pk {
  type: count_distinct
  sql: ${TABLE}.application_pk ;;
  description: "Unique id for an application. Keep in mind that a student may have multiple applications"
}
measure: sum_of_application_pk {
  type: sum_distinct
  sql: ${TABLE}.application_pk ;;
  description: "Unique id for an application. Keep in mind that a student may have multiple applications"
}
}
view: +sales_applications_history
measure: count_of_application_history_pk {
  type: count_distinct
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
measure: sum_of_application_history_pk {
  type: sum_distinct
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
}
view: +sales_applications_quota
measure: count_of_application_quota_pk {
  type: count_distinct
  sql: ${TABLE}.application_quota_pk ;;
  description: "not available"
}
measure: sum_of_application_quota_pk {
  type: sum_distinct
  sql: ${TABLE}.application_quota_pk ;;
  description: "not available"
}
}
view: +sales_applications_summary
measure: count_of_application_summary_pk {
  type: count_distinct
  sql: ${TABLE}.application_summary_pk ;;
  description: "not available"
}
measure: sum_of_application_summary_pk {
  type: sum_distinct
  sql: ${TABLE}.application_summary_pk ;;
  description: "not available"
}
}
view: +sales_new_programs
measure: count_of_program_launch_pk {
  type: count_distinct
  sql: ${TABLE}.program_launch_pk ;;
  description: ""
}
measure: sum_of_program_launch_pk {
  type: sum_distinct
  sql: ${TABLE}.program_launch_pk ;;
  description: ""
}
}
view: +sales_priority_programs
measure: count_of_priority_program_pk {
  type: count_distinct
  sql: ${TABLE}.priority_program_pk ;;
  description: "not available"
}
measure: sum_of_priority_program_pk {
  type: sum_distinct
  sql: ${TABLE}.priority_program_pk ;;
  description: "not available"
}
}
view: +sales_quota_allocations
measure: count_of_quota_allocation_pk {
  type: count_distinct
  sql: ${TABLE}.quota_allocation_pk ;;
  description: "not available"
}
measure: sum_of_quota_allocation_pk {
  type: sum_distinct
  sql: ${TABLE}.quota_allocation_pk ;;
  description: "not available"
}
}
view: +sales_scholarships
measure: count_of_scholarships_pk {
  type: count_distinct
  sql: ${TABLE}.scholarships_pk ;;
  description: "not available"
}
measure: sum_of_scholarships_pk {
  type: sum_distinct
  sql: ${TABLE}.scholarships_pk ;;
  description: "not available"
}
}
view: +sales_student
measure: count_of_student_pk {
  type: count_distinct
  sql: ${TABLE}.student_pk ;;
  description: "The key to link to/indicate a certain student"
}
measure: sum_of_student_pk {
  type: sum_distinct
  sql: ${TABLE}.student_pk ;;
  description: "The key to link to/indicate a certain student"
}
}
view: +scholarship_budgets
measure: count_of_scholarship_budgets_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_budgets_pk ;;
  description: "The key to link to the scholarship budget records"
}
measure: sum_of_scholarship_budgets_pk {
  type: sum_distinct
  sql: ${TABLE}.scholarship_budgets_pk ;;
  description: "The key to link to the scholarship budget records"
}
}
view: +scholarship_targets
measure: count_of_scholarship_targets_pk {
  type: count_distinct
  sql: ${TABLE}.scholarship_targets_pk ;;
  description: "not available"
}
measure: sum_of_scholarship_targets_pk {
  type: sum_distinct
  sql: ${TABLE}.scholarship_targets_pk ;;
  description: "not available"
}
}
view: +targets_institutions
measure: count_of_institution_target_pk {
  type: count_distinct
  sql: ${TABLE}.institution_target_pk ;;
  description: "not available"
}
measure: sum_of_institution_target_pk {
  type: sum_distinct
  sql: ${TABLE}.institution_target_pk ;;
  description: "not available"
}
}
view: +targets_sales_regions
measure: count_of_sales_region_target_pk {
  type: count_distinct
  sql: ${TABLE}.sales_region_target_pk ;;
  description: "The key to link to the target sales region"
}
measure: sum_of_sales_region_target_pk {
  type: sum_distinct
  sql: ${TABLE}.sales_region_target_pk ;;
  description: "The key to link to the target sales region"
}
}

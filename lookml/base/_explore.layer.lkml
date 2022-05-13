include: "/lookml/base/_base.layer.lkml"
include: "/lookml/aggregate/_aggregate.layer.lkml"
explore: sales_applications_explore {
hidden: no
view_name: sales_applications
join: sales_quota_allocations {
  sql_on: ${sales_quota_allocations.quota_allocation_fk} = ${sales_applications_quota.quota_allocation_pk} ;;
  relationship: one_to_many
}
join: core_users {
  sql_on: ${core_users.user_fk} = ${core_user_mapping.user_pk} ;;
  relationship: one_to_one
}
join: budgets_sales_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${budgets_sales.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: sales_new_programs_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${sales_new_programs.institution_pk} ;;
  relationship: many_to_one
  from: core_institutions
}
join: product_study_plans_history_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${product_study_plans_history.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: product_progression_plans_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${product_progression_plans.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: sales_applications_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${sales_applications.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: sales_priority_programs_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${sales_priority_programs.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: targets_institutions_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${targets_institutions.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: core_programs_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${core_programs.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: product_progression_plans_history_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${product_progression_plans_history.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: sales_application_history_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${sales_application_history.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: product_study_plans_core_institutions {
  sql_on: ${core_institutions.institution_fk} = ${product_study_plans.institution_pk} ;;
  relationship: one_to_many
  from: core_institutions
}
join: sales_application_agent_bridge_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${sales_application_agent_bridge.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: product_study_plans_history_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${product_study_plans_history.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: product_progression_plans_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${product_progression_plans.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: sales_scholarships_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${sales_scholarships.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: sales_applications_history_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${sales_applications_history.application_pk} ;;
  relationship: one_to_many
  from: sales_applications
}
join: product_progression_plans_history_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${product_progression_plans_history.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: sales_applications_quota_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${sales_applications_quota.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: sales_application_history_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${sales_application_history.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: product_study_plans_sales_applications {
  sql_on: ${sales_applications.application_fk} = ${product_study_plans.application_pk} ;;
  relationship: many_to_one
  from: sales_applications
}
join: sales_applications_sales_student {
  sql_on: ${sales_student.student_fk} = ${sales_applications.student_pk} ;;
  relationship: one_to_many
  from: sales_student
}
join: sales_applications_history_sales_student {
  sql_on: ${sales_student.student_fk} = ${sales_applications_history.student_pk} ;;
  relationship: one_to_many
  from: sales_student
}
join: sales_application_history_sales_student {
  sql_on: ${sales_student.student_fk} = ${sales_application_history.student_pk} ;;
  relationship: many_to_one
  from: sales_student
}
join: core_country_mapping_core_countries {
  sql_on: ${core_countries.country_fk} = ${core_country_mapping.country_pk} ;;
  relationship: one_to_one
  from: core_countries
}
join: core_institutions_core_countries {
  sql_on: ${core_countries.country_fk} = ${core_institutions.country_pk} ;;
  relationship: many_to_one
  from: core_countries
}
join: sales_student_core_countries {
  sql_on: ${core_countries.country_fk} = ${sales_student.country_pk} ;;
  relationship: one_to_many
  from: core_countries
}
join: core_agents_core_countries {
  sql_on: ${core_countries.country_fk} = ${core_agents.country_pk} ;;
  relationship: one_to_many
  from: core_countries
}
join: core_sponsors_core_countries {
  sql_on: ${core_countries.country_fk} = ${core_sponsors.country_pk} ;;
  relationship: many_to_one
  from: core_countries
}
join: core_agents {
  sql_on: ${core_agents.agent_fk} = ${sales_application_agent_bridge.agent_pk} ;;
  relationship: one_to_many
}
join: sales_applications_core_sponsors {
  sql_on: ${core_sponsors.sponsor_fk} = ${sales_applications.sponsor_pk} ;;
  relationship: one_to_many
  from: core_sponsors
}
join: sales_applications_history_core_sponsors {
  sql_on: ${core_sponsors.sponsor_fk} = ${sales_applications_history.sponsor_pk} ;;
  relationship: one_to_many
  from: core_sponsors
}
join: sales_application_history_core_sponsors {
  sql_on: ${core_sponsors.sponsor_fk} = ${sales_application_history.sponsor_pk} ;;
  relationship: one_to_many
  from: core_sponsors
}
join: product_study_plans_history_product_study_plans {
  sql_on: ${product_study_plans.study_plan_fk} = ${product_study_plans_history.study_plan_pk} ;;
  relationship: many_to_one
  from: product_study_plans
}
join: sales_scholarships_product_study_plans {
  sql_on: ${product_study_plans.study_plan_fk} = ${sales_scholarships.study_plan_pk} ;;
  relationship: many_to_one
  from: product_study_plans
}
join: sales_applications_product_study_plans {
  sql_on: ${product_study_plans.study_plan_fk} = ${sales_applications.study_plan_pk} ;;
  relationship: one_to_many
  from: product_study_plans
}
join: product_study_plans_product_study_plans {
  sql_on: ${product_study_plans.study_plan_fk} = ${product_study_plans.study_plan_pk} ;;
  relationship: one_to_one
  from: product_study_plans
}
}

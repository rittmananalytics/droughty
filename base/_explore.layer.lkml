explore: core_agents
view_name: core_agents
join: sales_application_agent_bridge {
  sql_on: sales_application_agent_bridge.agent_fk = core_agents.agent_pk ;;
}
explore: core_countries
view_name: core_countries
join: core_country_mapping {
  sql_on: core_country_mapping.country_fk = core_countries.country_pk ;;
}
join: core_institutions {
  sql_on: core_institutions.country_fk = core_countries.country_pk ;;
}
join: sales_student {
  sql_on: sales_student.country_fk = core_countries.country_pk ;;
}
join: core_agents {
  sql_on: core_agents.country_fk = core_countries.country_pk ;;
}
join: core_sponsors {
  sql_on: core_sponsors.country_fk = core_countries.country_pk ;;
}
explore: core_institutions
view_name: core_institutions
join: product_progression_plans {
  sql_on: product_progression_plans.institution_fk = core_institutions.institution_pk ;;
}
join: core_programs {
  sql_on: core_programs.institution_fk = core_institutions.institution_pk ;;
}
join: product_study_plans {
  sql_on: product_study_plans.institution_fk = core_institutions.institution_pk ;;
}
join: sales_applications {
  sql_on: sales_applications.institution_fk = core_institutions.institution_pk ;;
}
explore: core_sponsors
view_name: core_sponsors
join: sales_applications {
  sql_on: sales_applications.sponsor_fk = core_sponsors.sponsor_pk ;;
}
explore: core_users
view_name: core_users
join: core_user_mapping {
  sql_on: core_user_mapping.user_fk = core_users.user_pk ;;
}
explore: product_study_plans
view_name: product_study_plans
join: product_study_plans {
  sql_on: product_study_plans.study_plan_fk = product_study_plans.study_plan_pk ;;
}
join: sales_applications {
  sql_on: sales_applications.study_plan_fk = product_study_plans.study_plan_pk ;;
}
explore: sales_applications
view_name: sales_applications
join: sales_application_agent_bridge {
  sql_on: sales_application_agent_bridge.application_fk = sales_applications.application_pk ;;
}
join: product_progression_plans {
  sql_on: product_progression_plans.application_fk = sales_applications.application_pk ;;
}
join: product_study_plans {
  sql_on: product_study_plans.application_fk = sales_applications.application_pk ;;
}
explore: sales_student
view_name: sales_student
join: sales_applications {
  sql_on: sales_applications.student_fk = sales_student.student_pk ;;
}

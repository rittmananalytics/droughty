explore: sales_applications
view_name: sales_applications
join: core_users {
  sql_on: core_users.user_pk = core_user_mapping.user_fk ;;
}
join: core_institutions {
  sql_on: core_institutions.institution_pk = product_progression_plans.institution_fk ;;
}
join: core_institutions {
  sql_on: core_institutions.institution_pk = core_programs.institution_fk ;;
}
join: core_institutions {
  sql_on: core_institutions.institution_pk = product_study_plans.institution_fk ;;
}
join: core_countries {
  sql_on: core_countries.country_pk = core_country_mapping.country_fk ;;
}
join: core_countries {
  sql_on: core_countries.country_pk = core_institutions.country_fk ;;
}
join: core_countries {
  sql_on: core_countries.country_pk = sales_student.country_fk ;;
}
join: core_countries {
  sql_on: core_countries.country_pk = core_agents.country_fk ;;
}
join: core_countries {
  sql_on: core_countries.country_pk = core_sponsors.country_fk ;;
}
join: core_agents {
  sql_on: core_agents.agent_pk = sales_application_agent_bridge.agent_fk ;;
}
join: product_study_plans {
  sql_on: product_study_plans.study_plan_pk = product_study_plans.study_plan_fk ;;
}
join: core_institutions {
  sql_on: core_institutions.institution_pk = sales_applications.institution_fk ;;
}
join: sales_applications {
  sql_on: sales_applications.application_pk = sales_application_agent_bridge.application_fk ;;
}
join: sales_applications {
  sql_on: sales_applications.application_pk = product_progression_plans.application_fk ;;
}
join: sales_applications {
  sql_on: sales_applications.application_pk = product_study_plans.application_fk ;;
}
join: sales_student {
  sql_on: sales_student.student_pk = sales_applications.student_fk ;;
}
join: core_sponsors {
  sql_on: core_sponsors.sponsor_pk = sales_applications.sponsor_fk ;;
}
join: product_study_plans {
  sql_on: product_study_plans.study_plan_pk = sales_applications.study_plan_fk ;;
}
relationship: study_plan_fk

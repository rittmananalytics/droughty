cube (`budgets_sales_extended`, {
sql: `select * from analytics_qa.budgets_sales`,
extends: budgets_sales,
measures: {
count_of_budget_pk:  {
  sql: `budget_pk`,
  type: `count`,
} ,
sum_of_budget_amt:  {
  sql: `budget_amt`,
  type: `sum`,
} ,
}});
cube (`core_agents_extended`, {
sql: `select * from analytics_qa.core_agents`,
extends: core_agents,
measures: {
count_of_agent_pk:  {
  sql: `agent_pk`,
  type: `count`,
} ,
sum_of_agent_natural_key:  {
  sql: `agent_natural_key`,
  type: `sum`,
} ,
sum_of_country_natural_key:  {
  sql: `country_natural_key`,
  type: `sum`,
} ,
}});
cube (`core_countries_extended`, {
sql: `select * from analytics_qa.core_countries`,
extends: core_countries,
measures: {
count_of_country_pk:  {
  sql: `country_pk`,
  type: `count`,
} ,
sum_of_country_natural_key:  {
  sql: `country_natural_key`,
  type: `sum`,
} ,
}});
cube (`core_country_mapping_extended`, {
sql: `select * from analytics_qa.core_country_mapping`,
extends: core_country_mapping,
measures: {
count_of_country_mapping_pk:  {
  sql: `country_mapping_pk`,
  type: `count`,
} ,
sum_of_country_natural_key:  {
  sql: `country_natural_key`,
  type: `sum`,
} ,
}});
cube (`core_institutions_extended`, {
sql: `select * from analytics_qa.core_institutions`,
extends: core_institutions,
measures: {
count_of_institution_pk:  {
  sql: `institution_pk`,
  type: `count`,
} ,
sum_of_institution_natural_key:  {
  sql: `institution_natural_key`,
  type: `sum`,
} ,
sum_of_country_natural_key:  {
  sql: `country_natural_key`,
  type: `sum`,
} ,
}});
cube (`core_program_intakes_extended`, {
sql: `select * from analytics_qa.core_program_intakes`,
extends: core_program_intakes,
measures: {
count_of_program_intake_pk:  {
  sql: `program_intake_pk`,
  type: `count`,
} ,
sum_of_program_intake_natural_key:  {
  sql: `program_intake_natural_key`,
  type: `sum`,
} ,
sum_of_program_natural_key:  {
  sql: `program_natural_key`,
  type: `sum`,
} ,
sum_of_program_fee:  {
  sql: `program_fee`,
  type: `sum`,
} ,
sum_of_intake_quota_exists:  {
  sql: `intake_quota_exists`,
  type: `sum`,
} ,
}});
cube (`core_programs_extended`, {
sql: `select * from analytics_qa.core_programs`,
extends: core_programs,
measures: {
count_of_program_pk:  {
  sql: `program_pk`,
  type: `count`,
} ,
sum_of_program_natural_key:  {
  sql: `program_natural_key`,
  type: `sum`,
} ,
sum_of_institution_natural_key:  {
  sql: `institution_natural_key`,
  type: `sum`,
} ,
}});
cube (`core_scholarship_reason_owners_extended`, {
sql: `select * from analytics_qa.core_scholarship_reason_owners`,
extends: core_scholarship_reason_owners,
measures: {
count_of_scholarship_reason_owner_pk:  {
  sql: `scholarship_reason_owner_pk`,
  type: `count`,
} ,
}});
cube (`core_scholarship_reasons_extended`, {
sql: `select * from analytics_qa.core_scholarship_reasons`,
extends: core_scholarship_reasons,
measures: {
count_of_scholarship_reason_pk:  {
  sql: `scholarship_reason_pk`,
  type: `count`,
} ,
}});
cube (`core_sponsors_extended`, {
sql: `select * from analytics_qa.core_sponsors`,
extends: core_sponsors,
measures: {
count_of_sponsor_pk:  {
  sql: `sponsor_pk`,
  type: `count`,
} ,
sum_of_sponsor_natural_key:  {
  sql: `sponsor_natural_key`,
  type: `sum`,
} ,
sum_of_country_natural_key:  {
  sql: `country_natural_key`,
  type: `sum`,
} ,
}});
cube (`core_subjects_extended`, {
sql: `select * from analytics_qa.core_subjects`,
extends: core_subjects,
measures: {
count_of_program_subject_pk:  {
  sql: `program_subject_pk`,
  type: `count`,
} ,
sum_of_program_natural_key:  {
  sql: `program_natural_key`,
  type: `sum`,
} ,
}});
cube (`core_user_mapping_extended`, {
sql: `select * from analytics_qa.core_user_mapping`,
extends: core_user_mapping,
measures: {
count_of_user_mapping_pk:  {
  sql: `user_mapping_pk`,
  type: `count`,
} ,
}});
cube (`core_users_extended`, {
sql: `select * from analytics_qa.core_users`,
extends: core_users,
measures: {
count_of_user_pk:  {
  sql: `user_pk`,
  type: `count`,
} ,
}});
cube (`product_progression_plans_extended`, {
sql: `select * from analytics_qa.product_progression_plans`,
extends: product_progression_plans,
measures: {
count_of_progression_plan_pk:  {
  sql: `progression_plan_pk`,
  type: `count`,
} ,
sum_of_institution_natural_key:  {
  sql: `institution_natural_key`,
  type: `sum`,
} ,
sum_of_progression_plan_program_natural_key:  {
  sql: `progression_plan_program_natural_key`,
  type: `sum`,
} ,
sum_of_version_number:  {
  sql: `version_number`,
  type: `sum`,
} ,
}});
cube (`product_progression_plans_history_extended`, {
sql: `select * from analytics_qa.product_progression_plans_history`,
extends: product_progression_plans_history,
measures: {
count_of_study_plan_history_pk:  {
  sql: `study_plan_history_pk`,
  type: `count`,
} ,
count_of_progression_plan_pk:  {
  sql: `progression_plan_pk`,
  type: `count`,
} ,
sum_of_institution_natural_key:  {
  sql: `institution_natural_key`,
  type: `sum`,
} ,
sum_of_progression_plan_program_natural_key:  {
  sql: `progression_plan_program_natural_key`,
  type: `sum`,
} ,
sum_of_progression_plan_version_number:  {
  sql: `progression_plan_version_number`,
  type: `sum`,
} ,
sum_of_progression_plan_index:  {
  sql: `progression_plan_index`,
  type: `sum`,
} ,
}});
cube (`product_study_plans_extended`, {
sql: `select * from analytics_qa.product_study_plans`,
extends: product_study_plans,
measures: {
count_of_study_plan_pk:  {
  sql: `study_plan_pk`,
  type: `count`,
} ,
sum_of_study_plan_natural_key:  {
  sql: `study_plan_natural_key`,
  type: `sum`,
} ,
sum_of_institution_natural_key:  {
  sql: `institution_natural_key`,
  type: `sum`,
} ,
sum_of_study_plan_program_natural_key:  {
  sql: `study_plan_program_natural_key`,
  type: `sum`,
} ,
sum_of_version_number:  {
  sql: `version_number`,
  type: `sum`,
} ,
}});
cube (`product_study_plans_history_extended`, {
sql: `select * from analytics_qa.product_study_plans_history`,
extends: product_study_plans_history,
measures: {
count_of_study_plan_history_pk:  {
  sql: `study_plan_history_pk`,
  type: `count`,
} ,
sum_of_study_plan_natural_key:  {
  sql: `study_plan_natural_key`,
  type: `sum`,
} ,
sum_of_institution_natural_key:  {
  sql: `institution_natural_key`,
  type: `sum`,
} ,
sum_of_study_plan_program_natural_key:  {
  sql: `study_plan_program_natural_key`,
  type: `sum`,
} ,
sum_of_study_plan_version_number:  {
  sql: `study_plan_version_number`,
  type: `sum`,
} ,
sum_of_study_plan_index:  {
  sql: `study_plan_index`,
  type: `sum`,
} ,
}});
cube (`sales_application_agent_bridge_extended`, {
sql: `select * from analytics_qa.sales_application_agent_bridge`,
extends: sales_application_agent_bridge,
measures: {
count_of_application_agent_pk:  {
  sql: `application_agent_pk`,
  type: `count`,
} ,
}});
cube (`sales_application_history_extended`, {
sql: `select * from analytics_qa.sales_application_history`,
extends: sales_application_history,
measures: {
count_of_application_history_pk:  {
  sql: `application_history_pk`,
  type: `count`,
} ,
sum_of_study_plan_version_number:  {
  sql: `study_plan_version_number`,
  type: `sum`,
} ,
sum_of_applications:  {
  sql: `applications`,
  type: `sum`,
} ,
sum_of_offers:  {
  sql: `offers`,
  type: `sum`,
} ,
sum_of_deposits:  {
  sql: `deposits`,
  type: `sum`,
} ,
sum_of_enrolled:  {
  sql: `enrolled`,
  type: `sum`,
} ,
sum_of_lost:  {
  sql: `lost`,
  type: `sum`,
} ,
sum_of_change_count:  {
  sql: `change_count`,
  type: `sum`,
} ,
}});
cube (`sales_applications_extended`, {
sql: `select * from analytics_qa.sales_applications`,
extends: sales_applications,
measures: {
count_of_application_pk:  {
  sql: `application_pk`,
  type: `count`,
} ,
sum_of_application_natural_key:  {
  sql: `application_natural_key`,
  type: `sum`,
} ,
sum_of_sponsor_natural_key:  {
  sql: `sponsor_natural_key`,
  type: `sum`,
} ,
sum_of_class_application_id:  {
  sql: `class_application_id`,
  type: `sum`,
} ,
sum_of_weighting:  {
  sql: `weighting`,
  type: `sum`,
} ,
sum_of_weighting_non_deferred:  {
  sql: `weighting_non_deferred`,
  type: `sum`,
} ,
}});
cube (`sales_applications_history_extended`, {
sql: `select * from analytics_qa.sales_applications_history`,
extends: sales_applications_history,
measures: {
count_of_application_history_pk:  {
  sql: `application_history_pk`,
  type: `count`,
} ,
sum_of_application_natural_key:  {
  sql: `application_natural_key`,
  type: `sum`,
} ,
sum_of_sponsor_natural_key:  {
  sql: `sponsor_natural_key`,
  type: `sum`,
} ,
sum_of_class_application_id:  {
  sql: `class_application_id`,
  type: `sum`,
} ,
sum_of_application_index:  {
  sql: `application_index`,
  type: `sum`,
} ,
sum_of_application_status_duration_seconds:  {
  sql: `application_status_duration_seconds`,
  type: `sum`,
} ,
sum_of_application_weight:  {
  sql: `application_weight`,
  type: `sum`,
} ,
}});
cube (`sales_applications_quota_extended`, {
sql: `select * from analytics_qa.sales_applications_quota`,
extends: sales_applications_quota,
measures: {
count_of_application_quota_pk:  {
  sql: `application_quota_pk`,
  type: `count`,
} ,
}});
cube (`sales_applications_summary_extended`, {
sql: `select * from analytics_qa.sales_applications_summary`,
extends: sales_applications_summary,
measures: {
count_of_application_summary_pk:  {
  sql: `application_summary_pk`,
  type: `count`,
} ,
sum_of_sales_applications_application_count:  {
  sql: `sales_applications_application_count`,
  type: `sum`,
} ,
sum_of_sales_applications_unweighted_offer_count:  {
  sql: `sales_applications_unweighted_offer_count`,
  type: `sum`,
} ,
sum_of_sales_applications_application_offer_count:  {
  sql: `sales_applications_application_offer_count`,
  type: `sum`,
} ,
sum_of_sales_applications_unconverted_application_count:  {
  sql: `sales_applications_unconverted_application_count`,
  type: `sum`,
} ,
sum_of_sales_applications_application_count_non_deferred:  {
  sql: `sales_applications_application_count_non_deferred`,
  type: `sum`,
} ,
sum_of_sales_applications_application_offer_count_non_deferred:  {
  sql: `sales_applications_application_offer_count_non_deferred`,
  type: `sum`,
} ,
sum_of_sales_applications_unconverted_application_count_non_deferred:  {
  sql: `sales_applications_unconverted_application_count_non_deferred`,
  type: `sum`,
} ,
sum_of_sales_applications_application_deposit_count:  {
  sql: `sales_applications_application_deposit_count`,
  type: `sum`,
} ,
sum_of_sales_applications_application_enrolled_count:  {
  sql: `sales_applications_application_enrolled_count`,
  type: `sum`,
} ,
sum_of_sales_applications_enrollments_and_deposit_count:  {
  sql: `sales_applications_enrollments_and_deposit_count`,
  type: `sum`,
} ,
}});
cube (`sales_new_programs_extended`, {
sql: `select * from analytics_qa.sales_new_programs`,
extends: sales_new_programs,
measures: {
count_of_program_launch_pk:  {
  sql: `program_launch_pk`,
  type: `count`,
} ,
}});
cube (`sales_priority_programs_extended`, {
sql: `select * from analytics_qa.sales_priority_programs`,
extends: sales_priority_programs,
measures: {
count_of_priority_program_pk:  {
  sql: `priority_program_pk`,
  type: `count`,
} ,
}});
cube (`sales_quota_allocations_extended`, {
sql: `select * from analytics_qa.sales_quota_allocations`,
extends: sales_quota_allocations,
measures: {
count_of_quota_allocation_pk:  {
  sql: `quota_allocation_pk`,
  type: `count`,
} ,
sum_of_quota_year:  {
  sql: `quota_year`,
  type: `sum`,
} ,
sum_of_deposits_amt:  {
  sql: `deposits_amt`,
  type: `sum`,
} ,
sum_of_cas_enrolment_amt:  {
  sql: `cas_enrolment_amt`,
  type: `sum`,
} ,
sum_of_progression_amt:  {
  sql: `progression_amt`,
  type: `sum`,
} ,
}});
cube (`sales_scholarships_extended`, {
sql: `select * from analytics_qa.sales_scholarships`,
extends: sales_scholarships,
measures: {
count_of_scholarships_pk:  {
  sql: `scholarships_pk`,
  type: `count`,
} ,
sum_of_student_ledger_sop_line_item_actual_amount:  {
  sql: `student_ledger_sop_line_item_actual_amount`,
  type: `sum`,
} ,
}});
cube (`sales_student_extended`, {
sql: `select * from analytics_qa.sales_student`,
extends: sales_student,
measures: {
count_of_student_pk:  {
  sql: `student_pk`,
  type: `count`,
} ,
sum_of_country_natural_key:  {
  sql: `country_natural_key`,
  type: `sum`,
} ,
}});
cube (`scholarship_budgets_extended`, {
sql: `select * from analytics_qa.scholarship_budgets`,
extends: scholarship_budgets,
measures: {
count_of_scholarship_budgets_pk:  {
  sql: `scholarship_budgets_pk`,
  type: `count`,
} ,
sum_of_budget_amt:  {
  sql: `budget_amt`,
  type: `sum`,
} ,
}});
cube (`scholarship_targets_extended`, {
sql: `select * from analytics_qa.scholarship_targets`,
extends: scholarship_targets,
measures: {
count_of_scholarship_targets_pk:  {
  sql: `scholarship_targets_pk`,
  type: `count`,
} ,
sum_of_target_amt:  {
  sql: `target_amt`,
  type: `sum`,
} ,
sum_of_budget_amt:  {
  sql: `budget_amt`,
  type: `sum`,
} ,
}});
cube (`targets_institutions_extended`, {
sql: `select * from analytics_qa.targets_institutions`,
extends: targets_institutions,
measures: {
count_of_institution_target_pk:  {
  sql: `institution_target_pk`,
  type: `count`,
} ,
sum_of_target_amt:  {
  sql: `target_amt`,
  type: `sum`,
} ,
}});
cube (`targets_sales_regions_extended`, {
sql: `select * from analytics_qa.targets_sales_regions`,
extends: targets_sales_regions,
measures: {
count_of_sales_region_target_pk:  {
  sql: `sales_region_target_pk`,
  type: `count`,
} ,
sum_of_target_amt:  {
  sql: `target_amt`,
  type: `sum`,
} ,
}});

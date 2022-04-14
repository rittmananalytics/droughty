cube (`core_agents`, {
sql: `select * from analytics_qa.core_agents`,
joins : {
sales_application_agent_bridge:  {
  relationship: `one_to_many`,
  sql: `${CUBE.agent_pk} = ${sales_application_agent_bridge.agent_fk}`,
} ,
},
dimensions: {
agent_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `agent_pk`,
  description: `The key and link to an agent`,
} ,
country_fk:  {
  sql: `country_fk`,
  type: `string`,
} ,
agent_salesforce_business_key:  {
  sql: `agent_salesforce_business_key`,
  type: `string`,
} ,
name:  {
  sql: `name`,
  type: `string`,
} ,
group:  {
  sql: `group`,
  type: `string`,
} ,
status:  {
  sql: `status`,
  type: `string`,
} ,
sales_channel:  {
  sql: `sales_channel`,
  type: `string`,
} ,
uk_based_agent:  {
  sql: `uk_based_agent`,
  type: `boolean`,
} ,
}});
cube (`core_countries`, {
sql: `select * from analytics_qa.core_countries`,
joins : {
core_country_mapping:  {
  relationship: `one_to_one`,
  sql: `${CUBE.country_pk} = ${core_country_mapping.country_fk}`,
} ,
core_institutions:  {
  relationship: `many_to_one`,
  sql: `${CUBE.country_pk} = ${core_institutions.country_fk}`,
} ,
sales_student:  {
  relationship: `one_to_many`,
  sql: `${CUBE.country_pk} = ${sales_student.country_fk}`,
} ,
core_agents:  {
  relationship: `one_to_many`,
  sql: `${CUBE.country_pk} = ${core_agents.country_fk}`,
} ,
core_sponsors:  {
  relationship: `many_to_one`,
  sql: `${CUBE.country_pk} = ${core_sponsors.country_fk}`,
} ,
},
dimensions: {
country_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `country_pk`,
  description: `The key and link to a country`,
} ,
country:  {
  sql: `country`,
  type: `string`,
} ,
country_iso_key:  {
  sql: `country_iso_key`,
  type: `string`,
} ,
salesforce_country_key:  {
  sql: `salesforce_country_key`,
  type: `string`,
} ,
country_nationality:  {
  sql: `country_nationality`,
  type: `string`,
} ,
country_is_sanctioned:  {
  sql: `country_is_sanctioned`,
  type: `boolean`,
} ,
}});
cube (`core_institutions`, {
sql: `select * from analytics_qa.core_institutions`,
joins : {
product_progression_plans:  {
  relationship: `one_to_many`,
  sql: `${CUBE.institution_pk} = ${product_progression_plans.institution_fk}`,
} ,
core_programs:  {
  relationship: `one_to_many`,
  sql: `${CUBE.institution_pk} = ${core_programs.institution_fk}`,
} ,
product_study_plans:  {
  relationship: `one_to_many`,
  sql: `${CUBE.institution_pk} = ${product_study_plans.institution_fk}`,
} ,
sales_applications:  {
  relationship: `one_to_many`,
  sql: `${CUBE.institution_pk} = ${sales_applications.institution_fk}`,
} ,
},
dimensions: {
institution_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `institution_pk`,
  description: `The key and link to an institution`,
} ,
country_fk:  {
  sql: `country_fk`,
  type: `string`,
} ,
institution_type:  {
  sql: `institution_type`,
  type: `string`,
} ,
institution_code:  {
  sql: `institution_code`,
  type: `string`,
} ,
institution_name:  {
  sql: `institution_name`,
  type: `string`,
} ,
institution_group:  {
  sql: `institution_group`,
  type: `string`,
} ,
}});
cube (`core_sponsors`, {
sql: `select * from analytics_qa.core_sponsors`,
joins : {
sales_applications:  {
  relationship: `one_to_many`,
  sql: `${CUBE.sponsor_pk} = ${sales_applications.sponsor_fk}`,
} ,
},
dimensions: {
sponsor_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `sponsor_pk`,
  description: `The key to link a sponsor to a certain record`,
} ,
country_fk:  {
  sql: `country_fk`,
  type: `string`,
} ,
sponsor_salesforce_business_key:  {
  sql: `sponsor_salesforce_business_key`,
  type: `string`,
} ,
name:  {
  sql: `name`,
  type: `string`,
} ,
group:  {
  sql: `group`,
  type: `string`,
} ,
status:  {
  sql: `status`,
  type: `string`,
} ,
uk_sponsor:  {
  sql: `uk_sponsor`,
  type: `boolean`,
} ,
}});
cube (`core_users`, {
sql: `select * from analytics_qa.core_users`,
joins : {
core_user_mapping:  {
  relationship: `one_to_one`,
  sql: `${CUBE.user_pk} = ${core_user_mapping.user_fk}`,
} ,
},
dimensions: {
user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `user_pk`,
  description: `The key to link an user to a record`,
} ,
user_natural_key:  {
  sql: `user_natural_key`,
  type: `string`,
} ,
name:  {
  sql: `name`,
  type: `string`,
} ,
sales_region:  {
  sql: `sales_region`,
  type: `string`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
} ,
}});
cube (`product_study_plans`, {
sql: `select * from analytics_qa.product_study_plans`,
joins : {
product_study_plans:  {
  relationship: `one_to_one`,
  sql: `${CUBE.study_plan_pk} = ${product_study_plans.study_plan_fk}`,
} ,
sales_applications:  {
  relationship: `one_to_many`,
  sql: `${CUBE.study_plan_pk} = ${sales_applications.study_plan_fk}`,
} ,
},
dimensions: {
study_plan_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `study_plan_pk`,
  description: `The key to link a record to a study plan`,
} ,
study_plan_fk:  {
  sql: `study_plan_fk`,
  type: `string`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
} ,
study_plan_program_intake_fk:  {
  sql: `study_plan_program_intake_fk`,
  type: `string`,
} ,
study_plan_program_fk:  {
  sql: `study_plan_program_fk`,
  type: `string`,
} ,
entry_type_code:  {
  sql: `entry_type_code`,
  type: `string`,
} ,
course_code:  {
  sql: `course_code`,
  type: `string`,
} ,
course_name:  {
  sql: `course_name`,
  type: `string`,
} ,
intake_date:  {
  sql: `intake_date`,
  type: `time`,
} ,
intake_season:  {
  sql: `intake_season`,
  type: `string`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
} ,
intake_academic_year:  {
  sql: `intake_academic_year`,
  type: `string`,
} ,
entry_level:  {
  sql: `entry_level`,
  type: `string`,
} ,
enrolment:  {
  sql: `enrolment`,
  type: `time`,
} ,
course_start:  {
  sql: `course_start`,
  type: `time`,
} ,
course_end:  {
  sql: `course_end`,
  type: `time`,
} ,
teaching_end:  {
  sql: `teaching_end`,
  type: `time`,
} ,
teaching_start:  {
  sql: `teaching_start`,
  type: `time`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
} ,
is_current_version:  {
  sql: `is_current_version`,
  type: `boolean`,
} ,
has_deferred:  {
  sql: `has_deferred`,
  type: `boolean`,
} ,
is_deferred:  {
  sql: `is_deferred`,
  type: `boolean`,
} ,
}});
cube (`product_study_plans_history`, {
sql: `select * from analytics_qa.product_study_plans_history`,
joins : {
product_study_plans:  {
  relationship: `one_to_one`,
  sql: `${CUBE.study_plan_pk} = ${product_study_plans.study_plan_fk}`,
} ,
sales_applications:  {
  relationship: `one_to_many`,
  sql: `${CUBE.study_plan_pk} = ${sales_applications.study_plan_fk}`,
} ,
},
dimensions: {
study_plan_history_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `study_plan_history_pk`,
  description: `The key to link a record to the study plan history record`,
} ,
pathway_sk:  {
  sql: `pathway_sk`,
  type: `string`,
} ,
study_plan_fk:  {
  sql: `study_plan_fk`,
  type: `string`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
} ,
study_plan_program_intake_fk:  {
  sql: `study_plan_program_intake_fk`,
  type: `string`,
} ,
study_plan_program_fk:  {
  sql: `study_plan_program_fk`,
  type: `string`,
} ,
study_plan_track_entry_type_code:  {
  sql: `study_plan_track_entry_type_code`,
  type: `string`,
} ,
study_plan_program_code:  {
  sql: `study_plan_program_code`,
  type: `string`,
} ,
study_plan_program_name:  {
  sql: `study_plan_program_name`,
  type: `string`,
} ,
study_plan_intake_date:  {
  sql: `study_plan_intake_date`,
  type: `time`,
} ,
study_plan_intake_season:  {
  sql: `study_plan_intake_season`,
  type: `string`,
} ,
study_plan_program_entry_level:  {
  sql: `study_plan_program_entry_level`,
  type: `string`,
} ,
enrolment_date:  {
  sql: `enrolment_date`,
  type: `time`,
} ,
study_plan_program_start_date:  {
  sql: `study_plan_program_start_date`,
  type: `time`,
} ,
study_plan_program_end_date:  {
  sql: `study_plan_program_end_date`,
  type: `time`,
} ,
study_plan_teaching_end_date:  {
  sql: `study_plan_teaching_end_date`,
  type: `time`,
} ,
study_plan_teaching_start_date:  {
  sql: `study_plan_teaching_start_date`,
  type: `time`,
} ,
study_plan_created_at:  {
  sql: `study_plan_created_at`,
  type: `time`,
} ,
study_plan_modified_at:  {
  sql: `study_plan_modified_at`,
  type: `time`,
} ,
study_plan_valid_from:  {
  sql: `study_plan_valid_from`,
  type: `time`,
} ,
study_plan_valid_to:  {
  sql: `study_plan_valid_to`,
  type: `time`,
} ,
is_current_study_plan_record:  {
  sql: `is_current_study_plan_record`,
  type: `boolean`,
} ,
has_deferred:  {
  sql: `has_deferred`,
  type: `string`,
} ,
}});
cube (`sales_applications`, {
sql: `select * from analytics_qa.sales_applications`,
joins : {
sales_application_agent_bridge:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
product_study_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_study_plans.application_fk}`,
} ,
},
dimensions: {
study_plan_fk:  {
  sql: `study_plan_fk`,
  type: `string`,
} ,
application_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `application_pk`,
  description: `Unique id for an application. Keep in mind that a student may have multiple applications`,
} ,
student_fk:  {
  sql: `student_fk`,
  type: `string`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
} ,
sales_manager_fk:  {
  sql: `sales_manager_fk`,
  type: `string`,
} ,
application_owner_fk:  {
  sql: `application_owner_fk`,
  type: `string`,
} ,
cas_team_owner_fk:  {
  sql: `cas_team_owner_fk`,
  type: `string`,
} ,
sponsor_fk:  {
  sql: `sponsor_fk`,
  type: `string`,
} ,
student_natural_key:  {
  sql: `student_natural_key`,
  type: `string`,
} ,
sales_manager_natural_key:  {
  sql: `sales_manager_natural_key`,
  type: `string`,
} ,
application_owner_natural_key:  {
  sql: `application_owner_natural_key`,
  type: `string`,
} ,
cas_team_owner_natural_key:  {
  sql: `cas_team_owner_natural_key`,
  type: `string`,
} ,
salesforce_opportunity_natural_key:  {
  sql: `salesforce_opportunity_natural_key`,
  type: `string`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
} ,
status_update:  {
  sql: `status_update`,
  type: `time`,
} ,
intake_date:  {
  sql: `intake_date`,
  type: `time`,
} ,
payment_status:  {
  sql: `payment_status`,
  type: `string`,
} ,
immigration_category:  {
  sql: `immigration_category`,
  type: `string`,
} ,
learning_mode:  {
  sql: `learning_mode`,
  type: `string`,
} ,
returning_student:  {
  sql: `returning_student`,
  type: `string`,
} ,
accommodation_required:  {
  sql: `accommodation_required`,
  type: `string`,
} ,
sponsor_reference:  {
  sql: `sponsor_reference`,
  type: `string`,
} ,
is_offer_letter_issued:  {
  sql: `is_offer_letter_issued`,
  type: `boolean`,
} ,
is_acceptance_form_issued:  {
  sql: `is_acceptance_form_issued`,
  type: `boolean`,
} ,
is_visa_needed:  {
  sql: `is_visa_needed`,
  type: `boolean`,
} ,
is_application_submitted:  {
  sql: `is_application_submitted`,
  type: `boolean`,
} ,
is_application_completed:  {
  sql: `is_application_completed`,
  type: `boolean`,
} ,
is_confirmation_required:  {
  sql: `is_confirmation_required`,
  type: `boolean`,
} ,
has_second_agent:  {
  sql: `has_second_agent`,
  type: `boolean`,
} ,
has_deferred:  {
  sql: `has_deferred`,
  type: `string`,
} ,
status:  {
  sql: `status`,
  type: `string`,
} ,
status_group:  {
  sql: `status_group`,
  type: `string`,
} ,
is_deferred:  {
  sql: `is_deferred`,
  type: `boolean`,
} ,
}});
cube (`sales_applications_history`, {
sql: `select * from analytics_qa.sales_applications_history`,
joins : {
sales_application_agent_bridge:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
product_study_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_study_plans.application_fk}`,
} ,
},
dimensions: {
application_history_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `application_history_pk`,
  description: `not available`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
} ,
student_fk:  {
  sql: `student_fk`,
  type: `string`,
} ,
sales_manager_fk:  {
  sql: `sales_manager_fk`,
  type: `string`,
} ,
application_owner_fk:  {
  sql: `application_owner_fk`,
  type: `string`,
} ,
cas_team_owner_fk:  {
  sql: `cas_team_owner_fk`,
  type: `string`,
} ,
sponsor_fk:  {
  sql: `sponsor_fk`,
  type: `string`,
} ,
student_natural_key:  {
  sql: `student_natural_key`,
  type: `string`,
} ,
sales_manager_natural_key:  {
  sql: `sales_manager_natural_key`,
  type: `string`,
} ,
application_owner_natural_key:  {
  sql: `application_owner_natural_key`,
  type: `string`,
} ,
cas_team_owner_natural_key:  {
  sql: `cas_team_owner_natural_key`,
  type: `string`,
} ,
salesforce_opportunity_natural_key:  {
  sql: `salesforce_opportunity_natural_key`,
  type: `string`,
} ,
created_ts:  {
  sql: `created_ts`,
  type: `time`,
} ,
modified_ts:  {
  sql: `modified_ts`,
  type: `time`,
} ,
application_status_log_created_ts:  {
  sql: `application_status_log_created_ts`,
  type: `time`,
} ,
application_status:  {
  sql: `application_status`,
  type: `string`,
} ,
application_status_group:  {
  sql: `application_status_group`,
  type: `string`,
} ,
payment_status:  {
  sql: `payment_status`,
  type: `string`,
} ,
immigration_category:  {
  sql: `immigration_category`,
  type: `string`,
} ,
learning_mode:  {
  sql: `learning_mode`,
  type: `string`,
} ,
returning_student:  {
  sql: `returning_student`,
  type: `string`,
} ,
accommodation_required:  {
  sql: `accommodation_required`,
  type: `string`,
} ,
sponsor_reference:  {
  sql: `sponsor_reference`,
  type: `string`,
} ,
is_offer_letter_issued:  {
  sql: `is_offer_letter_issued`,
  type: `boolean`,
} ,
is_acceptance_form_issued:  {
  sql: `is_acceptance_form_issued`,
  type: `boolean`,
} ,
is_visa_needed:  {
  sql: `is_visa_needed`,
  type: `boolean`,
} ,
is_application_submitted:  {
  sql: `is_application_submitted`,
  type: `boolean`,
} ,
is_application_completed:  {
  sql: `is_application_completed`,
  type: `boolean`,
} ,
is_confirmation_required:  {
  sql: `is_confirmation_required`,
  type: `boolean`,
} ,
has_second_agent:  {
  sql: `has_second_agent`,
  type: `boolean`,
} ,
old_title:  {
  sql: `old_title`,
  type: `string`,
} ,
new_title:  {
  sql: `new_title`,
  type: `string`,
} ,
application_valid_from:  {
  sql: `application_valid_from`,
  type: `time`,
} ,
application_valid_to:  {
  sql: `application_valid_to`,
  type: `time`,
} ,
is_current_application_record:  {
  sql: `is_current_application_record`,
  type: `boolean`,
} ,
}});
cube (`sales_applications_quota`, {
sql: `select * from analytics_qa.sales_applications_quota`,
joins : {
sales_application_agent_bridge:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
product_study_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_study_plans.application_fk}`,
} ,
},
dimensions: {
application_quota_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `application_quota_pk`,
  description: `not available`,
} ,
quota_allocation_fk:  {
  sql: `quota_allocation_fk`,
  type: `string`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
} ,
degree_name:  {
  sql: `degree_name`,
  type: `string`,
} ,
application_status_group:  {
  sql: `application_status_group`,
  type: `string`,
} ,
}});
cube (`sales_applications_summary`, {
sql: `select * from analytics_qa.sales_applications_summary`,
joins : {
sales_application_agent_bridge:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
product_study_plans:  {
  relationship: `many_to_one`,
  sql: `${CUBE.application_pk} = ${product_study_plans.application_fk}`,
} ,
},
dimensions: {
application_summary_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `application_summary_pk`,
  description: `not available`,
} ,
}});
cube (`sales_student`, {
sql: `select * from analytics_qa.sales_student`,
joins : {
sales_applications:  {
  relationship: `one_to_many`,
  sql: `${CUBE.student_pk} = ${sales_applications.student_fk}`,
} ,
},
dimensions: {
student_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `student_pk`,
  description: `The key to link to/indicate a certain student`,
} ,
country_fk:  {
  sql: `country_fk`,
  type: `string`,
} ,
nationality_fk:  {
  sql: `nationality_fk`,
  type: `string`,
} ,
student_natural_key:  {
  sql: `student_natural_key`,
  type: `string`,
} ,
kss_student_id:  {
  sql: `kss_student_id`,
  type: `string`,
} ,
class_student_id:  {
  sql: `class_student_id`,
  type: `string`,
} ,
student_salesforce_natural_key:  {
  sql: `student_salesforce_natural_key`,
  type: `string`,
} ,
name:  {
  sql: `name`,
  type: `string`,
} ,
gender:  {
  sql: `gender`,
  type: `string`,
} ,
country_iso_key:  {
  sql: `country_iso_key`,
  type: `string`,
} ,
source:  {
  sql: `source`,
  type: `string`,
} ,
nationality:  {
  sql: `nationality`,
  type: `string`,
} ,
dob:  {
  sql: `dob`,
  type: `time`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
} ,
}});

cube (`core_agents`, {
sql: `select * from analytics_qa.core_agents`,
joins : {
sales_application_agent_bridge:  {
  relationship: `hasMany`,
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
  description: `The key and link to a country`,
} ,
agent_salesforce_business_key:  {
  sql: `agent_salesforce_business_key`,
  type: `string`,
  description: `The key and link to an agent based salesforce record`,
} ,
name:  {
  sql: `name`,
  type: `string`,
  description: `The name of the agent`,
} ,
group:  {
  sql: `group`,
  type: `string`,
  description: `The agent group which the agent belongs too`,
} ,
status:  {
  sql: `status`,
  type: `string`,
  description: `The status of the agent`,
} ,
sales_channel:  {
  sql: `sales_channel`,
  type: `string`,
  description: `The sales channel which the agent belongs to`,
} ,
uk_based_agent:  {
  sql: `uk_based_agent`,
  type: `boolean`,
  description: `Confirms if the agent is UK based`,
} ,
}});
cube (`core_countries`, {
sql: `select * from analytics_qa.core_countries`,
joins : {
core_country_mapping:  {
  relationship: `HasOne`,
  sql: `${CUBE.country_pk} = ${core_country_mapping.country_fk}`,
} ,
core_institutions:  {
  relationship: `belongsTo`,
  sql: `${CUBE.country_pk} = ${core_institutions.country_fk}`,
} ,
sales_student:  {
  relationship: `hasMany`,
  sql: `${CUBE.country_pk} = ${sales_student.country_fk}`,
} ,
core_agents:  {
  relationship: `hasMany`,
  sql: `${CUBE.country_pk} = ${core_agents.country_fk}`,
} ,
core_sponsors:  {
  relationship: `belongsTo`,
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
  description: `The name of the country`,
} ,
country_iso_key:  {
  sql: `country_iso_key`,
  type: `string`,
  description: `An abbreviation for the names of countries (United States Of America = USA, etc)`,
} ,
salesforce_country_key:  {
  sql: `salesforce_country_key`,
  type: `string`,
  description: `The key and link to the salesforce country record`,
} ,
country_nationality:  {
  sql: `country_nationality`,
  type: `string`,
  description: `The nationality for the country`,
} ,
country_is_sanctioned:  {
  sql: `country_is_sanctioned`,
  type: `boolean`,
  description: `Confirms if the country is sanctioned`,
} ,
}});
cube (`core_institutions`, {
sql: `select * from analytics_qa.core_institutions`,
joins : {
budgets_sales:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${budgets_sales.institution_fk}`,
} ,
sales_new_programs:  {
  relationship: `belongsTo`,
  sql: `${CUBE.institution_pk} = ${sales_new_programs.institution_fk}`,
} ,
product_study_plans_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${product_study_plans_history.institution_fk}`,
} ,
product_progression_plans:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${product_progression_plans.institution_fk}`,
} ,
sales_applications:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${sales_applications.institution_fk}`,
} ,
sales_priority_programs:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${sales_priority_programs.institution_fk}`,
} ,
targets_institutions:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${targets_institutions.institution_fk}`,
} ,
core_programs:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${core_programs.institution_fk}`,
} ,
product_progression_plans_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${product_progression_plans_history.institution_fk}`,
} ,
sales_application_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${sales_application_history.institution_fk}`,
} ,
product_study_plans:  {
  relationship: `hasMany`,
  sql: `${CUBE.institution_pk} = ${product_study_plans.institution_fk}`,
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
  description: `The key and link to a country`,
} ,
institution_type:  {
  sql: `institution_type`,
  type: `string`,
  description: `The type of institution (college or university)`,
} ,
institution_code:  {
  sql: `institution_code`,
  type: `string`,
  description: `The code to indicate what type of institution it is`,
} ,
institution_name:  {
  sql: `institution_name`,
  type: `string`,
  description: `The name of the institution`,
} ,
institution_group:  {
  sql: `institution_group`,
  type: `string`,
  description: `The institution group the institution belongs to`,
} ,
}});
cube (`core_sponsors`, {
sql: `select * from analytics_qa.core_sponsors`,
joins : {
sales_applications:  {
  relationship: `hasMany`,
  sql: `${CUBE.sponsor_pk} = ${sales_applications.sponsor_fk}`,
} ,
sales_applications_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.sponsor_pk} = ${sales_applications_history.sponsor_fk}`,
} ,
sales_application_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.sponsor_pk} = ${sales_application_history.sponsor_fk}`,
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
  description: `The key to link a country to a certain record`,
} ,
sponsor_salesforce_business_key:  {
  sql: `sponsor_salesforce_business_key`,
  type: `string`,
  description: `The key to link a record to a sponsor salesforce business records`,
} ,
name:  {
  sql: `name`,
  type: `string`,
  description: `The name of the sponsor`,
} ,
group:  {
  sql: `group`,
  type: `string`,
  description: `The group which the sponsor belongs to`,
} ,
status:  {
  sql: `status`,
  type: `string`,
  description: `The status of the sponsor (active, suspended, etc)`,
} ,
uk_sponsor:  {
  sql: `uk_sponsor`,
  type: `boolean`,
  description: `Confirms if the sponsor is based in the UK`,
} ,
}});
cube (`core_users`, {
sql: `select * from analytics_qa.core_users`,
joins : {
core_user_mapping:  {
  relationship: `HasOne`,
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
  description: `The key to link an user to a record`,
} ,
name:  {
  sql: `name`,
  type: `string`,
  description: `The name of the applicant/user`,
} ,
sales_region:  {
  sql: `sales_region`,
  type: `string`,
  description: `The sales region which the user is based`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
  description: `The sales region group which the user is based under`,
} ,
}});
cube (`product_study_plans`, {
sql: `select * from analytics_qa.product_study_plans`,
joins : {
product_study_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.study_plan_pk} = ${product_study_plans_history.study_plan_fk}`,
} ,
sales_scholarships:  {
  relationship: `belongsTo`,
  sql: `${CUBE.study_plan_pk} = ${sales_scholarships.study_plan_fk}`,
} ,
sales_applications:  {
  relationship: `hasMany`,
  sql: `${CUBE.study_plan_pk} = ${sales_applications.study_plan_fk}`,
} ,
product_study_plans:  {
  relationship: `HasOne`,
  sql: `${CUBE.study_plan_pk} = ${product_study_plans.study_plan_fk}`,
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
  description: `The key to link a record to a study plan`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
  description: `The key to link a record to an application`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `The key to link a record to an institution`,
} ,
study_plan_program_intake_fk:  {
  sql: `study_plan_program_intake_fk`,
  type: `string`,
  description: `The key to link a record to a study plan's program intake`,
} ,
study_plan_program_fk:  {
  sql: `study_plan_program_fk`,
  type: `string`,
  description: `The key to link a record to a study plan's program`,
} ,
entry_type_code:  {
  sql: `entry_type_code`,
  type: `string`,
  description: `The code to indicate how the applicant had entry to the study plan`,
} ,
course_code:  {
  sql: `course_code`,
  type: `string`,
  description: `The code to link a record to the course`,
} ,
course_name:  {
  sql: `course_name`,
  type: `string`,
  description: `The name of the study plan course`,
} ,
intake_date:  {
  sql: `intake_date`,
  type: `time`,
  description: `The intake date for the study plan`,
} ,
intake_season:  {
  sql: `intake_season`,
  type: `string`,
  description: `The intake season for the study plan`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `The year and season of the intake for the study plan`,
} ,
intake_academic_year:  {
  sql: `intake_academic_year`,
  type: `string`,
  description: `The academic year which the intake will be based in`,
} ,
entry_level:  {
  sql: `entry_level`,
  type: `string`,
  description: `The entry level required for the study plan course (undergraduate, graduate, etc)`,
} ,
enrolment:  {
  sql: `enrolment`,
  type: `time`,
  description: `The enrolment date of the study plan`,
} ,
course_start:  {
  sql: `course_start`,
  type: `time`,
  description: `The course start date for the study plan`,
} ,
course_end:  {
  sql: `course_end`,
  type: `time`,
  description: `The course end date for the study plan`,
} ,
teaching_end:  {
  sql: `teaching_end`,
  type: `time`,
  description: `The teaching end date for the study plan course`,
} ,
teaching_start:  {
  sql: `teaching_start`,
  type: `time`,
  description: `The teaching start date for the study plan course`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
  description: `When the study plan was created`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
  description: `When the study plan was last modified at`,
} ,
is_current_version:  {
  sql: `is_current_version`,
  type: `boolean`,
  description: `not available`,
} ,
has_deferred:  {
  sql: `has_deferred`,
  type: `boolean`,
  description: `not available`,
} ,
is_deferred:  {
  sql: `is_deferred`,
  type: `boolean`,
  description: `not available`,
} ,
}});
cube (`product_study_plans_history`, {
sql: `select * from analytics_qa.product_study_plans_history`,
joins : {
product_study_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.study_plan_pk} = ${product_study_plans_history.study_plan_fk}`,
} ,
sales_scholarships:  {
  relationship: `belongsTo`,
  sql: `${CUBE.study_plan_pk} = ${sales_scholarships.study_plan_fk}`,
} ,
sales_applications:  {
  relationship: `hasMany`,
  sql: `${CUBE.study_plan_pk} = ${sales_applications.study_plan_fk}`,
} ,
product_study_plans:  {
  relationship: `HasOne`,
  sql: `${CUBE.study_plan_pk} = ${product_study_plans.study_plan_fk}`,
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
  description: `The surrogate key to link to the record`,
} ,
study_plan_fk:  {
  sql: `study_plan_fk`,
  type: `string`,
  description: `The key to link a record to a study plan`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
  description: `The key to link a record to an application`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `The key to link a record to an institution`,
} ,
study_plan_program_intake_fk:  {
  sql: `study_plan_program_intake_fk`,
  type: `string`,
  description: `The key to link a record to a study plan's program intake`,
} ,
study_plan_program_fk:  {
  sql: `study_plan_program_fk`,
  type: `string`,
  description: `The key to link a record to a study plan's program`,
} ,
study_plan_track_entry_type_code:  {
  sql: `study_plan_track_entry_type_code`,
  type: `string`,
  description: `not available`,
} ,
study_plan_program_code:  {
  sql: `study_plan_program_code`,
  type: `string`,
  description: `not available`,
} ,
study_plan_program_name:  {
  sql: `study_plan_program_name`,
  type: `string`,
  description: `not available`,
} ,
study_plan_intake_date:  {
  sql: `study_plan_intake_date`,
  type: `time`,
  description: `not available`,
} ,
study_plan_intake_season:  {
  sql: `study_plan_intake_season`,
  type: `string`,
  description: `not available`,
} ,
study_plan_program_entry_level:  {
  sql: `study_plan_program_entry_level`,
  type: `string`,
  description: `not available`,
} ,
enrolment_date:  {
  sql: `enrolment_date`,
  type: `time`,
  description: `not available`,
} ,
study_plan_program_start_date:  {
  sql: `study_plan_program_start_date`,
  type: `time`,
  description: `not available`,
} ,
study_plan_program_end_date:  {
  sql: `study_plan_program_end_date`,
  type: `time`,
  description: `not available`,
} ,
study_plan_teaching_end_date:  {
  sql: `study_plan_teaching_end_date`,
  type: `time`,
  description: `not available`,
} ,
study_plan_teaching_start_date:  {
  sql: `study_plan_teaching_start_date`,
  type: `time`,
  description: `not available`,
} ,
study_plan_created_at:  {
  sql: `study_plan_created_at`,
  type: `time`,
  description: `not available`,
} ,
study_plan_modified_at:  {
  sql: `study_plan_modified_at`,
  type: `time`,
  description: `not available`,
} ,
study_plan_valid_from:  {
  sql: `study_plan_valid_from`,
  type: `time`,
  description: `When the study plan was valid from`,
} ,
study_plan_valid_to:  {
  sql: `study_plan_valid_to`,
  type: `time`,
  description: `When the study plan was valid to`,
} ,
is_current_study_plan_record:  {
  sql: `is_current_study_plan_record`,
  type: `boolean`,
  description: `Confirms if the historical study plan record is also a current one`,
} ,
has_deferred:  {
  sql: `has_deferred`,
  type: `string`,
  description: `Confirms if the student has deferred from the study plan`,
} ,
}});
cube (`sales_applications`, {
sql: `select * from analytics_qa.sales_applications`,
joins : {
sales_application_agent_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_study_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_study_plans_history.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
sales_scholarships:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_scholarships.application_fk}`,
} ,
sales_applications_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.application_pk} = ${sales_applications_history.application_fk}`,
} ,
product_progression_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans_history.application_fk}`,
} ,
sales_applications_quota:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_applications_quota.application_fk}`,
} ,
sales_application_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_history.application_fk}`,
} ,
product_study_plans:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_study_plans.application_fk}`,
} ,
},
dimensions: {
study_plan_fk:  {
  sql: `study_plan_fk`,
  type: `string`,
  description: `not available`,
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
  description: `The student that applied`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `The college or university where the student will start studies`,
} ,
sales_manager_fk:  {
  sql: `sales_manager_fk`,
  type: `string`,
  description: `The sales manager which is in charge of the sales based applications`,
} ,
application_owner_fk:  {
  sql: `application_owner_fk`,
  type: `string`,
  description: `The owner/user of the application`,
} ,
cas_team_owner_fk:  {
  sql: `cas_team_owner_fk`,
  type: `string`,
  description: `Key to determine the cas team owner`,
} ,
sponsor_fk:  {
  sql: `sponsor_fk`,
  type: `string`,
  description: `not available`,
} ,
student_natural_key:  {
  sql: `student_natural_key`,
  type: `string`,
  description: `The key to indicate the student`,
} ,
sales_manager_natural_key:  {
  sql: `sales_manager_natural_key`,
  type: `string`,
  description: `The key to indicate the sales manager`,
} ,
application_owner_natural_key:  {
  sql: `application_owner_natural_key`,
  type: `string`,
  description: `The key to indicate the application owner`,
} ,
cas_team_owner_natural_key:  {
  sql: `cas_team_owner_natural_key`,
  type: `string`,
  description: `Key to determine the cas team owner`,
} ,
salesforce_opportunity_natural_key:  {
  sql: `salesforce_opportunity_natural_key`,
  type: `string`,
  description: `The key to indicate and link to the salesforce opportunity id`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
  description: `The date the application was created`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
  description: `The date the application was last modified at`,
} ,
status_update:  {
  sql: `status_update`,
  type: `time`,
  description: `not available`,
} ,
intake_date:  {
  sql: `intake_date`,
  type: `time`,
  description: `The date where the application/student will start the course`,
} ,
payment_status:  {
  sql: `payment_status`,
  type: `string`,
  description: `The status of the payment process for the application`,
} ,
immigration_category:  {
  sql: `immigration_category`,
  type: `string`,
  description: `The status of immigration the applicant will be in`,
} ,
learning_mode:  {
  sql: `learning_mode`,
  type: `string`,
  description: `The way the student will be studying (on campus, digital learning, etc)`,
} ,
returning_student:  {
  sql: `returning_student`,
  type: `string`,
  description: `Confirms if the applicant is a returning student`,
} ,
accommodation_required:  {
  sql: `accommodation_required`,
  type: `string`,
  description: `Confirms if accommodation is required for the applicant`,
} ,
sponsor_reference:  {
  sql: `sponsor_reference`,
  type: `string`,
  description: `not available`,
} ,
is_offer_letter_issued:  {
  sql: `is_offer_letter_issued`,
  type: `boolean`,
  description: `Has the offer letter been issued?`,
} ,
is_acceptance_form_issued:  {
  sql: `is_acceptance_form_issued`,
  type: `boolean`,
  description: `Has the acceptance form been issued?`,
} ,
is_visa_needed:  {
  sql: `is_visa_needed`,
  type: `boolean`,
  description: `Is a visa needed for applicant`,
} ,
is_application_submitted:  {
  sql: `is_application_submitted`,
  type: `boolean`,
  description: `Has the application been submitted?`,
} ,
is_application_completed:  {
  sql: `is_application_completed`,
  type: `boolean`,
  description: `Is the application completed?`,
} ,
is_confirmation_required:  {
  sql: `is_confirmation_required`,
  type: `boolean`,
  description: `Is confirmation required from any parties for the application`,
} ,
has_second_agent:  {
  sql: `has_second_agent`,
  type: `boolean`,
  description: `Has their been any involment from a second agent for the application`,
} ,
has_deferred:  {
  sql: `has_deferred`,
  type: `string`,
  description: `Has the applicant deferred?`,
} ,
status:  {
  sql: `status`,
  type: `string`,
  description: `The current status of the application, a mix of numeric code and text description`,
} ,
status_group:  {
  sql: `status_group`,
  type: `string`,
  description: `Like application status but grouped into 5 codes`,
} ,
is_deferred:  {
  sql: `is_deferred`,
  type: `boolean`,
  description: `not available`,
} ,
}});
cube (`sales_applications_history`, {
sql: `select * from analytics_qa.sales_applications_history`,
joins : {
sales_application_agent_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_study_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_study_plans_history.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
sales_scholarships:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_scholarships.application_fk}`,
} ,
sales_applications_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.application_pk} = ${sales_applications_history.application_fk}`,
} ,
product_progression_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans_history.application_fk}`,
} ,
sales_applications_quota:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_applications_quota.application_fk}`,
} ,
sales_application_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_history.application_fk}`,
} ,
product_study_plans:  {
  relationship: `belongsTo`,
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
  description: `not available`,
} ,
student_fk:  {
  sql: `student_fk`,
  type: `string`,
  description: `not available`,
} ,
sales_manager_fk:  {
  sql: `sales_manager_fk`,
  type: `string`,
  description: `not available`,
} ,
application_owner_fk:  {
  sql: `application_owner_fk`,
  type: `string`,
  description: `not available`,
} ,
cas_team_owner_fk:  {
  sql: `cas_team_owner_fk`,
  type: `string`,
  description: `not available`,
} ,
sponsor_fk:  {
  sql: `sponsor_fk`,
  type: `string`,
  description: `not available`,
} ,
student_natural_key:  {
  sql: `student_natural_key`,
  type: `string`,
  description: `not available`,
} ,
sales_manager_natural_key:  {
  sql: `sales_manager_natural_key`,
  type: `string`,
  description: `not available`,
} ,
application_owner_natural_key:  {
  sql: `application_owner_natural_key`,
  type: `string`,
  description: `not available`,
} ,
cas_team_owner_natural_key:  {
  sql: `cas_team_owner_natural_key`,
  type: `string`,
  description: `not available`,
} ,
salesforce_opportunity_natural_key:  {
  sql: `salesforce_opportunity_natural_key`,
  type: `string`,
  description: `not available`,
} ,
created_ts:  {
  sql: `created_ts`,
  type: `time`,
  description: `not available`,
} ,
modified_ts:  {
  sql: `modified_ts`,
  type: `time`,
  description: `not available`,
} ,
application_status_log_created_ts:  {
  sql: `application_status_log_created_ts`,
  type: `time`,
  description: `not available`,
} ,
application_status:  {
  sql: `application_status`,
  type: `string`,
  description: `not available`,
} ,
application_status_group:  {
  sql: `application_status_group`,
  type: `string`,
  description: `not available`,
} ,
payment_status:  {
  sql: `payment_status`,
  type: `string`,
  description: `not available`,
} ,
immigration_category:  {
  sql: `immigration_category`,
  type: `string`,
  description: `not available`,
} ,
learning_mode:  {
  sql: `learning_mode`,
  type: `string`,
  description: `not available`,
} ,
returning_student:  {
  sql: `returning_student`,
  type: `string`,
  description: `not available`,
} ,
accommodation_required:  {
  sql: `accommodation_required`,
  type: `string`,
  description: `not available`,
} ,
sponsor_reference:  {
  sql: `sponsor_reference`,
  type: `string`,
  description: `not available`,
} ,
is_offer_letter_issued:  {
  sql: `is_offer_letter_issued`,
  type: `boolean`,
  description: `not available`,
} ,
is_acceptance_form_issued:  {
  sql: `is_acceptance_form_issued`,
  type: `boolean`,
  description: `not available`,
} ,
is_visa_needed:  {
  sql: `is_visa_needed`,
  type: `boolean`,
  description: `not available`,
} ,
is_application_submitted:  {
  sql: `is_application_submitted`,
  type: `boolean`,
  description: `not available`,
} ,
is_application_completed:  {
  sql: `is_application_completed`,
  type: `boolean`,
  description: `not available`,
} ,
is_confirmation_required:  {
  sql: `is_confirmation_required`,
  type: `boolean`,
  description: `not available`,
} ,
has_second_agent:  {
  sql: `has_second_agent`,
  type: `boolean`,
  description: `not available`,
} ,
old_title:  {
  sql: `old_title`,
  type: `string`,
  description: `Displays the previous application status before changing in the new title`,
} ,
new_title:  {
  sql: `new_title`,
  type: `string`,
  description: `Displays the new application status from changing from the old title`,
} ,
application_valid_from:  {
  sql: `application_valid_from`,
  type: `time`,
  description: `Date application is valid from`,
} ,
application_valid_to:  {
  sql: `application_valid_to`,
  type: `time`,
  description: `Date application is valid to`,
} ,
is_current_application_record:  {
  sql: `is_current_application_record`,
  type: `boolean`,
  description: `Is the application a current or past record`,
} ,
}});
cube (`sales_applications_quota`, {
sql: `select * from analytics_qa.sales_applications_quota`,
joins : {
sales_application_agent_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_study_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_study_plans_history.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
sales_scholarships:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_scholarships.application_fk}`,
} ,
sales_applications_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.application_pk} = ${sales_applications_history.application_fk}`,
} ,
product_progression_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans_history.application_fk}`,
} ,
sales_applications_quota:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_applications_quota.application_fk}`,
} ,
sales_application_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_history.application_fk}`,
} ,
product_study_plans:  {
  relationship: `belongsTo`,
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
  description: `not available`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
  description: `not available`,
} ,
degree_name:  {
  sql: `degree_name`,
  type: `string`,
  description: `not available`,
} ,
application_status_group:  {
  sql: `application_status_group`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`sales_applications_summary`, {
sql: `select * from analytics_qa.sales_applications_summary`,
joins : {
sales_application_agent_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_agent_bridge.application_fk}`,
} ,
product_study_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_study_plans_history.application_fk}`,
} ,
product_progression_plans:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans.application_fk}`,
} ,
sales_scholarships:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_scholarships.application_fk}`,
} ,
sales_applications_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.application_pk} = ${sales_applications_history.application_fk}`,
} ,
product_progression_plans_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${product_progression_plans_history.application_fk}`,
} ,
sales_applications_quota:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_applications_quota.application_fk}`,
} ,
sales_application_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.application_pk} = ${sales_application_history.application_fk}`,
} ,
product_study_plans:  {
  relationship: `belongsTo`,
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
cube (`sales_quota_allocations`, {
sql: `select * from analytics_qa.sales_quota_allocations`,
joins : {
sales_applications_quota:  {
  relationship: `hasMany`,
  sql: `${CUBE.quota_allocation_pk} = ${sales_applications_quota.quota_allocation_fk}`,
} ,
},
dimensions: {
quota_allocation_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `quota_allocation_pk`,
  description: `not available`,
} ,
university_code:  {
  sql: `university_code`,
  type: `string`,
  description: `not available`,
} ,
university_name:  {
  sql: `university_name`,
  type: `string`,
  description: `not available`,
} ,
college_code:  {
  sql: `college_code`,
  type: `string`,
  description: `not available`,
} ,
degree_concat:  {
  sql: `degree_concat`,
  type: `string`,
  description: `not available`,
} ,
quota_group:  {
  sql: `quota_group`,
  type: `string`,
  description: `not available`,
} ,
nationaility_criteria:  {
  sql: `nationaility_criteria`,
  type: `string`,
  description: `not available`,
} ,
sponsor_criteria:  {
  sql: `sponsor_criteria`,
  type: `string`,
  description: `not available`,
} ,
agent_region_criteria:  {
  sql: `agent_region_criteria`,
  type: `string`,
  description: `not available`,
} ,
program_criteria:  {
  sql: `program_criteria`,
  type: `string`,
  description: `not available`,
} ,
limited:  {
  sql: `limited`,
  type: `time`,
  description: `not available`,
} ,
closed:  {
  sql: `closed`,
  type: `time`,
  description: `not available`,
} ,
}});
cube (`sales_student`, {
sql: `select * from analytics_qa.sales_student`,
joins : {
sales_applications:  {
  relationship: `hasMany`,
  sql: `${CUBE.student_pk} = ${sales_applications.student_fk}`,
} ,
sales_applications_history:  {
  relationship: `hasMany`,
  sql: `${CUBE.student_pk} = ${sales_applications_history.student_fk}`,
} ,
sales_application_history:  {
  relationship: `belongsTo`,
  sql: `${CUBE.student_pk} = ${sales_application_history.student_fk}`,
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
  description: `The country of residence of the student (when recruited)`,
} ,
nationality_fk:  {
  sql: `nationality_fk`,
  type: `string`,
  description: `The nationality of the student`,
} ,
student_natural_key:  {
  sql: `student_natural_key`,
  type: `string`,
  description: `The key to indicate and link to a student`,
} ,
kss_student_id:  {
  sql: `kss_student_id`,
  type: `string`,
  description: `The kss format id to indicate and link to a student`,
} ,
class_student_id:  {
  sql: `class_student_id`,
  type: `string`,
  description: `The id to determine the student's class`,
} ,
student_salesforce_natural_key:  {
  sql: `student_salesforce_natural_key`,
  type: `string`,
  description: `The unique id of the student in Salesforce.`,
} ,
name:  {
  sql: `name`,
  type: `string`,
  description: `The student's name`,
} ,
gender:  {
  sql: `gender`,
  type: `string`,
  description: `The student's gender`,
} ,
country_iso_key:  {
  sql: `country_iso_key`,
  type: `string`,
  description: `An abbreviation for the names of countries linked to the student nationality (United States Of America = USA, etc)`,
} ,
source:  {
  sql: `source`,
  type: `string`,
  description: `This how the student was introduced to Kaplan. Similar to recruitment channel but for student instead of application.`,
} ,
nationality:  {
  sql: `nationality`,
  type: `string`,
  description: `The nationality of the student`,
} ,
dob:  {
  sql: `dob`,
  type: `time`,
  description: `The student's date of birth.`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
  description: `The date when the student record was created`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
  description: `The last date when the student record was modified`,
} ,
}});

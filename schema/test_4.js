cube (`budgets_sales`, {
sql: `select * from analytics_qa.budgets_sales`,
dimensions: {
budget_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `budget_pk`,
  description: `not available`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `not available`,
} ,
budget_group:  {
  sql: `budget_group`,
  type: `string`,
  description: `not available`,
} ,
budget_name:  {
  sql: `budget_name`,
  type: `string`,
  description: `not available`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `not available`,
} ,
institution_name:  {
  sql: `institution_name`,
  type: `string`,
  description: `not available`,
} ,
entry_type_code:  {
  sql: `entry_type_code`,
  type: `string`,
  description: `not available`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`core_agents`, {
sql: `select * from analytics_qa.core_agents`,
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
cube (`core_country_mapping`, {
sql: `select * from analytics_qa.core_country_mapping`,
dimensions: {
country_mapping_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `country_mapping_pk`,
  description: `The key to link countries to other records`,
} ,
country_fk:  {
  sql: `country_fk`,
  type: `string`,
  description: `The key and link to a country`,
} ,
nationality_fk:  {
  sql: `nationality_fk`,
  type: `string`,
  description: `The key and link to a countries nationality`,
} ,
sales_region:  {
  sql: `sales_region`,
  type: `string`,
  description: `not available`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
  description: `not available`,
} ,
schols_region:  {
  sql: `schols_region`,
  type: `string`,
  description: `The region of the scholarship system`,
} ,
valid_from:  {
  sql: `valid_from`,
  type: `time`,
  description: `Date the record is valid from`,
} ,
valid_to:  {
  sql: `valid_to`,
  type: `time`,
  description: `Date the record is valid to`,
} ,
}});
cube (`core_institutions`, {
sql: `select * from analytics_qa.core_institutions`,
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
cube (`core_program_intakes`, {
sql: `select * from analytics_qa.core_program_intakes`,
dimensions: {
program_intake_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `program_intake_pk`,
  description: `The key to link a record to a program intake`,
} ,
program_fk:  {
  sql: `program_fk`,
  type: `string`,
  description: `The key to link a record to a program`,
} ,
intake:  {
  sql: `intake`,
  type: `time`,
  description: `The date of the start of intake`,
} ,
intake_season:  {
  sql: `intake_season`,
  type: `string`,
  description: `The season which the intake starts`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `The season and year which the intake starts`,
} ,
intake_academic_year:  {
  sql: `intake_academic_year`,
  type: `string`,
  description: `not available`,
} ,
status:  {
  sql: `status`,
  type: `string`,
  description: `The status of the application process`,
} ,
enrolment_start:  {
  sql: `enrolment_start`,
  type: `time`,
  description: `The enrolment start date for a program`,
} ,
enrolment_end:  {
  sql: `enrolment_end`,
  type: `time`,
  description: `The enrolment end date for a program`,
} ,
teaching_start:  {
  sql: `teaching_start`,
  type: `time`,
  description: `The teaching start date for a program`,
} ,
teaching_end:  {
  sql: `teaching_end`,
  type: `time`,
  description: `The teaching end date for a program`,
} ,
}});
cube (`core_programs`, {
sql: `select * from analytics_qa.core_programs`,
dimensions: {
program_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `program_pk`,
  description: `The key to link to a certain program`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `The key to link to a certain institution`,
} ,
program_code:  {
  sql: `program_code`,
  type: `string`,
  description: `The code to link to a certain program`,
} ,
name:  {
  sql: `name`,
  type: `string`,
  description: `The name of the program`,
} ,
level:  {
  sql: `level`,
  type: `string`,
  description: `not available`,
} ,
status:  {
  sql: `status`,
  type: `string`,
  description: `The status of the program (active or inactive)`,
} ,
type:  {
  sql: `type`,
  type: `string`,
  description: `The type of program (foundation, pre-masters etc)`,
} ,
university_unit_faculty:  {
  sql: `university_unit_faculty`,
  type: `string`,
  description: `The university's faculty which would be targeted at with the program record`,
} ,
university_unit_school:  {
  sql: `university_unit_school`,
  type: `string`,
  description: `The university's school which would be targeted at with the program record`,
} ,
university_unit_department:  {
  sql: `university_unit_department`,
  type: `string`,
  description: `The university's department which would be targeted at with the program record`,
} ,
university_unit_college:  {
  sql: `university_unit_college`,
  type: `string`,
  description: `The university's college which would be targeted at with the program record`,
} ,
university_unit_institute:  {
  sql: `university_unit_institute`,
  type: `string`,
  description: `The university's institute which would be targeted at with the program record`,
} ,
university_unit_division:  {
  sql: `university_unit_division`,
  type: `string`,
  description: `The university's division which would be targeted at with the program record`,
} ,
entry_level:  {
  sql: `entry_level`,
  type: `string`,
  description: `Confirms the type of entry level required for the program (graduate, undergraduate, etc)`,
} ,
award_type:  {
  sql: `award_type`,
  type: `string`,
  description: `Confirms the award type to be recieved by the program`,
} ,
award_title:  {
  sql: `award_title`,
  type: `string`,
  description: `The name of the award`,
} ,
award_code:  {
  sql: `award_code`,
  type: `string`,
  description: `The code to link to the award`,
} ,
duration_length:  {
  sql: `duration_length`,
  type: `string`,
  description: `The length of the program`,
} ,
entry_type_code:  {
  sql: `entry_type_code`,
  type: `string`,
  description: `The code to link to the program's entry type/level`,
} ,
}});
cube (`core_scholarship_reason_owners`, {
sql: `select * from analytics_qa.core_scholarship_reason_owners`,
dimensions: {
scholarship_reason_owner_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `scholarship_reason_owner_pk`,
  description: `The key to link the core_scholarship_reasons_owner record to another record`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
  description: `The sales region group which the record will be placed under`,
} ,
budget_pot:  {
  sql: `budget_pot`,
  type: `string`,
  description: `Budget details`,
} ,
budget_owner:  {
  sql: `budget_owner`,
  type: `string`,
  description: `The owner of the budget`,
} ,
}});
cube (`core_scholarship_reasons`, {
sql: `select * from analytics_qa.core_scholarship_reasons`,
dimensions: {
scholarship_reason_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `scholarship_reason_pk`,
  description: `The key to link the scholarship reason to another record`,
} ,
scholarship_reason:  {
  sql: `scholarship_reason`,
  type: `string`,
  description: `The reason behind the scholarship being given`,
} ,
budget_pot:  {
  sql: `budget_pot`,
  type: `string`,
  description: `Budget details`,
} ,
}});
cube (`core_sponsors`, {
sql: `select * from analytics_qa.core_sponsors`,
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
cube (`core_subjects`, {
sql: `select * from analytics_qa.core_subjects`,
dimensions: {
program_subject_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `program_subject_pk`,
  description: `The key to link the program's subject to a record`,
} ,
program_fk:  {
  sql: `program_fk`,
  type: `string`,
  description: `The key to link a program to a record`,
} ,
subject:  {
  sql: `subject`,
  type: `string`,
  description: `The name of the subject which the program will be on`,
} ,
subject_group:  {
  sql: `subject_group`,
  type: `string`,
  description: `The group which the subject will be based under`,
} ,
}});
cube (`core_user_mapping`, {
sql: `select * from analytics_qa.core_user_mapping`,
dimensions: {
user_mapping_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `user_mapping_pk`,
  description: `not available`,
} ,
user_fk:  {
  sql: `user_fk`,
  type: `string`,
  description: `The key to link an user to a record`,
} ,
user_natural_key:  {
  sql: `user_natural_key`,
  type: `string`,
  description: `The key to link an user to a record`,
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
valid_from:  {
  sql: `valid_from`,
  type: `time`,
  description: `The date which the user record is valid from`,
} ,
valid_to:  {
  sql: `valid_to`,
  type: `time`,
  description: `The date which the user record is valid to`,
} ,
}});
cube (`core_users`, {
sql: `select * from analytics_qa.core_users`,
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
cube (`product_progression_plans`, {
sql: `select * from analytics_qa.product_progression_plans`,
dimensions: {
progression_plan_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `progression_plan_pk`,
  description: `The key to link a record to a progression plan`,
} ,
progression_plan_fk:  {
  sql: `progression_plan_fk`,
  type: `string`,
  description: `The key to link a record to a progression plan`,
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
progression_plan_program_intake_fk:  {
  sql: `progression_plan_program_intake_fk`,
  type: `string`,
  description: `The key to link a record to a progression plan's program intake`,
} ,
progression_plan_program_fk:  {
  sql: `progression_plan_program_fk`,
  type: `string`,
  description: `The key to link a record to a progression plan's program`,
} ,
entry_type_code:  {
  sql: `entry_type_code`,
  type: `string`,
  description: `The code to indicate how the applicant had entry to the progression plan`,
} ,
degree_code:  {
  sql: `degree_code`,
  type: `string`,
  description: `The code to indicate the degree from the progression plan`,
} ,
degree_name:  {
  sql: `degree_name`,
  type: `string`,
  description: `The name of the degree recieved by the progression plan`,
} ,
degree_entry_level:  {
  sql: `degree_entry_level`,
  type: `string`,
  description: `The level of entry needed to access the degree (undergraduate, graduate, etc)`,
} ,
is_primary_progression:  {
  sql: `is_primary_progression`,
  type: `string`,
  description: `Confirms if the progression path is a primary progression path`,
} ,
university_intake_date:  {
  sql: `university_intake_date`,
  type: `time`,
  description: `The intake date for the start of the progression plan at the university`,
} ,
university_intake_season:  {
  sql: `university_intake_season`,
  type: `string`,
  description: ``,
} ,
university_enrolment:  {
  sql: `university_enrolment`,
  type: `time`,
  description: `The date of enrolment for the university course`,
} ,
degree_teaching_end:  {
  sql: `degree_teaching_end`,
  type: `time`,
  description: `The end date of teaching for the university course`,
} ,
degree_start:  {
  sql: `degree_start`,
  type: `time`,
  description: `The start date for the university course`,
} ,
degree_end:  {
  sql: `degree_end`,
  type: `time`,
  description: `The end date for the university course`,
} ,
degree_teaching_start:  {
  sql: `degree_teaching_start`,
  type: `time`,
  description: `The start date of teaching for the university course`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
  description: `The created at date for the progression plan`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
  description: `The last date the progression plan was modified at`,
} ,
}});
cube (`product_progression_plans_history`, {
sql: `select * from analytics_qa.product_progression_plans_history`,
dimensions: {
study_plan_history_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `study_plan_history_pk`,
  description: `The key to link a record to the study plan history record`,
} ,
progression_plan_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `progression_plan_pk`,
  description: `The key to link a record to a progression plan`,
} ,
progression_plan_fk:  {
  sql: `progression_plan_fk`,
  type: `string`,
  description: `The key to link a record to a progression plan`,
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
progression_plan_program_intake_fk:  {
  sql: `progression_plan_program_intake_fk`,
  type: `string`,
  description: `The key to link a record to a progression plan's program intake`,
} ,
progression_plan_program_fk:  {
  sql: `progression_plan_program_fk`,
  type: `string`,
  description: `The key to link a record to a progression plan's program`,
} ,
progression_plan_track_entry_type_code:  {
  sql: `progression_plan_track_entry_type_code`,
  type: `string`,
  description: `not available`,
} ,
progression_plan_program_code:  {
  sql: `progression_plan_program_code`,
  type: `string`,
  description: `not available`,
} ,
progression_plan_program_name:  {
  sql: `progression_plan_program_name`,
  type: `string`,
  description: `not available`,
} ,
progression_plan_entry_level:  {
  sql: `progression_plan_entry_level`,
  type: `string`,
  description: `not available`,
} ,
is_primary_progression:  {
  sql: `is_primary_progression`,
  type: `string`,
  description: `Confirms if the progression path is a primary progression path`,
} ,
progression_plan_intake_date:  {
  sql: `progression_plan_intake_date`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_intake_season:  {
  sql: `progression_plan_intake_season`,
  type: `string`,
  description: `not available`,
} ,
enrolment_date:  {
  sql: `enrolment_date`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_teaching_end_date:  {
  sql: `progression_plan_teaching_end_date`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_program_start_date:  {
  sql: `progression_plan_program_start_date`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_program_end_date:  {
  sql: `progression_plan_program_end_date`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_teaching_start_date:  {
  sql: `progression_plan_teaching_start_date`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_created_at:  {
  sql: `progression_plan_created_at`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_modified_at:  {
  sql: `progression_plan_modified_at`,
  type: `time`,
  description: `not available`,
} ,
progression_plan_valid_from:  {
  sql: `progression_plan_valid_from`,
  type: `time`,
  description: `When the progression plan was valid from`,
} ,
progression_plan_valid_to:  {
  sql: `progression_plan_valid_to`,
  type: `time`,
  description: `When the progression plan was valid to`,
} ,
is_current_progression_plan_record:  {
  sql: `is_current_progression_plan_record`,
  type: `boolean`,
  description: `Confirms if the historical progression plan record is also a current one`,
} ,
}});
cube (`product_study_plans`, {
sql: `select * from analytics_qa.product_study_plans`,
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
cube (`sales_application_agent_bridge`, {
sql: `select * from analytics_qa.sales_application_agent_bridge`,
dimensions: {
application_agent_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `application_agent_pk`,
  description: `Unique id to link an agent with an application`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
  description: `Id used to link records to application records`,
} ,
agent_fk:  {
  sql: `agent_fk`,
  type: `string`,
  description: `Id used to link records to agent records`,
} ,
is_main_agent:  {
  sql: `is_main_agent`,
  type: `boolean`,
  description: `not available`,
} ,
}});
cube (`sales_application_history`, {
sql: `select * from analytics_qa.sales_application_history`,
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
  description: `Id used to link records to application records`,
} ,
program_fk:  {
  sql: `program_fk`,
  type: `string`,
  description: `The key to indicate the related program/course`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `The key to indicate the related institution`,
} ,
program_intake_fk:  {
  sql: `program_intake_fk`,
  type: `string`,
  description: `The key that relates to the program intake`,
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
valid_from:  {
  sql: `valid_from`,
  type: `time`,
  description: `The start date of the application`,
} ,
valid_to:  {
  sql: `valid_to`,
  type: `time`,
  description: `The end date of the application`,
} ,
status:  {
  sql: `status`,
  type: `string`,
  description: `not available`,
} ,
status_group:  {
  sql: `status_group`,
  type: `string`,
  description: `not available`,
} ,
program_code:  {
  sql: `program_code`,
  type: `string`,
  description: `not available`,
} ,
program_name:  {
  sql: `program_name`,
  type: `string`,
  description: `The name of the program/course`,
} ,
intake:  {
  sql: `intake`,
  type: `time`,
  description: `not available`,
} ,
salesforce_opportunity_natural_key:  {
  sql: `salesforce_opportunity_natural_key`,
  type: `string`,
  description: `not available`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
  description: `not available`,
} ,
modified_at:  {
  sql: `modified_at`,
  type: `time`,
  description: `not available`,
} ,
change:  {
  sql: `change`,
  type: `string`,
  description: `Gives a description of the change to the applicant`,
} ,
has_deferred:  {
  sql: `has_deferred`,
  type: `string`,
  description: `Has the applicant deferred`,
} ,
}});
cube (`sales_new_programs`, {
sql: `select * from analytics_qa.sales_new_programs`,
dimensions: {
program_launch_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `program_launch_pk`,
  description: ``,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `not available`,
} ,
program_fk:  {
  sql: `program_fk`,
  type: `string`,
  description: `not available`,
} ,
program_intake_fk:  {
  sql: `program_intake_fk`,
  type: `string`,
  description: `not available`,
} ,
launch_name:  {
  sql: `launch_name`,
  type: `string`,
  description: `Name of the new program`,
} ,
launch:  {
  sql: `launch`,
  type: `time`,
  description: `Date of launch`,
} ,
launch_expiry:  {
  sql: `launch_expiry`,
  type: `time`,
  description: `Expiry date of launch`,
} ,
institution_name:  {
  sql: `institution_name`,
  type: `string`,
  description: `Name of institution`,
} ,
program_code:  {
  sql: `program_code`,
  type: `string`,
  description: `Code to link to program`,
} ,
program_name:  {
  sql: `program_name`,
  type: `string`,
  description: `Name of program/course`,
} ,
program_type:  {
  sql: `program_type`,
  type: `string`,
  description: `Type of program/course`,
} ,
award_name:  {
  sql: `award_name`,
  type: `string`,
  description: `Name of the award`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `Season and year of intake for the applicant`,
} ,
}});
cube (`sales_priority_programs`, {
sql: `select * from analytics_qa.sales_priority_programs`,
dimensions: {
priority_program_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `priority_program_pk`,
  description: `not available`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `not available`,
} ,
program_fk:  {
  sql: `program_fk`,
  type: `string`,
  description: `not available`,
} ,
program_intake_fk:  {
  sql: `program_intake_fk`,
  type: `string`,
  description: `not available`,
} ,
priority_reason:  {
  sql: `priority_reason`,
  type: `string`,
  description: `not available`,
} ,
institution_name:  {
  sql: `institution_name`,
  type: `string`,
  description: `not available`,
} ,
program_code:  {
  sql: `program_code`,
  type: `string`,
  description: `not available`,
} ,
program_name:  {
  sql: `program_name`,
  type: `string`,
  description: `not available`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`sales_quota_allocations`, {
sql: `select * from analytics_qa.sales_quota_allocations`,
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
cube (`sales_scholarships`, {
sql: `select * from analytics_qa.sales_scholarships`,
dimensions: {
scholarships_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `scholarships_pk`,
  description: `not available`,
} ,
study_plan_fk:  {
  sql: `study_plan_fk`,
  type: `string`,
  description: `The key to relate to the type of study plan`,
} ,
application_fk:  {
  sql: `application_fk`,
  type: `string`,
  description: `The key to relate to a certain application`,
} ,
scholarship_reason:  {
  sql: `scholarship_reason`,
  type: `string`,
  description: `Reason behind why the scholarship was given`,
} ,
scholarship_note:  {
  sql: `scholarship_note`,
  type: `string`,
  description: `Any additional information about the scholarship record`,
} ,
student_ledger_currency_code:  {
  sql: `student_ledger_currency_code`,
  type: `string`,
  description: `Code to indicate what currency the applicant is using`,
} ,
budget_pot:  {
  sql: `budget_pot`,
  type: `string`,
  description: `Budget details`,
} ,
created_at:  {
  sql: `created_at`,
  type: `time`,
  description: `not available`,
} ,
application_status_group:  {
  sql: `application_status_group`,
  type: `string`,
  description: `Status/point of progress group of an application`,
} ,
}});
cube (`sales_student`, {
sql: `select * from analytics_qa.sales_student`,
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
cube (`scholarship_budgets`, {
sql: `select * from analytics_qa.scholarship_budgets`,
dimensions: {
scholarship_budgets_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `scholarship_budgets_pk`,
  description: `The key to link to the scholarship budget records`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `Season and year of when the student will start`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
  description: `The region group of where the applicant is based (before studying)`,
} ,
schols_region:  {
  sql: `schols_region`,
  type: `string`,
  description: `The scholarship region of the budget record`,
} ,
budget_pot:  {
  sql: `budget_pot`,
  type: `string`,
  description: `Budget details`,
} ,
budget_owner:  {
  sql: `budget_owner`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`scholarship_targets`, {
sql: `select * from analytics_qa.scholarship_targets`,
dimensions: {
scholarship_targets_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `scholarship_targets_pk`,
  description: `not available`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `not available`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
  description: `not available`,
} ,
schols_region:  {
  sql: `schols_region`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`targets_institutions`, {
sql: `select * from analytics_qa.targets_institutions`,
dimensions: {
institution_target_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `institution_target_pk`,
  description: `not available`,
} ,
institution_fk:  {
  sql: `institution_fk`,
  type: `string`,
  description: `not available`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `not available`,
} ,
institution_name:  {
  sql: `institution_name`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`targets_sales_regions`, {
sql: `select * from analytics_qa.targets_sales_regions`,
dimensions: {
sales_region_target_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `sales_region_target_pk`,
  description: `The key to link to the target sales region`,
} ,
sales_region_target_country_fk:  {
  sql: `sales_region_target_country_fk`,
  type: `string`,
  description: `The key to link to the target sales region country`,
} ,
intake_name:  {
  sql: `intake_name`,
  type: `string`,
  description: `The target season and year for when the student begins`,
} ,
country_name:  {
  sql: `country_name`,
  type: `string`,
  description: `The target country where the student will start studying`,
} ,
sales_region:  {
  sql: `sales_region`,
  type: `string`,
  description: `The target sales region where the student will start studying`,
} ,
sales_region_group:  {
  sql: `sales_region_group`,
  type: `string`,
  description: `The target sales region group where the student will start studying`,
} ,
sales_channel:  {
  sql: `sales_channel`,
  type: `string`,
  description: `The target sales channel the student when through (agent, online, etc)`,
} ,
}});

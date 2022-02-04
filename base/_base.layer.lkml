explore: budgets_sales
{ hidden: yes }
explore: core_agents
{ hidden: yes }
explore: core_countries
{ hidden: yes }
explore: core_country_mapping
{ hidden: yes }
explore: core_institutions
{ hidden: yes }
explore: core_program_intakes
{ hidden: yes }
explore: core_programs
{ hidden: yes }
explore: core_scholarship_reason_owners
{ hidden: yes }
explore: core_scholarship_reasons
{ hidden: yes }
explore: core_sponsors
{ hidden: yes }
explore: core_subjects
{ hidden: yes }
explore: core_user_mapping
{ hidden: yes }
explore: core_users
{ hidden: yes }
explore: product_progression_plans
{ hidden: yes }
explore: product_progression_plans_history
{ hidden: yes }
explore: product_study_plans
{ hidden: yes }
explore: product_study_plans_history
{ hidden: yes }
explore: sales_application_agent_bridge
{ hidden: yes }
explore: sales_application_history
{ hidden: yes }
explore: sales_applications
{ hidden: yes }
explore: sales_applications_history
{ hidden: yes }
explore: sales_applications_quota
{ hidden: yes }
explore: sales_applications_summary
{ hidden: yes }
explore: sales_new_programs
{ hidden: yes }
explore: sales_priority_programs
{ hidden: yes }
explore: sales_quota_allocations
{ hidden: yes }
explore: sales_scholarships
{ hidden: yes }
explore: sales_student
{ hidden: yes }
explore: scholarship_budgets
{ hidden: yes }
explore: scholarship_targets
{ hidden: yes }
explore: targets_institutions
{ hidden: yes }
explore: targets_sales_regions
{ hidden: yes }
view: budgets_sales {
sql_table_name: budgets_sales ;;
dimension: budget_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.budget_pk ;;
  description: "not available"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "not available"
}
dimension: budget_group {
  type: string
  sql: ${TABLE}.budget_group ;;
  description: "not available"
}
dimension: budget_name {
  type: string
  sql: ${TABLE}.budget_name ;;
  description: "not available"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "not available"
}
dimension: institution_name {
  type: string
  sql: ${TABLE}.institution_name ;;
  description: "not available"
}
dimension: entry_type_code {
  type: string
  sql: ${TABLE}.entry_type_code ;;
  description: "not available"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "not available"
}
dimension: budget_amt {
  type: number
  sql: ${TABLE}.budget_amt ;;
  description: "not available"
}
}
view: core_agents {
sql_table_name: core_agents ;;
dimension: agent_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.agent_pk ;;
  description: "The key and link to an agent"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "The key and link to a country"
}
dimension: agent_natural_key {
  type: number
  sql: ${TABLE}.agent_natural_key ;;
  description: "The key and link to an agent from a record"
}
dimension: agent_salesforce_business_key {
  type: string
  sql: ${TABLE}.agent_salesforce_business_key ;;
  description: "The key and link to an agent based salesforce record"
}
dimension: country_natural_key {
  type: number
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country from a record"
}
dimension: name {
  type: string
  sql: ${TABLE}.name ;;
  description: "The name of the agent"
}
dimension: group {
  type: string
  sql: ${TABLE}.group ;;
  description: "The agent group which the agent belongs too"
}
dimension: status {
  type: string
  sql: ${TABLE}.status ;;
  description: "The status of the agent"
}
dimension: sales_channel {
  type: string
  sql: ${TABLE}.sales_channel ;;
  description: "The sales channel which the agent belongs to"
}
dimension: uk_based_agent {
  type: yesno
  sql: ${TABLE}.uk_based_agent ;;
  description: "Confirms if the agent is UK based"
}
}
view: core_countries {
sql_table_name: core_countries ;;
dimension: country_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.country_pk ;;
  description: "The key and link to a country"
}
dimension: country_natural_key {
  type: number
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country"
}
dimension: country {
  type: string
  sql: ${TABLE}.country ;;
  description: "The name of the country"
}
dimension: country_iso_key {
  type: string
  sql: ${TABLE}.country_iso_key ;;
  description: "An abbreviation for the names of countries (United States Of America = USA, etc)"
}
dimension: salesforce_country_key {
  type: string
  sql: ${TABLE}.salesforce_country_key ;;
  description: "The key and link to the salesforce country record"
}
dimension: country_nationality {
  type: string
  sql: ${TABLE}.country_nationality ;;
  description: "The nationality for the country"
}
dimension: country_is_sanctioned {
  type: yesno
  sql: ${TABLE}.country_is_sanctioned ;;
  description: "Confirms if the country is sanctioned"
}
}
view: core_country_mapping {
sql_table_name: core_country_mapping ;;
dimension: country_mapping_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.country_mapping_pk ;;
  description: "The key to link countries to other records"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "The key and link to a country"
}
dimension: nationality_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.nationality_fk ;;
  description: "The key and link to a countries nationality"
}
dimension: country_natural_key {
  type: number
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country"
}
dimension: sales_region {
  type: string
  sql: ${TABLE}.sales_region ;;
  description: "not available"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "not available"
}
dimension: schols_region {
  type: string
  sql: ${TABLE}.schols_region ;;
  description: "The region of the scholarship system"
}
dimension_group: valid_from {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.valid_from ;;
  description: "Date the record is valid from"
}
dimension_group: valid_to {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.valid_to ;;
  description: "Date the record is valid to"
}
}
view: core_institutions {
sql_table_name: core_institutions ;;
dimension: institution_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.institution_pk ;;
  description: "The key and link to an institution"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "The key and link to a country"
}
dimension: institution_natural_key {
  type: number
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key and link to an institution"
}
dimension: country_natural_key {
  type: number
  sql: ${TABLE}.country_natural_key ;;
  description: "The key and link to a country"
}
dimension: institution_type {
  type: string
  sql: ${TABLE}.institution_type ;;
  description: "The type of institution (college or university)"
}
dimension: institution_code {
  type: string
  sql: ${TABLE}.institution_code ;;
  description: "The code to indicate what type of institution it is"
}
dimension: institution_name {
  type: string
  sql: ${TABLE}.institution_name ;;
  description: "The name of the institution"
}
dimension: institution_group {
  type: string
  sql: ${TABLE}.institution_group ;;
  description: "The institution group the institution belongs to"
}
}
view: core_program_intakes {
sql_table_name: core_program_intakes ;;
dimension: program_intake_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.program_intake_pk ;;
  description: "The key to link a record to a program intake"
}
dimension: program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_fk ;;
  description: "The key to link a record to a program"
}
dimension: program_intake_natural_key {
  type: number
  sql: ${TABLE}.program_intake_natural_key ;;
  description: "The key to link a record to a program intake"
}
dimension: program_natural_key {
  type: number
  sql: ${TABLE}.program_natural_key ;;
  description: "The key to link a record to a program"
}
dimension: program_fee {
  type: number
  sql: ${TABLE}.program_fee ;;
  description: "Cost of a program"
}
dimension_group: intake {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.intake ;;
  description: "The date of the start of intake"
}
dimension: intake_season {
  type: string
  sql: ${TABLE}.intake_season ;;
  description: "The season which the intake starts"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "The season and year which the intake starts"
}
dimension: intake_academic_year {
  type: string
  sql: ${TABLE}.intake_academic_year ;;
  description: "not available"
}
dimension: status {
  type: string
  sql: ${TABLE}.status ;;
  description: "The status of the application process"
}
dimension: intake_quota_exists {
  type: number
  sql: ${TABLE}.intake_quota_exists ;;
  description: "Confirms if there's a quota on the intake"
}
dimension_group: enrolment_start {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.enrolment_start ;;
  description: "The enrolment start date for a program"
}
dimension_group: enrolment_end {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.enrolment_end ;;
  description: "The enrolment end date for a program"
}
dimension_group: teaching_start {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.teaching_start ;;
  description: "The teaching start date for a program"
}
dimension_group: teaching_end {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.teaching_end ;;
  description: "The teaching end date for a program"
}
}
view: core_programs {
sql_table_name: core_programs ;;
dimension: program_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.program_pk ;;
  description: "The key to link to a certain program"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "The key to link to a certain institution"
}
dimension: program_natural_key {
  type: number
  sql: ${TABLE}.program_natural_key ;;
  description: "The key to link to a certain program"
}
dimension: institution_natural_key {
  type: number
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link to a certain institution"
}
dimension: program_code {
  type: string
  sql: ${TABLE}.program_code ;;
  description: "The code to link to a certain program"
}
dimension: name {
  type: string
  sql: ${TABLE}.name ;;
  description: "The name of the program"
}
dimension: level {
  type: string
  sql: ${TABLE}.level ;;
  description: "not available"
}
dimension: status {
  type: string
  sql: ${TABLE}.status ;;
  description: "The status of the program (active or inactive)"
}
dimension: type {
  type: string
  sql: ${TABLE}.type ;;
  description: "The type of program (foundation, pre-masters etc)"
}
dimension: university_unit_faculty {
  type: string
  sql: ${TABLE}.university_unit_faculty ;;
  description: "The university's faculty which would be targeted at with the program record"
}
dimension: university_unit_school {
  type: string
  sql: ${TABLE}.university_unit_school ;;
  description: "The university's school which would be targeted at with the program record"
}
dimension: university_unit_department {
  type: string
  sql: ${TABLE}.university_unit_department ;;
  description: "The university's department which would be targeted at with the program record"
}
dimension: university_unit_college {
  type: string
  sql: ${TABLE}.university_unit_college ;;
  description: "The university's college which would be targeted at with the program record"
}
dimension: university_unit_institute {
  type: string
  sql: ${TABLE}.university_unit_institute ;;
  description: "The university's institute which would be targeted at with the program record"
}
dimension: university_unit_division {
  type: string
  sql: ${TABLE}.university_unit_division ;;
  description: "The university's division which would be targeted at with the program record"
}
dimension: entry_level {
  type: string
  sql: ${TABLE}.entry_level ;;
  description: "Confirms the type of entry level required for the program (graduate, undergraduate, etc)"
}
dimension: award_type {
  type: string
  sql: ${TABLE}.award_type ;;
  description: "Confirms the award type to be recieved by the program"
}
dimension: award_title {
  type: string
  sql: ${TABLE}.award_title ;;
  description: "The name of the award"
}
dimension: award_code {
  type: string
  sql: ${TABLE}.award_code ;;
  description: "The code to link to the award"
}
dimension: duration_length {
  type: string
  sql: ${TABLE}.duration_length ;;
  description: "The length of the program"
}
dimension: entry_type_code {
  type: string
  sql: ${TABLE}.entry_type_code ;;
  description: "The code to link to the program's entry type/level"
}
}
view: core_scholarship_reason_owners {
sql_table_name: core_scholarship_reason_owners ;;
dimension: scholarship_reason_owner_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.scholarship_reason_owner_pk ;;
  description: "The key to link the core_scholarship_reasons_owner record to another record"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "The sales region group which the record will be placed under"
}
dimension: budget_pot {
  type: string
  sql: ${TABLE}.budget_pot ;;
  description: "Budget details"
}
dimension: budget_owner {
  type: string
  sql: ${TABLE}.budget_owner ;;
  description: "The owner of the budget"
}
}
view: core_scholarship_reasons {
sql_table_name: core_scholarship_reasons ;;
dimension: scholarship_reason_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.scholarship_reason_pk ;;
  description: "The key to link the scholarship reason to another record"
}
dimension: scholarship_reason {
  type: string
  sql: ${TABLE}.scholarship_reason ;;
  description: "The reason behind the scholarship being given"
}
dimension: budget_pot {
  type: string
  sql: ${TABLE}.budget_pot ;;
  description: "Budget details"
}
}
view: core_sponsors {
sql_table_name: core_sponsors ;;
dimension: sponsor_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.sponsor_pk ;;
  description: "The key to link a sponsor to a certain record"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "The key to link a country to a certain record"
}
dimension: sponsor_natural_key {
  type: number
  sql: ${TABLE}.sponsor_natural_key ;;
  description: "The key to link a sponsor to a certain record"
}
dimension: sponsor_salesforce_business_key {
  type: string
  sql: ${TABLE}.sponsor_salesforce_business_key ;;
  description: "The key to link a record to a sponsor salesforce business records"
}
dimension: country_natural_key {
  type: number
  sql: ${TABLE}.country_natural_key ;;
  description: "The key to link a country to a certain record"
}
dimension: name {
  type: string
  sql: ${TABLE}.name ;;
  description: "The name of the sponsor"
}
dimension: group {
  type: string
  sql: ${TABLE}.group ;;
  description: "The group which the sponsor belongs to"
}
dimension: status {
  type: string
  sql: ${TABLE}.status ;;
  description: "The status of the sponsor (active, suspended, etc)"
}
dimension: uk_sponsor {
  type: yesno
  sql: ${TABLE}.uk_sponsor ;;
  description: "Confirms if the sponsor is based in the UK"
}
}
view: core_subjects {
sql_table_name: core_subjects ;;
dimension: program_subject_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.program_subject_pk ;;
  description: "The key to link the program's subject to a record"
}
dimension: program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_fk ;;
  description: "The key to link a program to a record"
}
dimension: program_natural_key {
  type: number
  sql: ${TABLE}.program_natural_key ;;
  description: "The key to link a program to a record"
}
dimension: subject {
  type: string
  sql: ${TABLE}.subject ;;
  description: "The name of the subject which the program will be on"
}
dimension: subject_group {
  type: string
  sql: ${TABLE}.subject_group ;;
  description: "The group which the subject will be based under"
}
}
view: core_user_mapping {
sql_table_name: core_user_mapping ;;
dimension: user_mapping_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.user_mapping_pk ;;
  description: "not available"
}
dimension: user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.user_fk ;;
  description: "The key to link an user to a record"
}
dimension: user_natural_key {
  type: string
  sql: ${TABLE}.user_natural_key ;;
  description: "The key to link an user to a record"
}
dimension: sales_region {
  type: string
  sql: ${TABLE}.sales_region ;;
  description: "The sales region which the user is based"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "The sales region group which the user is based under"
}
dimension_group: valid_from {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.valid_from ;;
  description: "The date which the user record is valid from"
}
dimension_group: valid_to {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.valid_to ;;
  description: "The date which the user record is valid to"
}
}
view: core_users {
sql_table_name: core_users ;;
dimension: user_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.user_pk ;;
  description: "The key to link an user to a record"
}
dimension: user_natural_key {
  type: string
  sql: ${TABLE}.user_natural_key ;;
  description: "The key to link an user to a record"
}
dimension: name {
  type: string
  sql: ${TABLE}.name ;;
  description: "The name of the applicant/user"
}
dimension: sales_region {
  type: string
  sql: ${TABLE}.sales_region ;;
  description: "The sales region which the user is based"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "The sales region group which the user is based under"
}
}
view: product_progression_plans {
sql_table_name: product_progression_plans ;;
dimension: progression_plan_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
dimension: progression_plan_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.progression_plan_fk ;;
  description: "The key to link a record to a progression plan"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "The key to link a record to an application"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "The key to link a record to an institution"
}
dimension: progression_plan_program_intake_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.progression_plan_program_intake_fk ;;
  description: "The key to link a record to a progression plan's program intake"
}
dimension: progression_plan_program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.progression_plan_program_fk ;;
  description: "The key to link a record to a progression plan's program"
}
dimension: institution_natural_key {
  type: number
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
dimension: progression_plan_program_natural_key {
  type: number
  sql: ${TABLE}.progression_plan_program_natural_key ;;
  description: "The key to link a record to a progression plan's program"
}
dimension: version_number {
  type: number
  sql: ${TABLE}.version_number ;;
  description: "The progression plan's version number"
}
dimension: entry_type_code {
  type: string
  sql: ${TABLE}.entry_type_code ;;
  description: "The code to indicate how the applicant had entry to the progression plan"
}
dimension: degree_code {
  type: string
  sql: ${TABLE}.degree_code ;;
  description: "The code to indicate the degree from the progression plan"
}
dimension: degree_name {
  type: string
  sql: ${TABLE}.degree_name ;;
  description: "The name of the degree recieved by the progression plan"
}
dimension: degree_entry_level {
  type: string
  sql: ${TABLE}.degree_entry_level ;;
  description: "The level of entry needed to access the degree (undergraduate, graduate, etc)"
}
dimension: is_primary_progression {
  type: string
  sql: ${TABLE}.is_primary_progression ;;
  description: "Confirms if the progression path is a primary progression path"
}
dimension_group: university_intake_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.university_intake_date ;;
  description: "The intake date for the start of the progression plan at the university"
}
dimension: university_intake_season {
  type: string
  sql: ${TABLE}.university_intake_season ;;
  description: ""
}
dimension_group: university_enrolment {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.university_enrolment ;;
  description: "The date of enrolment for the university course"
}
dimension_group: degree_teaching_end {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.degree_teaching_end ;;
  description: "The end date of teaching for the university course"
}
dimension_group: degree_start {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.degree_start ;;
  description: "The start date for the university course"
}
dimension_group: degree_end {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.degree_end ;;
  description: "The end date for the university course"
}
dimension_group: degree_teaching_start {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.degree_teaching_start ;;
  description: "The start date of teaching for the university course"
}
dimension_group: created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.created_at ;;
  description: "The created at date for the progression plan"
}
dimension_group: modified_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.modified_at ;;
  description: "The last date the progression plan was modified at"
}
}
view: product_progression_plans_history {
sql_table_name: product_progression_plans_history ;;
dimension: study_plan_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
dimension: progression_plan_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.progression_plan_pk ;;
  description: "The key to link a record to a progression plan"
}
dimension: progression_plan_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.progression_plan_fk ;;
  description: "The key to link a record to a progression plan"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "The key to link a record to an application"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "The key to link a record to an institution"
}
dimension: progression_plan_program_intake_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.progression_plan_program_intake_fk ;;
  description: "The key to link a record to a progression plan's program intake"
}
dimension: progression_plan_program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.progression_plan_program_fk ;;
  description: "The key to link a record to a progression plan's program"
}
dimension: institution_natural_key {
  type: number
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
dimension: progression_plan_program_natural_key {
  type: number
  sql: ${TABLE}.progression_plan_program_natural_key ;;
  description: "The key to link a record to a progression plan's program"
}
dimension: progression_plan_version_number {
  type: number
  sql: ${TABLE}.progression_plan_version_number ;;
  description: "not available"
}
dimension: progression_plan_track_entry_type_code {
  type: string
  sql: ${TABLE}.progression_plan_track_entry_type_code ;;
  description: "not available"
}
dimension: progression_plan_program_code {
  type: string
  sql: ${TABLE}.progression_plan_program_code ;;
  description: "not available"
}
dimension: progression_plan_program_name {
  type: string
  sql: ${TABLE}.progression_plan_program_name ;;
  description: "not available"
}
dimension: progression_plan_entry_level {
  type: string
  sql: ${TABLE}.progression_plan_entry_level ;;
  description: "not available"
}
dimension: is_primary_progression {
  type: string
  sql: ${TABLE}.is_primary_progression ;;
  description: "Confirms if the progression path is a primary progression path"
}
dimension_group: progression_plan_intake_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.progression_plan_intake_date ;;
  description: "not available"
}
dimension: progression_plan_intake_season {
  type: string
  sql: ${TABLE}.progression_plan_intake_season ;;
  description: "not available"
}
dimension_group: enrolment_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.enrolment_date ;;
  description: "not available"
}
dimension_group: progression_plan_teaching_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.progression_plan_teaching_end_date ;;
  description: "not available"
}
dimension_group: progression_plan_program_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.progression_plan_program_start_date ;;
  description: "not available"
}
dimension_group: progression_plan_program_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.progression_plan_program_end_date ;;
  description: "not available"
}
dimension_group: progression_plan_teaching_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.progression_plan_teaching_start_date ;;
  description: "not available"
}
dimension_group: progression_plan_created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.progression_plan_created_at ;;
  description: "not available"
}
dimension_group: progression_plan_modified_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.progression_plan_modified_at ;;
  description: "not available"
}
dimension_group: progression_plan_valid_from {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.progression_plan_valid_from ;;
  description: "When the progression plan was valid from"
}
dimension_group: progression_plan_valid_to {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.progression_plan_valid_to ;;
  description: "When the progression plan was valid to"
}
dimension: progression_plan_index {
  type: number
  sql: ${TABLE}.progression_plan_index ;;
  description: "The index for the progression plan historical records to help organise"
}
dimension: is_current_progression_plan_record {
  type: yesno
  sql: ${TABLE}.is_current_progression_plan_record ;;
  description: "Confirms if the historical progression plan record is also a current one"
}
}
view: product_study_plans {
sql_table_name: product_study_plans ;;
dimension: study_plan_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.study_plan_pk ;;
  description: "The key to link a record to a study plan"
}
dimension: study_plan_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_fk ;;
  description: "The key to link a record to a study plan"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "The key to link a record to an application"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "The key to link a record to an institution"
}
dimension: study_plan_program_intake_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_program_intake_fk ;;
  description: "The key to link a record to a study plan's program intake"
}
dimension: study_plan_program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_program_fk ;;
  description: "The key to link a record to a study plan's program"
}
dimension: study_plan_natural_key {
  type: number
  sql: ${TABLE}.study_plan_natural_key ;;
  description: "The key to link a record to a study plan"
}
dimension: institution_natural_key {
  type: number
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
dimension: study_plan_program_natural_key {
  type: number
  sql: ${TABLE}.study_plan_program_natural_key ;;
  description: "The key to link a record to a study plan's program"
}
dimension: version_number {
  type: number
  sql: ${TABLE}.version_number ;;
  description: "The study plan's version number"
}
dimension: entry_type_code {
  type: string
  sql: ${TABLE}.entry_type_code ;;
  description: "The code to indicate how the applicant had entry to the study plan"
}
dimension: course_code {
  type: string
  sql: ${TABLE}.course_code ;;
  description: "The code to link a record to the course"
}
dimension: course_name {
  type: string
  sql: ${TABLE}.course_name ;;
  description: "The name of the study plan course"
}
dimension_group: intake_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.intake_date ;;
  description: "The intake date for the study plan"
}
dimension: intake_season {
  type: string
  sql: ${TABLE}.intake_season ;;
  description: "The intake season for the study plan"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "The year and season of the intake for the study plan"
}
dimension: intake_academic_year {
  type: string
  sql: ${TABLE}.intake_academic_year ;;
  description: "The academic year which the intake will be based in"
}
dimension: entry_level {
  type: string
  sql: ${TABLE}.entry_level ;;
  description: "The entry level required for the study plan course (undergraduate, graduate, etc)"
}
dimension_group: enrolment {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.enrolment ;;
  description: "The enrolment date of the study plan"
}
dimension_group: course_start {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.course_start ;;
  description: "The course start date for the study plan"
}
dimension_group: course_end {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.course_end ;;
  description: "The course end date for the study plan"
}
dimension_group: teaching_end {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.teaching_end ;;
  description: "The teaching end date for the study plan course"
}
dimension_group: teaching_start {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.teaching_start ;;
  description: "The teaching start date for the study plan course"
}
dimension_group: created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.created_at ;;
  description: "When the study plan was created"
}
dimension_group: modified_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.modified_at ;;
  description: "When the study plan was last modified at"
}
dimension: is_current_version {
  type: yesno
  sql: ${TABLE}.is_current_version ;;
  description: "not available"
}
dimension: has_deferred {
  type: yesno
  sql: ${TABLE}.has_deferred ;;
  description: "not available"
}
dimension: is_deferred {
  type: yesno
  sql: ${TABLE}.is_deferred ;;
  description: "not available"
}
}
view: product_study_plans_history {
sql_table_name: product_study_plans_history ;;
dimension: study_plan_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.study_plan_history_pk ;;
  description: "The key to link a record to the study plan history record"
}
dimension: pathway_sk {
  type: string
  sql: ${TABLE}.pathway_sk ;;
  description: "The surrogate key to link to the record"
}
dimension: study_plan_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_fk ;;
  description: "The key to link a record to a study plan"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "The key to link a record to an application"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "The key to link a record to an institution"
}
dimension: study_plan_program_intake_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_program_intake_fk ;;
  description: "The key to link a record to a study plan's program intake"
}
dimension: study_plan_program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_program_fk ;;
  description: "The key to link a record to a study plan's program"
}
dimension: study_plan_natural_key {
  type: number
  sql: ${TABLE}.study_plan_natural_key ;;
  description: "The key to link a record to a study plan"
}
dimension: institution_natural_key {
  type: number
  sql: ${TABLE}.institution_natural_key ;;
  description: "The key to link a record to an institution"
}
dimension: study_plan_program_natural_key {
  type: number
  sql: ${TABLE}.study_plan_program_natural_key ;;
  description: "The key to link a record to a study plan's program"
}
dimension: study_plan_version_number {
  type: number
  sql: ${TABLE}.study_plan_version_number ;;
  description: "not available"
}
dimension: study_plan_track_entry_type_code {
  type: string
  sql: ${TABLE}.study_plan_track_entry_type_code ;;
  description: "not available"
}
dimension: study_plan_program_code {
  type: string
  sql: ${TABLE}.study_plan_program_code ;;
  description: "not available"
}
dimension: study_plan_program_name {
  type: string
  sql: ${TABLE}.study_plan_program_name ;;
  description: "not available"
}
dimension_group: study_plan_intake_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.study_plan_intake_date ;;
  description: "not available"
}
dimension: study_plan_intake_season {
  type: string
  sql: ${TABLE}.study_plan_intake_season ;;
  description: "not available"
}
dimension: study_plan_program_entry_level {
  type: string
  sql: ${TABLE}.study_plan_program_entry_level ;;
  description: "not available"
}
dimension_group: enrolment_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.enrolment_date ;;
  description: "not available"
}
dimension_group: study_plan_program_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.study_plan_program_start_date ;;
  description: "not available"
}
dimension_group: study_plan_program_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.study_plan_program_end_date ;;
  description: "not available"
}
dimension_group: study_plan_teaching_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.study_plan_teaching_end_date ;;
  description: "not available"
}
dimension_group: study_plan_teaching_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.study_plan_teaching_start_date ;;
  description: "not available"
}
dimension_group: study_plan_created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.study_plan_created_at ;;
  description: "not available"
}
dimension_group: study_plan_modified_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.study_plan_modified_at ;;
  description: "not available"
}
dimension_group: study_plan_valid_from {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.study_plan_valid_from ;;
  description: "When the study plan was valid from"
}
dimension_group: study_plan_valid_to {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.study_plan_valid_to ;;
  description: "When the study plan was valid to"
}
dimension: study_plan_index {
  type: number
  sql: ${TABLE}.study_plan_index ;;
  description: "The index for the study plan historical records to help organise"
}
dimension: is_current_study_plan_record {
  type: yesno
  sql: ${TABLE}.is_current_study_plan_record ;;
  description: "Confirms if the historical study plan record is also a current one"
}
dimension: has_deferred {
  type: string
  sql: ${TABLE}.has_deferred ;;
  description: "Confirms if the student has deferred from the study plan"
}
}
view: sales_application_agent_bridge {
sql_table_name: sales_application_agent_bridge ;;
dimension: application_agent_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.application_agent_pk ;;
  description: "Unique id to link an agent with an application"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "Id used to link records to application records"
}
dimension: agent_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.agent_fk ;;
  description: "Id used to link records to agent records"
}
dimension: is_main_agent {
  type: yesno
  sql: ${TABLE}.is_main_agent ;;
  description: "not available"
}
}
view: sales_application_history {
sql_table_name: sales_application_history ;;
dimension: application_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "Id used to link records to application records"
}
dimension: program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_fk ;;
  description: "The key to indicate the related program/course"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "The key to indicate the related institution"
}
dimension: program_intake_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_intake_fk ;;
  description: "The key that relates to the program intake"
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "not available"
}
dimension: sales_manager_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.sales_manager_fk ;;
  description: "not available"
}
dimension: application_owner_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_owner_fk ;;
  description: "not available"
}
dimension: cas_team_owner_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.cas_team_owner_fk ;;
  description: "not available"
}
dimension: sponsor_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.sponsor_fk ;;
  description: "not available"
}
dimension_group: valid_from {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.valid_from ;;
  description: "The start date of the application"
}
dimension_group: valid_to {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.valid_to ;;
  description: "The end date of the application"
}
dimension: status {
  type: string
  sql: ${TABLE}.status ;;
  description: "not available"
}
dimension: status_group {
  type: string
  sql: ${TABLE}.status_group ;;
  description: "not available"
}
dimension: study_plan_version_number {
  type: number
  sql: ${TABLE}.study_plan_version_number ;;
  description: "The number to indicate what type of study plan the application is following"
}
dimension: program_code {
  type: string
  sql: ${TABLE}.program_code ;;
  description: "not available"
}
dimension: program_name {
  type: string
  sql: ${TABLE}.program_name ;;
  description: "The name of the program/course"
}
dimension_group: intake {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.intake ;;
  description: "not available"
}
dimension: salesforce_opportunity_natural_key {
  type: string
  sql: ${TABLE}.salesforce_opportunity_natural_key ;;
  description: "not available"
}
dimension_group: created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.created_at ;;
  description: "not available"
}
dimension_group: modified_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.modified_at ;;
  description: "not available"
}
dimension: applications {
  type: number
  sql: ${TABLE}.applications ;;
  description: "Full list/count of applications"
}
dimension: offers {
  type: number
  sql: ${TABLE}.offers ;;
  description: "Full list/count of offers"
}
dimension: deposits {
  type: number
  sql: ${TABLE}.deposits ;;
  description: "Full list/count of deposits"
}
dimension: enrolled {
  type: number
  sql: ${TABLE}.enrolled ;;
  description: "Full list/count of enrolled"
}
dimension: lost {
  type: number
  sql: ${TABLE}.lost ;;
  description: "Full list/count of lost records"
}
dimension: change_count {
  type: number
  sql: ${TABLE}.change_count ;;
  description: "Counts the amount of changes to the applicant (Such as switched program and intake etc)"
}
dimension: change {
  type: string
  sql: ${TABLE}.change ;;
  description: "Gives a description of the change to the applicant"
}
dimension: has_deferred {
  type: string
  sql: ${TABLE}.has_deferred ;;
  description: "Has the applicant deferred"
}
}
view: sales_applications {
sql_table_name: sales_applications ;;
dimension: study_plan_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_fk ;;
  description: "not available"
}
dimension: application_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.application_pk ;;
  description: "Unique id for an application. Keep in mind that a student may have multiple applications"
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "The student that applied"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "The college or university where the student will start studies"
}
dimension: sales_manager_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.sales_manager_fk ;;
  description: "The sales manager which is in charge of the sales based applications"
}
dimension: application_owner_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_owner_fk ;;
  description: "The owner/user of the application"
}
dimension: cas_team_owner_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.cas_team_owner_fk ;;
  description: "Key to determine the cas team owner"
}
dimension: sponsor_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.sponsor_fk ;;
  description: "not available"
}
dimension: application_natural_key {
  type: number
  sql: ${TABLE}.application_natural_key ;;
  description: "not available"
}
dimension: student_natural_key {
  type: string
  sql: ${TABLE}.student_natural_key ;;
  description: "The key to indicate the student"
}
dimension: sales_manager_natural_key {
  type: string
  sql: ${TABLE}.sales_manager_natural_key ;;
  description: "The key to indicate the sales manager"
}
dimension: application_owner_natural_key {
  type: string
  sql: ${TABLE}.application_owner_natural_key ;;
  description: "The key to indicate the application owner"
}
dimension: cas_team_owner_natural_key {
  type: string
  sql: ${TABLE}.cas_team_owner_natural_key ;;
  description: "Key to determine the cas team owner"
}
dimension: salesforce_opportunity_natural_key {
  type: string
  sql: ${TABLE}.salesforce_opportunity_natural_key ;;
  description: "The key to indicate and link to the salesforce opportunity id"
}
dimension: sponsor_natural_key {
  type: number
  sql: ${TABLE}.sponsor_natural_key ;;
  description: "The key to indicate and link the record to the sponsor"
}
dimension_group: created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.created_at ;;
  description: "The date the application was created"
}
dimension_group: modified_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.modified_at ;;
  description: "The date the application was last modified at"
}
dimension_group: status_update {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.status_update ;;
  description: "not available"
}
dimension_group: intake_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.intake_date ;;
  description: "The date where the application/student will start the course"
}
dimension: payment_status {
  type: string
  sql: ${TABLE}.payment_status ;;
  description: "The status of the payment process for the application"
}
dimension: immigration_category {
  type: string
  sql: ${TABLE}.immigration_category ;;
  description: "The status of immigration the applicant will be in"
}
dimension: learning_mode {
  type: string
  sql: ${TABLE}.learning_mode ;;
  description: "The way the student will be studying (on campus, digital learning, etc)"
}
dimension: returning_student {
  type: string
  sql: ${TABLE}.returning_student ;;
  description: "Confirms if the applicant is a returning student"
}
dimension: accommodation_required {
  type: string
  sql: ${TABLE}.accommodation_required ;;
  description: "Confirms if accommodation is required for the applicant"
}
dimension: sponsor_reference {
  type: string
  sql: ${TABLE}.sponsor_reference ;;
  description: "not available"
}
dimension: is_offer_letter_issued {
  type: yesno
  sql: ${TABLE}.is_offer_letter_issued ;;
  description: "Has the offer letter been issued?"
}
dimension: is_acceptance_form_issued {
  type: yesno
  sql: ${TABLE}.is_acceptance_form_issued ;;
  description: "Has the acceptance form been issued?"
}
dimension: is_visa_needed {
  type: yesno
  sql: ${TABLE}.is_visa_needed ;;
  description: "Is a visa needed for applicant"
}
dimension: is_application_submitted {
  type: yesno
  sql: ${TABLE}.is_application_submitted ;;
  description: "Has the application been submitted?"
}
dimension: is_application_completed {
  type: yesno
  sql: ${TABLE}.is_application_completed ;;
  description: "Is the application completed?"
}
dimension: is_confirmation_required {
  type: yesno
  sql: ${TABLE}.is_confirmation_required ;;
  description: "Is confirmation required from any parties for the application"
}
dimension: has_second_agent {
  type: yesno
  sql: ${TABLE}.has_second_agent ;;
  description: "Has their been any involment from a second agent for the application"
}
dimension: has_deferred {
  type: string
  sql: ${TABLE}.has_deferred ;;
  description: "Has the applicant deferred?"
}
dimension: class_application_id {
  type: number
  sql: ${TABLE}.class_application_id ;;
  description: "Confirm the id for the class"
}
dimension: status {
  type: string
  sql: ${TABLE}.status ;;
  description: "The current status of the application, a mix of numeric code and text description"
}
dimension: status_group {
  type: string
  sql: ${TABLE}.status_group ;;
  description: "Like application status but grouped into 5 codes"
}
dimension: is_deferred {
  type: yesno
  sql: ${TABLE}.is_deferred ;;
  description: "not available"
}
dimension: weighting {
  type: number
  sql: ${TABLE}.weighting ;;
  description: "The percentage of offers per student (all offers add up too one)"
}
dimension: weighting_non_deferred {
  type: number
  sql: ${TABLE}.weighting_non_deferred ;;
  description: "The percentage of offers per student excluding deferred (all offers add up too one)"
}
}
view: sales_applications_history {
sql_table_name: sales_applications_history ;;
dimension: application_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.application_history_pk ;;
  description: "not available"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "not available"
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "not available"
}
dimension: sales_manager_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.sales_manager_fk ;;
  description: "not available"
}
dimension: application_owner_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_owner_fk ;;
  description: "not available"
}
dimension: cas_team_owner_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.cas_team_owner_fk ;;
  description: "not available"
}
dimension: sponsor_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.sponsor_fk ;;
  description: "not available"
}
dimension: application_natural_key {
  type: number
  sql: ${TABLE}.application_natural_key ;;
  description: "not available"
}
dimension: student_natural_key {
  type: string
  sql: ${TABLE}.student_natural_key ;;
  description: "not available"
}
dimension: sales_manager_natural_key {
  type: string
  sql: ${TABLE}.sales_manager_natural_key ;;
  description: "not available"
}
dimension: application_owner_natural_key {
  type: string
  sql: ${TABLE}.application_owner_natural_key ;;
  description: "not available"
}
dimension: cas_team_owner_natural_key {
  type: string
  sql: ${TABLE}.cas_team_owner_natural_key ;;
  description: "not available"
}
dimension: salesforce_opportunity_natural_key {
  type: string
  sql: ${TABLE}.salesforce_opportunity_natural_key ;;
  description: "not available"
}
dimension: sponsor_natural_key {
  type: number
  sql: ${TABLE}.sponsor_natural_key ;;
  description: "not available"
}
dimension_group: created_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.created_ts ;;
  description: "not available"
}
dimension_group: modified_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.modified_ts ;;
  description: "not available"
}
dimension_group: application_status_log_created_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.application_status_log_created_ts ;;
  description: "not available"
}
dimension: application_status {
  type: string
  sql: ${TABLE}.application_status ;;
  description: "not available"
}
dimension: application_status_group {
  type: string
  sql: ${TABLE}.application_status_group ;;
  description: "not available"
}
dimension: payment_status {
  type: string
  sql: ${TABLE}.payment_status ;;
  description: "not available"
}
dimension: immigration_category {
  type: string
  sql: ${TABLE}.immigration_category ;;
  description: "not available"
}
dimension: learning_mode {
  type: string
  sql: ${TABLE}.learning_mode ;;
  description: "not available"
}
dimension: returning_student {
  type: string
  sql: ${TABLE}.returning_student ;;
  description: "not available"
}
dimension: accommodation_required {
  type: string
  sql: ${TABLE}.accommodation_required ;;
  description: "not available"
}
dimension: sponsor_reference {
  type: string
  sql: ${TABLE}.sponsor_reference ;;
  description: "not available"
}
dimension: is_offer_letter_issued {
  type: yesno
  sql: ${TABLE}.is_offer_letter_issued ;;
  description: "not available"
}
dimension: is_acceptance_form_issued {
  type: yesno
  sql: ${TABLE}.is_acceptance_form_issued ;;
  description: "not available"
}
dimension: is_visa_needed {
  type: yesno
  sql: ${TABLE}.is_visa_needed ;;
  description: "not available"
}
dimension: is_application_submitted {
  type: yesno
  sql: ${TABLE}.is_application_submitted ;;
  description: "not available"
}
dimension: is_application_completed {
  type: yesno
  sql: ${TABLE}.is_application_completed ;;
  description: "not available"
}
dimension: is_confirmation_required {
  type: yesno
  sql: ${TABLE}.is_confirmation_required ;;
  description: "not available"
}
dimension: has_second_agent {
  type: yesno
  sql: ${TABLE}.has_second_agent ;;
  description: "not available"
}
dimension: class_application_id {
  type: number
  sql: ${TABLE}.class_application_id ;;
  description: "not available"
}
dimension: old_title {
  type: string
  sql: ${TABLE}.old_title ;;
  description: "Displays the previous application status before changing in the new title"
}
dimension: new_title {
  type: string
  sql: ${TABLE}.new_title ;;
  description: "Displays the new application status from changing from the old title"
}
dimension_group: application_valid_from {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.application_valid_from ;;
  description: "Date application is valid from"
}
dimension_group: application_valid_to {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.application_valid_to ;;
  description: "Date application is valid to"
}
dimension: application_index {
  type: number
  sql: ${TABLE}.application_index ;;
  description: "The index format of the row of applications"
}
dimension: is_current_application_record {
  type: yesno
  sql: ${TABLE}.is_current_application_record ;;
  description: "Is the application a current or past record"
}
dimension: application_status_duration_seconds {
  type: number
  sql: ${TABLE}.application_status_duration_seconds ;;
  description: "The time the application was kept on each status"
}
dimension: application_weight {
  type: number
  sql: ${TABLE}.application_weight ;;
  description: "not available"
}
}
view: sales_applications_quota {
sql_table_name: sales_applications_quota ;;
dimension: application_quota_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.application_quota_pk ;;
  description: "not available"
}
dimension: quota_allocation_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.quota_allocation_fk ;;
  description: "not available"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "not available"
}
dimension: degree_name {
  type: string
  sql: ${TABLE}.degree_name ;;
  description: "not available"
}
dimension: application_status_group {
  type: string
  sql: ${TABLE}.application_status_group ;;
  description: "not available"
}
}
view: sales_applications_summary {
sql_table_name: sales_applications_summary ;;
dimension: application_summary_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.application_summary_pk ;;
  description: "not available"
}
dimension: sales_applications_application_count {
  type: number
  sql: ${TABLE}.sales_applications_application_count ;;
  description: "The weighted count of applications. In other words, the number of students who have applied including offers, deposits, and enrollments."
}
dimension: sales_applications_unweighted_offer_count {
  type: number
  sql: ${TABLE}.sales_applications_unweighted_offer_count ;;
  description: "not available"
}
dimension: sales_applications_application_offer_count {
  type: number
  sql: ${TABLE}.sales_applications_application_offer_count ;;
  description: "The weighted count of applications in offer state. In other words, the number of students who have received an offer but not yet made a deposit."
}
dimension: sales_applications_unconverted_application_count {
  type: number
  sql: ${TABLE}.sales_applications_unconverted_application_count ;;
  description: "The weighted count of applications in application state. In other words, the number of students who have applied but not yet received an offer."
}
dimension: sales_applications_application_count_non_deferred {
  type: number
  sql: ${TABLE}.sales_applications_application_count_non_deferred ;;
  description: "not available"
}
dimension: sales_applications_application_offer_count_non_deferred {
  type: number
  sql: ${TABLE}.sales_applications_application_offer_count_non_deferred ;;
  description: "not available"
}
dimension: sales_applications_unconverted_application_count_non_deferred {
  type: number
  sql: ${TABLE}.sales_applications_unconverted_application_count_non_deferred ;;
  description: "not available"
}
dimension: sales_applications_application_deposit_count {
  type: number
  sql: ${TABLE}.sales_applications_application_deposit_count ;;
  description: "The number of applications that have converted to deposits."
}
dimension: sales_applications_application_enrolled_count {
  type: number
  sql: ${TABLE}.sales_applications_application_enrolled_count ;;
  description: "The number of applications that have converted to enrolled students."
}
dimension: sales_applications_enrollments_and_deposit_count {
  type: number
  sql: ${TABLE}.sales_applications_enrollments_and_deposit_count ;;
  description: "not available"
}
}
view: sales_new_programs {
sql_table_name: sales_new_programs ;;
dimension: program_launch_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.program_launch_pk ;;
  description: ""
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "not available"
}
dimension: program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_fk ;;
  description: "not available"
}
dimension: program_intake_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_intake_fk ;;
  description: "not available"
}
dimension: launch_name {
  type: string
  sql: ${TABLE}.launch_name ;;
  description: "Name of the new program"
}
dimension_group: launch {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.launch ;;
  description: "Date of launch"
}
dimension_group: launch_expiry {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.launch_expiry ;;
  description: "Expiry date of launch"
}
dimension: institution_name {
  type: string
  sql: ${TABLE}.institution_name ;;
  description: "Name of institution"
}
dimension: program_code {
  type: string
  sql: ${TABLE}.program_code ;;
  description: "Code to link to program"
}
dimension: program_name {
  type: string
  sql: ${TABLE}.program_name ;;
  description: "Name of program/course"
}
dimension: program_type {
  type: string
  sql: ${TABLE}.program_type ;;
  description: "Type of program/course"
}
dimension: award_name {
  type: string
  sql: ${TABLE}.award_name ;;
  description: "Name of the award"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "Season and year of intake for the applicant"
}
}
view: sales_priority_programs {
sql_table_name: sales_priority_programs ;;
dimension: priority_program_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.priority_program_pk ;;
  description: "not available"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "not available"
}
dimension: program_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_fk ;;
  description: "not available"
}
dimension: program_intake_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.program_intake_fk ;;
  description: "not available"
}
dimension: priority_reason {
  type: string
  sql: ${TABLE}.priority_reason ;;
  description: "not available"
}
dimension: institution_name {
  type: string
  sql: ${TABLE}.institution_name ;;
  description: "not available"
}
dimension: program_code {
  type: string
  sql: ${TABLE}.program_code ;;
  description: "not available"
}
dimension: program_name {
  type: string
  sql: ${TABLE}.program_name ;;
  description: "not available"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "not available"
}
}
view: sales_quota_allocations {
sql_table_name: sales_quota_allocations ;;
dimension: quota_allocation_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.quota_allocation_pk ;;
  description: "not available"
}
dimension: university_code {
  type: string
  sql: ${TABLE}.university_code ;;
  description: "not available"
}
dimension: university_name {
  type: string
  sql: ${TABLE}.university_name ;;
  description: "not available"
}
dimension: college_code {
  type: string
  sql: ${TABLE}.college_code ;;
  description: "not available"
}
dimension: degree_concat {
  type: string
  sql: ${TABLE}.degree_concat ;;
  description: "not available"
}
dimension: quota_group {
  type: string
  sql: ${TABLE}.quota_group ;;
  description: "not available"
}
dimension: nationaility_criteria {
  type: string
  sql: ${TABLE}.nationaility_criteria ;;
  description: "not available"
}
dimension: sponsor_criteria {
  type: string
  sql: ${TABLE}.sponsor_criteria ;;
  description: "not available"
}
dimension: agent_region_criteria {
  type: string
  sql: ${TABLE}.agent_region_criteria ;;
  description: "not available"
}
dimension: program_criteria {
  type: string
  sql: ${TABLE}.program_criteria ;;
  description: "not available"
}
dimension: quota_year {
  type: number
  sql: ${TABLE}.quota_year ;;
  description: "not available"
}
dimension: deposits_amt {
  type: number
  sql: ${TABLE}.deposits_amt ;;
  description: "not available"
}
dimension: cas_enrolment_amt {
  type: number
  sql: ${TABLE}.cas_enrolment_amt ;;
  description: "not available"
}
dimension: progression_amt {
  type: number
  sql: ${TABLE}.progression_amt ;;
  description: "not available"
}
dimension_group: limited {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.limited ;;
  description: "not available"
}
dimension_group: closed {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.closed ;;
  description: "not available"
}
}
view: sales_scholarships {
sql_table_name: sales_scholarships ;;
dimension: scholarships_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.scholarships_pk ;;
  description: "not available"
}
dimension: study_plan_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.study_plan_fk ;;
  description: "The key to relate to the type of study plan"
}
dimension: application_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.application_fk ;;
  description: "The key to relate to a certain application"
}
dimension: scholarship_reason {
  type: string
  sql: ${TABLE}.scholarship_reason ;;
  description: "Reason behind why the scholarship was given"
}
dimension: scholarship_note {
  type: string
  sql: ${TABLE}.scholarship_note ;;
  description: "Any additional information about the scholarship record"
}
dimension: student_ledger_currency_code {
  type: string
  sql: ${TABLE}.student_ledger_currency_code ;;
  description: "Code to indicate what currency the applicant is using"
}
dimension: student_ledger_sop_line_item_actual_amount {
  type: number
  sql: ${TABLE}.student_ledger_sop_line_item_actual_amount ;;
  description: "The amount of the course after the scholarship has been given"
}
dimension: budget_pot {
  type: string
  sql: ${TABLE}.budget_pot ;;
  description: "Budget details"
}
dimension_group: created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.created_at ;;
  description: "not available"
}
dimension: application_status_group {
  type: string
  sql: ${TABLE}.application_status_group ;;
  description: "Status/point of progress group of an application"
}
}
view: sales_student {
sql_table_name: sales_student ;;
dimension: student_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.student_pk ;;
  description: "The key to link to/indicate a certain student"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "The country of residence of the student (when recruited)"
}
dimension: nationality_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.nationality_fk ;;
  description: "The nationality of the student"
}
dimension: student_natural_key {
  type: string
  sql: ${TABLE}.student_natural_key ;;
  description: "The key to indicate and link to a student"
}
dimension: kss_student_id {
  type: string
  sql: ${TABLE}.kss_student_id ;;
  description: "The kss format id to indicate and link to a student"
}
dimension: class_student_id {
  type: string
  sql: ${TABLE}.class_student_id ;;
  description: "The id to determine the student's class"
}
dimension: student_salesforce_natural_key {
  type: string
  sql: ${TABLE}.student_salesforce_natural_key ;;
  description: "The unique id of the student in Salesforce."
}
dimension: name {
  type: string
  sql: ${TABLE}.name ;;
  description: "The student's name"
}
dimension: gender {
  type: string
  sql: ${TABLE}.gender ;;
  description: "The student's gender"
}
dimension: country_iso_key {
  type: string
  sql: ${TABLE}.country_iso_key ;;
  description: "An abbreviation for the names of countries linked to the student nationality (United States Of America = USA, etc)"
}
dimension: country_natural_key {
  type: number
  sql: ${TABLE}.country_natural_key ;;
  description: "The key to indicate the country linked to the student"
}
dimension: source {
  type: string
  sql: ${TABLE}.source ;;
  description: "This how the student was introduced to Kaplan. Similar to recruitment channel but for student instead of application."
}
dimension: nationality {
  type: string
  sql: ${TABLE}.nationality ;;
  description: "The nationality of the student"
}
dimension_group: dob {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.dob ;;
  description: "The student's date of birth."
}
dimension_group: created_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.created_at ;;
  description: "The date when the student record was created"
}
dimension_group: modified_at {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.modified_at ;;
  description: "The last date when the student record was modified"
}
}
view: scholarship_budgets {
sql_table_name: scholarship_budgets ;;
dimension: scholarship_budgets_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.scholarship_budgets_pk ;;
  description: "The key to link to the scholarship budget records"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "Season and year of when the student will start"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "The region group of where the applicant is based (before studying)"
}
dimension: schols_region {
  type: string
  sql: ${TABLE}.schols_region ;;
  description: "The scholarship region of the budget record"
}
dimension: budget_pot {
  type: string
  sql: ${TABLE}.budget_pot ;;
  description: "Budget details"
}
dimension: budget_amt {
  type: number
  sql: ${TABLE}.budget_amt ;;
  description: "The amount of budget"
}
dimension: budget_owner {
  type: string
  sql: ${TABLE}.budget_owner ;;
  description: "not available"
}
}
view: scholarship_targets {
sql_table_name: scholarship_targets ;;
dimension: scholarship_targets_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.scholarship_targets_pk ;;
  description: "not available"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "not available"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "not available"
}
dimension: schols_region {
  type: string
  sql: ${TABLE}.schols_region ;;
  description: "not available"
}
dimension: target_amt {
  type: number
  sql: ${TABLE}.target_amt ;;
  description: "not available"
}
dimension: budget_amt {
  type: number
  sql: ${TABLE}.budget_amt ;;
  description: "not available"
}
}
view: targets_institutions {
sql_table_name: targets_institutions ;;
dimension: institution_target_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.institution_target_pk ;;
  description: "not available"
}
dimension: institution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.institution_fk ;;
  description: "not available"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "not available"
}
dimension: institution_name {
  type: string
  sql: ${TABLE}.institution_name ;;
  description: "not available"
}
dimension: target_amt {
  type: number
  sql: ${TABLE}.target_amt ;;
  description: "not available"
}
}
view: targets_sales_regions {
sql_table_name: targets_sales_regions ;;
dimension: sales_region_target_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.sales_region_target_pk ;;
  description: "The key to link to the target sales region"
}
dimension: sales_region_target_country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.sales_region_target_country_fk ;;
  description: "The key to link to the target sales region country"
}
dimension: intake_name {
  type: string
  sql: ${TABLE}.intake_name ;;
  description: "The target season and year for when the student begins"
}
dimension: country_name {
  type: string
  sql: ${TABLE}.country_name ;;
  description: "The target country where the student will start studying"
}
dimension: sales_region {
  type: string
  sql: ${TABLE}.sales_region ;;
  description: "The target sales region where the student will start studying"
}
dimension: sales_region_group {
  type: string
  sql: ${TABLE}.sales_region_group ;;
  description: "The target sales region group where the student will start studying"
}
dimension: sales_channel {
  type: string
  sql: ${TABLE}.sales_channel ;;
  description: "The target sales channel the student when through (agent, online, etc)"
}
dimension: target_amt {
  type: number
  sql: ${TABLE}.target_amt ;;
  description: "The target amount of enrolments"
}
}

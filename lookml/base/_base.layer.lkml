explore: wh_core__advisors_dim
{ hidden: yes }
explore: wh_core__cities_dim
{ hidden: yes }
explore: wh_core__countries_dim
{ hidden: yes }
explore: wh_core__courses_dim
{ hidden: yes }
explore: wh_core__engagements_xa
{ hidden: yes }
explore: wh_core__schools_dim
{ hidden: yes }
explore: wh_core__states_dim
{ hidden: yes }
explore: wh_core__students_dim
{ hidden: yes }
explore: wh_core__students_xa
{ hidden: yes }
explore: wh_core__unclassified_users_dim
{ hidden: yes }
explore: wh_core__universities_dim
{ hidden: yes }
explore: wh_cs__external_events_fact
{ hidden: yes }
explore: wh_marketing__articles_dim
{ hidden: yes }
explore: wh_platform__applications_fact
{ hidden: yes }
explore: wh_platform__events_fact
{ hidden: yes }
explore: wh_platform__shortlists_fact
{ hidden: yes }
view: wh_core__advisors_dim {
sql_table_name: wh_core__advisors_dim ;;
set: wh_core__advisors_dim_set {
  fields: [advisor_platform_instance, advisor_email, advisor_roles, advisor_archived]
}
dimension: advisor_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.advisor_pk ;;
  description: "The primary key of the advisors table"
}
dimension: school_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.school_fk ;;
  description: "Primary key of the schools table"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
}
dimension: advisor_platform_instance {
  type: string
  sql: ${TABLE}.advisor_platform_instance ;;
  description: "The platform instance
* 'cn' = China
* 'com' = Rest of World"
  drill_fields: [wh_core__advisors_dim_set*]
}
dimension: advisor_email {
  type: string
  sql: ${TABLE}.advisor_email ;;
  description: "The email address associated with the advisor"
  drill_fields: [wh_core__advisors_dim_set*]
}
dimension: advisor_roles {
  type: string
  sql: ${TABLE}.advisor_roles ;;
  description: "Array with allowed sub roles for an advisor. This can include following sub_roles:
* advisor
* report_writer
* registrar"
  drill_fields: [wh_core__advisors_dim_set*]
}
dimension: advisor_archived {
  type: string
  sql: ${TABLE}.advisor_archived ;;
  description: "When an advisor is archived this is set to true, boolean value"
  drill_fields: [wh_core__advisors_dim_set*]
}
dimension_group: advisor_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.advisor_created_at ;;
  description: "When the advisor record was created"
}
dimension_group: advisor_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.advisor_updated_at ;;
  description: "When the advisor record was last updated"
}
}
view: wh_core__cities_dim {
sql_table_name: wh_core__cities_dim ;;
set: wh_core__cities_dim_set {
  fields: [city_name]
}
dimension: city_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.city_pk ;;
  description: "Primary key of the cities table"
}
dimension: state_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.state_fk ;;
  description: "Primary key of the states table"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
}
dimension: city_name {
  type: string
  sql: ${TABLE}.city_name ;;
  description: "The name of the city"
  drill_fields: [wh_core__cities_dim_set*]
}
}
view: wh_core__countries_dim {
sql_table_name: wh_core__countries_dim ;;
set: wh_core__countries_dim_set {
  fields: [country_name, country_continent, country_subregion]
}
dimension: country_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.country_pk ;;
  description: "Primary key of the countries table"
}
dimension: country_natural_key {
  type: string
  sql: ${TABLE}.country_natural_key ;;
  description: "The country code"
  drill_fields: [wh_core__countries_dim_set*]
}
dimension: country_name {
  type: string
  sql: ${TABLE}.country_name ;;
  description: "The name of the country"
  drill_fields: [wh_core__countries_dim_set*]
}
dimension: country_continent {
  type: string
  sql: ${TABLE}.country_continent ;;
  description: "The continent of the country"
  drill_fields: [wh_core__countries_dim_set*]
}
dimension: country_subregion {
  type: string
  sql: ${TABLE}.country_subregion ;;
  description: "The subregion of the country"
  drill_fields: [wh_core__countries_dim_set*]
}
}
view: wh_core__courses_dim {
sql_table_name: wh_core__courses_dim ;;
set: wh_core__courses_dim_set {
  fields: [course_name, course_kaplan_course]
}
dimension: course_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.course_pk ;;
  description: "Primary key of the courses table"
}
dimension: university_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
}
dimension: course_natural_key {
  type: string
  sql: ${TABLE}.course_natural_key ;;
  description: "The BUID of the course"
  drill_fields: [wh_core__courses_dim_set*]
}
dimension: course_ucas_natural_key {
  type: string
  sql: ${TABLE}.course_ucas_natural_key ;;
  description: "The ucas_course_id of the course, if known"
  drill_fields: [wh_core__courses_dim_set*]
}
dimension: course_non_china_natural_key {
  type: string
  sql: ${TABLE}.course_non_china_natural_key ;;
  description: "The course ID Of the record that corresponds to the non-China data. Superseded by BUID in the analytics warehouse."
  drill_fields: [wh_core__courses_dim_set*]
}
dimension: course_china_natural_key {
  type: string
  sql: ${TABLE}.course_china_natural_key ;;
  description: "The course ID Of the record that corresponds to the China data. Superseded by BUID in the analytics warehouse."
  drill_fields: [wh_core__courses_dim_set*]
}
dimension: course_name {
  type: string
  sql: ${TABLE}.course_name ;;
  description: "The name of the course"
  drill_fields: [wh_core__courses_dim_set*]
}
dimension: course_kaplan_course {
  type: string
  sql: ${TABLE}.course_kaplan_course ;;
  description: "descTBC"
  drill_fields: [wh_core__courses_dim_set*]
}
dimension_group: course_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.course_created_at ;;
  description: "When the course record was created"
}
dimension_group: course_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.course_updated_at ;;
  description: "When the course record was last updated"
}
}
view: wh_core__engagements_xa {
sql_table_name: wh_core__engagements_xa ;;
set: wh_core__engagements_xa_set {
  fields: [
    preceding_engagement_for_student,
    preceding_engagement_for_student_and_uni,
    preceding_touchpoint_for_student,
    preceding_touchpoint_for_student_and_uni,
    engagement_type,
    engagement_student_outcome,
    engagement_source,
    engagement_platform_instance,
    engagement_index,
  ]
}
dimension: engagement_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.engagement_pk ;;
  description: "Primary key of the engagements table. Generated from hashing the combination of student_key and engagement_index."
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
}
dimension: university_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
}
dimension: shortlist_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
}
dimension: event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.event_fk ;;
  description: "Primary key of the platform events table"
}
dimension: external_event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.external_event_fk ;;
  description: "Primary key of the external events table"
}
dimension: preceding_engagement_for_student {
  type: string
  sql: ${TABLE}.preceding_engagement_for_student ;;
  description: "The pk of the directly preceding engagement pertaining to:
* the student"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: preceding_engagement_for_student_and_uni {
  type: string
  sql: ${TABLE}.preceding_engagement_for_student_and_uni ;;
  description: "The pk of the directly preceding engagement pertaining to:
* the student
* the university"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: preceding_touchpoint_for_student {
  type: string
  sql: ${TABLE}.preceding_touchpoint_for_student ;;
  description: "The pk of the preceding non-outcome engagement (i.e., touchpoint)  pertaining to:
* the student"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: preceding_touchpoint_for_student_and_uni {
  type: string
  sql: ${TABLE}.preceding_touchpoint_for_student_and_uni ;;
  description: "The pk of the directly preceding non-outcome engagement (i.e., touchpoint) pertaining to:
* the student
* the university"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: engagement_type {
  type: string
  sql: ${TABLE}.engagement_type ;;
  description: "The nature of the engagement. E.g. 'external event'"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: engagement_student_outcome {
  type: string
  sql: ${TABLE}.engagement_student_outcome ;;
  description: "Student outcomes represent the key interactions with the system that help evidence users engaging with universities and achieving a certain milestone"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: engagement_source {
  type: string
  sql: ${TABLE}.engagement_source ;;
  description: "The data source in which the engagement was recorded. E.g. 'zoom webinar participation'"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: engagement_platform_instance {
  type: string
  sql: ${TABLE}.engagement_platform_instance ;;
  description: "The platform instance
* 'cn' = China
* 'com' = Rest of World"
  drill_fields: [wh_core__engagements_xa_set*]
}
dimension: engagement_index {
  hidden: yes 
  type: number
  sql: ${TABLE}.engagement_index ;;
  description: "The engagment's position in the student's chronology of engagements. First engagement: 1, second: 2. Derived from 'engagement_ts'."
}
dimension_group: engagement_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.engagement_ts ;;
  description: "The timestamp of the engagement, from which the 'engagement_index' is derived."
}
}
view: wh_core__schools_dim {
sql_table_name: wh_core__schools_dim ;;
set: wh_core__schools_dim_set {
  fields: [
    school_platform_instance,
    school_name,
    school_account_type,
    school_timezone,
    school_active,
  ]
}
dimension: school_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.school_pk ;;
  description: "The primary key of the schools table"
}
dimension: city_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.city_fk ;;
  description: "Primary key of the cities table"
}
dimension: state_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.state_fk ;;
  description: "Primary key of the states table"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
}
dimension: school_salesforce_account_natural_key {
  type: string
  sql: ${TABLE}.school_salesforce_account_natural_key ;;
  description: "The natural key of the salesforce account that corresponds to the school"
  drill_fields: [wh_core__schools_dim_set*]
}
dimension: school_school_group_id_natural_key {
  type: string
  sql: ${TABLE}.school_school_group_id_natural_key ;;
  description: "The natural key of the group in which the school is a member"
  drill_fields: [wh_core__schools_dim_set*]
}
dimension: school_platform_instance {
  type: string
  sql: ${TABLE}.school_platform_instance ;;
  description: "The platform instance
* 'cn' = China
* 'com' = Rest of World"
  drill_fields: [wh_core__schools_dim_set*]
}
dimension: school_name {
  type: string
  sql: ${TABLE}.school_name ;;
  description: "The name of the school"
  drill_fields: [wh_core__schools_dim_set*]
}
dimension: school_account_type {
  type: string
  sql: ${TABLE}.school_account_type ;;
  description: "The account type of the school.
-1: test
 0: paying_customer
 1: trial"
  drill_fields: [wh_core__schools_dim_set*]
}
dimension: school_timezone {
  type: string
  sql: ${TABLE}.school_timezone ;;
  description: "The timezone of the school"
  drill_fields: [wh_core__schools_dim_set*]
}
dimension: school_active {
  type: string
  sql: ${TABLE}.school_active ;;
  description: "A flag indicating whether the school is active"
  drill_fields: [wh_core__schools_dim_set*]
}
dimension_group: school_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.school_created_at ;;
  description: "When the school record was created"
}
dimension_group: school_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.school_updated_at ;;
  description: "When the school record was last updated"
}
}
view: wh_core__states_dim {
sql_table_name: wh_core__states_dim ;;
set: wh_core__states_dim_set {
  fields: [state_name]
}
dimension: state_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.state_pk ;;
  description: "Primary key of the states table"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
}
dimension: state_natural_key {
  type: string
  sql: ${TABLE}.state_natural_key ;;
  description: "2-3 letter state code"
  drill_fields: [wh_core__states_dim_set*]
}
dimension: state_name {
  type: string
  sql: ${TABLE}.state_name ;;
  description: "The name of the state"
  drill_fields: [wh_core__states_dim_set*]
}
}
view: wh_core__students_dim {
sql_table_name: wh_core__students_dim ;;
set: wh_core__students_dim_set {
  fields: [
    student_platform_instance,
    student_email,
    student_first_name,
    student_surname,
    student_age,
    student_date_of_birth,
    student_archived,
    student_graduating_year,
    student_historically_imported,
    student_engage_email_consent,
    student_terms_accepted,
  ]
}
dimension: student_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.student_pk ;;
  description: "The primary key of the students table"
}
dimension: school_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.school_fk ;;
  description: "Primary key of the schools table"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
}
dimension: student_platform_instance {
  type: string
  sql: ${TABLE}.student_platform_instance ;;
  description: "The platform instance
* 'cn' = China
* 'com' = Rest of World"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_email {
  type: string
  sql: ${TABLE}.student_email ;;
  description: "The email address associated with the student"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_first_name {
  type: string
  sql: ${TABLE}.student_first_name ;;
  description: "The first name of the student"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_surname {
  type: string
  sql: ${TABLE}.student_surname ;;
  description: "The surname of the student"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_age {
  type: string
  sql: ${TABLE}.student_age ;;
  description: "The age of the student"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_date_of_birth {
  type: string
  sql: ${TABLE}.student_date_of_birth ;;
  description: "The student's date of birth"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_archived {
  type: string
  sql: ${TABLE}.student_archived ;;
  description: "If the student is archived this is set to true, boolean value"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_graduating_year {
  hidden: yes 
  type: number
  sql: ${TABLE}.student_graduating_year ;;
  description: "The graduating year of the student"
}
dimension: student_historically_imported {
  type: yesno
  sql: ${TABLE}.student_historically_imported ;;
  description: "Indicates whether the user is an imported historical user for analytics purposes instead of a real user"
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_engage_email_consent {
  type: yesno
  sql: ${TABLE}.student_engage_email_consent ;;
  description: "Whether user provided consent to get \"engage emails\""
  drill_fields: [wh_core__students_dim_set*]
}
dimension: student_terms_accepted {
  type: yesno
  sql: ${TABLE}.student_terms_accepted ;;
  description: "Whether user has accepted T&Cs."
  drill_fields: [wh_core__students_dim_set*]
}
dimension_group: student_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.student_created_at ;;
  description: "When the student record was created"
}
dimension_group: student_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.student_updated_at ;;
  description: "When the student record was last updated"
}
}
view: wh_core__students_xa {
sql_table_name: wh_core__students_xa ;;
set: wh_core__students_xa_set {
  fields: [
    count_of_client_shortlist_and_student_active_student_touchpoints,
    count_of_student_active_student_touchpoints,
    count_of_student_passive_student_touchpoints,
    count_of_advisor_passive_student_touchpoints,
    count_of_advisor_active_student_touchpoints,
    count_of_shortlist_events,
    count_of_current_client_shortlists,
    count_of_client_marked_apply_events,
    count_of_current_client_applications,
  ]
}
dimension: student_xa_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.student_xa_pk ;;
  description: ""
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
}
dimension: count_of_client_shortlist_and_student_active_student_touchpoints {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_client_shortlist_and_student_active_student_touchpoints ;;
  description: ""
}
dimension: count_of_student_active_student_touchpoints {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_student_active_student_touchpoints ;;
  description: ""
}
dimension: count_of_student_passive_student_touchpoints {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_student_passive_student_touchpoints ;;
  description: ""
}
dimension: count_of_advisor_passive_student_touchpoints {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_advisor_passive_student_touchpoints ;;
  description: ""
}
dimension: count_of_advisor_active_student_touchpoints {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_advisor_active_student_touchpoints ;;
  description: ""
}
dimension: count_of_shortlist_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_shortlist_events ;;
  description: ""
}
dimension: count_of_current_client_shortlists {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_current_client_shortlists ;;
  description: ""
}
dimension: count_of_client_marked_apply_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_client_marked_apply_events ;;
  description: ""
}
dimension: count_of_current_client_applications {
  hidden: yes 
  type: number
  sql: ${TABLE}.count_of_current_client_applications ;;
  description: ""
}
}
view: wh_core__unclassified_users_dim {
sql_table_name: wh_core__unclassified_users_dim ;;
set: wh_core__unclassified_users_dim_set {
  fields: [unclassified_user_source, unclassified_user_name, unclassified_user_email, unclassified_user_platform_instance]
}
dimension: unclassified_user_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.unclassified_user_pk ;;
  description: "Primary key of the unclassified users table (Unique ID for an unclassified user)"
}
dimension: external_event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.external_event_fk ;;
  description: "Primary key of the external events table"
}
dimension: unclassified_user_source {
  type: string
  sql: ${TABLE}.unclassified_user_source ;;
  description: "The source from which the user's information was first gathered"
  drill_fields: [wh_core__unclassified_users_dim_set*]
}
dimension: unclassified_user_name {
  type: string
  sql: ${TABLE}.unclassified_user_name ;;
  description: "The user's full known name (first, middle, and last)"
  drill_fields: [wh_core__unclassified_users_dim_set*]
}
dimension: unclassified_user_email {
  type: string
  sql: ${TABLE}.unclassified_user_email ;;
  description: "The user's email address"
  drill_fields: [wh_core__unclassified_users_dim_set*]
}
dimension: unclassified_user_platform_instance {
  type: string
  sql: ${TABLE}.unclassified_user_platform_instance ;;
  description: "The platform instance
* 'cn' = China
* 'com' = Rest of World"
  drill_fields: [wh_core__unclassified_users_dim_set*]
}
dimension_group: unclassified_user_first_record_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.unclassified_user_first_record_ts ;;
  description: "The timestamp of the first record from which the user's information was gathered"
}
}
view: wh_core__universities_dim {
sql_table_name: wh_core__universities_dim ;;
set: wh_core__universities_dim_set {
  fields: [
    university_name,
    university_country_code,
    university_applyable_type,
    university_account_lifecycle_status,
    university_problematic_application,
    university_is_matchable,
    university_ibcp_friendly,
    university_parchment_enabled,
    university_popularity,
  ]
}
dimension: university_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.university_pk ;;
  description: "The primary key of the universities table"
}
dimension: country_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
}
dimension: state_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.state_fk ;;
  description: "Primary key of the states table"
}
dimension: city_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.city_fk ;;
  description: "Primary key of the cities table"
}
dimension: university_natural_key {
  type: string
  sql: ${TABLE}.university_natural_key ;;
  description: "BUID; The natural key unique identifier of a university"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_non_china_natural_key {
  type: string
  sql: ${TABLE}.university_non_china_natural_key ;;
  description: "The university ID Of the record that corresponds to the non-China data. Superseded by BUID in the analytics warehouse."
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_china_natural_key {
  type: string
  sql: ${TABLE}.university_china_natural_key ;;
  description: "The university ID Of the record that corresponds to the China data. Superseded by BUID in the analytics warehouse."
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_name {
  type: string
  sql: ${TABLE}.university_name ;;
  description: "The name of the university"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_country_code {
  type: string
  sql: ${TABLE}.university_country_code ;;
  description: "The country code of the university"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_applyable_type {
  type: string
  sql: ${TABLE}.university_applyable_type ;;
  description: "The applyable type of the University"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_account_lifecycle_status {
  type: string
  sql: ${TABLE}.university_account_lifecycle_status ;;
  description: "The relationship of the University to BridgeU. Mostly used to identify whether university is a \"customer\"."
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_problematic_application {
  type: string
  sql: ${TABLE}.university_problematic_application ;;
  description: "A flag indicating a problematic application"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_is_matchable {
  type: yesno
  sql: ${TABLE}.university_is_matchable ;;
  description: "A flag indicating whether the university is matchable"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_ibcp_friendly {
  type: yesno
  sql: ${TABLE}.university_ibcp_friendly ;;
  description: "A flag indicating whether the university is IBCP friendly"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_parchment_enabled {
  type: yesno
  sql: ${TABLE}.university_parchment_enabled ;;
  description: "A flag indicating whether the university accepts document delivery trough the parchment route"
  drill_fields: [wh_core__universities_dim_set*]
}
dimension: university_popularity {
  hidden: yes 
  type: number
  sql: ${TABLE}.university_popularity ;;
  description: "The popularity of the University"
}
dimension_group: university_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.university_created_at ;;
  description: "When the university record was created"
}
dimension_group: university_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.university_updated_at ;;
  description: "When the university record was last updated"
}
}
view: wh_cs__external_events_fact {
sql_table_name: wh_cs__external_events_fact ;;
set: wh_cs__external_events_fact_set {
  fields: [external_event_key, external_event_name, external_event_platform_instance]
}
dimension: external_event_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.external_event_pk ;;
  description: "Primary key of the external events table (Unique ID for a student-event combination)"
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
}
dimension: external_event_key {
  type: string
  sql: ${TABLE}.external_event_key ;;
  description: "The natural or compound key of the source event table"
  drill_fields: [wh_cs__external_events_fact_set*]
}
dimension: external_event_name {
  type: string
  sql: ${TABLE}.external_event_name ;;
  description: "A descriptive name for the external event source"
  drill_fields: [wh_cs__external_events_fact_set*]
}
dimension: external_event_platform_instance {
  type: string
  sql: ${TABLE}.external_event_platform_instance ;;
  description: "The platform instance
- 'cn' = China
- 'com' = Rest of World"
  drill_fields: [wh_cs__external_events_fact_set*]
}
dimension_group: external_event_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.external_event_ts ;;
  description: "The timestamp in which the external event took place for the relevant student or representative (e.g. parent)"
}
}
view: wh_marketing__articles_dim {
sql_table_name: wh_marketing__articles_dim ;;
set: wh_marketing__articles_dim_set {
  fields: [article_title, article_excerpt, article_thumbnail_url]
}
dimension: article_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.article_pk ;;
  description: "Primary key of the articles table"
}
dimension: university_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
}
dimension: article_title {
  type: string
  sql: ${TABLE}.article_title ;;
  description: "The title of the article"
  drill_fields: [wh_marketing__articles_dim_set*]
}
dimension: article_excerpt {
  type: string
  sql: ${TABLE}.article_excerpt ;;
  description: "The excerpt of the article"
  drill_fields: [wh_marketing__articles_dim_set*]
}
dimension: article_thumbnail_url {
  type: string
  sql: ${TABLE}.article_thumbnail_url ;;
  description: "The URL for the picture used in the thumbnail"
  drill_fields: [wh_marketing__articles_dim_set*]
}
dimension_group: article_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.article_created_at ;;
  description: "When the article record was created"
}
dimension_group: article_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.article_updated_at ;;
  description: "When the article record was last updated"
}
}
view: wh_platform__applications_fact {
sql_table_name: wh_platform__applications_fact ;;
set: wh_platform__applications_fact_set {
  fields: [
    application_status,
    application_ucas_student_choice,
    application_university_outcome,
    application_university_condition,
    application_university_condition_summary,
    application_student_attendance,
    application_is_ever_waitlisted,
    application_is_deferred,
    application_is_sent,
  ]
}
dimension: application_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.application_pk ;;
  description: "Primary key of the applications table. Generated from hashing the combination of matchable_type, matchable_id and analytics_id ofthe student's user record."
}
dimension: shortlist_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
}
dimension: application_status {
  type: string
  sql: ${TABLE}.application_status ;;
  description: "derived from state, the stage in the application pipeline [0 not_ready, 2 application_sent, 3 university_decided, 4 attendance_set]"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_ucas_student_choice {
  type: string
  sql: ${TABLE}.application_ucas_student_choice ;;
  description: "in case the application is going via UCAS and the student must make a decision. [\"first_choice\", \"second_choice\", \"declined\"]"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_university_outcome {
  type: string
  sql: ${TABLE}.application_university_outcome ;;
  description: "This field returns the university_outcome Possible values are: [\"withdrawn\", \"unsuccessful\", \"waitlisted\", \"deferred\", \"unknown\", \"conditions_set\", \"accepted\", \"unconditional\"]"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_university_condition {
  type: string
  sql: ${TABLE}.application_university_condition ;;
  description: "This field stores the particular condition on the offer, in case it is a conditional one"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_university_condition_summary {
  type: string
  sql: ${TABLE}.application_university_condition_summary ;;
  description: "This field is only for historical data purposes. Usually when we retrieve UCAS data they provide a huge condition explanation, that we trim into this summary"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_student_attendance {
  type: string
  sql: ${TABLE}.application_student_attendance ;;
  description: "This field is an enum to store what's the final student decision for this university [0 attending, 1 not_attending, 2 attendance unknown]"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_is_ever_waitlisted {
  type: yesno
  sql: ${TABLE}.application_is_ever_waitlisted ;;
  description: "ever_waitlisted is a boolean to keep track if a matriculation was waitlisted at some point"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_is_deferred {
  type: yesno
  sql: ${TABLE}.application_is_deferred ;;
  description: "This field is a boolean to keep track if a matriculation was deferred at some point"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension: application_is_sent {
  type: yesno
  sql: ${TABLE}.application_is_sent ;;
  description: "This field is a boolean to keep track if a application was sent"
  drill_fields: [wh_platform__applications_fact_set*]
}
dimension_group: application_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.application_created_at_ts ;;
  description: "This field is a timestamp to keep track when the application was created at"
}
dimension_group: application_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.application_updated_at_ts ;;
  description: "This field is a timestamp to keep track when the application was updated at"
}
dimension_group: application_confirmed_submitted_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.application_confirmed_submitted_at_ts ;;
  description: "This field is a timestamp storing when we confirm an application submission via BridgeU Apply"
}
}
view: wh_platform__events_fact {
sql_table_name: wh_platform__events_fact ;;
set: wh_platform__events_fact_set {
  fields: [
    event_platform_instance,
    event_name,
    event_source_url,
    event_source_path,
    event_source_search,
    event_number,
    event_sequence,
    event_in_session_sequence,
    event_is_marketing_touchpoint,
    event_is_evidenced_touchpoint,
    event_student_outcome,
    event_user_role,
    event_interaction_user_type,
    event_interaction_type,
    event_time_on_page_secs,
  ]
}
dimension: event_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.event_pk ;;
  description: "Primary key of the events table"
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
}
dimension: advisor_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.advisor_fk ;;
  description: "A foreign key populated when segment associates an advisor with an event"
}
dimension: university_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
}
dimension: course_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.course_fk ;;
  description: "A foreign key populated when segment associates a course with an event"
}
dimension: shortlist_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
}
dimension: session_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.session_fk ;;
  description: "A foreign key associated with events occuring within a user session"
}
dimension: event_natural_key {
  type: string
  sql: ${TABLE}.event_natural_key ;;
  description: "A unique id associated with an event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: university_natural_key {
  type: string
  sql: ${TABLE}.university_natural_key ;;
  description: "BUID; The natural key unique identifier of a university"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_university_natural_key {
  type: string
  sql: ${TABLE}.event_university_natural_key ;;
  description: "Segment id populated when Segment associates a university with an event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_student_natural_key {
  type: string
  sql: ${TABLE}.event_student_natural_key ;;
  description: "Segment id populated when Segment associates a student with an event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_school_natural_key {
  type: string
  sql: ${TABLE}.event_school_natural_key ;;
  description: "Segment id populated when Segment associates a school with an event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_advisor_natural_key {
  type: string
  sql: ${TABLE}.event_advisor_natural_key ;;
  description: "Segment id populated when Segment associates an advisor with an event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_course_natural_key {
  type: string
  sql: ${TABLE}.event_course_natural_key ;;
  description: "Segment id populated when Segment associates a course with an event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_anonymous_user_natural_key {
  type: string
  sql: ${TABLE}.event_anonymous_user_natural_key ;;
  description: "Anonymous user id associated with a user until the Segment cookie expires"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_user_natural_key {
  type: string
  sql: ${TABLE}.event_user_natural_key ;;
  description: "Segment id associated with an event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_blended_user_natural_key {
  type: string
  sql: ${TABLE}.event_blended_user_natural_key ;;
  description: "Coalesced Segment anonymous_id and user_id"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_platform_instance {
  type: string
  sql: ${TABLE}.event_platform_instance ;;
  description: "The platform instance
* 'cn' = China
* 'com' = Rest of World"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_name {
  type: string
  sql: ${TABLE}.event_name ;;
  description: "A description of the event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_source_url {
  type: string
  sql: ${TABLE}.event_source_url ;;
  description: "URL source"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_source_path {
  type: string
  sql: ${TABLE}.event_source_path ;;
  description: "Source path"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_source_search {
  type: string
  sql: ${TABLE}.event_source_search ;;
  description: "Source search"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.event_number ;;
  description: "Event number index by anonymous user and timestamp"
}
dimension: event_sequence {
  hidden: yes 
  type: number
  sql: ${TABLE}.event_sequence ;;
  description: "Event sequence by blended user id and timestamp"
}
dimension: event_in_session_sequence {
  hidden: yes 
  type: number
  sql: ${TABLE}.event_in_session_sequence ;;
  description: "Event sequence by blended user id and timestamp within a session"
}
dimension: event_is_marketing_touchpoint {
  type: yesno
  sql: ${TABLE}.event_is_marketing_touchpoint ;;
  description: "Flag attributed to specific events by the Product Team"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_is_evidenced_touchpoint {
  type: yesno
  sql: ${TABLE}.event_is_evidenced_touchpoint ;;
  description: "Flag attributed to specific events by the Product Team"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_student_outcome {
  type: string
  sql: ${TABLE}.event_student_outcome ;;
  description: "Student outcomes represent the key interactions with the system that help evidence users engaging with universities and achieving a certain milestone"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_user_role {
  type: string
  sql: ${TABLE}.event_user_role ;;
  description: "The role of the user that caused the event"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_interaction_user_type {
  type: string
  sql: ${TABLE}.event_interaction_user_type ;;
  description: "The user role / type that is related to the event type"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_interaction_type {
  type: string
  sql: ${TABLE}.event_interaction_type ;;
  description: "Interaction type for a user
* Active interaction types are those that the user has undertaken themselves. They have actively engaged with a part of the product e.g. clicking a link, reading an article or shortlisting a uni. These are the ones that give a strong indication of intent from the user
* Passive interaction types are those that have been done to the user, e.g. they have been shown a piece of content, seen results from a search"
  drill_fields: [wh_platform__events_fact_set*]
}
dimension: event_time_on_page_secs {
  hidden: yes 
  type: number
  sql: ${TABLE}.event_time_on_page_secs ;;
  description: "Time on page in seconds"
}
dimension_group: event_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.event_ts ;;
  description: "Event timestamp"
}
}
view: wh_platform__shortlists_fact {
sql_table_name: wh_platform__shortlists_fact ;;
set: wh_platform__shortlists_fact_set {
  fields: [shortlist_custom_course_name]
}
dimension: shortlist_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.shortlist_pk ;;
  description: "Primary key of the shortlists table. Generated from hashing the combination of matchable_type, matchable_id and analytics_id ofthe student's user record."
}
dimension: student_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
}
dimension: course_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.course_fk ;;
  description: "A foreign key populated when segment associates a course with an event"
}
dimension: university_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
}
dimension: shortlist_custom_course_name {
  type: string
  sql: ${TABLE}.shortlist_custom_course_name ;;
  description: "The custom name a user entered for the university course. Only applicable when a course didn't already exist."
  drill_fields: [wh_platform__shortlists_fact_set*]
}
dimension_group: shortlist_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.shortlist_ts ;;
  description: "The timestamp of the creation of the shortlist"
}
}

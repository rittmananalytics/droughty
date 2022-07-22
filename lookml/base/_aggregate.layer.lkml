include: "/lookml/base/_base.layer.lkml"
view: +wh_core__advisors_dim {
measure: count_of_advisor_pk {
  type: count_distinct
  sql: ${TABLE}.advisor_pk ;;
  description: "The primary key of the advisors table"
  drill_fields: [wh_core__advisors_dim_set*]
}
}
view: +wh_core__cities_dim {
measure: count_of_city_pk {
  type: count_distinct
  sql: ${TABLE}.city_pk ;;
  description: "Primary key of the cities table"
  drill_fields: [wh_core__cities_dim_set*]
}
}
view: +wh_core__countries_dim {
measure: count_of_country_pk {
  type: count_distinct
  sql: ${TABLE}.country_pk ;;
  description: "Primary key of the countries table"
  drill_fields: [wh_core__countries_dim_set*]
}
}
view: +wh_core__courses_dim {
measure: count_of_course_pk {
  type: count_distinct
  sql: ${TABLE}.course_pk ;;
  description: "Primary key of the courses table"
  drill_fields: [wh_core__courses_dim_set*]
}
}
view: +wh_core__engagements_xa {
measure: count_of_engagement_pk {
  type: count_distinct
  sql: ${TABLE}.engagement_pk ;;
  description: "Primary key of the engagements table. Generated from hashing the combination of student_key and engagement_index."
  drill_fields: [wh_core__engagements_xa_set*]
}
measure: sum_of_engagement_index {
  type: sum_distinct
  sql: ${TABLE}.engagement_index ;;
  description: "The engagment's position in the student's chronology of engagements. First engagement: 1, second: 2. Derived from 'engagement_ts'."
  drill_fields: [wh_core__engagements_xa_set*]
}
}
view: +wh_core__schools_dim {
measure: count_of_school_pk {
  type: count_distinct
  sql: ${TABLE}.school_pk ;;
  description: "The primary key of the schools table"
  drill_fields: [wh_core__schools_dim_set*]
}
}
view: +wh_core__states_dim {
measure: count_of_state_pk {
  type: count_distinct
  sql: ${TABLE}.state_pk ;;
  description: "Primary key of the states table"
  drill_fields: [wh_core__states_dim_set*]
}
}
view: +wh_core__students_dim {
measure: count_of_student_pk {
  type: count_distinct
  sql: ${TABLE}.student_pk ;;
  description: "The primary key of the students table"
  drill_fields: [wh_core__students_dim_set*]
}
measure: sum_of_student_graduating_year {
  type: sum_distinct
  sql: ${TABLE}.student_graduating_year ;;
  description: "The graduating year of the student"
  drill_fields: [wh_core__students_dim_set*]
}
}
view: +wh_core__students_xa {
measure: count_of_student_xa_pk {
  type: count_distinct
  sql: ${TABLE}.student_xa_pk ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_client_shortlist_and_student_active_student_touchpoints {
  type: sum_distinct
  sql: ${TABLE}.count_of_client_shortlist_and_student_active_student_touchpoints ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_student_active_student_touchpoints {
  type: sum_distinct
  sql: ${TABLE}.count_of_student_active_student_touchpoints ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_student_passive_student_touchpoints {
  type: sum_distinct
  sql: ${TABLE}.count_of_student_passive_student_touchpoints ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_advisor_passive_student_touchpoints {
  type: sum_distinct
  sql: ${TABLE}.count_of_advisor_passive_student_touchpoints ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_advisor_active_student_touchpoints {
  type: sum_distinct
  sql: ${TABLE}.count_of_advisor_active_student_touchpoints ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_shortlist_events {
  type: sum_distinct
  sql: ${TABLE}.count_of_shortlist_events ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_current_client_shortlists {
  type: sum_distinct
  sql: ${TABLE}.count_of_current_client_shortlists ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_client_marked_apply_events {
  type: sum_distinct
  sql: ${TABLE}.count_of_client_marked_apply_events ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
measure: sum_of_count_of_current_client_applications {
  type: sum_distinct
  sql: ${TABLE}.count_of_current_client_applications ;;
  description: ""
  drill_fields: [wh_core__students_xa_set*]
}
}
view: +wh_core__unclassified_users_dim {
measure: count_of_unclassified_user_pk {
  type: count_distinct
  sql: ${TABLE}.unclassified_user_pk ;;
  description: "Primary key of the unclassified users table (Unique ID for an unclassified user)"
  drill_fields: [wh_core__unclassified_users_dim_set*]
}
}
view: +wh_core__universities_dim {
measure: count_of_university_pk {
  type: count_distinct
  sql: ${TABLE}.university_pk ;;
  description: "The primary key of the universities table"
  drill_fields: [wh_core__universities_dim_set*]
}
measure: sum_of_university_popularity {
  type: sum_distinct
  sql: ${TABLE}.university_popularity ;;
  description: "The popularity of the University"
  drill_fields: [wh_core__universities_dim_set*]
}
}
view: +wh_cs__external_events_fact {
measure: count_of_external_event_pk {
  type: count_distinct
  sql: ${TABLE}.external_event_pk ;;
  description: "Primary key of the external events table (Unique ID for a student-event combination)"
  drill_fields: [wh_cs__external_events_fact_set*]
}
}
view: +wh_marketing__articles_dim {
measure: count_of_article_pk {
  type: count_distinct
  sql: ${TABLE}.article_pk ;;
  description: "Primary key of the articles table"
  drill_fields: [wh_marketing__articles_dim_set*]
}
}
view: +wh_platform__applications_fact {
measure: count_of_application_pk {
  type: count_distinct
  sql: ${TABLE}.application_pk ;;
  description: "Primary key of the applications table. Generated from hashing the combination of matchable_type, matchable_id and analytics_id ofthe student's user record."
  drill_fields: [wh_platform__applications_fact_set*]
}
}
view: +wh_platform__events_fact {
measure: count_of_event_pk {
  type: count_distinct
  sql: ${TABLE}.event_pk ;;
  description: "Primary key of the events table"
  drill_fields: [wh_platform__events_fact_set*]
}
measure: sum_of_event_number {
  type: sum_distinct
  sql: ${TABLE}.event_number ;;
  description: "Event number index by anonymous user and timestamp"
  drill_fields: [wh_platform__events_fact_set*]
}
measure: sum_of_event_sequence {
  type: sum_distinct
  sql: ${TABLE}.event_sequence ;;
  description: "Event sequence by blended user id and timestamp"
  drill_fields: [wh_platform__events_fact_set*]
}
measure: sum_of_event_in_session_sequence {
  type: sum_distinct
  sql: ${TABLE}.event_in_session_sequence ;;
  description: "Event sequence by blended user id and timestamp within a session"
  drill_fields: [wh_platform__events_fact_set*]
}
measure: sum_of_event_time_on_page_secs {
  type: sum_distinct
  sql: ${TABLE}.event_time_on_page_secs ;;
  description: "Time on page in seconds"
  drill_fields: [wh_platform__events_fact_set*]
}
}
view: +wh_platform__shortlists_fact {
measure: count_of_shortlist_pk {
  type: count_distinct
  sql: ${TABLE}.shortlist_pk ;;
  description: "Primary key of the shortlists table. Generated from hashing the combination of matchable_type, matchable_id and analytics_id ofthe student's user record."
  drill_fields: [wh_platform__shortlists_fact_set*]
}
}

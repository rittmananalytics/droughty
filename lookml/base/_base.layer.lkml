explore: actors_dim
{ hidden: yes }
explore: events_fct
{ hidden: yes }
explore: narratives_fct
{ hidden: yes }
explore: observations_fct
{ hidden: yes }
explore: observers_dim
{ hidden: yes }
explore: protests_dim
{ hidden: yes }
view: actors_dim {
sql_table_name: actors_dim ;;
dimension: actor_code {
  type: string
  sql: ${TABLE}.actor_code ;;
  description: "not available"
}
dimension: actor_geo_country_code {
  type: string
  sql: ${TABLE}.actor_geo_country_code ;;
  description: "not available"
}
dimension: actor_name {
  type: string
  sql: ${TABLE}.actor_name ;;
  description: "not available"
}
dimension: actor_pk {
  primary_key1: yes
  hidden: yes
  type: string
  sql: ${TABLE}.actor_pk ;;
  description: "not available"
}
dimension: actor_type_code {
  type: string
  sql: ${TABLE}.actor_type_code ;;
  description: "not available"
}
dimension: actor_type_name {
  type: string
  sql: ${TABLE}.actor_type_name ;;
  description: "not available"
}
}
view: events_fct {
sql_table_name: events_fct ;;
dimension: action_geo_country_code {
  type: string
  sql: ${TABLE}.action_geo_country_code ;;
  description: "not available"
}
dimension: action_geo_country_name {
  type: string
  sql: ${TABLE}.action_geo_country_name ;;
  description: "not available"
}
dimension: action_geo_full_name {
  type: string
  sql: ${TABLE}.action_geo_full_name ;;
  description: "not available"
}
dimension: action_geo_latitude {
  hidden: yes 
  type: number
  sql: ${TABLE}.action_geo_latitude ;;
  description: "not available"
}
dimension: action_geo_longitude {
  hidden: yes 
  type: number
  sql: ${TABLE}.action_geo_longitude ;;
  description: "not available"
}
dimension: event_pk {
  primary_key1: yes
  hidden: yes
  type: string
  sql: ${TABLE}.event_pk ;;
  description: "not available"
}
dimension_group: event_ts {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.event_ts ;;
  description: "not available"
}
dimension: protest_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.protest_fk ;;
  description: "not available"
}
}
view: narratives_fct {
sql_table_name: narratives_fct ;;
dimension: actor_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.actor_fk ;;
  description: "not available"
}
dimension: event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.event_fk ;;
  description: "not available"
}
dimension: narrative {
  type: string
  sql: ${TABLE}.narrative ;;
  description: "not available"
}
dimension: narrative_pk {
  primary_key1: yes
  hidden: yes
  type: string
  sql: ${TABLE}.narrative_pk ;;
  description: "not available"
}
}
view: observations_fct {
sql_table_name: observations_fct ;;
dimension: event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.event_fk ;;
  description: "not available"
}
dimension: observation_keywords {
  type: string
  sql: ${TABLE}.observation_keywords ;;
  description: "not available"
}
dimension: observation_page_description {
  type: string
  sql: ${TABLE}.observation_page_description ;;
  description: "not available"
}
dimension: observation_page_title {
  type: string
  sql: ${TABLE}.observation_page_title ;;
  description: "not available"
}
dimension: observation_pk {
  primary_key1: yes
  hidden: yes
  type: string
  sql: ${TABLE}.observation_pk ;;
  description: "not available"
}
dimension: observation_type {
  type: string
  sql: ${TABLE}.observation_type ;;
  description: "not available"
}
dimension: observation_url {
  type: string
  sql: ${TABLE}.observation_url ;;
  description: "not available"
}
dimension: observer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.observer_fk ;;
  description: "not available"
}
dimension_group: published_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.published_date ;;
  description: "not available"
}
}
view: observers_dim {
sql_table_name: observers_dim ;;
dimension: observer_domain {
  type: string
  sql: ${TABLE}.observer_domain ;;
  description: "not available"
}
dimension: observer_pk {
  primary_key1: yes
  hidden: yes
  type: string
  sql: ${TABLE}.observer_pk ;;
  description: "not available"
}
}
view: protests_dim {
sql_table_name: protests_dim ;;
dimension: countries {
  type: string
  sql: ${TABLE}.countries ;;
  description: "not available"
}
dimension: page_description_regex {
  type: string
  sql: ${TABLE}.page_description_regex ;;
  description: "not available"
}
dimension: protest_name {
  type: string
  sql: ${TABLE}.protest_name ;;
  description: "not available"
}
dimension: protest_pk {
  primary_key1: yes
  hidden: yes
  type: string
  sql: ${TABLE}.protest_pk ;;
  description: "not available"
}
dimension_group: published_date_end {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.published_date_end ;;
  description: "not available"
}
dimension_group: published_date_start {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.published_date_start ;;
  description: "not available"
}
}
set: actors_dim_set {
  fields: [
    actor_code,
    actor_geo_country_code,
    actor_name,
    actor_pk,
    actor_type_code,
    actor_type_name,
  ]
}
set: events_fct_set {
  fields: [
    action_geo_country_code,
    action_geo_country_name,
    action_geo_full_name,
    action_geo_latitude,
    action_geo_longitude,
    event_pk,
    event_ts,
    protest_fk,
  ]
}
set: narratives_fct_set {
  fields: [actor_fk, event_fk, narrative, narrative_pk]
}
set: observations_fct_set {
  fields: [
    event_fk,
    observation_keywords,
    observation_page_description,
    observation_page_title,
    observation_pk,
    observation_type,
    observation_url,
    observer_fk,
    published_date,
  ]
}
set: observers_dim_set {
  fields: [observer_domain, observer_pk]
}
set: protests_dim_set {
  fields: [
    countries,
    page_description_regex,
    protest_name,
    protest_pk,
    published_date_end,
    published_date_start,
  ]
}

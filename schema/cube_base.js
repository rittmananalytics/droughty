cube (`events_fct`, {
sql: `select * from DBT_ODUPUIS.events_fct`,
dimensions: {
action_geo_country_code:  {
  sql: `action_geo_country_code`,
  type: `string`,
} ,
action_geo_country_name:  {
  sql: `action_geo_country_name`,
  type: `string`,
} ,
action_geo_full_name:  {
  sql: `action_geo_full_name`,
  type: `string`,
} ,
event_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `event_pk`,
  description: `not available`,
} ,
event_ts:  {
  sql: `event_ts`,
  type: `time`,
} ,
protest_fk:  {
  sql: `protest_fk`,
  type: `string`,
} ,
}});
cube (`narratives_fct`, {
sql: `select * from DBT_ODUPUIS.narratives_fct`,
dimensions: {
actor_fk:  {
  sql: `actor_fk`,
  type: `string`,
} ,
event_fk:  {
  sql: `event_fk`,
  type: `string`,
} ,
narrative:  {
  sql: `narrative`,
  type: `string`,
} ,
narrative_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `narrative_pk`,
  description: `not available`,
} ,
}});
cube (`observations_fct`, {
sql: `select * from DBT_ODUPUIS.observations_fct`,
dimensions: {
event_fk:  {
  sql: `event_fk`,
  type: `string`,
} ,
observation_keywords:  {
  sql: `observation_keywords`,
  type: `string`,
} ,
observation_page_description:  {
  sql: `observation_page_description`,
  type: `string`,
} ,
observation_page_title:  {
  sql: `observation_page_title`,
  type: `string`,
} ,
observation_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `observation_pk`,
  description: `not available`,
} ,
observation_type:  {
  sql: `observation_type`,
  type: `string`,
} ,
observation_url:  {
  sql: `observation_url`,
  type: `string`,
} ,
observer_fk:  {
  sql: `observer_fk`,
  type: `string`,
} ,
published_date:  {
  sql: `published_date`,
  type: `time`,
} ,
}});
cube (`observers_dim`, {
sql: `select * from DBT_ODUPUIS.observers_dim`,
dimensions: {
observer_domain:  {
  sql: `observer_domain`,
  type: `string`,
} ,
observer_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `observer_pk`,
  description: `not available`,
} ,
}});
cube (`protests_dim`, {
sql: `select * from DBT_ODUPUIS.protests_dim`,
dimensions: {
countries:  {
  sql: `countries`,
  type: `string`,
} ,
page_description_regex:  {
  sql: `page_description_regex`,
  type: `string`,
} ,
protest_name:  {
  sql: `protest_name`,
  type: `string`,
} ,
protest_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `protest_pk`,
  description: `not available`,
} ,
published_date_end:  {
  sql: `published_date_end`,
  type: `time`,
} ,
published_date_start:  {
  sql: `published_date_start`,
  type: `time`,
} ,
}});

cube (`actors_dim`, {
sql: `select * from DBT_ODUPUIS.actors_dim`,
joins : {
narratives_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.actor_pk} = ${narratives_fct.actor_fk}`,
} ,
},
dimensions: {
actor_code:  {
  sql: `actor_code`,
  type: `string`,
  description: `not available`,
} ,
actor_geo_country_code:  {
  sql: `actor_geo_country_code`,
  type: `string`,
  description: `not available`,
} ,
actor_name:  {
  sql: `actor_name`,
  type: `string`,
  description: `not available`,
} ,
actor_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `actor_pk`,
  description: `not available`,
} ,
actor_type_code:  {
  sql: `actor_type_code`,
  type: `string`,
  description: `not available`,
} ,
actor_type_name:  {
  sql: `actor_type_name`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`protests_dim`, {
sql: `select * from DBT_ODUPUIS.protests_dim`,
joins : {
events_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.protest_pk} = ${events_fct.protest_fk}`,
} ,
},
dimensions: {
countries:  {
  sql: `countries`,
  type: `string`,
  description: `not available`,
} ,
page_description_regex:  {
  sql: `page_description_regex`,
  type: `string`,
  description: `not available`,
} ,
protest_name:  {
  sql: `protest_name`,
  type: `string`,
  description: `not available`,
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
  description: `not available`,
} ,
published_date_start:  {
  sql: `published_date_start`,
  type: `time`,
  description: `not available`,
} ,
}});
cube (`events_fct`, {
sql: `select * from DBT_ODUPUIS.events_fct`,
joins : {
narratives_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.event_pk} = ${narratives_fct.event_fk}`,
} ,
observations_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.event_pk} = ${observations_fct.event_fk}`,
} ,
},
dimensions: {
action_geo_country_code:  {
  sql: `action_geo_country_code`,
  type: `string`,
  description: `not available`,
} ,
action_geo_country_name:  {
  sql: `action_geo_country_name`,
  type: `string`,
  description: `not available`,
} ,
action_geo_full_name:  {
  sql: `action_geo_full_name`,
  type: `string`,
  description: `not available`,
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
  description: `not available`,
} ,
protest_fk:  {
  sql: `protest_fk`,
  type: `string`,
  description: `not available`,
} ,
}});
cube (`protests_dim`, {
sql: `select * from DBT_ODUPUIS.protests_dim`,
joins : {
events_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.protest_pk} = ${events_fct.protest_fk}`,
} ,
},
dimensions: {
countries:  {
  sql: `countries`,
  type: `string`,
  description: `not available`,
} ,
page_description_regex:  {
  sql: `page_description_regex`,
  type: `string`,
  description: `not available`,
} ,
protest_name:  {
  sql: `protest_name`,
  type: `string`,
  description: `not available`,
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
  description: `not available`,
} ,
published_date_start:  {
  sql: `published_date_start`,
  type: `time`,
  description: `not available`,
} ,
}});
cube (`observers_dim`, {
sql: `select * from DBT_ODUPUIS.observers_dim`,
joins : {
observations_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.observer_pk} = ${observations_fct.observer_fk}`,
} ,
},
dimensions: {
observer_domain:  {
  sql: `observer_domain`,
  type: `string`,
  description: `not available`,
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
joins : {
events_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.protest_pk} = ${events_fct.protest_fk}`,
} ,
},
dimensions: {
countries:  {
  sql: `countries`,
  type: `string`,
  description: `not available`,
} ,
page_description_regex:  {
  sql: `page_description_regex`,
  type: `string`,
  description: `not available`,
} ,
protest_name:  {
  sql: `protest_name`,
  type: `string`,
  description: `not available`,
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
  description: `not available`,
} ,
published_date_start:  {
  sql: `published_date_start`,
  type: `time`,
  description: `not available`,
} ,
}});
cube (`protests_dim`, {
sql: `select * from DBT_ODUPUIS.protests_dim`,
joins : {
events_fct:  {
  relationship: `hasmany`,
  sql: `${CUBE.protest_pk} = ${events_fct.protest_fk}`,
} ,
},
dimensions: {
countries:  {
  sql: `countries`,
  type: `string`,
  description: `not available`,
} ,
page_description_regex:  {
  sql: `page_description_regex`,
  type: `string`,
  description: `not available`,
} ,
protest_name:  {
  sql: `protest_name`,
  type: `string`,
  description: `not available`,
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
  description: `not available`,
} ,
published_date_start:  {
  sql: `published_date_start`,
  type: `time`,
  description: `not available`,
} ,
}});

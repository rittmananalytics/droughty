cube (`actors_dim_extended`, {
sql: `select * from DBT_ODUPUIS.actors_dim`,
extends: actors_dim,
measures: {
count_of_actor_pk:  {
  sql: `actor_pk`,
  type: `count`,
} ,
}});
cube (`events_fct_extended`, {
sql: `select * from DBT_ODUPUIS.events_fct`,
extends: events_fct,
measures: {
sum_of_action_geo_latitude:  {
  sql: `action_geo_latitude`,
  type: `sum`,
} ,
sum_of_action_geo_longitude:  {
  sql: `action_geo_longitude`,
  type: `sum`,
} ,
count_of_event_pk:  {
  sql: `event_pk`,
  type: `count`,
} ,
}});
cube (`narratives_fct_extended`, {
sql: `select * from DBT_ODUPUIS.narratives_fct`,
extends: narratives_fct,
measures: {
count_of_narrative_pk:  {
  sql: `narrative_pk`,
  type: `count`,
} ,
}});
cube (`observations_fct_extended`, {
sql: `select * from DBT_ODUPUIS.observations_fct`,
extends: observations_fct,
measures: {
count_of_observation_pk:  {
  sql: `observation_pk`,
  type: `count`,
} ,
}});
cube (`observers_dim_extended`, {
sql: `select * from DBT_ODUPUIS.observers_dim`,
extends: observers_dim,
measures: {
count_of_observer_pk:  {
  sql: `observer_pk`,
  type: `count`,
} ,
}});
cube (`protests_dim_extended`, {
sql: `select * from DBT_ODUPUIS.protests_dim`,
extends: protests_dim,
measures: {
count_of_protest_pk:  {
  sql: `protest_pk`,
  type: `count`,
} ,
}});

include: "/lookml/base/_base.layer.lkml"
view: +actors_dim {
measure: count_of_actor_pk {
  type: count_distinct
  sql: ${TABLE}.actor_pk ;;
  description: "not available"
  drill_fields: [actors_dim_set*]
}
}
view: +events_fct {
measure: sum_of_action_geo_latitude {
  type: sum_distinct
  sql: ${TABLE}.action_geo_latitude ;;
  description: "not available"
  drill_fields: [events_fct_set*]
}
measure: sum_of_action_geo_longitude {
  type: sum_distinct
  sql: ${TABLE}.action_geo_longitude ;;
  description: "not available"
  drill_fields: [events_fct_set*]
}
measure: count_of_event_pk {
  type: count_distinct
  sql: ${TABLE}.event_pk ;;
  description: "not available"
  drill_fields: [events_fct_set*]
}
}
view: +narratives_fct {
measure: count_of_narrative_pk {
  type: count_distinct
  sql: ${TABLE}.narrative_pk ;;
  description: "not available"
  drill_fields: [narratives_fct_set*]
}
}
view: +observations_fct {
measure: count_of_observation_pk {
  type: count_distinct
  sql: ${TABLE}.observation_pk ;;
  description: "not available"
  drill_fields: [observations_fct_set*]
}
}
view: +observers_dim {
measure: count_of_observer_pk {
  type: count_distinct
  sql: ${TABLE}.observer_pk ;;
  description: "not available"
  drill_fields: [observers_dim_set*]
}
}
view: +protests_dim {
measure: count_of_protest_pk {
  type: count_distinct
  sql: ${TABLE}.protest_pk ;;
  description: "not available"
  drill_fields: [protests_dim_set*]
}
}

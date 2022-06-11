include: "/lookml/base/_base.layer.lkml"
view: +actors_dim {
measure: count_of_actor_pk {
  type: count_distinct
  sql: ${TABLE}.actor_pk ;;
  description: "not available"
}
}
view: +events_fct {
measure: sum_of_action_geo_latitude {
  type: sum_distinct
  sql: ${TABLE}.action_geo_latitude ;;
  description: "not available"
}
measure: sum_of_action_geo_longitude {
  type: sum_distinct
  sql: ${TABLE}.action_geo_longitude ;;
  description: "not available"
}
measure: count_of_event_pk {
  type: count_distinct
  sql: ${TABLE}.event_pk ;;
  description: "not available"
}
}
view: +narratives_fct {
measure: count_of_narrative_pk {
  type: count_distinct
  sql: ${TABLE}.narrative_pk ;;
  description: "not available"
}
}
view: +observations_fct {
measure: count_of_observation_pk {
  type: count_distinct
  sql: ${TABLE}.observation_pk ;;
  description: "not available"
}
}
view: +observers_dim {
measure: count_of_observer_pk {
  type: count_distinct
  sql: ${TABLE}.observer_pk ;;
  description: "not available"
}
}
view: +protests_dim {
measure: count_of_protest_pk {
  type: count_distinct
  sql: ${TABLE}.protest_pk ;;
  description: "not available"
}
}

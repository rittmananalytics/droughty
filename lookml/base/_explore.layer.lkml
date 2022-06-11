include: "/lookml/base/_base.layer.lkml"
include: "/lookml/aggregate/_aggregate.layer.lkml"
explore: actors_dim_explore {
hidden: no
view_name: actors_dim
join: observers_dim {
  sql_on: ${observers_dim.observer_fk} = ${observations_fct.observer_pk} ;;
  relationship: one_to_many
}
join: narratives_fct_events_fct {
  sql_on: ${events_fct.event_fk} = ${narratives_fct.event_pk} ;;
  relationship: one_to_many
  from: events_fct
}
join: actors_dim {
  sql_on: ${actors_dim.actor_fk} = ${narratives_fct.actor_pk} ;;
  relationship: one_to_many
}
join: observations_fct_events_fct {
  sql_on: ${events_fct.event_fk} = ${observations_fct.event_pk} ;;
  relationship: one_to_many
  from: events_fct
}
join: protests_dim {
  sql_on: ${protests_dim.protest_fk} = ${events_fct.protest_pk} ;;
  relationship: one_to_many
}
}

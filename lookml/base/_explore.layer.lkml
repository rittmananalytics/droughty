include: "/lookml/base/_base.layer.lkml"
include: "/lookml/aggregate/_aggregate.layer.lkml"
explore: actors_dim_explore {
hidden: no
view_name: actors_dim
join: actors_dim {
  sql_on: ${actors_dim.actor_fk} = ${narratives_fct.actor_pk} ;;
  relationship: hasMany
}
}
include: "/lookml/base/_base.layer.lkml"
include: "/lookml/aggregate/_aggregate.layer.lkml"
explore: events_fct_explore {
hidden: no
view_name: events_fct
join: observations_fct_events_fct {
  sql_on: ${events_fct.event_fk} = ${observations_fct.event_pk} ;;
  relationship: hasMany
  from: events_fct
}
join: narratives_fct_events_fct {
  sql_on: ${events_fct.event_fk} = ${narratives_fct.event_pk} ;;
  relationship: hasMany
  from: events_fct
}
}
include: "/lookml/base/_base.layer.lkml"
include: "/lookml/aggregate/_aggregate.layer.lkml"
explore: narratives_fct_explore {
hidden: no
view_name: narratives_fct

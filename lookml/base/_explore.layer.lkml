include: "/lookml/base/_base.layer.lkml"
include: "/lookml/aggregate/_aggregate.layer.lkml"
explore: actors_dim_explore {
hidden: no
view_name: actors_dim
join: observers_dim {
  sql_on: ${observers_dim.observer_fk} = ${observations_fct.observer_pk} ;;
  relationship: one_to_many
}

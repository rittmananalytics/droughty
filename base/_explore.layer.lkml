include: "/_base/base.layer.lkml"
include: "/_aggregate/aggregate.layer.lkml"
explore: wh_platform__policies_fact_explore {
hidden: no
view_name: wh_platform__policies_fact
join: wh_platform__quotes_fact {
  sql_on: ${wh_platform__quotes_fact.quote_fk} = ${wh_platform__schedules_fact.quote_pk} ;;
  relationship: many_to_one
}
join: wh_platform__schedules_fact {
  sql_on: ${wh_platform__schedules_fact.schedule_fk} = ${wh_platform__bordereaux_fact.schedule_pk} ;;
  relationship: many_to_one
}
join: wh_platform__bordereaux_fact_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__bordereaux_fact.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
join: wh_platform__invoices_fact_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__invoices_fact.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
join: wh_platform__schedules_fact_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__schedules_fact.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
}

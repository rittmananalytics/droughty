include: "/_base/base.layer.lkml"
view: +wh_platform__bordereaux_fact {
measure: count_of_bordereaux_pk {
  type: count_distinct
  sql: ${TABLE}.bordereaux_pk ;;
  description: "not available"
}
}
view: +wh_platform__brokers_fact {
measure: count_of_broker_pk {
  type: count_distinct
  sql: ${TABLE}.broker_pk ;;
  description: "not available"
}
}
view: +wh_platform__invoices_fact {
measure: count_of_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.invoice_pk ;;
  description: "not available"
}
}
view: +wh_platform__policies_fact {
measure: count_of_policy_pk {
  type: count_distinct
  sql: ${TABLE}.policy_pk ;;
  description: "not available"
}
}
view: +wh_platform__products_dim {
measure: count_of_product_pk {
  type: count_distinct
  sql: ${TABLE}.product_pk ;;
  description: "not available"
}
}
view: +wh_platform__quotes_fact {
measure: count_of_quote_pk {
  type: count_distinct
  sql: ${TABLE}.quote_pk ;;
  description: "not available"
}
}
view: +wh_platform__schedules_fact {
measure: count_of_schedule_pk {
  type: count_distinct
  sql: ${TABLE}.schedule_pk ;;
  description: "not available"
}
}
view: +wh_platform__vehicles_dim {
measure: count_of_vehicle_pk {
  type: count_distinct
  sql: ${TABLE}.vehicle_pk ;;
  description: "not available"
}
}
view: +wh_platform_brokers_fact {
measure: count_of_broker_pk {
  type: count_distinct
  sql: ${TABLE}.broker_pk ;;
  description: "not available"
}
}
view: +wh_platform_products_dim {
measure: count_of_product_pk {
  type: count_distinct
  sql: ${TABLE}.product_pk ;;
  description: "not available"
}
}
view: +wh_platform_vehicles_dim {
measure: count_of_vehicle_pk {
  type: count_distinct
  sql: ${TABLE}.vehicle_pk ;;
  description: "not available"
}
}

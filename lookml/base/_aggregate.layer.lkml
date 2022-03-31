include: "/lookml/base/_base.layer.lkml"
view: +wh_marketing__web_event_items_fact {
measure: count_of_web_event_items_pk {
  type: count_distinct
  sql: ${TABLE}.web_event_items_pk ;;
  description: ""
}
measure: sum_of_web_event_item_price_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_price_in_usd ;;
  description: ""
}
measure: sum_of_web_event_item_price {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_price ;;
  description: ""
}
measure: sum_of_web_event_item_quantity {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_quantity ;;
  description: ""
}
measure: sum_of_web_event_item_revenue_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_revenue_in_usd ;;
  description: ""
}
measure: sum_of_web_event_item_revenue {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_revenue ;;
  description: ""
}
measure: sum_of_web_event_item_refund_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_refund_in_usd ;;
  description: ""
}
measure: sum_of_web_event_item_refund {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_refund ;;
  description: ""
}
}
view: +wh_marketing__web_events_fact {
measure: count_of_web_event_pk {
  type: count_distinct
  sql: ${TABLE}.web_event_pk ;;
  description: "One unique web event per row."
}
measure: sum_of_web_event_row_no_per_session {
  type: sum_distinct
  sql: ${TABLE}.web_event_row_no_per_session ;;
  description: "The row sequence number attribute to an event within a GA Session ID"
}
measure: sum_of_web_event_session_natural_key {
  type: sum_distinct
  sql: ${TABLE}.web_event_session_natural_key ;;
  description: "A GA4 unique session identifier associated with each event that occurs within a session"
}
measure: sum_of_web_event_session_number {
  type: sum_distinct
  sql: ${TABLE}.web_event_session_number ;;
  description: "A GA4 parameter associated with each event that occurs within a session that identifies the ordinal position of a session as it relates to a user, e.g. a users 1st of 5th session."
}
measure: sum_of_web_event_engaged_session_event {
  type: sum_distinct
  sql: ${TABLE}.web_event_engaged_session_event ;;
  description: "A session that has spent 10 seconds or more on the site/app or viewed 2 or more screens/pages or had a conversion event, counted towards engagement rate."
}
measure: sum_of_web_event_ecommerce_total_item_quantity {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_total_item_quantity ;;
  description: "Total number of items in this event, which is the sum of items.quantity."
}
measure: sum_of_web_event_ecommerce_unique_items {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_unique_items ;;
  description: "The number of unique items in this event, based on item_id, item_name, and item_brand."
}
measure: sum_of_web_event_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_value_in_usd ;;
  description: "The currency-converted value (in USD) of the event's \"value\" parameter."
}
measure: sum_of_web_event_ecommerce_purchase_revenue_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_purchase_revenue_in_usd ;;
  description: "Purchase revenue of this event, represented in USD with standard unit. Populated for purchase event only."
}
measure: sum_of_web_event_ecommerce_purchase_revenue {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_purchase_revenue ;;
  description: "Purchase revenue of this event, represented in local currency with standard unit. Populated for purchase event only."
}
measure: sum_of_web_event_ecommerce_refund_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_refund_value_in_usd ;;
  description: "The amount of refund in this event, represented in USD with standard unit. Populated for refund event only."
}
measure: sum_of_web_event_ecommerce_refund_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_refund_value ;;
  description: "The amount of refund in this event, represented in local currency with standard unit. Populated for refund event only."
}
measure: sum_of_web_event_ecommerce_shipping_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_shipping_value_in_usd ;;
  description: "The shipping cost in this event, represented in USD with standard unit."
}
measure: sum_of_web_event_ecommerce_shipping_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_shipping_value ;;
  description: "The shipping cost in this event, represented in local currency."
}
measure: sum_of_web_event_ecommerce_tax_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_tax_value_in_usd ;;
  description: "The tax value in this event, represented in USD with standard unit."
}
measure: sum_of_web_event_ecommerce_tax_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_tax_value ;;
  description: "The tax value in this event, represented in local currency with standard unit."
}
measure: sum_of_web_event_is_ga_engaged_session {
  type: sum_distinct
  sql: ${TABLE}.web_event_is_ga_engaged_session ;;
  description: "A session that has spent 10 seconds or more on the site/app or viewed 2 or more screens/pages or had a conversion event, counted towards engagement rate."
}
}
view: +wh_marketing__web_sessions_fact {
measure: count_of_web_session_pk {
  type: count_distinct
  sql: ${TABLE}.web_session_pk ;;
  description: ""
}
measure: sum_of_web_session_natural_key {
  type: sum_distinct
  sql: ${TABLE}.web_session_natural_key ;;
  description: ""
}
measure: sum_of_web_session_number {
  type: sum_distinct
  sql: ${TABLE}.web_session_number ;;
  description: ""
}
measure: sum_of_web_session_ga_engaged_session {
  type: sum_distinct
  sql: ${TABLE}.web_session_ga_engaged_session ;;
  description: ""
}
measure: sum_of_web_session_total_events {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_events ;;
  description: ""
}
measure: sum_of_web_session_total_ga_engaged_events {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_ga_engaged_events ;;
  description: ""
}
measure: sum_of_web_session_total_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_page_views ;;
  description: ""
}
measure: sum_of_web_session_total_search_results_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_search_results_page_views ;;
  description: ""
}
measure: sum_of_web_session_total_vehicle_details_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_vehicle_details_page_views ;;
  description: ""
}
measure: sum_of_web_session_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.web_session_duration_seconds ;;
  description: ""
}
}

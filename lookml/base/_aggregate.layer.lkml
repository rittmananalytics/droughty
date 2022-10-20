include: "/lookml/base/_base.layer.lkml"
view: +wh_marketing__web_event_items_fact {
measure: count_of_web_event_item_pk {
  type: count_distinct
  sql: ${TABLE}.web_event_item_pk ;;
  description: "Primary key of the event-items table (Unique ID for an event-item)"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
measure: sum_of_web_event_item_price_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_price_in_usd ;;
  description: "The price of the event-item in US Dollars (Vehicle price in USD)"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
measure: sum_of_web_event_item_price {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_price ;;
  description: "The price of the event-item in local currency (Vehicle price in local currency = GBP)"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
measure: sum_of_web_event_item_quantity {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_quantity ;;
  description: "The number of units for this event-item included in this ecommerce event (should always be 1 in our context)"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
measure: sum_of_web_event_item_revenue_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_revenue_in_usd ;;
  description: "The revenue of the event-item in US Dollars, calculated as item_price_in_usd * item_quantity (Vehicle revenue in USD) This is only populated for purchase events"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
measure: sum_of_web_event_item_revenue {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_revenue ;;
  description: "The revenue of the event-item in local currency, calculated as item_price * item_quantity (Vehicle revenue in local currency = GBP) This is only populated for purchase events"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
measure: sum_of_web_event_item_refund_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_refund_in_usd ;;
  description: "The refund value of the event-item in US Dollars, calculated as item_price_in_usd * item_quantity (Vehicle revenue in USD) This is only populated for refund events"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
measure: sum_of_web_event_item_refund {
  type: sum_distinct
  sql: ${TABLE}.web_event_item_refund ;;
  description: "The refund value of the event-item in local currency, calculated as item_price * item_quantity (Vehicle revenue in local currency = GBP) This is only populated for refund events"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
}
view: +wh_marketing__web_event_parameters_fact {
measure: count_of_web_event_parameter_pk {
  type: count_distinct
  sql: ${TABLE}.web_event_parameter_pk ;;
  description: "Primary key of the event parameters table (Unique ID for an event parameter)"
  drill_fields: [wh_marketing__web_event_parameters_fact_set*]
}
measure: sum_of_web_event_parameter_int_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_parameter_int_value ;;
  description: "The integer value of the event parameter, if one exists"
  drill_fields: [wh_marketing__web_event_parameters_fact_set*]
}
measure: sum_of_web_event_parameter_float_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_parameter_float_value ;;
  description: "The float value of the event parameter, if one exists"
  drill_fields: [wh_marketing__web_event_parameters_fact_set*]
}
measure: sum_of_web_event_parameter_double_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_parameter_double_value ;;
  description: "The double value of the event parameter, if one exists"
  drill_fields: [wh_marketing__web_event_parameters_fact_set*]
}
}
view: +wh_marketing__web_event_query_parameters_fact {
measure: count_of_web_event_query_parameter_pk {
  type: count_distinct
  sql: ${TABLE}.web_event_query_parameter_pk ;;
  description: "Primary key of the query_parameters table (surrogate key of web_event_query_parameter_compound_key)"
  drill_fields: [wh_marketing__web_event_query_parameters_fact_set*]
}
}
view: +wh_marketing__web_event_visitor_properties_fact {
measure: count_of_web_event_visitor_property_pk {
  type: count_distinct
  sql: ${TABLE}.web_event_visitor_property_pk ;;
  description: "Primary key of the event-visitor-property table (Unique ID for an event-visitor property)"
  drill_fields: [wh_marketing__web_event_visitor_properties_fact_set*]
}
measure: sum_of_web_event_visitor_property_int_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_visitor_property_int_value ;;
  description: "The integer value of the visitor-property, if one exists"
  drill_fields: [wh_marketing__web_event_visitor_properties_fact_set*]
}
measure: sum_of_web_event_visitor_property_float_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_visitor_property_float_value ;;
  description: "The float value of the visitor-property, if one exists"
  drill_fields: [wh_marketing__web_event_visitor_properties_fact_set*]
}
measure: sum_of_web_event_visitor_property_double_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_visitor_property_double_value ;;
  description: "The double value of the visitor-property, if one exists"
  drill_fields: [wh_marketing__web_event_visitor_properties_fact_set*]
}
}
view: +wh_marketing__web_events_fact {
measure: count_of_web_event_pk {
  type: count_distinct
  sql: ${TABLE}.web_event_pk ;;
  description: "Primary key of the events table (Unique ID for an event)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_sequence_number {
  type: sum_distinct
  sql: ${TABLE}.web_event_sequence_number ;;
  description: "Sequence number for the event within its session i.e. A data value of 1 identifies the first event in a session"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_intent_rank {
  type: sum_distinct
  sql: ${TABLE}.web_event_intent_rank ;;
  description: ""
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_total_item_quantity {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_total_item_quantity ;;
  description: "For ecommerce events: The total number of items in this event (based on the sum of web_event_items_fact.web_event_item_quantity)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_unique_items {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_unique_items ;;
  description: "For ecommerce events: The number of unique items in this event (based on the unique combinations of item_id, item_name and item_brand (from web_event_items_fact))"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_purchase_revenue_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_purchase_revenue_in_usd ;;
  description: "For ecommerce purchase events: The purchase revenue of this event, represented in US Dollars (where the revenue is calculated as the price * quantity)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_purchase_revenue {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_purchase_revenue ;;
  description: "For ecommerce purchase events: The purchase revenue of this event, represented in local currency (where the revenue is calculated as the price * quantity)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_refund_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_refund_value_in_usd ;;
  description: "For ecommerce refund events: The refund amount of this event, represented in US Dollars (where the refund amount is calculated as the price * quantity)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_refund_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_refund_value ;;
  description: "For ecommerce refund events: The refund amount of this event, represented in local currency (where the refund amount is calculated as the price * quantity)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_shipping_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_shipping_value_in_usd ;;
  description: "For ecommerce events: The shipping cost of this event, represented in US Dollars (where we have repurposed the 'shipping info' to cover our 'billing info')"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_shipping_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_shipping_value ;;
  description: "For ecommerce events: The shipping cost of this event, represented in local currency (where we have repurposed the 'shipping info' to cover our 'billing info')"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_tax_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_tax_value_in_usd ;;
  description: "For ecommerce events: The tax value in this event, represented in US Dollars"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ecommerce_tax_value {
  type: sum_distinct
  sql: ${TABLE}.web_event_ecommerce_tax_value ;;
  description: "For ecommerce events: The tax value in this event, represented in local currency"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_value_in_usd {
  type: sum_distinct
  sql: ${TABLE}.web_event_value_in_usd ;;
  description: "The currency-converted value (in US Dollars) of the event's value parameter"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_entrances {
  type: sum_distinct
  sql: ${TABLE}.web_event_entrances ;;
  description: "A data value of 1 in this column indicates that the event is for an entrance to the website"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_device_time_zone_offset_seconds {
  type: sum_distinct
  sql: ${TABLE}.web_event_device_time_zone_offset_seconds ;;
  description: "Device's offset from the GMT time zone in seconds"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_ga_engaged_event {
  type: sum_distinct
  sql: ${TABLE}.web_event_ga_engaged_event ;;
  description: "A data value of 'true' in this column indicates that the event caused Google Analytics (GA) to count the session as an 'engaged session', according to GA's own definition of 'engagement', namely: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_was_visitor_natural_key_null {
  type: sum_distinct
  sql: ${TABLE}.web_event_was_visitor_natural_key_null ;;
  description: "Flag to identify if the original value for the visitor natural key was null in the source data, and subsequently populated with a surrogate key"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
measure: sum_of_web_event_was_session_natural_key_null {
  type: sum_distinct
  sql: ${TABLE}.web_event_was_session_natural_key_null ;;
  description: "Flag to identify if the original value for the session natural key was null in the source data, and subsequently populated with a surrogate key"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
}
view: +wh_marketing__web_sessions_xa {
measure: count_of_web_session_pk {
  type: count_distinct
  sql: ${TABLE}.web_session_pk ;;
  description: "Primary key of the sessions table (Unique ID for a session)"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_wh_generated {
  type: sum_distinct
  sql: ${TABLE}.web_session_wh_generated ;;
  description: "Flag to identify whether the session has been generated by the warehouse (with data value = 1) as opposed to identifying a session that came through in the GA clickstream data (with data value = 0)"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_number {
  type: sum_distinct
  sql: ${TABLE}.web_session_number ;;
  description: "Ordinal session count for this visitor e.g. For the visitor's first session, the data value will be 1. For the visitor's second session, the data value will be 2."
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_ga_engaged_session {
  type: sum_distinct
  sql: ${TABLE}.web_session_ga_engaged_session ;;
  description: "A data value of 'true' in this column indicates that Google Analytics (GA) has deemed the session to be an 'engaged session' (because it has one or more events that were deemed to be an 'engaged event'). Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_events {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_events ;;
  description: "Total number of events within the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_ga_engaged_events {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_ga_engaged_events ;;
  description: "Total number of events within the session that Google Analytics (GA) deemed to be an 'engaged event'. Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_page_views ;;
  description: "Total number of page_view events within the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_search_results_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_search_results_page_views ;;
  description: "Total number of search result (SRP) page_view events within the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_vehicle_details_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_vehicle_details_page_views ;;
  description: "Total number of vehicle details (VDP) page_view events within the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_level_2_events {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_level_2_events ;;
  description: "Total number of events within the session that were 'level 2 engagement events' according to the measurement framework"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_level_3_events {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_level_3_events ;;
  description: "Total number of events within the session that were 'level 3 enquiry events' according to the measurement framework (i.e. number of enquiry form submits)"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_level_4_events {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_level_4_events ;;
  description: "Total number of events within the session that were 'level 4 transaction events' according to the measurement framework (i.e. number of completed transactions)"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_level_2_vdp {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_level_2_vdp ;;
  description: "Number of Vehicle Detail Pages (VDPs) visited by the session with at least one 'level 2 engagement event' fired from that VDP i.e. Reflects the number of vehicles that the session 'engaged' with according to the measurement framework"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_total_intents {
  type: sum_distinct
  sql: ${TABLE}.web_session_total_intents ;;
  description: "The number of different intents exhibited by the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_first_not_null_device_time_zone_offset_seconds {
  type: sum_distinct
  sql: ${TABLE}.web_session_first_not_null_device_time_zone_offset_seconds ;;
  description: "The first non-null device_time_zone_offset_seconds in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
measure: sum_of_web_session_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.web_session_duration_seconds ;;
  description: "Number of seconds between the timestamps for the first and last events in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
}
view: +wh_marketing__web_visitors_xa {
measure: count_of_web_visitor_pk {
  type: count_distinct
  sql: ${TABLE}.web_visitor_pk ;;
  description: "Primary key of the visitors table (surrogate key of web_event_visitor_natural_key)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_wh_generated {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_wh_generated ;;
  description: "Flag to identify whether the visitor has been generated by the warehouse (with data value = 1) as opposed to identifying a visitor that came through in the GA clickstream data (with data value = 0)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_sessions {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_sessions ;;
  description: "Total number of sessions for the visitor"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_events {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_events ;;
  description: "Total number of events (across all sessions) for the visitor"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_ga_engaged_visitor {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_ga_engaged_visitor ;;
  description: "A data value of 'true' in this column indicates that Google Analytics (GA) has deemed the visitor to be an 'engaged visitor' (because it has one or more events that were deemed to be an 'engaged event'). Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_page_views ;;
  description: "Total number of page_view events across all sessions for the visitor"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_search_results_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_search_results_page_views ;;
  description: "Total number of search result (SRP) page_view events across all sessions for the visitorfor the visitor"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_vehicle_details_page_views {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_vehicle_details_page_views ;;
  description: "Total number of vehicle details (VDP) page_view events across all sessions for the visitorsessions for the visitor"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_level_2_events {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_level_2_events ;;
  description: "Total number of events across all sessions for the visitor that were 'level 2 engagement events' according to the measurement framework"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_level_3_events {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_level_3_events ;;
  description: "Total number of events across all sessions for the visitor that were 'level 3 enquiry events' according to the measurement framework (i.e. number of enquiry form submits)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_level_4_events {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_level_4_events ;;
  description: "Total number of events across all sessions for the visitor that were 'level 4 transaction events' according to the measurement framework (i.e. number of completed transactions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
measure: sum_of_web_visitor_total_level_2_vdp {
  type: sum_distinct
  sql: ${TABLE}.web_visitor_total_level_2_vdp ;;
  description: "Number of Vehicle Detail Pages (VDPs) visited by the visitor with at least one 'level 2 engagement event' fired from that VDP i.e. Reflects the number of vehicles that the visitor 'engaged' with according to the measurement framework"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
}

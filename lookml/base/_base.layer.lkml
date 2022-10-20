explore: wh_marketing__web_event_items_fact
{ hidden: yes }
explore: wh_marketing__web_event_parameters_fact
{ hidden: yes }
explore: wh_marketing__web_event_query_parameters_fact
{ hidden: yes }
explore: wh_marketing__web_event_visitor_properties_fact
{ hidden: yes }
explore: wh_marketing__web_events_fact
{ hidden: yes }
explore: wh_marketing__web_sessions_xa
{ hidden: yes }
explore: wh_marketing__web_visitors_xa
{ hidden: yes }
view: wh_marketing__web_event_items_fact {
sql_table_name: wh_marketing__web_event_items_fact ;;
set: wh_marketing__web_event_items_fact_set {
  fields: [
    web_event_compound_key,
    web_event_item_name,
    web_event_item_division,
    web_event_item_brand,
    web_event_item_body_type,
    web_event_item_classification_type,
    web_event_item_range,
    web_event_item_model,
    web_event_item_derivative,
    web_event_item_trim,
    web_event_item_price_in_usd,
    web_event_item_price,
    web_event_item_quantity,
    web_event_item_revenue_in_usd,
    web_event_item_revenue,
    web_event_item_refund_in_usd,
    web_event_item_refund,
    web_event_item_coupon,
    web_event_item_list_name,
    web_event_item_list_index,
    web_event_item_promotion_name,
    web_event_item_creative_name,
    web_event_item_creative_slot,
  ]
}
dimension: web_event_item_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.web_event_item_pk ;;
  description: "Primary key of the event-items table (Unique ID for an event-item)"
}
dimension: web_event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.web_event_fk ;;
  description: "Primary key of the events table that the record relates to (Unique ID for the event that this record relates to)"
}
dimension: web_event_compound_key {
  type: string
  sql: ${TABLE}.web_event_compound_key ;;
  description: "Compound key used to derive the primary key for web events. Derived from the user psuedo ID + ga session ID + web_event_sequence_number.  Where the pseudo ID and ga session ID are null, a substitute number, derived by the row number in order of timestamp is used to populate."
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_natural_key {
  type: string
  sql: ${TABLE}.web_event_item_natural_key ;;
  description: "Natural key of the event-items table (Event-item ID from the raw data) Supplied as the 'item_id' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_location_natural_key {
  type: string
  sql: ${TABLE}.web_event_item_location_natural_key ;;
  description: "Natural key for the event-item's location (Event-item's location ID from the raw data) Supplied as the 'location_id' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_list_natural_key {
  type: string
  sql: ${TABLE}.web_event_item_list_natural_key ;;
  description: "Natural key for the event-item's list (Event-item's list ID from the raw data) Supplied as the 'item_list_id' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_promotion_natural_key {
  type: string
  sql: ${TABLE}.web_event_item_promotion_natural_key ;;
  description: "Natural key for the event-item's promotion (Event-item's promotion ID from the raw data) Supplied as the 'promotion_id' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_name {
  type: string
  sql: ${TABLE}.web_event_item_name ;;
  description: "Name of the event-item (High-level vehicle description as displayed in the search listing or the VDP)"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_division {
  type: string
  sql: ${TABLE}.web_event_item_division ;;
  description: "Division of the event-item (Vehicle division e.g. JLR, Specialist) Supplied as the 'affiliation' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_brand {
  type: string
  sql: ${TABLE}.web_event_item_brand ;;
  description: "Brand of the event-item (Brand of the vehicle)"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_body_type {
  type: string
  sql: ${TABLE}.web_event_item_body_type ;;
  description: "Body type of the event-item (Vehicle body type e.g. coupe, hatchback) Supplied as the 'item_variant' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_classification_type {
  type: string
  sql: ${TABLE}.web_event_item_classification_type ;;
  description: "Classification type of the event-item (Vehicle classification type e.g. new, used) Supplied as the 'item_category' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_range {
  type: string
  sql: ${TABLE}.web_event_item_range ;;
  description: "Range of the event-item (Vehicle range e.g. A3) Supplied as the 'item_category2' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_model {
  type: string
  sql: ${TABLE}.web_event_item_model ;;
  description: "Model of the event-item (Vehicle model e.g. Sportback) Supplied as the 'item_category3' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_derivative {
  type: string
  sql: ${TABLE}.web_event_item_derivative ;;
  description: "Derivative of the event-item (Vehicle derivative e.g. Vorsprung) Supplied as the 'item_category4' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_trim {
  type: string
  sql: ${TABLE}.web_event_item_trim ;;
  description: "Trim/Specification of the event-item (Vehicle trim / specification e.g. Comfort and Soundpack) Supplied as the 'item_category5' in the raw GA events data"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_price_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_item_price_in_usd ;;
  description: "The price of the event-item in US Dollars (Vehicle price in USD)"
}
dimension: web_event_item_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_item_price ;;
  description: "The price of the event-item in local currency (Vehicle price in local currency = GBP)"
}
dimension: web_event_item_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_item_quantity ;;
  description: "The number of units for this event-item included in this ecommerce event (should always be 1 in our context)"
}
dimension: web_event_item_revenue_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_item_revenue_in_usd ;;
  description: "The revenue of the event-item in US Dollars, calculated as item_price_in_usd * item_quantity (Vehicle revenue in USD) This is only populated for purchase events"
}
dimension: web_event_item_revenue {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_item_revenue ;;
  description: "The revenue of the event-item in local currency, calculated as item_price * item_quantity (Vehicle revenue in local currency = GBP) This is only populated for purchase events"
}
dimension: web_event_item_refund_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_item_refund_in_usd ;;
  description: "The refund value of the event-item in US Dollars, calculated as item_price_in_usd * item_quantity (Vehicle revenue in USD) This is only populated for refund events"
}
dimension: web_event_item_refund {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_item_refund ;;
  description: "The refund value of the event-item in local currency, calculated as item_price * item_quantity (Vehicle revenue in local currency = GBP) This is only populated for refund events"
}
dimension: web_event_item_coupon {
  type: string
  sql: ${TABLE}.web_event_item_coupon ;;
  description: "Coupon code applied to this event-item"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_list_name {
  type: string
  sql: ${TABLE}.web_event_item_list_name ;;
  description: "Name of the list in which the event-item was presented to the website visitor"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_list_index {
  type: string
  sql: ${TABLE}.web_event_item_list_index ;;
  description: "Position of the event-item in a list"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_promotion_name {
  type: string
  sql: ${TABLE}.web_event_item_promotion_name ;;
  description: "Name of the promotion associated to this event-item"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_creative_name {
  type: string
  sql: ${TABLE}.web_event_item_creative_name ;;
  description: "Name of a creative used in a promotional spot for this event-item"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
dimension: web_event_item_creative_slot {
  type: string
  sql: ${TABLE}.web_event_item_creative_slot ;;
  description: "Name of a creative slot for this event-item"
  drill_fields: [wh_marketing__web_event_items_fact_set*]
}
}
view: wh_marketing__web_event_parameters_fact {
sql_table_name: wh_marketing__web_event_parameters_fact ;;
set: wh_marketing__web_event_parameters_fact_set {
  fields: [
    web_event_parameter_compound_key,
    web_event_parameter_key,
    web_event_parameter_string_value,
    web_event_parameter_int_value,
    web_event_parameter_float_value,
    web_event_parameter_double_value,
  ]
}
dimension: web_event_parameter_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.web_event_parameter_pk ;;
  description: "Primary key of the event parameters table (Unique ID for an event parameter)"
}
dimension: web_event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.web_event_fk ;;
  description: "Primary key of the events table that the record relates to (Unique ID for the event that this record relates to)"
}
dimension: web_event_parameter_compound_key {
  type: string
  sql: ${TABLE}.web_event_parameter_compound_key ;;
  description: "Natural key of the event parameters table (event parameter ID from the raw data). Compound of session ID + event row number + event parameters key"
  drill_fields: [wh_marketing__web_event_parameters_fact_set*]
}
dimension: web_event_parameter_key {
  type: string
  sql: ${TABLE}.web_event_parameter_key ;;
  description: "The name of the event parameter"
  drill_fields: [wh_marketing__web_event_parameters_fact_set*]
}
dimension: web_event_parameter_string_value {
  type: string
  sql: ${TABLE}.web_event_parameter_string_value ;;
  description: "The string value of the event parameter, if one exists"
  drill_fields: [wh_marketing__web_event_parameters_fact_set*]
}
dimension: web_event_parameter_int_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_parameter_int_value ;;
  description: "The integer value of the event parameter, if one exists"
}
dimension: web_event_parameter_float_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_parameter_float_value ;;
  description: "The float value of the event parameter, if one exists"
}
dimension: web_event_parameter_double_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_parameter_double_value ;;
  description: "The double value of the event parameter, if one exists"
}
}
view: wh_marketing__web_event_query_parameters_fact {
sql_table_name: wh_marketing__web_event_query_parameters_fact ;;
set: wh_marketing__web_event_query_parameters_fact_set {
  fields: [web_event_query_parameter_compound_key, web_event_query_parameter_name, web_event_query_parameter_value]
}
dimension: web_event_query_parameter_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.web_event_query_parameter_pk ;;
  description: "Primary key of the query_parameters table (surrogate key of web_event_query_parameter_compound_key)"
}
dimension: web_event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.web_event_fk ;;
  description: "Primary key of the events table that the record relates to (Unique ID for the event that this record relates to)"
}
dimension: web_event_query_parameter_compound_key {
  type: string
  sql: ${TABLE}.web_event_query_parameter_compound_key ;;
  description: "Compound of web_event_compound_key, web_event_query_parameter_name, and web_event_query_parameter_value"
  drill_fields: [wh_marketing__web_event_query_parameters_fact_set*]
}
dimension: web_event_query_parameter_name {
  type: string
  sql: ${TABLE}.web_event_query_parameter_name ;;
  description: "The parameter name"
  drill_fields: [wh_marketing__web_event_query_parameters_fact_set*]
}
dimension: web_event_query_parameter_value {
  type: string
  sql: ${TABLE}.web_event_query_parameter_value ;;
  description: "The parameter value"
  drill_fields: [wh_marketing__web_event_query_parameters_fact_set*]
}
}
view: wh_marketing__web_event_visitor_properties_fact {
sql_table_name: wh_marketing__web_event_visitor_properties_fact ;;
set: wh_marketing__web_event_visitor_properties_fact_set {
  fields: [
    web_event_visitor_property_compound_key,
    web_event_visitor_property_key,
    web_event_visitor_property_string_value,
    web_event_visitor_property_int_value,
    web_event_visitor_property_float_value,
    web_event_visitor_property_double_value,
  ]
}
dimension: web_event_visitor_property_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.web_event_visitor_property_pk ;;
  description: "Primary key of the event-visitor-property table (Unique ID for an event-visitor property)"
}
dimension: web_event_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.web_event_fk ;;
  description: "Primary key of the events table that the record relates to (Unique ID for the event that this record relates to)"
}
dimension: web_event_visitor_property_compound_key {
  type: string
  sql: ${TABLE}.web_event_visitor_property_compound_key ;;
  description: "Natural key of the event-visitor-property table (Event-visitor-property ID from the raw data). Compound of session ID + event row number + visitor property key"
  drill_fields: [wh_marketing__web_event_visitor_properties_fact_set*]
}
dimension: web_event_visitor_property_key {
  type: string
  sql: ${TABLE}.web_event_visitor_property_key ;;
  description: "The name of the visitor-property"
  drill_fields: [wh_marketing__web_event_visitor_properties_fact_set*]
}
dimension: web_event_visitor_property_string_value {
  type: string
  sql: ${TABLE}.web_event_visitor_property_string_value ;;
  description: "The string value of the visitor-property, if one exists"
  drill_fields: [wh_marketing__web_event_visitor_properties_fact_set*]
}
dimension: web_event_visitor_property_int_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_visitor_property_int_value ;;
  description: "The integer value of the visitor-property, if one exists"
}
dimension: web_event_visitor_property_float_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_visitor_property_float_value ;;
  description: "The float value of the visitor-property, if one exists"
}
dimension: web_event_visitor_property_double_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_visitor_property_double_value ;;
  description: "The double value of the visitor-property, if one exists"
}
}
view: wh_marketing__web_events_fact {
sql_table_name: wh_marketing__web_events_fact ;;
set: wh_marketing__web_events_fact_set {
  fields: [
    web_event_compound_key,
    web_event_session_compound_key,
    web_event_sequence_number,
    web_event_data_source,
    web_event_website_property,
    web_event_table_suffix,
    web_event_name,
    web_event_page_type,
    web_event_page_hostname,
    web_event_page_location,
    web_event_page_location_without_query_parameters,
    web_event_page_title,
    web_event_page_referrer,
    web_event_page_referrer_without_query_parameters,
    web_event_page_referrer_ignore,
    web_event_link_text,
    web_event_link_domain,
    web_event_link_url,
    web_event_channel,
    web_event_source,
    web_event_medium,
    web_event_campaign,
    web_event_content,
    web_event_term,
    web_event_visitor_first_campaign,
    web_event_visitor_first_medium,
    web_event_visitor_first_source,
    web_event_division,
    web_event_brand,
    web_event_intent,
    web_event_intent_rank,
    web_event_mf_level,
    web_event_mf_sub_level,
    web_event_device_category,
    web_event_device_mobile_brand_name,
    web_event_device_mobile_model_name,
    web_event_device_mobile_marketing_name,
    web_event_device_mobile_os_hardware_model,
    web_event_device_operating_system,
    web_event_device_operating_system_version,
    web_event_device_vendor_id,
    web_event_device_advertising_id,
    web_event_device_language,
    web_event_device_is_limited_ad_tracking,
    web_event_device_browser,
    web_event_device_browser_version,
    web_event_device_screen_resolution,
    web_event_geo_continent,
    web_event_geo_sub_continent,
    web_event_geo_country,
    web_event_geo_region,
    web_event_geo_metro,
    web_event_geo_city,
    web_event_cms_card_title,
    web_event_cms_card_name,
    web_event_cms_card_position,
    web_event_cms_slice_name,
    web_event_cms_slice_position,
    web_event_cms_component_title,
    web_event_cms_component_name,
    web_event_cms_component_position,
    web_event_cms_clickable_element_title,
    web_event_cms_clickable_element_name,
    web_event_cms_clickable_element_position,
    web_event_cms_block_position,
    web_event_enquiry_template,
    web_event_enquiry_topic,
    web_event_enquiry_category,
    web_event_enquiry_sub_category,
    web_event_error_type,
    web_event_error_details,
    web_event_purchase_type,
    web_event_content_type,
    web_event_search_type,
    web_event_search_term,
    web_event_debug_mode,
    web_event_outbound_link_click,
    web_event_privacy_info_ads_storage,
    web_event_privacy_info_analytics_storage,
    web_event_privacy_info_uses_transient_token,
    web_event_ecommerce_total_item_quantity,
    web_event_ecommerce_unique_items,
    web_event_ecommerce_purchase_revenue_in_usd,
    web_event_ecommerce_purchase_revenue,
    web_event_ecommerce_refund_value_in_usd,
    web_event_ecommerce_refund_value,
    web_event_ecommerce_shipping_value_in_usd,
    web_event_ecommerce_shipping_value,
    web_event_ecommerce_tax_value_in_usd,
    web_event_ecommerce_tax_value,
    web_event_value_in_usd,
    web_event_entrances,
    web_event_device_time_zone_offset_seconds,
    web_event_ga_engaged_event,
  ]
}
dimension: web_event_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.web_event_pk ;;
  description: "Primary key of the events table (Unique ID for an event)"
}
dimension: web_session_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.web_session_fk ;;
  description: "Primary key of the sessions table that the event relates to (Unique ID for the session that fired this event)"
}
dimension: web_visitor_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.web_visitor_fk ;;
  description: "Primary key of the visitors table (Unique ID for the visitor who conducted this session)"
}
dimension: web_event_compound_key {
  type: string
  sql: ${TABLE}.web_event_compound_key ;;
  description: "Compound key used to derive the primary key for web events. Derived from the user psuedo ID + ga session ID + web_event_sequence_number.  Where the pseudo ID and ga session ID are null, a substitute number, derived by the row number in order of timestamp is used to populate."
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_session_compound_key {
  type: string
  sql: ${TABLE}.web_event_session_compound_key ;;
  description: "A concatenation of the raw GA session ID and user pseudo ID from the raw GA data; The ga_session_id supplied in the event parameter in the raw GA data."
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_user_natural_key {
  type: string
  sql: ${TABLE}.web_event_user_natural_key ;;
  description: "User ID from the raw GA data. This provides the 'known user ID' from our website, where it is set via the setUserId API via Google Analytics (GA). Customer accounts are not yet active on our websites so this column is not yet in use and will therefore be NULL for all records."
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_visitor_natural_key {
  type: string
  sql: ${TABLE}.web_event_visitor_natural_key ;;
  description: "Visitor ID from the raw GA data. This provides the 'GA Client ID' from Google Analytics (GA) which is supplied in the user_pseudo_id column in the raw GA data. This is merely a GA cookie ID, which identifies an anonymous visitor to our website, which is unique to the visitor's device and browser."
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_session_natural_key {
  type: string
  sql: ${TABLE}.web_event_session_natural_key ;;
  description: "Session ID from the raw GA data (which comes through as an event parameter called 'ga_session_id')"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_sequence_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_sequence_number ;;
  description: "Sequence number for the event within its session i.e. A data value of 1 identifies the first event in a session"
}
dimension: web_event_bundle_sequence_natural_key {
  type: string
  sql: ${TABLE}.web_event_bundle_sequence_natural_key ;;
  description: "Sequential ID of the bundle in which these events were uploaded by Google Analytics. Provided as 'event_bundle_sequence_id' in the raw GA data."
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_vehicle_deal_natural_key {
  type: string
  sql: ${TABLE}.web_event_vehicle_deal_natural_key ;;
  description: "Sytner vehicle deal ID; a unique ID for the vehicle and this instance of attempting to sell it i.e. If we have had the same physical vehicle on our books to sell more than once, then there will be more than one vehicle deal ID for the same physical vehicle; there will be one vehicle deal ID for each time we have had it on our books to sell"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_ecommerce_transaction_natural_key {
  type: string
  sql: ${TABLE}.web_event_ecommerce_transaction_natural_key ;;
  description: "Raw ecommerce ID from Google Analytics (GA)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_data_source {
  type: string
  sql: ${TABLE}.web_event_data_source ;;
  description: "The data source that has provided the event e.g. Data value will be 'ga4' for records coming from Google Analytics (GA)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_website_property {
  type: string
  sql: ${TABLE}.web_event_website_property ;;
  description: "The website related to the data source"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_table_suffix {
  type: string
  sql: ${TABLE}.web_event_table_suffix ;;
  description: "The BigQuery table suffix"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_name {
  type: string
  sql: ${TABLE}.web_event_name ;;
  description: "The name of the event"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_type {
  type: string
  sql: ${TABLE}.web_event_page_type ;;
  description: "Website page type e.g. vdp (for a vehicle details page), srp (for a search results page)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_hostname {
  type: string
  sql: ${TABLE}.web_event_page_hostname ;;
  description: "Website page hostname e.g. sytner.co.uk"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_location {
  type: string
  sql: ${TABLE}.web_event_page_location ;;
  description: "Website page URL"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_location_without_query_parameters {
  type: string
  sql: ${TABLE}.web_event_page_location_without_query_parameters ;;
  description: "Website page URL without query parameters"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_title {
  type: string
  sql: ${TABLE}.web_event_page_title ;;
  description: "Website page title"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_referrer {
  type: string
  sql: ${TABLE}.web_event_page_referrer ;;
  description: "The URL of the previously loaded website page"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_referrer_without_query_parameters {
  type: string
  sql: ${TABLE}.web_event_page_referrer_without_query_parameters ;;
  description: "The URL without query parameters of the previously loaded website page"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_page_referrer_ignore {
  type: string
  sql: ${TABLE}.web_event_page_referrer_ignore ;;
  description: "A data value of 'true' in this column indicates that the web_event_page_referrer should be ignored due to it being an invalid referrer"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_link_text {
  type: string
  sql: ${TABLE}.web_event_link_text ;;
  description: "For the click, click_button, click_link events; this column holds the text for the link that was clicked, as it appeared on the website front-end. For click_image events; this column holds the alt-text for the image (from the image meta data)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_link_domain {
  type: string
  sql: ${TABLE}.web_event_link_domain ;;
  description: "Domain name of the destination URL for a click event or file download event"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_link_url {
  type: string
  sql: ${TABLE}.web_event_link_url ;;
  description: "Full destination URL for a click event or file download event"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_channel {
  type: string
  sql: ${TABLE}.web_event_channel ;;
  description: "Channel of the traffic source attributed to the event e.g. direct, email, referral, display, paid search"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_source {
  type: string
  sql: ${TABLE}.web_event_source ;;
  description: "Source of the traffic source attributed to the event e.g. google, facebook, autotrader, (direct)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_medium {
  type: string
  sql: ${TABLE}.web_event_medium ;;
  description: "Medium of the traffic source attributed to the event e.g. organic, cpc, partner, social"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_campaign {
  type: string
  sql: ${TABLE}.web_event_campaign ;;
  description: "Campaign name of the traffic source attributed to the event"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_content {
  type: string
  sql: ${TABLE}.web_event_content ;;
  description: "Ad content of the traffic source attributed to the event (which can be set via the utm_content URL parameter)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_term {
  type: string
  sql: ${TABLE}.web_event_term ;;
  description: "Keyword term of the traffic source attributed to the event (which is usually set when the medium of the traffic source is 'organic' or 'cpc'). This can be set via the utm_term URL parameter"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_visitor_first_campaign {
  type: string
  sql: ${TABLE}.web_event_visitor_first_campaign ;;
  description: "Campaign name of the traffic source that first acquired the visitor, according to the raw GA data"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_visitor_first_medium {
  type: string
  sql: ${TABLE}.web_event_visitor_first_medium ;;
  description: "Medium of the traffic source that first acquired the visitor, according to the raw GA data e.g. organic, cpc, partner, social"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_visitor_first_source {
  type: string
  sql: ${TABLE}.web_event_visitor_first_source ;;
  description: "Source of the traffic source that first acquired the visitor, according to the raw GA data e.g. google, facebook, autotrader, (direct)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_division {
  type: string
  sql: ${TABLE}.web_event_division ;;
  description: "Division attributed to the event (derived from the web_event_brand)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_brand {
  type: string
  sql: ${TABLE}.web_event_brand ;;
  description: "Brand attributed to the event (as supplied in the raw GA data in the 'brand' or 'item_brand' event parameters)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_intent {
  type: string
  sql: ${TABLE}.web_event_intent ;;
  description: "Intent attributed to the event (as supplied in the raw GA data in the 'intent' event parameter)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_intent_rank {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_intent_rank ;;
  description: ""
}
dimension: web_event_mf_level {
  type: string
  sql: ${TABLE}.web_event_mf_level ;;
  description: "Measurement framework level attributed to the event (as supplied in the raw GA data in the 'mf' event parameter, or derived from the event name)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_mf_sub_level {
  type: string
  sql: ${TABLE}.web_event_mf_sub_level ;;
  description: "Measurement framework sub-level attributed to the event (as derived from the web_event_intent, event_name and web_event_page_type)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_category {
  type: string
  sql: ${TABLE}.web_event_device_category ;;
  description: "Device category e.g. mobile, tablet, desktop"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_mobile_brand_name {
  type: string
  sql: ${TABLE}.web_event_device_mobile_brand_name ;;
  description: "Device brand name (for a mobile device)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_mobile_model_name {
  type: string
  sql: ${TABLE}.web_event_device_mobile_model_name ;;
  description: "Device model name (for a mobile device)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_mobile_marketing_name {
  type: string
  sql: ${TABLE}.web_event_device_mobile_marketing_name ;;
  description: "Device marketing name (for a mobile device)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_mobile_os_hardware_model {
  type: string
  sql: ${TABLE}.web_event_device_mobile_os_hardware_model ;;
  description: "Device model information retrieved directly from the operating system (for a mobile device)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_operating_system {
  type: string
  sql: ${TABLE}.web_event_device_operating_system ;;
  description: "Operating system of the device"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_operating_system_version {
  type: string
  sql: ${TABLE}.web_event_device_operating_system_version ;;
  description: "Operating system version of the device"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_vendor_id {
  type: string
  sql: ${TABLE}.web_event_device_vendor_id ;;
  description: "IDFV (only present if the IDFA is not collected in the web_event_device_advertising_id column)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_advertising_id {
  type: string
  sql: ${TABLE}.web_event_device_advertising_id ;;
  description: "Advertising ID for the device (IDFA)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_language {
  type: string
  sql: ${TABLE}.web_event_device_language ;;
  description: "Language set in the device's operating system"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_is_limited_ad_tracking {
  type: string
  sql: ${TABLE}.web_event_device_is_limited_ad_tracking ;;
  description: "The 'Limit Ad Tracking' setting for the device. On iOS14+, this returns 'false' if the IDFA is non-zero (in the web_event_device_advertising_id column)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_browser {
  type: string
  sql: ${TABLE}.web_event_device_browser ;;
  description: "Browser used by the visitor to browse the website"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_browser_version {
  type: string
  sql: ${TABLE}.web_event_device_browser_version ;;
  description: "Version of the browser used by the visitor to browse the website"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_device_screen_resolution {
  type: string
  sql: ${TABLE}.web_event_device_screen_resolution ;;
  description: "Device screen resolution"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_geo_continent {
  type: string
  sql: ${TABLE}.web_event_geo_continent ;;
  description: "Continent from which the event was reported, based on the visitor's IP address"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_geo_sub_continent {
  type: string
  sql: ${TABLE}.web_event_geo_sub_continent ;;
  description: "Sub-continent from which the event was reported, based on the visitor's IP address"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_geo_country {
  type: string
  sql: ${TABLE}.web_event_geo_country ;;
  description: "Country from which the event was reported, based on the visitor's IP address"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_geo_region {
  type: string
  sql: ${TABLE}.web_event_geo_region ;;
  description: "Region from which the event was reported, based on the visitor's IP address"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_geo_metro {
  type: string
  sql: ${TABLE}.web_event_geo_metro ;;
  description: "Metro from which the event was reported, based on the visitor's IP address"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_geo_city {
  type: string
  sql: ${TABLE}.web_event_geo_city ;;
  description: "City from which the event was reported, based on the visitor's IP address"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_card_title {
  type: string
  sql: ${TABLE}.web_event_cms_card_title ;;
  description: "CMS taxonomy parameter: card title"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_card_name {
  type: string
  sql: ${TABLE}.web_event_cms_card_name ;;
  description: "CMS taxonomy parameter: card name"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_card_position {
  type: string
  sql: ${TABLE}.web_event_cms_card_position ;;
  description: "CMS taxonomy parameter: card position"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_slice_name {
  type: string
  sql: ${TABLE}.web_event_cms_slice_name ;;
  description: "CMS taxonomy parameter: slice name"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_slice_position {
  type: string
  sql: ${TABLE}.web_event_cms_slice_position ;;
  description: "CMS taxonomy parameter: slice position"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_component_title {
  type: string
  sql: ${TABLE}.web_event_cms_component_title ;;
  description: "CMS taxonomy parameter: component title"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_component_name {
  type: string
  sql: ${TABLE}.web_event_cms_component_name ;;
  description: "CMS taxonomy parameter: component name"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_component_position {
  type: string
  sql: ${TABLE}.web_event_cms_component_position ;;
  description: "CMS taxonomy parameter: component position"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_clickable_element_title {
  type: string
  sql: ${TABLE}.web_event_cms_clickable_element_title ;;
  description: "CMS taxonomy parameter: clickable element title"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_clickable_element_name {
  type: string
  sql: ${TABLE}.web_event_cms_clickable_element_name ;;
  description: "CMS taxonomy parameter: clickable element name"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_clickable_element_position {
  type: string
  sql: ${TABLE}.web_event_cms_clickable_element_position ;;
  description: "CMS taxonomy parameter: clickable element position"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_cms_block_position {
  type: string
  sql: ${TABLE}.web_event_cms_block_position ;;
  description: "CMS taxonomy parameter: block position"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_enquiry_template {
  type: string
  sql: ${TABLE}.web_event_enquiry_template ;;
  description: "For events relating to enquiry forms: Name of the enquiry form template used"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_enquiry_topic {
  type: string
  sql: ${TABLE}.web_event_enquiry_topic ;;
  description: "For events relating to enquiry forms: Enquiry topic"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_enquiry_category {
  type: string
  sql: ${TABLE}.web_event_enquiry_category ;;
  description: "For events relating to enquiry forms: Enquiry category"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_enquiry_sub_category {
  type: string
  sql: ${TABLE}.web_event_enquiry_sub_category ;;
  description: "For events relating to enquiry forms: Enquiry sub-category"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_error_type {
  type: string
  sql: ${TABLE}.web_event_error_type ;;
  description: "For events relating to errors: Error type"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_error_details {
  type: string
  sql: ${TABLE}.web_event_error_details ;;
  description: "For events relating to errors: Details of the error"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_purchase_type {
  type: string
  sql: ${TABLE}.web_event_purchase_type ;;
  description: "For purchase events: Type of purchase transaction"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_content_type {
  type: string
  sql: ${TABLE}.web_event_content_type ;;
  description: "For select_content events: Type of content selected"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_search_type {
  type: string
  sql: ${TABLE}.web_event_search_type ;;
  description: "For search-related events: Search type"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_search_term {
  type: string
  sql: ${TABLE}.web_event_search_term ;;
  description: "For search-related events: Search term"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_debug_mode {
  type: string
  sql: ${TABLE}.web_event_debug_mode ;;
  description: "A data value of 1 in this column indicates that the event came from a device that is running in debug mode (using the 'GA debug' chrome extension)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_outbound_link_click {
  type: string
  sql: ${TABLE}.web_event_outbound_link_click ;;
  description: "A data value of 'true' in this column indicates that the event was for a click event, which took the visitor away from the current domain (and redirected them to an external domain i.e. took them to an external website)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_privacy_info_ads_storage {
  type: string
  sql: ${TABLE}.web_event_privacy_info_ads_storage ;;
  description: "Indicates whether the visitor consented to ads storage (advertising cookies)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_privacy_info_analytics_storage {
  type: string
  sql: ${TABLE}.web_event_privacy_info_analytics_storage ;;
  description: "Indicates whether the visitor consented to analytics storage (analytics cookies)"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_privacy_info_uses_transient_token {
  type: string
  sql: ${TABLE}.web_event_privacy_info_uses_transient_token ;;
  description: "Indicates whether the visitor denied analytics storage (analytics cookies) and the developer has enabled measurement without cookies based on transient tokens in server data"
  drill_fields: [wh_marketing__web_events_fact_set*]
}
dimension: web_event_ecommerce_total_item_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_total_item_quantity ;;
  description: "For ecommerce events: The total number of items in this event (based on the sum of web_event_items_fact.web_event_item_quantity)"
}
dimension: web_event_ecommerce_unique_items {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_unique_items ;;
  description: "For ecommerce events: The number of unique items in this event (based on the unique combinations of item_id, item_name and item_brand (from web_event_items_fact))"
}
dimension: web_event_ecommerce_purchase_revenue_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_purchase_revenue_in_usd ;;
  description: "For ecommerce purchase events: The purchase revenue of this event, represented in US Dollars (where the revenue is calculated as the price * quantity)"
}
dimension: web_event_ecommerce_purchase_revenue {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_purchase_revenue ;;
  description: "For ecommerce purchase events: The purchase revenue of this event, represented in local currency (where the revenue is calculated as the price * quantity)"
}
dimension: web_event_ecommerce_refund_value_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_refund_value_in_usd ;;
  description: "For ecommerce refund events: The refund amount of this event, represented in US Dollars (where the refund amount is calculated as the price * quantity)"
}
dimension: web_event_ecommerce_refund_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_refund_value ;;
  description: "For ecommerce refund events: The refund amount of this event, represented in local currency (where the refund amount is calculated as the price * quantity)"
}
dimension: web_event_ecommerce_shipping_value_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_shipping_value_in_usd ;;
  description: "For ecommerce events: The shipping cost of this event, represented in US Dollars (where we have repurposed the 'shipping info' to cover our 'billing info')"
}
dimension: web_event_ecommerce_shipping_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_shipping_value ;;
  description: "For ecommerce events: The shipping cost of this event, represented in local currency (where we have repurposed the 'shipping info' to cover our 'billing info')"
}
dimension: web_event_ecommerce_tax_value_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_tax_value_in_usd ;;
  description: "For ecommerce events: The tax value in this event, represented in US Dollars"
}
dimension: web_event_ecommerce_tax_value {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ecommerce_tax_value ;;
  description: "For ecommerce events: The tax value in this event, represented in local currency"
}
dimension: web_event_value_in_usd {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_value_in_usd ;;
  description: "The currency-converted value (in US Dollars) of the event's value parameter"
}
dimension: web_event_entrances {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_entrances ;;
  description: "A data value of 1 in this column indicates that the event is for an entrance to the website"
}
dimension: web_event_device_time_zone_offset_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_device_time_zone_offset_seconds ;;
  description: "Device's offset from the GMT time zone in seconds"
}
dimension: web_event_ga_engaged_event {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_ga_engaged_event ;;
  description: "A data value of 'true' in this column indicates that the event caused Google Analytics (GA) to count the session as an 'engaged session', according to GA's own definition of 'engagement', namely: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
}
dimension: web_event_was_visitor_natural_key_null {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_was_visitor_natural_key_null ;;
  description: "Flag to identify if the original value for the visitor natural key was null in the source data, and subsequently populated with a surrogate key"
}
dimension: web_event_was_session_natural_key_null {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_event_was_session_natural_key_null ;;
  description: "Flag to identify if the original value for the session natural key was null in the source data, and subsequently populated with a surrogate key"
}
dimension_group: web_event_visitor_ga_first_touch_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.web_event_visitor_ga_first_touch_ts ;;
  description: "The time at which the user first opened the app or visited the site as record by GA"
}
dimension_group: web_event_dt {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.web_event_dt ;;
  description: "The date that the event fired (using UTC time zone)"
}
dimension_group: web_event_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.web_event_ts ;;
  description: "The timestamp that the event fired (using UTC time zone)"
}
dimension_group: web_event_server_timestamp_offset_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.web_event_server_timestamp_offset_ts ;;
  description: "Timestamp offset between collection time and upload time in micro seconds"
}
}
view: wh_marketing__web_sessions_xa {
sql_table_name: wh_marketing__web_sessions_xa ;;
set: wh_marketing__web_sessions_xa_set {
  fields: [
    web_session_compound_key,
    web_session_wh_generated,
    web_session_data_source,
    web_session_website_property,
    web_session_number,
    web_session_ga_engaged_session,
    web_session_total_events,
    web_session_total_ga_engaged_events,
    web_session_total_page_views,
    web_session_total_search_results_page_views,
    web_session_total_vehicle_details_page_views,
    web_session_total_level_2_events,
    web_session_total_level_3_events,
    web_session_total_level_4_events,
    web_session_total_level_2_vdp,
    web_session_total_intents,
    web_session_landing_page_hostname,
    web_session_landing_page_type,
    web_session_landing_page_title,
    web_session_landing_page_referrer,
    web_session_landing_page_referrer_ignore,
    web_session_landing_page_location,
    web_session_landing_page_location_without_query_parameters,
    web_session_exit_page_hostname,
    web_session_exit_page_type,
    web_session_exit_page_location,
    web_session_exit_page_title,
    web_session_exit_page_referrer,
    web_session_exit_page_referrer_ignore,
    web_session_division,
    web_session_first_not_null_division,
    web_session_last_division,
    web_session_brand,
    web_session_first_not_null_brand,
    web_session_last_brand,
    web_session_highest_frequency_brand,
    web_session_intent,
    web_session_first_not_null_intent,
    web_session_first_non_other_intent,
    web_session_last_intent,
    web_session_mf_level,
    web_session_mf_sub_level,
    web_session_start_channel,
    web_session_start_source,
    web_session_start_medium,
    web_session_start_campaign,
    web_session_start_content,
    web_session_start_term,
    web_session_first_channel,
    web_session_first_source,
    web_session_first_medium,
    web_session_first_campaign,
    web_session_first_content,
    web_session_first_term,
    web_session_first_not_null_channel,
    web_session_first_not_null_source,
    web_session_first_not_null_medium,
    web_session_first_not_null_campaign,
    web_session_first_not_null_content,
    web_session_first_not_null_term,
    web_session_last_channel,
    web_session_last_source,
    web_session_last_medium,
    web_session_last_campaign,
    web_session_last_content,
    web_session_last_term,
    web_session_first_not_null_device_category,
    web_session_first_not_null_device_mobile_brand_name,
    web_session_first_not_null_device_mobile_model_name,
    web_session_first_not_null_device_mobile_marketing_name,
    web_session_first_not_null_device_mobile_os_hardware_model,
    web_session_first_not_null_device_operating_system,
    web_session_first_not_null_device_operating_system_version,
    web_session_first_not_null_device_vendor_id,
    web_session_first_not_null_device_advertising_id,
    web_session_first_not_null_device_language,
    web_session_first_not_null_device_time_zone_offset_seconds,
    web_session_first_not_null_device_is_limited_ad_tracking,
    web_session_first_not_null_device_browser,
    web_session_first_not_null_device_browser_version,
    web_session_first_not_null_device_screen_resolution,
    web_session_first_not_null_geo_continent,
    web_session_first_not_null_geo_sub_continent,
    web_session_first_not_null_geo_country,
    web_session_first_not_null_geo_region,
    web_session_first_not_null_geo_metro,
    web_session_first_not_null_geo_city,
    web_session_first_not_null_privacy_info_ads_storage,
    web_session_first_not_null_privacy_info_analytics_storage,
    web_session_first_not_null_privacy_info_uses_transient_token,
    web_session_duration_seconds,
  ]
}
dimension: web_session_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.web_session_pk ;;
  description: "Primary key of the sessions table (Unique ID for a session)"
}
dimension: web_visitor_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.web_visitor_fk ;;
  description: "Primary key of the visitors table (Unique ID for the visitor who conducted this session)"
}
dimension: web_event_user_natural_key {
  type: string
  sql: ${TABLE}.web_event_user_natural_key ;;
  description: "User ID from the raw GA data. This provides the 'known user ID' from our website, where it is set via the setUserId API via Google Analytics (GA). Customer accounts are not yet active on our websites so this column is not yet in use and will therefore be NULL for all records."
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_event_visitor_natural_key {
  type: string
  sql: ${TABLE}.web_event_visitor_natural_key ;;
  description: "Visitor ID from the raw GA data. This provides the 'GA Client ID' from Google Analytics (GA) which is supplied in the user_pseudo_id column in the raw GA data. This is merely a GA cookie ID, which identifies an anonymous visitor to our website, which is unique to the visitor's device and browser."
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_event_session_natural_key {
  type: string
  sql: ${TABLE}.web_event_session_natural_key ;;
  description: "Session ID from the raw GA data (which comes through as an event parameter called 'ga_session_id')"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_compound_key {
  type: string
  sql: ${TABLE}.web_session_compound_key ;;
  description: "The generated unique identifier of a session within dbt."
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_wh_generated {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_wh_generated ;;
  description: "Flag to identify whether the session has been generated by the warehouse (with data value = 1) as opposed to identifying a session that came through in the GA clickstream data (with data value = 0)"
}
dimension: web_session_data_source {
  type: string
  sql: ${TABLE}.web_session_data_source ;;
  description: "The data source that has provided the session e.g. Data value will be 'ga4' for records coming from Google Analytics (GA)"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_website_property {
  type: string
  sql: ${TABLE}.web_session_website_property ;;
  description: "The website related to the data source"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_number ;;
  description: "Ordinal session count for this visitor e.g. For the visitor's first session, the data value will be 1. For the visitor's second session, the data value will be 2."
}
dimension: web_session_ga_engaged_session {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_ga_engaged_session ;;
  description: "A data value of 'true' in this column indicates that Google Analytics (GA) has deemed the session to be an 'engaged session' (because it has one or more events that were deemed to be an 'engaged event'). Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
}
dimension: web_session_total_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_events ;;
  description: "Total number of events within the session"
}
dimension: web_session_total_ga_engaged_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_ga_engaged_events ;;
  description: "Total number of events within the session that Google Analytics (GA) deemed to be an 'engaged event'. Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
}
dimension: web_session_total_page_views {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_page_views ;;
  description: "Total number of page_view events within the session"
}
dimension: web_session_total_search_results_page_views {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_search_results_page_views ;;
  description: "Total number of search result (SRP) page_view events within the session"
}
dimension: web_session_total_vehicle_details_page_views {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_vehicle_details_page_views ;;
  description: "Total number of vehicle details (VDP) page_view events within the session"
}
dimension: web_session_total_level_2_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_level_2_events ;;
  description: "Total number of events within the session that were 'level 2 engagement events' according to the measurement framework"
}
dimension: web_session_total_level_3_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_level_3_events ;;
  description: "Total number of events within the session that were 'level 3 enquiry events' according to the measurement framework (i.e. number of enquiry form submits)"
}
dimension: web_session_total_level_4_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_level_4_events ;;
  description: "Total number of events within the session that were 'level 4 transaction events' according to the measurement framework (i.e. number of completed transactions)"
}
dimension: web_session_total_level_2_vdp {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_level_2_vdp ;;
  description: "Number of Vehicle Detail Pages (VDPs) visited by the session with at least one 'level 2 engagement event' fired from that VDP i.e. Reflects the number of vehicles that the session 'engaged' with according to the measurement framework"
}
dimension: web_session_total_intents {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_total_intents ;;
  description: "The number of different intents exhibited by the session"
}
dimension: web_session_landing_page_hostname {
  type: string
  sql: ${TABLE}.web_session_landing_page_hostname ;;
  description: "The hostname of the first page_view event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_landing_page_type {
  type: string
  sql: ${TABLE}.web_session_landing_page_type ;;
  description: "The type of the first page_view event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_landing_page_title {
  type: string
  sql: ${TABLE}.web_session_landing_page_title ;;
  description: "The title of the first page_view event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_landing_page_referrer {
  type: string
  sql: ${TABLE}.web_session_landing_page_referrer ;;
  description: "The referrer of the first page_view event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_landing_page_referrer_ignore {
  type: string
  sql: ${TABLE}.web_session_landing_page_referrer_ignore ;;
  description: "The referrer_ignore of the first page_view event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_landing_page_location {
  type: string
  sql: ${TABLE}.web_session_landing_page_location ;;
  description: "The location of the first page_view event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_landing_page_location_without_query_parameters {
  type: string
  sql: ${TABLE}.web_session_landing_page_location_without_query_parameters ;;
  description: "The location of the first page_view event in the session, excluding any query parameters"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_exit_page_hostname {
  type: string
  sql: ${TABLE}.web_session_exit_page_hostname ;;
  description: "The hostname the last page_view event of in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_exit_page_type {
  type: string
  sql: ${TABLE}.web_session_exit_page_type ;;
  description: "The type the last page_view event of in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_exit_page_location {
  type: string
  sql: ${TABLE}.web_session_exit_page_location ;;
  description: "The location the last page_view event of in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_exit_page_title {
  type: string
  sql: ${TABLE}.web_session_exit_page_title ;;
  description: "The title the last page_view event of in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_exit_page_referrer {
  type: string
  sql: ${TABLE}.web_session_exit_page_referrer ;;
  description: "The referrer the last page_view event of in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_exit_page_referrer_ignore {
  type: string
  sql: ${TABLE}.web_session_exit_page_referrer_ignore ;;
  description: "The referrer_ignore the last page_view event of in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_division {
  type: string
  sql: ${TABLE}.web_session_division ;;
  description: "The division of the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_division {
  type: string
  sql: ${TABLE}.web_session_first_not_null_division ;;
  description: "The division on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_division {
  type: string
  sql: ${TABLE}.web_session_last_division ;;
  description: "The division on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_brand {
  type: string
  sql: ${TABLE}.web_session_brand ;;
  description: "The brand of the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_brand {
  type: string
  sql: ${TABLE}.web_session_first_not_null_brand ;;
  description: "The brand on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_brand {
  type: string
  sql: ${TABLE}.web_session_last_brand ;;
  description: "The brand on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_highest_frequency_brand {
  type: string
  sql: ${TABLE}.web_session_highest_frequency_brand ;;
  description: "The most frequent value of brand across all events for the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_intent {
  type: string
  sql: ${TABLE}.web_session_intent ;;
  description: "The intent of the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_intent {
  type: string
  sql: ${TABLE}.web_session_first_not_null_intent ;;
  description: "The first non-null intent in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_non_other_intent {
  type: string
  sql: ${TABLE}.web_session_first_non_other_intent ;;
  description: "The first non-other intent in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_intent {
  type: string
  sql: ${TABLE}.web_session_last_intent ;;
  description: "The intent on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_mf_level {
  type: string
  sql: ${TABLE}.web_session_mf_level ;;
  description: "The measurement framework level assigned to the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_mf_sub_level {
  type: string
  sql: ${TABLE}.web_session_mf_sub_level ;;
  description: "The measurement framework sub-level assigned to the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_start_channel {
  type: string
  sql: ${TABLE}.web_session_start_channel ;;
  description: "The channel of the session_start event"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_start_source {
  type: string
  sql: ${TABLE}.web_session_start_source ;;
  description: "The source of the session_start event"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_start_medium {
  type: string
  sql: ${TABLE}.web_session_start_medium ;;
  description: "The medium of the session_start event"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_start_campaign {
  type: string
  sql: ${TABLE}.web_session_start_campaign ;;
  description: "The campaign of the session_start event"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_start_content {
  type: string
  sql: ${TABLE}.web_session_start_content ;;
  description: "The content of the session_start event"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_start_term {
  type: string
  sql: ${TABLE}.web_session_start_term ;;
  description: "The term of the session_start event"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_channel {
  type: string
  sql: ${TABLE}.web_session_first_channel ;;
  description: "The channel on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_source {
  type: string
  sql: ${TABLE}.web_session_first_source ;;
  description: "The source on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_medium {
  type: string
  sql: ${TABLE}.web_session_first_medium ;;
  description: "The medium on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_campaign {
  type: string
  sql: ${TABLE}.web_session_first_campaign ;;
  description: "The campaign on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_content {
  type: string
  sql: ${TABLE}.web_session_first_content ;;
  description: "The content on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_term {
  type: string
  sql: ${TABLE}.web_session_first_term ;;
  description: "The term on the first event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_channel {
  type: string
  sql: ${TABLE}.web_session_first_not_null_channel ;;
  description: "The first non-null channel in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_source {
  type: string
  sql: ${TABLE}.web_session_first_not_null_source ;;
  description: "The first non-null source in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_medium {
  type: string
  sql: ${TABLE}.web_session_first_not_null_medium ;;
  description: "The first non-null medium in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_campaign {
  type: string
  sql: ${TABLE}.web_session_first_not_null_campaign ;;
  description: "The first non-null campaign in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_content {
  type: string
  sql: ${TABLE}.web_session_first_not_null_content ;;
  description: "The first non-null content in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_term {
  type: string
  sql: ${TABLE}.web_session_first_not_null_term ;;
  description: "The first non-null term in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_channel {
  type: string
  sql: ${TABLE}.web_session_last_channel ;;
  description: "The channel on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_source {
  type: string
  sql: ${TABLE}.web_session_last_source ;;
  description: "The source on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_medium {
  type: string
  sql: ${TABLE}.web_session_last_medium ;;
  description: "The medium on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_campaign {
  type: string
  sql: ${TABLE}.web_session_last_campaign ;;
  description: "The campaign on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_content {
  type: string
  sql: ${TABLE}.web_session_last_content ;;
  description: "The content on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_last_term {
  type: string
  sql: ${TABLE}.web_session_last_term ;;
  description: "The term on the last event in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_category {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_category ;;
  description: "The first non-null device_category in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_mobile_brand_name {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_mobile_brand_name ;;
  description: "The first non-null device_mobile_brand_name in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_mobile_model_name {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_mobile_model_name ;;
  description: "The first non-null device_mobile_model_name in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_mobile_marketing_name {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_mobile_marketing_name ;;
  description: "The first non-null device_mobile_marketing_name in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_mobile_os_hardware_model {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_mobile_os_hardware_model ;;
  description: "The first non-null device_mobile_os_hardware_model in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_operating_system {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_operating_system ;;
  description: "The first non-null device_operating_system in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_operating_system_version {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_operating_system_version ;;
  description: "The first non-null device_operating_system_version in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_vendor_id {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_vendor_id ;;
  description: "The first non-null device_vendor_id in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_advertising_id {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_advertising_id ;;
  description: "The first non-null device_advertising_id in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_language {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_language ;;
  description: "The first non-null device_language in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_time_zone_offset_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_first_not_null_device_time_zone_offset_seconds ;;
  description: "The first non-null device_time_zone_offset_seconds in the session"
}
dimension: web_session_first_not_null_device_is_limited_ad_tracking {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_is_limited_ad_tracking ;;
  description: "The first non-null device_is_limited_ad_tracking in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_browser {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_browser ;;
  description: "The first non-null device_browser in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_browser_version {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_browser_version ;;
  description: "The first non-null device_browser_version in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_device_screen_resolution {
  type: string
  sql: ${TABLE}.web_session_first_not_null_device_screen_resolution ;;
  description: "The first non-null device_screen_resolution in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_geo_continent {
  type: string
  sql: ${TABLE}.web_session_first_not_null_geo_continent ;;
  description: "The first non-null continent in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_geo_sub_continent {
  type: string
  sql: ${TABLE}.web_session_first_not_null_geo_sub_continent ;;
  description: "The first non-null sub_continent in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_geo_country {
  type: string
  sql: ${TABLE}.web_session_first_not_null_geo_country ;;
  description: "The first non-null country in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_geo_region {
  type: string
  sql: ${TABLE}.web_session_first_not_null_geo_region ;;
  description: "The first non-null region in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_geo_metro {
  type: string
  sql: ${TABLE}.web_session_first_not_null_geo_metro ;;
  description: "The first non-null metro in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_geo_city {
  type: string
  sql: ${TABLE}.web_session_first_not_null_geo_city ;;
  description: "The first non-null city in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_privacy_info_ads_storage {
  type: string
  sql: ${TABLE}.web_session_first_not_null_privacy_info_ads_storage ;;
  description: "The first non-null ads_storage in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_privacy_info_analytics_storage {
  type: string
  sql: ${TABLE}.web_session_first_not_null_privacy_info_analytics_storage ;;
  description: "The first non-null analytics_storage in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension: web_session_first_not_null_privacy_info_uses_transient_token {
  type: string
  sql: ${TABLE}.web_session_first_not_null_privacy_info_uses_transient_token ;;
  description: "The first non-null uses_transient_token in the session"
  drill_fields: [wh_marketing__web_sessions_xa_set*]
}
dimension_group: web_session_start_timestamp {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.web_session_start_timestamp ;;
  description: "The timestamp of the first event in the session"
}
dimension_group: web_session_end_timestamp {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.web_session_end_timestamp ;;
  description: "The timestamp of the last event in the session"
}
dimension_group: web_session_start_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.web_session_start_date ;;
  description: "The date of the first event in the session - excluding timestamp"
}
dimension: web_session_duration_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_session_duration_seconds ;;
  description: "Number of seconds between the timestamps for the first and last events in the session"
}
}
view: wh_marketing__web_visitors_xa {
sql_table_name: wh_marketing__web_visitors_xa ;;
set: wh_marketing__web_visitors_xa_set {
  fields: [
    web_visitor_wh_generated,
    web_visitor_data_source,
    web_visitor_website_property,
    web_visitor_total_sessions,
    web_visitor_total_events,
    web_visitor_ga_engaged_visitor,
    web_visitor_total_page_views,
    web_visitor_total_search_results_page_views,
    web_visitor_total_vehicle_details_page_views,
    web_visitor_total_level_2_events,
    web_visitor_total_level_3_events,
    web_visitor_total_level_4_events,
    web_visitor_total_level_2_vdp,
    web_visitor_first_not_null_intent,
    web_visitor_first_non_other_intent,
    web_visitor_last_not_null_intent,
    web_visitor_intent,
    web_visitor_mf_level,
    web_visitor_first_not_null_channel,
    web_visitor_first_not_null_source,
    web_visitor_first_not_null_medium,
    web_visitor_first_not_null_campaign,
    web_visitor_last_not_null_channel,
    web_visitor_last_not_null_source,
    web_visitor_last_not_null_medium,
    web_visitor_last_not_null_campaign,
  ]
}
dimension: web_visitor_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.web_visitor_pk ;;
  description: "Primary key of the visitors table (surrogate key of web_event_visitor_natural_key)"
}
dimension: web_event_user_natural_key {
  type: string
  sql: ${TABLE}.web_event_user_natural_key ;;
  description: "User ID from the raw GA data. This provides the 'known user ID' from our website, where it is set via the setUserId API via Google Analytics (GA). Customer accounts are not yet active on our websites so this column is not yet in use and will therefore be NULL for all records."
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_event_visitor_natural_key {
  type: string
  sql: ${TABLE}.web_event_visitor_natural_key ;;
  description: "Visitor ID from the raw GA data. This provides the 'GA Client ID' from Google Analytics (GA) which is supplied in the user_pseudo_id column in the raw GA data. This is merely a GA cookie ID, which identifies an anonymous visitor to our website, which is unique to the visitor's device and browser."
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_wh_generated {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_wh_generated ;;
  description: "Flag to identify whether the visitor has been generated by the warehouse (with data value = 1) as opposed to identifying a visitor that came through in the GA clickstream data (with data value = 0)"
}
dimension: web_visitor_data_source {
  type: string
  sql: ${TABLE}.web_visitor_data_source ;;
  description: "The data source that has provided the session e.g. Data value will be 'ga4' for records coming from Google Analytics (GA)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_website_property {
  type: string
  sql: ${TABLE}.web_visitor_website_property ;;
  description: "The website related to the data source"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_total_sessions {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_sessions ;;
  description: "Total number of sessions for the visitor"
}
dimension: web_visitor_total_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_events ;;
  description: "Total number of events (across all sessions) for the visitor"
}
dimension: web_visitor_ga_engaged_visitor {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_ga_engaged_visitor ;;
  description: "A data value of 'true' in this column indicates that Google Analytics (GA) has deemed the visitor to be an 'engaged visitor' (because it has one or more events that were deemed to be an 'engaged event'). Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'."
}
dimension: web_visitor_total_page_views {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_page_views ;;
  description: "Total number of page_view events across all sessions for the visitor"
}
dimension: web_visitor_total_search_results_page_views {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_search_results_page_views ;;
  description: "Total number of search result (SRP) page_view events across all sessions for the visitorfor the visitor"
}
dimension: web_visitor_total_vehicle_details_page_views {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_vehicle_details_page_views ;;
  description: "Total number of vehicle details (VDP) page_view events across all sessions for the visitorsessions for the visitor"
}
dimension: web_visitor_total_level_2_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_level_2_events ;;
  description: "Total number of events across all sessions for the visitor that were 'level 2 engagement events' according to the measurement framework"
}
dimension: web_visitor_total_level_3_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_level_3_events ;;
  description: "Total number of events across all sessions for the visitor that were 'level 3 enquiry events' according to the measurement framework (i.e. number of enquiry form submits)"
}
dimension: web_visitor_total_level_4_events {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_level_4_events ;;
  description: "Total number of events across all sessions for the visitor that were 'level 4 transaction events' according to the measurement framework (i.e. number of completed transactions)"
}
dimension: web_visitor_total_level_2_vdp {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_visitor_total_level_2_vdp ;;
  description: "Number of Vehicle Detail Pages (VDPs) visited by the visitor with at least one 'level 2 engagement event' fired from that VDP i.e. Reflects the number of vehicles that the visitor 'engaged' with according to the measurement framework"
}
dimension_group: web_visitor_first_session_start_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.web_visitor_first_session_start_date ;;
  description: "Date for the visitor’s first session"
}
dimension_group: web_visitor_first_session_start_timestamp {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.web_visitor_first_session_start_timestamp ;;
  description: "Date and time for the visitor’s first session"
}
dimension_group: web_visitor_last_session_start_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.web_visitor_last_session_start_date ;;
  description: "Date for the visitor’s last session"
}
dimension_group: web_visitor_last_session_start_timestamp {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.web_visitor_last_session_start_timestamp ;;
  description: "Date and time for the visitor’s last session"
}
dimension: web_visitor_first_not_null_intent {
  type: string
  sql: ${TABLE}.web_visitor_first_not_null_intent ;;
  description: "The first not-null intent for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_first_non_other_intent {
  type: string
  sql: ${TABLE}.web_visitor_first_non_other_intent ;;
  description: "The first non-other intent for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_last_not_null_intent {
  type: string
  sql: ${TABLE}.web_visitor_last_not_null_intent ;;
  description: "The last intent for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_intent {
  type: string
  sql: ${TABLE}.web_visitor_intent ;;
  description: "The ‘best’ and ‘highest’ intent for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_mf_level {
  type: string
  sql: ${TABLE}.web_visitor_mf_level ;;
  description: "The measurement framework level reached by the visitor for their 'best' intent (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_first_not_null_channel {
  type: string
  sql: ${TABLE}.web_visitor_first_not_null_channel ;;
  description: "The first not-null channel for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_first_not_null_source {
  type: string
  sql: ${TABLE}.web_visitor_first_not_null_source ;;
  description: "The first not-null source for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_first_not_null_medium {
  type: string
  sql: ${TABLE}.web_visitor_first_not_null_medium ;;
  description: "The first not-null medium for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_first_not_null_campaign {
  type: string
  sql: ${TABLE}.web_visitor_first_not_null_campaign ;;
  description: "The first not-null campaign for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_last_not_null_channel {
  type: string
  sql: ${TABLE}.web_visitor_last_not_null_channel ;;
  description: "The last not-null channel for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_last_not_null_source {
  type: string
  sql: ${TABLE}.web_visitor_last_not_null_source ;;
  description: "The last not-null source for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_last_not_null_medium {
  type: string
  sql: ${TABLE}.web_visitor_last_not_null_medium ;;
  description: "The last not-null medium for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
dimension: web_visitor_last_not_null_campaign {
  type: string
  sql: ${TABLE}.web_visitor_last_not_null_campaign ;;
  description: "The last not-null campaign for the visitor (across all of their sessions)"
  drill_fields: [wh_marketing__web_visitors_xa_set*]
}
}

<!--  ************************************************ common model fields ************************************************ -->

{% docs web_visitor_natural_key %}
Visitor ID from the raw GA data. This provides the 'GA Client ID' from Google Analytics (GA) which is supplied in the user_pseudo_id column in the raw GA data. This is merely a GA cookie ID, which identifies an anonymous visitor to our website, which is unique to the visitor's device and browser.
{% enddocs %}

{% docs web_user_natural_key %}
The user ID set via the setUserId API for known website users
{% enddocs %}

{% docs web_event_fk %}
Primary key of the events table that the record relates to (Unique ID for the event that this record relates to)
{% enddocs %}


<!--  ************************************************ marketing__web_events ************************************************ -->

{% docs web_event_pk %}
Primary key of the events table (Unique ID for an event)
{% enddocs %}

{% docs web_session_fk %}
Primary key of the sessions table that the event relates to (Unique ID for the session that fired this event)
{% enddocs %}

{% docs web_event_compound_key %}
Compound key used to derive the primary key for the events. Derived from the session ID + web_event_sequence_number
{% enddocs %}

{% docs web_event_sequence_number %}
Sequence number for the event within its session i.e. A data value of 1 identifies the first event in a session
{% enddocs %}

{% docs web_event_bundle_sequence_natural_key %}
Sequential ID of the bundle in which these events were uploaded by Google Analytics. Provided as 'event_bundle_sequence_id' in the raw GA data.
{% enddocs %}

{% docs web_event_visitor_natural_key %}
Visitor ID from the raw GA data. This provides the 'GA Client ID' from Google Analytics (GA) which is supplied in the user_pseudo_id column in the raw GA data. This is merely a GA cookie ID, which identifies an anonymous visitor to our website, which is unique to the visitor's device and browser.
{% enddocs %}

{% docs web_event_user_natural_key %}
User ID from the raw GA data. This provides the 'known user ID' from our website, where it is set via the setUserId API via Google Analytics (GA). Customer accounts are not yet active on our websites so this column is not yet in use and will therefore be NULL for all records.
{% enddocs %}

{% docs web_event_session_compound_key %}
A concatenation of the raw GA session ID and user pseudo ID from the raw GA data; The ga_session_id supplied in the event parameter in the raw GA data.
{% enddocs %}

{% docs web_event_vehicle_deal_natural_key %}
Sytner vehicle deal ID; a unique ID for the vehicle and this instance of attempting to sell it i.e. If we have had the same physical vehicle on our books to sell more than once, then there will be more than one vehicle deal ID for the same physical vehicle; there will be one vehicle deal ID for each time we have had it on our books to sell
{% enddocs %}

{% docs web_event_ecommerce_transaction_natural_key %}
Raw ecommerce ID from Google Analytics (GA)
{% enddocs %}

{% docs web_event_data_source %}
The data source that has provided the event e.g. Data value will be 'ga4' for records coming from Google Analytics (GA)
{% enddocs %}

{% docs web_event_website_property %}
The website related to the data source
{% enddocs %}

{% docs web_event_table_suffix %}
The BigQuery table suffix
{% enddocs %}

{% docs web_event_session_sequence_number %}
A GA4 event parameter associated with each event that identifies the ordinal position of a session as it relates to a visitor e.g. A data value of 1 indicates that this is the first session for this visitor
{% enddocs %}

{% docs web_event_name %}
The name of the event
{% enddocs %}

{% docs web_event_page_type %}
Website page type e.g. vdp (for a vehicle details page), srp (for a search results page)
{% enddocs %}

{% docs web_event_page_location %}
Website page URL
{% enddocs %}

{% docs web_event_page_title %}
Website page title
{% enddocs %}

{% docs web_event_page_referrer %}
The URL of the previously loaded website page
{% enddocs %}

{% docs web_event_page_referrer_ignore %}
A data value of 'true' in this column indicates that the web_event_page_referrer should be ignored due to it being an invalid referrer
{% enddocs %}

{% docs web_event_entrances %}
A data value of 1 in this column indicates that the event is for an entrance to the website
{% enddocs %}

{% docs web_event_link_text %}
For the click, click_button, click_link events; this column holds the text for the link that was clicked, as it appeared on the website front-end. For click_image events; this column holds the alt-text for the image (from the image meta data)
{% enddocs %}

{% docs web_event_link_domain %}
Domain name of the destination URL for a click event or file download event
{% enddocs %}

{% docs web_event_link_url %}
Full destination URL for a click event or file download event
{% enddocs %}

{% docs web_event_channel %}
Channel of the traffic source attributed to the event e.g. direct, email, referral, display, paid search
{% enddocs %}

{% docs web_event_source %}
Source of the traffic source attributed to the event e.g. google, facebook, autotrader, (direct)
{% enddocs %}

{% docs web_event_medium %}
Medium of the traffic source attributed to the event e.g. organic, cpc, partner, social
{% enddocs %}

{% docs web_event_campaign %}
Campaign name of the traffic source attributed to the event
{% enddocs %}

{% docs web_event_content %}
Ad content of the traffic source attributed to the event (which can be set via the utm_content URL parameter)
{% enddocs %}

{% docs web_event_term %}
Keyword term of the traffic source attributed to the event (which is usually set when the medium of the traffic source is 'organic' or 'cpc'). This can be set via the utm_term URL parameter
{% enddocs %}

{% docs web_event_visitor_first_campaign %}
Campaign name of the traffic source that first acquired the visitor, according to the raw GA data
{% enddocs %}

{% docs web_event_visitor_first_medium %}
Medium of the traffic source that first acquired the visitor, according to the raw GA data e.g. organic, cpc, partner, social
{% enddocs %}

{% docs web_event_visitor_first_source %}
Source of the traffic source that first acquired the visitor, according to the raw GA data e.g. google, facebook, autotrader, (direct)
{% enddocs %}

{% docs web_event_division %}
Division attributed to the event (derived from the web_event_brand)
{% enddocs %}

{% docs web_event_brand %}
Brand attributed to the event (as supplied in the raw GA data in the 'brand' or 'item_brand' event parameters)
{% enddocs %}

{% docs web_event_intent %}
Intent attributed to the event (as supplied in the raw GA data in the 'intent' event parameter)
{% enddocs %}

{% docs web_event_mf_level %}
Measurement framework level attributed to the event (as supplied in the raw GA data in the 'mf' event parameter, or derived from the event name)
{% enddocs %}

{% docs web_event_mf_sub_level %}
Measurement framework sub-level attributed to the event (as derived from the web_event_intent, event_name and web_event_page_type)
{% enddocs %}

{% docs web_event_device_category %}
Device category e.g. mobile, tablet, desktop
{% enddocs %}

{% docs web_event_device_mobile_brand_name %}
Device brand name (for a mobile device)
{% enddocs %}

{% docs web_event_device_mobile_model_name %}
Device model name (for a mobile device)
{% enddocs %}

{% docs web_event_device_mobile_marketing_name %}
Device marketing name (for a mobile device)
{% enddocs %}

{% docs web_event_device_mobile_os_hardware_model %}
Device model information retrieved directly from the operating system (for a mobile device)
{% enddocs %}

{% docs web_event_device_operating_system %}
Operating system of the device
{% enddocs %}

{% docs web_event_device_operating_system_version %}
Operating system version of the device
{% enddocs %}

{% docs web_event_device_vendor_id %}
IDFV (only present if the IDFA is not collected in the web_event_device_advertising_id column)
{% enddocs %}

{% docs web_event_device_advertising_id %}
Advertising ID for the device (IDFA)
{% enddocs %}

{% docs web_event_device_language %}
Language set in the device's operating system
{% enddocs %}

{% docs web_event_device_is_limited_ad_tracking %}
The 'Limit Ad Tracking' setting for the device. On iOS14+, this returns 'false' if the IDFA is non-zero (in the web_event_device_advertising_id column)
{% enddocs %}

{% docs web_event_device_browser %}
Browser used by the visitor to browse the website
{% enddocs %}

{% docs web_event_device_browser_version %}
Version of the browser used by the visitor to browse the website
{% enddocs %}

{% docs web_event_device_screen_resolution %}
Device screen resolution
{% enddocs %}

{% docs web_event_page_hostname %}
Website page hostname e.g. sytner.co.uk
{% enddocs %}

{% docs web_event_geo_continent %}
Continent from which the event was reported, based on the visitor's IP address
{% enddocs %}

{% docs web_event_geo_sub_continent %}
Sub-continent from which the event was reported, based on the visitor's IP address
{% enddocs %}

{% docs web_event_geo_country %}
Country from which the event was reported, based on the visitor's IP address
{% enddocs %}

{% docs web_event_geo_region %}
Region from which the event was reported, based on the visitor's IP address
{% enddocs %}

{% docs web_event_geo_metro %}
Metro from which the event was reported, based on the visitor's IP address
{% enddocs %}

{% docs web_event_geo_city %}
City from which the event was reported, based on the visitor's IP address
{% enddocs %}

{% docs web_event_cms_block_position %}
CMS taxonomy parameter: block position
{% enddocs %}

{% docs web_event_cms_slice_name %}
CMS taxonomy parameter: slice name
{% enddocs %}

{% docs web_event_cms_slice_position %}
CMS taxonomy parameter: slice position
{% enddocs %}

{% docs web_event_cms_component_name %}
CMS taxonomy parameter: component name
{% enddocs %}

{% docs web_event_cms_component_position %}
CMS taxonomy parameter: component position
{% enddocs %}

{% docs web_event_cms_component_title %}
CMS taxonomy parameter: component title
{% enddocs %}

{% docs web_event_cms_card_name %}
CMS taxonomy parameter: card name
{% enddocs %}

{% docs web_event_cms_card_position %}
CMS taxonomy parameter: card position
{% enddocs %}

{% docs web_event_cms_card_title %}
CMS taxonomy parameter: card title
{% enddocs %}

{% docs web_event_cms_clickable_element_name %}
CMS taxonomy parameter: clickable element name
{% enddocs %}

{% docs web_event_cms_clickable_element_position %}
CMS taxonomy parameter: clickable element position
{% enddocs %}

{% docs web_event_cms_clickable_element_title %}
CMS taxonomy parameter: clickable element title
{% enddocs %}

{% docs web_event_enquiry_template %}
For events relating to enquiry forms: Name of the enquiry form template used
{% enddocs %}

{% docs web_event_enquiry_topic %}
For events relating to enquiry forms: Enquiry topic
{% enddocs %}

{% docs web_event_enquiry_category %}
For events relating to enquiry forms: Enquiry category
{% enddocs %}

{% docs web_event_enquiry_sub_category %}
For events relating to enquiry forms: Enquiry sub-category
{% enddocs %}

{% docs web_event_error_type %}
For events relating to errors: Error type
{% enddocs %}

{% docs web_event_error_details %}
For events relating to errors: Details of the error
{% enddocs %}

{% docs web_event_purchase_type %}
For purchase events: Type of purchase transaction
{% enddocs %}

{% docs web_event_content_type %}
For select_content events: Type of content selected
{% enddocs %}

{% docs web_event_search_type %}
For search-related events: Search type
{% enddocs %}

{% docs web_event_search_term %}
For search-related events: Search term
{% enddocs %}

{% docs web_event_debug_mode %}
A data value of 1 in this column indicates that the event came from a device that is running in debug mode (using the 'GA debug' chrome extension)
{% enddocs %}

{% docs web_event_outbound_link_click %}
A data value of 'true' in this column indicates that the event was for a click event, which took the visitor away from the current domain (and redirected them to an external domain i.e. took them to an external website)
{% enddocs %}

{% docs web_event_ga_engaged_event %}
A data value of 'true' in this column indicates that the event caused Google Analytics (GA) to count the session as an 'engaged session', according to GA's own definition of 'engagement', namely: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'.
{% enddocs %}

{% docs web_event_privacy_info_ads_storage %}
Indicates whether the visitor consented to ads storage (advertising cookies)
{% enddocs %}

{% docs web_event_privacy_info_analytics_storage %}
Indicates whether the visitor consented to analytics storage (analytics cookies)
{% enddocs %}

{% docs web_event_privacy_info_uses_transient_token %}
Indicates whether the visitor denied analytics storage (analytics cookies) and the developer has enabled measurement without cookies based on transient tokens in server data
{% enddocs %}

{% docs web_event_ecommerce_total_item_quantity %}
For ecommerce events: The total number of items in this event (based on the sum of web_event_items_fact.web_event_item_quantity)
{% enddocs %}

{% docs web_event_ecommerce_unique_items %}
For ecommerce events: The number of unique items in this event (based on the unique combinations of item_id, item_name and item_brand (from web_event_items_fact))
{% enddocs %}

{% docs web_event_value_in_usd %}
The currency-converted value (in US Dollars) of the event's value parameter
{% enddocs %}

{% docs web_event_ecommerce_purchase_revenue_in_usd %}
For ecommerce purchase events: The purchase revenue of this event, represented in US Dollars (where the revenue is calculated as the price * quantity)
{% enddocs %}

{% docs web_event_ecommerce_purchase_revenue %}
For ecommerce purchase events: The purchase revenue of this event, represented in local currency (where the revenue is calculated as the price * quantity)
{% enddocs %}

{% docs web_event_ecommerce_refund_value_in_usd %}
For ecommerce refund events: The refund amount of this event, represented in US Dollars (where the refund amount is calculated as the price * quantity)
{% enddocs %}

{% docs web_event_ecommerce_refund_value %}
For ecommerce refund events: The refund amount of this event, represented in local currency (where the refund amount is calculated as the price * quantity)
{% enddocs %}

{% docs web_event_ecommerce_shipping_value_in_usd %}
For ecommerce events: The shipping cost of this event, represented in US Dollars (where we have repurposed the 'shipping info' to cover our 'billing info')
{% enddocs %}

{% docs web_event_ecommerce_shipping_value %}
For ecommerce events: The shipping cost of this event, represented in local currency (where we have repurposed the 'shipping info' to cover our 'billing info')
{% enddocs %}

{% docs web_event_ecommerce_tax_value_in_usd %}
For ecommerce events: The tax value in this event, represented in US Dollars
{% enddocs %}

{% docs web_event_ecommerce_tax_value %}
For ecommerce events: The tax value in this event, represented in local currency
{% enddocs %}

{% docs web_event_device_time_zone_offset_seconds %}
Device's offset from the GMT time zone in seconds
{% enddocs %}

{% docs web_event_server_timestamp_offset_ts %}
Timestamp offset between collection time and upload time in micro seconds
{% enddocs %}

{% docs web_event_dt %}
The date that the event fired (using UTC time zone)
{% enddocs %}

{% docs web_event_ts %}
The timestamp that the event fired (using UTC time zone)
{% enddocs %}

<!--  ************************************************ marketing__web_event_visitor_properties ************************************************ -->

{% docs web_event_visitor_property_pk %} 
Primary key of the event-visitor-property table (Unique ID for an event-visitor property)
{% enddocs %}

{% docs web_event_visitor_property_compound_key %} 
Natural key of the event-visitor-property table (Event-visitor-property ID from the raw data). Compound of session ID + event row number + visitor property key
{% enddocs %}

{% docs web_event_visitor_property_key %} 
The name of the visitor-property
{% enddocs %}

{% docs web_event_visitor_property_string_value %} 
The string value of the visitor-property, if one exists
{% enddocs %}

{% docs web_event_visitor_property_int_value %} 
The integer value of the visitor-property, if one exists
{% enddocs %}

{% docs web_event_visitor_property_float_value %} 
The float value of the visitor-property, if one exists
{% enddocs %}

{% docs web_event_visitor_property_double_value %} 
The double value of the visitor-property, if one exists
{% enddocs %}


<!--  ************************************************ marketing__web_event_parameters ************************************************ -->

{% docs web_event_parameter_pk %} 
Primary key of the event parameters table (Unique ID for an event parameter)
{% enddocs %}

{% docs web_event_parameter_compound_key %} 
Natural key of the event parameters table (event parameter ID from the raw data). Compound of session ID + event row number + event parameters key
{% enddocs %}

{% docs web_event_parameter_key %} 
The name of the event parameter
{% enddocs %}

{% docs web_event_parameter_string_value %} 
The string value of the event parameter, if one exists
{% enddocs %}

{% docs web_event_parameter_int_value %} 
The integer value of the event parameter, if one exists
{% enddocs %}

{% docs web_event_parameter_float_value %} 
The float value of the event parameter, if one exists
{% enddocs %}

{% docs web_event_parameter_double_value %} 
The double value of the event parameter, if one exists
{% enddocs %}


<!--  ************************************************ marketing__web_event_items ************************************************ -->

<!--  !!! Pre-wh stage columns !!! -->

{% docs web_event_natural_key %}
One unique web event per row (Natural)
{% enddocs %}

<!--  !!! Main !!! -->

{% docs web_event_item_pk %}
Primary key of the event-items table (Unique ID for an event-item)
{% enddocs %}

{% docs web_event_item_natural_key %}
Natural key of the event-items table (Event-item ID from the raw data) Supplied as the 'item_id' in the raw GA events data
{% enddocs %}

{% docs web_event_item_location_natural_key %}
Natural key for the event-item's location (Event-item's location ID from the raw data) Supplied as the 'location_id' in the raw GA events data
{% enddocs %}

{% docs web_event_item_list_natural_key %}
Natural key for the event-item's list (Event-item's list ID from the raw data) Supplied as the 'item_list_id' in the raw GA events data
{% enddocs %}

{% docs web_event_item_promotion_natural_key %}
Natural key for the event-item's promotion (Event-item's promotion ID from the raw data) Supplied as the 'promotion_id' in the raw GA events data
{% enddocs %}

{% docs web_event_item_name %}
Name of the event-item (High-level vehicle description as displayed in the search listing or the VDP)
{% enddocs %}

{% docs web_event_item_brand %}
Brand of the event-item (Brand of the vehicle)
{% enddocs %}

{% docs web_event_item_body_type %}
Body type of the event-item (Vehicle body type e.g. coupe, hatchback) Supplied as the 'item_variant' in the raw GA events data
{% enddocs %}

{% docs web_event_item_classification_type %}
Classification type of the event-item (Vehicle classification type e.g. new, used) Supplied as the 'item_category' in the raw GA events data
{% enddocs %}

{% docs web_event_item_range %}
Range of the event-item (Vehicle range e.g. A3) Supplied as the 'item_category2' in the raw GA events data
{% enddocs %}

{% docs web_event_item_model %}
Model of the event-item (Vehicle model e.g. Sportback) Supplied as the 'item_category3' in the raw GA events data
{% enddocs %}

{% docs web_event_item_derivative %}
Derivative of the event-item (Vehicle derivative e.g. Vorsprung) Supplied as the 'item_category4' in the raw GA events data
{% enddocs %}

{% docs web_event_item_trim %}
Trim/Specification of the event-item (Vehicle trim / specification e.g. Comfort and Soundpack) Supplied as the 'item_category5' in the raw GA events data
{% enddocs %}

{% docs web_event_item_price_in_usd %}
The price of the event-item in US Dollars (Vehicle price in USD)
{% enddocs %}

{% docs web_event_item_price %}
The price of the event-item in local currency (Vehicle price in local currency = GBP)
{% enddocs %}

{% docs web_event_item_quantity %}
The number of units for this event-item included in this ecommerce event (should always be 1 in our context)
{% enddocs %}

{% docs web_event_item_revenue_in_usd %}
The revenue of the event-item in US Dollars, calculated as item_price_in_usd * item_quantity (Vehicle revenue in USD) This is only populated for purchase events
{% enddocs %}

{% docs web_event_item_revenue %}
The revenue of the event-item in local currency, calculated as item_price * item_quantity (Vehicle revenue in local currency = GBP) This is only populated for purchase events
{% enddocs %}

{% docs web_event_item_refund_in_usd %}
The refund value of the event-item in US Dollars, calculated as item_price_in_usd * item_quantity (Vehicle revenue in USD) This is only populated for refund events
{% enddocs %}

{% docs web_event_item_refund %}
The refund value of the event-item in local currency, calculated as item_price * item_quantity (Vehicle revenue in local currency = GBP) This is only populated for refund events
{% enddocs %}

{% docs web_event_item_coupon %}
Coupon code applied to this event-item
{% enddocs %}

{% docs web_event_item_division %}
Division of the event-item (Vehicle division e.g. JLR, Specialist) Supplied as the 'affiliation' in the raw GA events data
{% enddocs %}

{% docs web_event_item_list_name %}
Name of the list in which the event-item was presented to the website visitor
{% enddocs %}

{% docs web_event_item_list_index %}
Position of the event-item in a list
{% enddocs %}

{% docs web_event_item_promotion_name %}
Name of the promotion associated to this event-item
{% enddocs %}

{% docs web_event_item_creative_name %}
Name of a creative used in a promotional spot for this event-item
{% enddocs %}

{% docs web_event_item_creative_slot %}
Name of a creative slot for this event-item
{% enddocs %}


<!--  ************************************************ marketing__web_sessions ************************************************ -->

{% docs web_session_pk %}
Primary key of the sessions table (Unique ID for a session)
{% enddocs %}

{% docs web_visitor_fk %}
Primary key of the visitors table (Unique ID for the visitor who conducted this session)
{% enddocs %}

{% docs web_session_compound_key %}
The generated unique identifier of a session within dbt.
{% enddocs %}

{% docs web_session_data_source %}
The data source that has provided the session e.g. Data value will be 'ga4' for records coming from Google Analytics (GA)
{% enddocs %}

{% docs web_session_website_property %}
The website related to the data source
{% enddocs %}

{% docs web_session_table_suffix %}
The BigQuery table suffix
{% enddocs %}

{% docs web_session_number %}
Ordinal session count for this visitor e.g. For the visitor's first session, the data value will be 1. For the visitor's second session, the data value will be 2.
{% enddocs %}

{% docs web_session_ga_engaged_session %}
A data value of 'true' in this column indicates that Google Analytics (GA) has deemed the session to be an 'engaged session' (because it has one or more events that were deemed to be an 'engaged event'). Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'.
{% enddocs %}

{% docs web_session_total_events %}
Total number of events within the session
{% enddocs %}

{% docs web_session_total_ga_engaged_events %}
Total number of events within the session that Google Analytics (GA) deemed to be an 'engaged event'. Where GA's definition of 'engagement' is as follows: The session lasted longer than 10 seconds, had a conversion event, or had 2 or more screen views or page views. Note: GA's definition of an 'engaged session' is different to our definition of an 'engaged session'.
{% enddocs %}

{% docs web_session_total_page_views %}
Total number of page_view events within the session
{% enddocs %}

{% docs web_session_total_search_results_page_views %}
Total number of search result (SRP) page_view events within the session
{% enddocs %}

{% docs web_session_total_vehicle_details_page_views %}
Total number of vehicle details (VDP) page_view events within the session
{% enddocs %}

{% docs web_session_total_level_2_events %}
Total number of events within the session that were 'level 2 engagement events' according to the measurement framework
{% enddocs %}

{% docs web_session_total_level_3_events %}
Total number of events within the session that were 'level 3 enquiry events' according to the measurement framework (i.e. number of enquiry form submits)
{% enddocs %}

{% docs web_session_total_level_4_events %}
Total number of events within the session that were 'level 4 enquiry events' according to the measurement framework (i.e. number of enquiry form submits)
{% enddocs %}

{% docs web_session_total_level_2_vdp %}
Number of Vehicle Detail Pages (VDPs) visited by the session with at least one 'level 2 engagement event' fired from that VDP i.e. Reflects the number of vehicles that the session 'engaged' with according to the measurement framework
{% enddocs %}

{% docs web_session_total_intents %}
The number of different intents exhibited by the session
{% enddocs %}

{% docs web_session_landing_page_hostname %}
The hostname of the first page_view event in the session
{% enddocs %}

{% docs web_session_landing_page_type %}
The type of the first page_view event in the session
{% enddocs %}

{% docs web_session_landing_page_location %}
The location of the first page_view event in the session
{% enddocs %}

{% docs web_session_landing_page_title %}
The title of the first page_view event in the session
{% enddocs %}

{% docs web_session_landing_page_referrer %}
The referrer of the first page_view event in the session
{% enddocs %}

{% docs web_session_landing_page_referrer_ignore %}
The referrer_ignore of the first page_view event in the session
{% enddocs %}

{% docs web_session_exit_page_hostname %}
The hostname the last page_view event of in the session
{% enddocs %}

{% docs web_session_exit_page_type %}
The type the last page_view event of in the session
{% enddocs %}

{% docs web_session_exit_page_location %}
The location the last page_view event of in the session
{% enddocs %}

{% docs web_session_exit_page_title %}
The title the last page_view event of in the session
{% enddocs %}

{% docs web_session_exit_page_referrer %}
The referrer the last page_view event of in the session
{% enddocs %}

{% docs web_session_exit_page_referrer_ignore %}
The referrer_ignore the last page_view event of in the session
{% enddocs %}

{% docs web_session_division %}
The division of the session
{% enddocs %}

{% docs web_session_first_not_null_division %}
The division on the first event in the session
{% enddocs %}

{% docs web_session_last_division %}
The division on the last event in the session
{% enddocs %}

{% docs web_session_brand %}
The brand of the session
{% enddocs %}

{% docs web_session_first_not_null_brand %}
The brand on the first event in the session
{% enddocs %}

{% docs web_session_last_brand %}
The brand on the last event in the session
{% enddocs %}

{% docs web_session_highest_frequency_brand %}
The most frequent value of brand across all events for the session
{% enddocs %}

{% docs web_session_intent %}
The intent of the session
{% enddocs %}

{% docs web_session_first_not_null_intent %}
The first non-null intent in the session
{% enddocs %}

{% docs web_session_first_non_other_intent %}
The first non-other intent in the session
{% enddocs %}

{% docs web_session_last_intent %}
The intent on the last event in the session
{% enddocs %}

{% docs web_session_max_intent %}
!Description pending
{% enddocs %}

{% docs web_session_max_non_other_intent %}
!Description pending
{% enddocs %}

{% docs web_session_mf_level %}
!Description pending
{% enddocs %}

{% docs web_session_max_mf_level %}
!Description pending
{% enddocs %}

{% docs web_session_mf_sub_level %}
!Description pending
{% enddocs %}

{% docs web_session_max_mf_sub_level %}
!Description pending
{% enddocs %}

{% docs web_session_start_channel %}
The channel of the session_start event
{% enddocs %}

{% docs web_session_start_source %}
The source of the session_start event
{% enddocs %}

{% docs web_session_start_medium %}
The medium of the session_start event
{% enddocs %}

{% docs web_session_start_campaign %}
The campaign of the session_start event
{% enddocs %}

{% docs web_session_start_content %}
The content of the session_start event
{% enddocs %}

{% docs web_session_start_term %}
The term of the session_start event
{% enddocs %}

{% docs web_session_first_channel %}
The channel on the first event in the session
{% enddocs %}

{% docs web_session_first_source %}
The source on the first event in the session
{% enddocs %}

{% docs web_session_first_medium %}
The medium on the first event in the session
{% enddocs %}

{% docs web_session_first_campaign %}
The campaign on the first event in the session
{% enddocs %}

{% docs web_session_first_content %}
The content on the first event in the session
{% enddocs %}

{% docs web_session_first_term %}
The term on the first event in the session
{% enddocs %}

{% docs web_session_first_not_null_channel %}
The first non-null channel in the session
{% enddocs %}

{% docs web_session_first_not_null_source %}
The first non-null source in the session
{% enddocs %}

{% docs web_session_first_not_null_medium %}
The first non-null medium in the session
{% enddocs %}

{% docs web_session_first_not_null_campaign %}
The first non-null campaign in the session
{% enddocs %}

{% docs web_session_first_not_null_content %}
The first non-null content in the session
{% enddocs %}

{% docs web_session_first_not_null_term %}
The first non-null term in the session
{% enddocs %}

{% docs web_session_last_channel %}
The channel on the last event in the session
{% enddocs %}

{% docs web_session_last_source %}
The source on the last event in the session
{% enddocs %}

{% docs web_session_last_medium %}
The medium on the last event in the session
{% enddocs %}

{% docs web_session_last_campaign %}
The campaign on the last event in the session
{% enddocs %}

{% docs web_session_last_content %}
The content on the last event in the session
{% enddocs %}

{% docs web_session_last_term %}
The term on the last event in the session
{% enddocs %}

{% docs web_session_first_not_null_device_category %}
The first non-null device_category in the session
{% enddocs %}

{% docs web_session_first_not_null_device_mobile_brand_name %}
The first non-null device_mobile_brand_name in the session
{% enddocs %}

{% docs web_session_first_not_null_device_mobile_model_name %}
The first non-null device_mobile_model_name in the session
{% enddocs %}

{% docs web_session_first_not_null_device_mobile_marketing_name %}
The first non-null device_mobile_marketing_name in the session
{% enddocs %}

{% docs web_session_first_not_null_device_mobile_os_hardware_model %}
The first non-null device_mobile_os_hardware_model in the session
{% enddocs %}

{% docs web_session_first_not_null_device_operating_system %}
The first non-null device_operating_system in the session
{% enddocs %}

{% docs web_session_first_not_null_device_operating_system_version %}
The first non-null device_operating_system_version in the session
{% enddocs %}

{% docs web_session_first_not_null_device_vendor_id %}
The first non-null device_vendor_id in the session
{% enddocs %}

{% docs web_session_first_not_null_device_advertising_id %}
The first non-null device_advertising_id in the session
{% enddocs %}

{% docs web_session_first_not_null_device_language %}
The first non-null device_language in the session
{% enddocs %}

{% docs web_session_first_not_null_device_time_zone_offset_seconds %}
The first non-null device_time_zone_offset_seconds in the session
{% enddocs %}

{% docs web_session_first_not_null_device_is_limited_ad_tracking %}
The first non-null device_is_limited_ad_tracking in the session
{% enddocs %}

{% docs web_session_first_not_null_device_browser %}
The first non-null device_browser in the session
{% enddocs %}

{% docs web_session_first_not_null_device_browser_version %}
The first non-null device_browser_version in the session
{% enddocs %}

{% docs web_session_first_not_null_device_screen_resolution %}
The first non-null device_screen_resolution in the session
{% enddocs %}

{% docs web_session_first_not_null_geo_continent %}
The first non-null continent in the session
{% enddocs %}

{% docs web_session_first_not_null_geo_sub_continent %}
The first non-null sub_continent in the session
{% enddocs %}

{% docs web_session_first_not_null_geo_country %}
The first non-null country in the session
{% enddocs %}

{% docs web_session_first_not_null_geo_region %}
The first non-null region in the session
{% enddocs %}

{% docs web_session_first_not_null_geo_metro %}
The first non-null metro in the session
{% enddocs %}

{% docs web_session_first_not_null_geo_city %}
The first non-null city in the session
{% enddocs %}

{% docs web_session_first_not_null_privacy_info_ads_storage %}
The first non-null ads_storage in the session
{% enddocs %}

{% docs web_session_first_not_null_privacy_info_analytics_storage %}
The first non-null analytics_storage in the session
{% enddocs %}

{% docs web_session_first_not_null_privacy_info_uses_transient_token %}
The first non-null uses_transient_token in the session
{% enddocs %}

{% docs web_session_duration_seconds %}
Number of seconds between the timestamps for the first and last events in the session
{% enddocs %}

{% docs web_session_start_date %}
The date of the first event in the session - excluding timestamp
{% enddocs %}

{% docs web_session_start_timestamp %}
The timestamp of the first event in the session
{% enddocs %}

{% docs web_session_end_timestamp %}
The timestamp of the last event in the session
{% enddocs %}
<!--  ************************************************ common model fields ************************************************ -->

 <!-- marketing__web_sessions and marketing__web_events -->

{% docs web_visitor_natural_key %}
The pseudonymous id (e.g., app instance ID) for the user.
{% enddocs %}

{% docs web_user_natural_key %}
The user ID set via the setUserId API for known website users
{% enddocs %}


<!--  ************************************************ marketing__web_events ************************************************ -->

{% docs web_event_pk %}
One unique web event per row.
{% enddocs %}

{% docs web_event_session_fk %}
A foreign key that joins events to wh_marketing__web_sessions_fact
{% enddocs %}

{% docs web_event_compound_key %}
A compound key to derive a primary key for events
{% enddocs %}

{% docs web_event_row_no_per_session %}
The row sequence number attribute to an event within a GA Session ID
{% enddocs %}

{% docs web_event_bundle_sequence_natural_key %}
The sequential ID of the bundle in which these events were uploaded.
{% enddocs %}

{% docs web_event_session_natural_key %}
A GA4 unique session identifier associated with each event that occurs within a session
{% enddocs %}

{% docs web_event_vehicle_deal_natural_key %}
Sytner vehicle deal ID
{% enddocs %}

{% docs web_event_ecommerce_transaction_natural_key %}
Sytner ecommerce ID
{% enddocs %}

{% docs web_event_data_source %}
A field to identify the data source
{% enddocs %}

{% docs web_event_session_number %}
A GA4 parameter associated with each event that occurs within a session that identifies the ordinal position of a session as it relates to a user, e.g. a users 1st of 5th session.
{% enddocs %}

{% docs web_event_name %}
The name of the event
{% enddocs %}

{% docs web_event_page_type %}
Webpage type
{% enddocs %}

{% docs web_event_page_location %}
Webpage location
{% enddocs %}

{% docs web_event_page_title %}
Webpage title
{% enddocs %}

{% docs web_event_page_referrer %}
The URL that someone viewed before the current webpage
{% enddocs %}

{% docs web_event_page_referrer_ignore %}
Webpage event referrer ignore flag
{% enddocs %}

{% docs web_event_entrance %}
The number of times the first or last event in a session occurred on a page or screen.
{% enddocs %}

{% docs web_event_link_text %}
The text displayed with a hyperlink selected on a webpage
{% enddocs %}

{% docs web_event_link_domain %}
The domain associated with a hyperlink selected on a webpage
{% enddocs %}

{% docs web_link_url %}
The weblink url associated with a hyperlink selected on a webpage
{% enddocs %}

{% docs web_event_channel %}
The channel associated with the event
{% enddocs %}

{% docs web_event_source %}
The source associated with the event 
{% enddocs %}

{% docs web_event_medium %}
The medium associated with the event
{% enddocs %}

{% docs web_event_campaign %}
The campaign associated with the event
{% enddocs %}

{% docs web_event_content %}
The content associated with the event
{% enddocs %}

{% docs web_event_term %}
The term associated with the event
{% enddocs %}

{% docs web_event_visitor_first_campaign %}
The first campaign associated with a visitor
{% enddocs %}

{% docs web_event_visitor_first_medium %}
Name of the medium (paid search, organic search, email, etc.) that first acquired the user. This field is not populated in intraday tables.
{% enddocs %}

{% docs web_event_visitor_first_source %}
Name of the network that first acquired the user. This field is not populated in intraday tables.
{% enddocs %}

{% docs web_event_device_category %}
The type of device from which user activity originated. Device categories include 'desktop', 'mobile', and 'tablet'.
{% enddocs %}

{% docs web_event_device_mobile_brand_name %}
The brand name of the mobile device (e.g., Motorola, LG, or Samsung).
{% enddocs %}

{% docs web_event_device_mobile_model_name %}
The device model name (e.g., iPhone 5s or SM-J500M).
{% enddocs %}

{% docs web_event_device_mobile_marketing_name %}
The marketing name used for the mobile device.
{% enddocs %}

{% docs web_event_device_mobile_os_hardware_model %}
The device model information retrieved directly from the operating system.
{% enddocs %}

{% docs web_event_device_operating_system %}
The operating system of the device.
{% enddocs %}

{% docs web_event_device_operating_system_version %}
The OS version.
{% enddocs %}

{% docs web_event_device_vendor_id %}
IDFV (present only if IDFA is not collected).
{% enddocs %}

{% docs web_event_device_advertising_id %}
Advertising ID/IDFA.
{% enddocs %}

{% docs web_event_device_language %}
The OS language.
{% enddocs %}

{% docs web_event_device_is_limited_ad_tracking %}
The device's Limit Ad Tracking setting. On iOS14+, returns false if the IDFA is non-zero.
{% enddocs %}

{% docs web_event_device_browser %}
The browser in which the user viewed content.
{% enddocs %}

{% docs web_event_device_browser_version %}
The version of the browser in which the user viewed content.
{% enddocs %}

{% docs web_event_device_screen_resolution %}
The screen resolution of the device
{% enddocs %}

{% docs web_event_page_hostname %}
The hostname associated with the logged event.
{% enddocs %}

{% docs web_event_geo_continent %}
The continent from which events were reported, based on IP address.
{% enddocs %}

{% docs web_event_geo_sub_continent %}
The subcontinent from which events were reported, based on IP address.
{% enddocs %}

{% docs web_event_geo_country %}
The country from which events were reported, based on IP address.
{% enddocs %}

{% docs web_event_geo_region %}
The region from which events were reported, based on IP address.
{% enddocs %}

{% docs web_event_geo_metro %}
The metro from which events were reported, based on IP address.
{% enddocs %}

{% docs web_event_geo_city %}
The city from which events were reported, based on IP address.
{% enddocs %}

{% docs web_event_cms_block_position %}
CMS block position
{% enddocs %}

{% docs web_event_cms_slice_name %}
CMS slice name
{% enddocs %}

{% docs web_event_cms_slice_position %}
CMS slice position
{% enddocs %}

{% docs web_event_cms_component_name %}
CMS component name
{% enddocs %}

{% docs web_event_cms_component_position %}
CMS component position
{% enddocs %}

{% docs web_event_cms_component_title %}
CMS component title
{% enddocs %}

{% docs web_event_cms_card_name %}
CMS card name
{% enddocs %}

{% docs web_event_cms_card_position %}
CMS position
{% enddocs %}

{% docs web_event_cms_card_title %}
CMS card title
{% enddocs %}

{% docs web_event_cms_clickable_element_name %}
CMS clickable element name
{% enddocs %}

{% docs web_event_cms_clickable_element_position %}
CMS clickable element position
{% enddocs %}

{% docs web_event_cms_clickable_element_title %}
CMS clickable element title
{% enddocs %}

{% docs web_event_enquiry_template %}
Enquiry template
{% enddocs %}

{% docs web_event_enquiry_topic %}
Enquiry topic
{% enddocs %}

{% docs web_event_enquiry_category %}
Enquiry category
{% enddocs %}

{% docs web_event_enquiry_sub_category %}
Enquiry sub category
{% enddocs %}

{% docs web_event_error_type %}
Web event error type
{% enddocs %}

{% docs web_event_error_details %}
Web event error details
{% enddocs %}

{% docs web_event_purchase_type %}
The type of purchase
{% enddocs %}

{% docs web_event_content_type %}
The type of content
{% enddocs %}

{% docs web_event_search_type %}
The type of search
{% enddocs %}

{% docs web_event_search_term %}
The type of search term
{% enddocs %}

{% docs web_event_debug_mode %}
Web event debug mode parameter
{% enddocs %}

{% docs web_event_outbound_link_click %}
Outbound link clicked
{% enddocs %}

{% docs web_event_engaged_session_event %}
A session that has spent 10 seconds or more on the site/app or viewed 2 or more screens/pages or had a conversion event, counted towards engagement rate.
{% enddocs %}

{% docs web_event_privacy_info_ads_storage %}
Whether ad targeting is enabled for a user. Possible values: Yes, No, Unset
{% enddocs %}

{% docs web_event_privacy_info_analytics_storage %}
Whether Analytics storage is enabled for the user. Possible values: Yes, No, Unset
{% enddocs %}

{% docs web_event_privacy_info_uses_transient_token %}
Whether a web user has denied Analytics storage and the developer has enabled measurement without cookies based on transient tokens in server data. Possible values: Yes, No, Unset
{% enddocs %}

{% docs web_event_ecommerce_total_item_quantity %}
Total number of items in this event, which is the sum of items.quantity.
{% enddocs %}

{% docs web_event_ecommerce_unique_items %}
The number of unique items in this event, based on item_id, item_name, and item_brand.
{% enddocs %}

{% docs web_event_value_in_usd %}
The currency-converted value (in USD) of the event's value parameter.
{% enddocs %}

{% docs web_event_ecommerce_purchase_revenue_in_usd %}
Purchase revenue of this event, represented in USD with standard unit. Populated for purchase event only.
{% enddocs %}

{% docs web_event_ecommerce_purchase_revenue %}
Purchase revenue of this event, represented in local currency with standard unit. Populated for purchase event only.
{% enddocs %}

{% docs web_event_ecommerce_refund_value_in_usd %}
The amount of refund in this event, represented in USD with standard unit. Populated for refund event only.
{% enddocs %}

{% docs web_event_ecommerce_refund_value %}
The amount of refund in this event, represented in local currency with standard unit. Populated for refund event only.
{% enddocs %}

{% docs web_event_ecommerce_shipping_value_in_usd %}
The shipping cost in this event, represented in USD with standard unit.
{% enddocs %}

{% docs web_event_ecommerce_shipping_value %}
The shipping cost in this event, represented in local currency.
{% enddocs %}

{% docs web_event_ecommerce_tax_value_in_usd %}
The tax value in this event, represented in USD with standard unit.
{% enddocs %}

{% docs web_event_ecommerce_tax_value %}
The tax value in this event, represented in local currency with standard unit.
{% enddocs %}

{% docs web_event_is_ga_engaged_session %}
A session that has spent 10 seconds or more on the site/app or viewed 2 or more screens/pages or had a conversion event, counted towards engagement rate.
{% enddocs %}

{% docs web_event_server_timestamp_offset_ts %}
Timestamp offset between collection time and upload time.
{% enddocs %}

{% docs web_event_dt %}
The date on which the event was logged
{% enddocs %}

{% docs web_event_ts %}
The timestamp on which the event was logged	
{% enddocs %}


<!--  ************************************************ marketing__web_event_items ************************************************ -->

<!--  !!! Pre-wh stage columns !!! -->

{% docs web_event_natural_key %}
One unique web event per row (Natural)
{% enddocs %}

{% docs web_event_natural_key_index %}
!Description pending
{% enddocs %}

<!--  !!! Main !!! -->

{% docs web_event_item_pk %}
Primary key of the event-items table (Unique ID for an event-item)
{% enddocs %}

{% docs web_event_fk %}
Primary key of the events table that the event-item record relates to (Unique ID for the event that this event-item relates to)
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
The primary key of the sessions table
{% enddocs %}

{% docs web_visitor_fk %}
!Description pending
{% enddocs %}

{% docs web_session_natural_key %}
The session id
{% enddocs %}

{% docs web_session_data_source %}
The source of the events data that the sessions table is derived from
{% enddocs %}

{% docs web_session_number %}
The ga_session_number for the session_start event
{% enddocs %}

{% docs web_session_ga_engaged_session %}
Flag which equals 1 if the session had one instance of either a) an engaged event or b) an engaged session flag in the underlying events data
{% enddocs %}

{% docs web_session_total_events %}
The number of events which make up the sessions
{% enddocs %}

{% docs web_session_total_ga_engaged_events %}
Flag which equals 1 if the session had one instance an engaged event in the underlying events data
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
!Description pending
{% enddocs %}

{% docs web_session_total_level_2_vdp %}
!Description pending
{% enddocs %}

{% docs web_session_total_level_3_events %}
!Description pending
{% enddocs %}

{% docs web_session_total_level_4_events %}
!Description pending
{% enddocs %}

{% docs web_session_total_intents %}
!Description pending
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

{% docs web_session_first_division %}
The division on the first event in the session
{% enddocs %}

{% docs web_session_last_division %}
The division on the last event in the session
{% enddocs %}

{% docs web_session_brand %}
The brand of the session
{% enddocs %}

{% docs web_session_first_brand %}
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
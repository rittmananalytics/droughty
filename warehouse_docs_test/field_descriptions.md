
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

{% docs web_visitor_natural_key %}

The pseudonymous id (e.g., app instance ID) for the user.

{% enddocs %}

{% docs web_user_natural_key %}

The user ID set via the setUserId API for known website users

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

The currency-converted value (in USD) of the event's "value" parameter.

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

{% docs web_event_item_affiliation %}

web_event_item_affiliation

{% enddocs %}

{% docs web_event_item_body_type %}

web_event_item_body_type

{% enddocs %}

{% docs web_event_item_brand %}

web_event_item_brand

{% enddocs %}

<!--  ************************************************ Add a title and next model documentation below ************************************************ -->


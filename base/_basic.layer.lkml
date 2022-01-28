explore: wh_website_event_pages_fct

view_name: {
  ('event_pages_pk', 'string', 'A unique identifier for each page view event'): {}

  ('user_blended_fk', 'string', 'Coalesce of User Customer Natural Key and User Anonymous Natural Key'): {}

  ('user_anonymous_natural_key', 'string', 'A pseudo-unique substitute to identify a website user'): {}

  ('user_customer_natural_key', 'string', 'A unique identifier assigned to recognised users'): {}

  ('segment_identify_natural_key', 'string', 'Segment Identify Call ID'): {}

  ('google_click_natural_key', 'string', 'Google Ads click id (gclid)'): {}

  ('page_title', 'string', 'Webpage title'): {}

  ('page_url_host', 'string', 'Webpage URL host address'): {}

  ('page_url_path', 'string', 'Webpage URL file path'): {}

  ('page_url_query', 'string', 'Webpage URL query'): {}

  ('referrer', 'string', 'Information about how the user was referred to the website'): {}

  ('referrer_host', 'string', 'Referrers host address'): {}

  ('search_params', 'string', 'Search parameters'): {}

  ('utm_source', 'string', 'The source referrer to the webpage'): {}

  ('utm_medium', 'string', 'The traffic channel the visitor to the website originated from'): {}

  ('utm_campaign', 'string', 'Description of any campaign names used to drive visitors to the website'): {}

  ('utm_term', 'string', 'Keyword term the website visitor came from'): {}

  ('utm_content', 'string', 'The utm link clicked by the visitor pointing to the website URL'): {}

  ('user_ip', 'string', 'User IP address'): {}

  ('user_agent', 'string', 'User agent of the device making the request'): {}

  ('device', 'string', 'Derived device description'): {}

  ('device_category', 'string', 'Device category derived from device'): {}

  ('received_at_ts', 'timestamp', 'Time on Segment server clock when call was received'): {}

  ('sent_at_ts', 'timestamp', "The clock time for the client's device when the network request was made to the Segment API"): {}

  ('uuid_loaded_at_ts', 'timestamp', 'Loaded at timestamp'): {}

  ('event_pages_ts', 'timestamp', 'Timestamp when the datapoint occured, corrected for client-device clock skew.'): {}
}
explore: wh_website_event_tracks_fct

view_name: {
  ('event_tracks_pk', 'string', 'A unique identifier for each event'): {}

  ('user_blended_fk', 'string', 'Coalesce of User Customer Natural Key and User Anonymous Natural Key'): {}

  ('user_anonymous_natural_key', 'string', 'A pseudo-unique substitute to identify a website user'): {}

  ('user_customer_natural_key', 'string', 'A unique identifier assigned to recognised users'): {}

  ('segment_identify_natural_key', 'string', 'Segment Identify Call ID'): {}

  ('event_details', 'string', 'Event description'): {}

  ('event_type', 'string', 'Event type'): {}

  ('page_title', 'string', 'Webpage title'): {}

  ('page_url_path', 'string', 'Webpage URL file path'): {}

  ('page_url_host', 'string', 'Webpage URL host address'): {}

  ('referrer_host', 'string', 'Referrers host address'): {}

  ('search_params', 'string', 'Search parameters'): {}

  ('utm_source', 'string', 'The source referrer to the webpage'): {}

  ('utm_medium', 'string', 'The traffic channel the visitor to the website originated from'): {}

  ('utm_campaign', 'string', 'Description of any campaign names used to drive visitors to the website'): {}

  ('utm_term', 'string', 'Keyword term the website visitor came from'): {}

  ('utm_content', 'string', 'The utm link clicked by the visitor pointing to the website URL'): {}

  ('user_ip', 'string', 'User IP address'): {}

  ('device', 'string', 'Derived device description'): {}

  ('device_category', 'string', 'Device category derived from device'): {}

  ('received_at_ts', 'timestamp', 'Time on Segment server clock when call was received'): {}

  ('sent_at_ts', 'timestamp', "The clock time for the client's device when the network request was made to the Segment API."): {}

  ('event_tracks_ts', 'timestamp', 'Timestamp when the datapoint occured, corrected for client-device clock skew.'): {}
}
explore: wh_website_users_dim

view_name: {
  ('user_blended_pk', 'string', 'A unique identifier for website users'): {}

  ('user_customer_natural_key', 'string', 'Unique identifier for users identified by Segment'): {}

  ('is_user_anonymous', 'number', 'flag to identify users not identified by Segment'): {}

  ('user_created_date', 'date', 'Date user created'): {}
}

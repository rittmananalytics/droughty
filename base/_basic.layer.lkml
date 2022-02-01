explore: wh_marketing_website_event_pages_fact
{ hidden: yes }
explore: wh_marketing_website_event_tracks_fact
{ hidden: yes }
explore: wh_marketing_website_users_dim
{ hidden: yes }
view: wh_marketing_website_event_pages_fact {
sql_table_name: wh_marketing_website_event_pages_fact ;;
dimension: event_pages_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.event_pages_pk ;;
  description: "A unique identifier for each page view event"
}
dimension: user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.user_fk ;;
  description: "Coalesce of User Customer Natural Key and User Anonymous Natural Key"
}
dimension: user_anonymous_natural_key {
  type: string
  sql: ${TABLE}.user_anonymous_natural_key ;;
  description: "A pseudo-unique substitute to identify a website user"
}
dimension: user_customer_natural_key {
  type: string
  sql: ${TABLE}.user_customer_natural_key ;;
  description: "A unique identifier assigned to recognised users"
}
dimension: segment_identify_natural_key {
  type: string
  sql: ${TABLE}.segment_identify_natural_key ;;
  description: "Segment Identify Call ID"
}
dimension: google_click_natural_key {
  type: string
  sql: ${TABLE}.google_click_natural_key ;;
  description: "Google Ads click id (gclid)"
}
dimension: page_title {
  type: string
  sql: ${TABLE}.page_title ;;
  description: "Webpage title"
}
dimension: page_url_host {
  type: string
  sql: ${TABLE}.page_url_host ;;
  description: "Webpage URL host address"
}
dimension: page_url_path {
  type: string
  sql: ${TABLE}.page_url_path ;;
  description: "Webpage URL file path"
}
dimension: page_url_query {
  type: string
  sql: ${TABLE}.page_url_query ;;
  description: "Webpage URL query"
}
dimension: referrer {
  type: string
  sql: ${TABLE}.referrer ;;
  description: "Information about how the user was referred to the website"
}
dimension: referrer_host {
  type: string
  sql: ${TABLE}.referrer_host ;;
  description: "Referrers host address"
}
dimension: search_params {
  type: string
  sql: ${TABLE}.search_params ;;
  description: "Search parameters"
}
dimension: utm_source {
  type: string
  sql: ${TABLE}.utm_source ;;
  description: "The source referrer to the webpage"
}
dimension: utm_medium {
  type: string
  sql: ${TABLE}.utm_medium ;;
  description: "The traffic channel the visitor to the website originated from"
}
dimension: utm_campaign {
  type: string
  sql: ${TABLE}.utm_campaign ;;
  description: "Description of any campaign names used to drive visitors to the website"
}
dimension: utm_term {
  type: string
  sql: ${TABLE}.utm_term ;;
  description: "Keyword term the website visitor came from"
}
dimension: utm_content {
  type: string
  sql: ${TABLE}.utm_content ;;
  description: "The utm link clicked by the visitor pointing to the website URL"
}
dimension: user_ip {
  type: string
  sql: ${TABLE}.user_ip ;;
  description: "User IP address"
}
dimension: user_agent {
  type: string
  sql: ${TABLE}.user_agent ;;
  description: "User agent of the device making the request"
}
dimension: device {
  type: string
  sql: ${TABLE}.device ;;
  description: "Derived device description"
}
dimension: device_category {
  type: string
  sql: ${TABLE}.device_category ;;
  description: "Device category derived from device"
}
dimension_group: received_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.received_at_ts ;;
  description: "Time on Segment server clock when call was received"
}
dimension_group: sent_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.sent_at_ts ;;
  description: "The clock time for the client's device when the network request was made to the Segment API"
}
dimension_group: uuid_loaded_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.uuid_loaded_at_ts ;;
  description: "Loaded at timestamp"
}
dimension_group: event_pages_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.event_pages_ts ;;
  description: "Timestamp when the datapoint occured, corrected for client-device clock skew."
}
}
view: wh_marketing_website_event_tracks_fact {
sql_table_name: wh_marketing_website_event_tracks_fact ;;
dimension: event_tracks_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.event_tracks_pk ;;
  description: "A unique identifier for each event"
}
dimension: user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.user_fk ;;
  description: "Coalesce of User Customer Natural Key and User Anonymous Natural Key"
}
dimension: user_anonymous_natural_key {
  type: string
  sql: ${TABLE}.user_anonymous_natural_key ;;
  description: "A pseudo-unique substitute to identify a website user"
}
dimension: user_customer_natural_key {
  type: string
  sql: ${TABLE}.user_customer_natural_key ;;
  description: "A unique identifier assigned to recognised users"
}
dimension: segment_identify_natural_key {
  type: string
  sql: ${TABLE}.segment_identify_natural_key ;;
  description: "Segment Identify Call ID"
}
dimension: event_details {
  type: string
  sql: ${TABLE}.event_details ;;
  description: "Event description"
}
dimension: event_type {
  type: string
  sql: ${TABLE}.event_type ;;
  description: "Event type"
}
dimension: page_title {
  type: string
  sql: ${TABLE}.page_title ;;
  description: "Webpage title"
}
dimension: page_url_path {
  type: string
  sql: ${TABLE}.page_url_path ;;
  description: "Webpage URL file path"
}
dimension: page_url_host {
  type: string
  sql: ${TABLE}.page_url_host ;;
  description: "Webpage URL host address"
}
dimension: referrer_host {
  type: string
  sql: ${TABLE}.referrer_host ;;
  description: "Referrers host address"
}
dimension: search_params {
  type: string
  sql: ${TABLE}.search_params ;;
  description: "Search parameters"
}
dimension: utm_source {
  type: string
  sql: ${TABLE}.utm_source ;;
  description: "The source referrer to the webpage"
}
dimension: utm_medium {
  type: string
  sql: ${TABLE}.utm_medium ;;
  description: "The traffic channel the visitor to the website originated from"
}
dimension: utm_campaign {
  type: string
  sql: ${TABLE}.utm_campaign ;;
  description: "Description of any campaign names used to drive visitors to the website"
}
dimension: utm_term {
  type: string
  sql: ${TABLE}.utm_term ;;
  description: "Keyword term the website visitor came from"
}
dimension: utm_content {
  type: string
  sql: ${TABLE}.utm_content ;;
  description: "The utm link clicked by the visitor pointing to the website URL"
}
dimension: user_ip {
  type: string
  sql: ${TABLE}.user_ip ;;
  description: "User IP address"
}
dimension: device {
  type: string
  sql: ${TABLE}.device ;;
  description: "Derived device description"
}
dimension: device_category {
  type: string
  sql: ${TABLE}.device_category ;;
  description: "Device category derived from device"
}
dimension_group: received_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.received_at_ts ;;
  description: "Time on Segment server clock when call was received"
}
dimension_group: sent_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.sent_at_ts ;;
  description: "The clock time for the client's device when the network request was made to the Segment API."
}
dimension_group: event_tracks_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.event_tracks_ts ;;
  description: "Timestamp when the datapoint occured, corrected for client-device clock skew."
}
}
view: wh_marketing_website_users_dim {
sql_table_name: wh_marketing_website_users_dim ;;
dimension: user_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.user_pk ;;
  description: "A unique identifier for website users"
}
dimension: user_customer_natural_key {
  type: string
  sql: ${TABLE}.user_customer_natural_key ;;
  description: "Unique identifier for users identified by Segment"
}
dimension: is_user_anonymous {
  type: number
  sql: ${TABLE}.is_user_anonymous ;;
  description: "flag to identify users not identified by Segment"
}
dimension_group: user_created_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.user_created_date ;;
  description: "Date user created"
}
}

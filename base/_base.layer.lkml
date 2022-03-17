explore: wh_platform__bordereaux_fact
{ hidden: yes }
explore: wh_platform__brokers_fact
{ hidden: yes }
explore: wh_platform__invoices_fact
{ hidden: yes }
explore: wh_platform__policies_fact
{ hidden: yes }
explore: wh_platform__products_dim
{ hidden: yes }
explore: wh_platform__quotes_fact
{ hidden: yes }
explore: wh_platform__schedules_fact
{ hidden: yes }
explore: wh_platform__vehicles_dim
{ hidden: yes }
explore: wh_platform_brokers_fact
{ hidden: yes }
explore: wh_platform_products_dim
{ hidden: yes }
explore: wh_platform_vehicles_dim
{ hidden: yes }
view: wh_platform__bordereaux_fact {
sql_table_name: wh_platform__bordereaux_fact ;;
dimension: bordereaux_brokerage {
  type: number
  sql: ${TABLE}.bordereaux_brokerage ;;
  description: "not available"
}
dimension_group: bordereaux_created_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.bordereaux_created_at_ts ;;
  description: "not available"
}
dimension: bordereaux_fee {
  type: number
  sql: ${TABLE}.bordereaux_fee ;;
  description: "not available"
}
dimension: bordereaux_gross_discount {
  type: number
  sql: ${TABLE}.bordereaux_gross_discount ;;
  description: "not available"
}
dimension: bordereaux_natural_key {
  type: string
  sql: ${TABLE}.bordereaux_natural_key ;;
  description: "not available"
}
dimension: bordereaux_net {
  type: number
  sql: ${TABLE}.bordereaux_net ;;
  description: "not available"
}
dimension: bordereaux_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.bordereaux_pk ;;
  description: "not available"
}
dimension: bordereaux_tax {
  type: number
  sql: ${TABLE}.bordereaux_tax ;;
  description: "not available"
}
dimension: bordereaux_tax_discount {
  type: number
  sql: ${TABLE}.bordereaux_tax_discount ;;
  description: "not available"
}
dimension: business_type_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.business_type_fk ;;
  description: "not available"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "not available"
}
dimension: schedule_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.schedule_fk ;;
  description: "not available"
}
}
view: wh_platform__brokers_fact {
sql_table_name: wh_platform__brokers_fact ;;
dimension_group: broker_created_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.broker_created_at_ts ;;
  description: "not available"
}
dimension: broker_email_addresses {
  type: VARIANT
  sql: ${TABLE}.broker_email_addresses ;;
  description: "not available"
}
dimension: broker_name {
  type: string
  sql: ${TABLE}.broker_name ;;
  description: "not available"
}
dimension: broker_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.broker_pk ;;
  description: "not available"
}
dimension: broker_remuneration_rate {
  type: number
  sql: ${TABLE}.broker_remuneration_rate ;;
  description: "not available"
}
dimension_group: broker_remuneration_start_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.broker_remuneration_start_ts ;;
  description: "not available"
}
}
view: wh_platform__invoices_fact {
sql_table_name: wh_platform__invoices_fact ;;
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "not available"
}
dimension_group: invoice_closed_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.invoice_closed_at_ts ;;
  description: "not available"
}
dimension_group: invoice_due_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.invoice_due_at_ts ;;
  description: "not available"
}
dimension: invoice_fees {
  type: number
  sql: ${TABLE}.invoice_fees ;;
  description: "not available"
}
dimension: invoice_gross_premium {
  type: number
  sql: ${TABLE}.invoice_gross_premium ;;
  description: "not available"
}
dimension: invoice_local_currency {
  type: string
  sql: ${TABLE}.invoice_local_currency ;;
  description: "not available"
}
dimension: invoice_natural_key {
  type: string
  sql: ${TABLE}.invoice_natural_key ;;
  description: "not available"
}
dimension_group: invoice_opened_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.invoice_opened_at_ts ;;
  description: "not available"
}
dimension_group: invoice_payment_confirmed_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.invoice_payment_confirmed_at_ts ;;
  description: "not available"
}
dimension: invoice_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.invoice_pk ;;
  description: "not available"
}
dimension: invoice_source_type {
  type: string
  sql: ${TABLE}.invoice_source_type ;;
  description: "not available"
}
dimension: invoice_status {
  type: string
  sql: ${TABLE}.invoice_status ;;
  description: "not available"
}
dimension: invoice_tax {
  type: number
  sql: ${TABLE}.invoice_tax ;;
  description: "not available"
}
dimension: payment_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.payment_fk ;;
  description: "not available"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "not available"
}
dimension: timezone_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.timezone_fk ;;
  description: "not available"
}
}
view: wh_platform__policies_fact {
sql_table_name: wh_platform__policies_fact ;;
dimension: claim_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.claim_fk ;;
  description: "not available"
}
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: deposit_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deposit_fk ;;
  description: "not available"
}
dimension: introducer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.introducer_fk ;;
  description: "not available"
}
dimension_group: policy_bound_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.policy_bound_at_ts ;;
  description: "not available"
}
dimension: policy_business_type {
  type: string
  sql: ${TABLE}.policy_business_type ;;
  description: "not available"
}
dimension_group: policy_end_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.policy_end_at_ts ;;
  description: "not available"
}
dimension: policy_holder {
  type: string
  sql: ${TABLE}.policy_holder ;;
  description: "not available"
}
dimension_group: policy_inception_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.policy_inception_ts ;;
  description: "not available"
}
dimension: policy_installment_base {
  type: yesnoEAN
  sql: ${TABLE}.policy_installment_base ;;
  description: "not available"
}
dimension: policy_natural_key {
  type: string
  sql: ${TABLE}.policy_natural_key ;;
  description: "not available"
}
dimension: policy_operation {
  type: string
  sql: ${TABLE}.policy_operation ;;
  description: "not available"
}
dimension: policy_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.policy_pk ;;
  description: "not available"
}
dimension: policy_status {
  type: string
  sql: ${TABLE}.policy_status ;;
  description: "not available"
}
dimension: policy_vertical {
  type: string
  sql: ${TABLE}.policy_vertical ;;
  description: "not available"
}
dimension: product_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.product_fk ;;
  description: "not available"
}
dimension: timezone_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.timezone_fk ;;
  description: "not available"
}
dimension: underwriter_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.underwriter_fk ;;
  description: "not available"
}
}
view: wh_platform__products_dim {
sql_table_name: wh_platform__products_dim ;;
dimension: product_display_name {
  type: string
  sql: ${TABLE}.product_display_name ;;
  description: "not available"
}
dimension: product_name {
  type: string
  sql: ${TABLE}.product_name ;;
  description: "not available"
}
dimension: product_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.product_pk ;;
  description: "not available"
}
dimension: product_type {
  type: string
  sql: ${TABLE}.product_type ;;
  description: "not available"
}
}
view: wh_platform__quotes_fact {
sql_table_name: wh_platform__quotes_fact ;;
dimension: business_type_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.business_type_fk ;;
  description: "not available"
}
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: discount_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.discount_fk ;;
  description: "not available"
}
dimension: introducer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.introducer_fk ;;
  description: "not available"
}
dimension: product_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.product_fk ;;
  description: "not available"
}
dimension: quote_brokerage_premium {
  type: number
  sql: ${TABLE}.quote_brokerage_premium ;;
  description: "not available"
}
dimension_group: quote_created_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.quote_created_at_ts ;;
  description: "not available"
}
dimension: quote_excess {
  type: number
  sql: ${TABLE}.quote_excess ;;
  description: "not available"
}
dimension: quote_fee {
  type: number
  sql: ${TABLE}.quote_fee ;;
  description: "not available"
}
dimension: quote_net_premium {
  type: number
  sql: ${TABLE}.quote_net_premium ;;
  description: "not available"
}
dimension: quote_operation {
  type: string
  sql: ${TABLE}.quote_operation ;;
  description: "not available"
}
dimension: quote_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.quote_pk ;;
  description: "not available"
}
dimension: quote_status {
  type: string
  sql: ${TABLE}.quote_status ;;
  description: "not available"
}
dimension: quote_tax {
  type: number
  sql: ${TABLE}.quote_tax ;;
  description: "not available"
}
dimension: timezone_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.timezone_fk ;;
  description: "not available"
}
dimension: underwriter_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.underwriter_fk ;;
  description: "not available"
}
}
view: wh_platform__schedules_fact {
sql_table_name: wh_platform__schedules_fact ;;
dimension: batch_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.batch_fk ;;
  description: "not available"
}
dimension: business_type_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.business_type_fk ;;
  description: "not available"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "not available"
}
dimension: quote_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.quote_fk ;;
  description: "not available"
}
dimension_group: schedule_bound_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.schedule_bound_at_ts ;;
  description: "not available"
}
dimension_group: schedule_end_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.schedule_end_at_ts ;;
  description: "not available"
}
dimension_group: schedule_inception_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.schedule_inception_ts ;;
  description: "not available"
}
dimension: schedule_natural_key {
  type: string
  sql: ${TABLE}.schedule_natural_key ;;
  description: "not available"
}
dimension: schedule_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.schedule_pk ;;
  description: "not available"
}
}
view: wh_platform__vehicles_dim {
sql_table_name: wh_platform__vehicles_dim ;;
dimension: vehicle_gross_weight_kg {
  type: number
  sql: ${TABLE}.vehicle_gross_weight_kg ;;
  description: "not available"
}
dimension: vehicle_manufacturer {
  type: string
  sql: ${TABLE}.vehicle_manufacturer ;;
  description: "not available"
}
dimension: vehicle_model {
  type: string
  sql: ${TABLE}.vehicle_model ;;
  description: "not available"
}
dimension: vehicle_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.vehicle_pk ;;
  description: "not available"
}
dimension: vehicle_type {
  type: string
  sql: ${TABLE}.vehicle_type ;;
  description: "not available"
}
}
view: wh_platform_brokers_fact {
sql_table_name: wh_platform_brokers_fact ;;
dimension_group: broker_created_at_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.broker_created_at_ts ;;
  description: "not available"
}
dimension: broker_email_addresses {
  type: VARIANT
  sql: ${TABLE}.broker_email_addresses ;;
  description: "not available"
}
dimension: broker_name {
  type: string
  sql: ${TABLE}.broker_name ;;
  description: "not available"
}
dimension: broker_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.broker_pk ;;
  description: "not available"
}
dimension: broker_remuneration_rate {
  type: number
  sql: ${TABLE}.broker_remuneration_rate ;;
  description: "not available"
}
dimension_group: broker_remuneration_start_ts {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_TZ
  sql: ${TABLE}.broker_remuneration_start_ts ;;
  description: "not available"
}
}
view: wh_platform_products_dim {
sql_table_name: wh_platform_products_dim ;;
dimension: product_display_name {
  type: string
  sql: ${TABLE}.product_display_name ;;
  description: "not available"
}
dimension: product_name {
  type: string
  sql: ${TABLE}.product_name ;;
  description: "not available"
}
dimension: product_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.product_pk ;;
  description: "not available"
}
dimension: product_type {
  type: string
  sql: ${TABLE}.product_type ;;
  description: "not available"
}
}
view: wh_platform_vehicles_dim {
sql_table_name: wh_platform_vehicles_dim ;;
dimension: vehicle_gross_weight_kg {
  type: number
  sql: ${TABLE}.vehicle_gross_weight_kg ;;
  description: "not available"
}
dimension: vehicle_manufacturer {
  type: string
  sql: ${TABLE}.vehicle_manufacturer ;;
  description: "not available"
}
dimension: vehicle_model {
  type: string
  sql: ${TABLE}.vehicle_model ;;
  description: "not available"
}
dimension: vehicle_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.vehicle_pk ;;
  description: "not available"
}
dimension: vehicle_type {
  type: string
  sql: ${TABLE}.vehicle_type ;;
  description: "not available"
}
}

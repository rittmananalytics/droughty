explore: wh_connectivity__connectivity_heartbeats_fact
{ hidden: yes }
explore: wh_connectivity__connectivity_summary_xa
{ hidden: yes }
explore: wh_core__business_types_dim
{ hidden: yes }
explore: wh_core__customers_dim
{ hidden: yes }
explore: wh_gocardless__transactions_fact
{ hidden: yes }
explore: wh_hubspot__companies_dim
{ hidden: yes }
explore: wh_hubspot__deal_company_bridge
{ hidden: yes }
explore: wh_hubspot__deal_pipelines_dim
{ hidden: yes }
explore: wh_hubspot__deal_stage_changes_fact
{ hidden: yes }
explore: wh_hubspot__deal_stages_dim
{ hidden: yes }
explore: wh_hubspot__deals_dim
{ hidden: yes }
explore: wh_hubspot__owners_dim
{ hidden: yes }
explore: wh_platform__bordereaux_fact
{ hidden: yes }
explore: wh_platform__brokers_bridge
{ hidden: yes }
explore: wh_platform__brokers_dim
{ hidden: yes }
explore: wh_platform__capacity_providers_dim
{ hidden: yes }
explore: wh_platform__invoices_fact
{ hidden: yes }
explore: wh_platform__mid_upload_fact
{ hidden: yes }
explore: wh_platform__policies_fact
{ hidden: yes }
explore: wh_platform__policy_capacity_providers_bridge
{ hidden: yes }
explore: wh_platform__policy_deposits_dim
{ hidden: yes }
explore: wh_platform__premium_xa
{ hidden: yes }
explore: wh_platform__products_dim
{ hidden: yes }
explore: wh_platform__quotes_fact
{ hidden: yes }
explore: wh_platform__schedules_fact
{ hidden: yes }
explore: wh_platform__vehicles_bridge
{ hidden: yes }
explore: wh_platform__vehicles_dim
{ hidden: yes }
explore: wh_targets__targets_dim
{ hidden: yes }
explore: wh_underwriting__claims_fact
{ hidden: yes }
view: wh_connectivity__connectivity_heartbeats_fact {
sql_table_name: wh_connectivity__connectivity_heartbeats_fact ;;
set: wh_connectivity__connectivity_heartbeats_fact_set {
  fields: [vehicle_is_connected, vehicle_registration_number]
}
dimension: connectivity_heartbeat_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.connectivity_heartbeat_pk ;;
  description: "the primary key for the connectivity summary table - a hash of the vrn"
}
dimension_group: connectivity_heartbeat_recieved_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.connectivity_heartbeat_recieved_at_date ;;
  description: "the date a heartbeat was recieved by flock from a telematic device"
}
dimension: vehicle_is_connected {
  type: yesno
  sql: ${TABLE}.vehicle_is_connected ;;
  description: "a flag to state whether a vehicle had been connected for 14 days at the date of the heartbeat (and therefore classed as connected)"
  drill_fields: [wh_connectivity__connectivity_heartbeats_fact_set*]
}
dimension: vehicle_registration_number {
  type: string
  sql: ${TABLE}.vehicle_registration_number ;;
  description: "the vehicle registration number"
  drill_fields: [wh_connectivity__connectivity_heartbeats_fact_set*]
}
}
view: wh_connectivity__connectivity_summary_xa {
sql_table_name: wh_connectivity__connectivity_summary_xa ;;
set: wh_connectivity__connectivity_summary_xa_set {
  fields: [vehicle_registration_number]
}
dimension: connectivity_summary_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.connectivity_summary_pk ;;
  description: "the primary key for the connectivity summary table - a hash of the vrn"
}
dimension_group: earliest_heartbeat_received_at_ts {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.earliest_heartbeat_received_at_ts ;;
  description: "the earliest heartbeat recieved by flock from a telematic device"
}
dimension_group: latest_heartbeat_received_at_ts {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.latest_heartbeat_received_at_ts ;;
  description: "the latest heartbeat recieved by flock from a telematic device"
}
dimension: vehicle_registration_number {
  type: string
  sql: ${TABLE}.vehicle_registration_number ;;
  description: "the vehicle registration number"
  drill_fields: [wh_connectivity__connectivity_summary_xa_set*]
}
}
view: wh_core__business_types_dim {
sql_table_name: wh_core__business_types_dim ;;
set: wh_core__business_types_dim_set {
  fields: [business_type]
}
dimension: business_type {
  type: string
  sql: ${TABLE}.business_type ;;
  description: "the business type for a record i.e. new, mta or renewal"
  drill_fields: [wh_core__business_types_dim_set*]
}
dimension: business_type_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.business_type_pk ;;
  description: "the primary key for a business type"
}
}
view: wh_core__customers_dim {
sql_table_name: wh_core__customers_dim ;;
set: wh_core__customers_dim_set {
  fields: [customer_email, customer_name]
}
dimension_group: customer_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.customer_created_at_ts ;;
  description: "the time a customer was created in the back end"
}
dimension: customer_email {
  type: string
  sql: ${TABLE}.customer_email ;;
  description: "a customer's email address"
  drill_fields: [wh_core__customers_dim_set*]
}
dimension: customer_name {
  type: string
  sql: ${TABLE}.customer_name ;;
  description: "a customer's name"
  drill_fields: [wh_core__customers_dim_set*]
}
dimension: customer_numeric_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.customer_numeric_natural_key ;;
  description: "the numeric id for a customer"
}
dimension: customer_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.customer_pk ;;
  description: "a surrogate key for the uuid of a customer"
}
}
view: wh_gocardless__transactions_fact {
sql_table_name: wh_gocardless__transactions_fact ;;
set: wh_gocardless__transactions_fact_set {
  fields: [
    transaction_amount,
    transaction_currency,
    transaction_customer_company_name,
    transaction_customer_email,
    transaction_meta,
    transaction_status,
  ]
}
dimension: transaction_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.transaction_amount ;;
  description: "the amount of the gocardless payment"
}
dimension_group: transaction_charge_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.transaction_charge_date ;;
  description: "the charged at timestamp of the transaction"
}
dimension_group: transaction_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.transaction_created_at_ts ;;
  description: "the created at timestamp of the transaction"
}
dimension: transaction_currency {
  type: string
  sql: ${TABLE}.transaction_currency ;;
  description: "the currency of the transaction"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
dimension: transaction_customer_company_name {
  type: string
  sql: ${TABLE}.transaction_customer_company_name ;;
  description: "the customer company name as recorded in gocardless"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
dimension: transaction_customer_email {
  type: string
  sql: ${TABLE}.transaction_customer_email ;;
  description: "the customer company email as recorded in gocardless"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
dimension: transaction_customer_natural_key {
  type: string
  sql: ${TABLE}.transaction_customer_natural_key ;;
  description: "the natural key from the gocardless transaction customer"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
dimension: transaction_meta {
  type: string
  sql: ${TABLE}.transaction_meta ;;
  description: "the meta data which is used by the finance team"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
dimension: transaction_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.transaction_pk ;;
  description: "the natural key from the gocardless transaction table"
}
dimension: transaction_status {
  type: string
  sql: ${TABLE}.transaction_status ;;
  description: "the status of a transaction as defined by gocardless"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
}
view: wh_hubspot__companies_dim {
sql_table_name: wh_hubspot__companies_dim ;;
set: wh_hubspot__companies_dim_set {
  fields: [company_lifecycle_stage, company_name, company_type, customer_success_manager]
}
dimension: company_lifecycle_stage {
  type: string
  sql: ${TABLE}.company_lifecycle_stage ;;
  description: "where the company is in it's lifecycle with flock"
  drill_fields: [wh_hubspot__companies_dim_set*]
}
dimension: company_name {
  type: string
  sql: ${TABLE}.company_name ;;
  description: "the name of a company in hubspot"
  drill_fields: [wh_hubspot__companies_dim_set*]
}
dimension: company_natural_key {
  type: string
  sql: ${TABLE}.company_natural_key ;;
  description: "the natural key for a company in hubspot"
  drill_fields: [wh_hubspot__companies_dim_set*]
}
dimension: company_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.company_pk ;;
  description: "a surrogate primary key for a company"
}
dimension: company_type {
  type: string
  sql: ${TABLE}.company_type ;;
  description: "the type of company in hubspot"
  drill_fields: [wh_hubspot__companies_dim_set*]
}
dimension: customer_success_manager {
  type: string
  sql: ${TABLE}.customer_success_manager ;;
  description: "the csm assigned to a customer in hubspot"
  drill_fields: [wh_hubspot__companies_dim_set*]
}
}
view: wh_hubspot__deal_company_bridge {
sql_table_name: wh_hubspot__deal_company_bridge ;;
set: {
  fields: [company_lifecycle_stage, company_name, company_type, customer_success_manager]
}
dimension: company_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.company_fk ;;
  description: "a surrogate foreign key for a company"
}
dimension: deal_company_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.deal_company_bridge_pk ;;
  description: "a surrogate primary key for an entry in the deal company bridge table"
}
dimension: deal_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deal_fk ;;
  description: "a surrogate foreign key for a deal"
}
}
view: wh_hubspot__deal_pipelines_dim {
sql_table_name: wh_hubspot__deal_pipelines_dim ;;
set: wh_hubspot__deal_pipelines_dim_set {
  fields: [deal_pipeline_label]
}
dimension: deal_pipeline_label {
  type: string
  sql: ${TABLE}.deal_pipeline_label ;;
  description: "the label for a pipeline in hubspot"
  drill_fields: [wh_hubspot__deal_pipelines_dim_set*]
}
dimension: deal_pipeline_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.deal_pipeline_pk ;;
  description: "a surrogate primary key for a deal pipeline"
}
}
view: wh_hubspot__deal_stage_changes_fact {
sql_table_name: wh_hubspot__deal_stage_changes_fact ;;
set: {
  fields: [deal_pipeline_label]
}
dimension: deal_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deal_fk ;;
  description: "a surrogate foreign key for a deal"
}
dimension: deal_stage_change_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.deal_stage_change_pk ;;
  description: "a surrogate primary key for a deal stage change"
}
dimension_group: deal_stage_entered_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.deal_stage_entered_at_ts ;;
  description: "the time a deal entered a stage in hubspot"
}
dimension_group: deal_stage_exited_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.deal_stage_exited_at_ts ;;
  description: "the time a deal exited a stage in hubspot"
}
dimension: deal_stage_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deal_stage_fk ;;
  description: "a surrogate primary key for a deal stage"
}
}
view: wh_hubspot__deal_stages_dim {
sql_table_name: wh_hubspot__deal_stages_dim ;;
set: wh_hubspot__deal_stages_dim_set {
  fields: [deal_stage_display_order, deal_stage_label, deal_stage_probability]
}
dimension: deal_pipeline_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deal_pipeline_fk ;;
  description: "a surrogate foreign key for a deal pipeline"
}
dimension: deal_stage_display_order {
  hidden: yes 
  type: number
  sql: ${TABLE}.deal_stage_display_order ;;
  description: "the order of deal stages through a pipeline"
}
dimension: deal_stage_label {
  type: string
  sql: ${TABLE}.deal_stage_label ;;
  description: "the label for a deal stage in hubspot"
  drill_fields: [wh_hubspot__deal_stages_dim_set*]
}
dimension: deal_stage_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.deal_stage_pk ;;
  description: "a surrogate foreign key for a deal stage"
}
dimension: deal_stage_probability {
  hidden: yes 
  type: number
  sql: ${TABLE}.deal_stage_probability ;;
  description: "the probability for a deal stage in hubspot"
}
}
view: wh_hubspot__deals_dim {
sql_table_name: wh_hubspot__deals_dim ;;
set: wh_hubspot__deals_dim_set {
  fields: [
    deal_broker_commission_percentage,
    deal_broker_owner,
    deal_closed_amount,
    deal_closed_lost_reason,
    deal_days_to_close,
    deal_fleet_size,
    deal_is_closed_lost,
    deal_is_closed_won,
    deal_name,
    deal_operation_type,
    deal_projected_amount,
    deal_source,
  ]
}
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "not available"
}
dimension: deal_broker_commission_percentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.deal_broker_commission_percentage ;;
  description: "the broker's commission percentage for a deal"
}
dimension: deal_broker_owner {
  type: string
  sql: ${TABLE}.deal_broker_owner ;;
  description: "the broker owner assigned to a deal in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension: deal_closed_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.deal_closed_amount ;;
  description: "the amount a deal closed for in hubspot"
}
dimension_group: deal_closed_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.deal_closed_at_ts ;;
  description: "the time a deal was marked as closed in hubspot"
}
dimension: deal_closed_lost_reason {
  type: string
  sql: ${TABLE}.deal_closed_lost_reason ;;
  description: "the reason a deal was closed & lost"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension_group: deal_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.deal_created_at_ts ;;
  description: "the time a deal was created in hubspot"
}
dimension: deal_days_to_close {
  hidden: yes 
  type: number
  sql: ${TABLE}.deal_days_to_close ;;
  description: "the number of days between a deal being submitted and either the current date or the date it closed"
}
dimension: deal_fleet_size {
  hidden: yes 
  type: number
  sql: ${TABLE}.deal_fleet_size ;;
  description: "the fleet size for a deal in hubspot"
}
dimension: deal_is_closed_lost {
  type: yesno
  sql: ${TABLE}.deal_is_closed_lost ;;
  description: "a flag to show whether a deal was closed & lost"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension: deal_is_closed_won {
  type: yesno
  sql: ${TABLE}.deal_is_closed_won ;;
  description: "a flag to show whether a deal was closed & won"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension: deal_name {
  type: string
  sql: ${TABLE}.deal_name ;;
  description: "the name for a deal in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension: deal_natural_key {
  type: string
  sql: ${TABLE}.deal_natural_key ;;
  description: "the natural key for a deal in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension: deal_operation_type {
  type: string
  sql: ${TABLE}.deal_operation_type ;;
  description: "the operation type of a deal in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension: deal_pipeline_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deal_pipeline_fk ;;
  description: "a surrogate foreign key for a deal pipeline"
}
dimension: deal_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.deal_pk ;;
  description: "a surrogate primary key for a deal"
}
dimension: deal_projected_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.deal_projected_amount ;;
  description: "the projected amount for a deal in hubspot"
}
dimension: deal_source {
  type: string
  sql: ${TABLE}.deal_source ;;
  description: "the source for a deal in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
dimension: deal_stage_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deal_stage_fk ;;
  description: "a surrogate primary key for a deal stage"
}
dimension: owner_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.owner_fk ;;
  description: "a surrogate foreign key for an owner"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
dimension: region_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.region_fk ;;
  description: "not available"
}
}
view: wh_hubspot__owners_dim {
sql_table_name: wh_hubspot__owners_dim ;;
set: wh_hubspot__owners_dim_set {
  fields: [owner_email_address, owner_first_name, owner_is_active, owner_last_name]
}
dimension: owner_email_address {
  type: string
  sql: ${TABLE}.owner_email_address ;;
  description: "the email address for an owner in hubspot"
  drill_fields: [wh_hubspot__owners_dim_set*]
}
dimension: owner_first_name {
  type: string
  sql: ${TABLE}.owner_first_name ;;
  description: "the first name for an owner in hubspot"
  drill_fields: [wh_hubspot__owners_dim_set*]
}
dimension: owner_is_active {
  type: yesno
  sql: ${TABLE}.owner_is_active ;;
  description: "a flag to state whether an owner in hubspot is active"
  drill_fields: [wh_hubspot__owners_dim_set*]
}
dimension: owner_last_name {
  type: string
  sql: ${TABLE}.owner_last_name ;;
  description: "the last name for an owner in hubspot"
  drill_fields: [wh_hubspot__owners_dim_set*]
}
dimension: owner_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.owner_pk ;;
  description: "a surrogate primary key for an owner"
}
}
view: wh_platform__bordereaux_fact {
sql_table_name: wh_platform__bordereaux_fact ;;
set: wh_platform__bordereaux_fact_set {
  fields: [
    bordereaux_brokerage,
    bordereaux_fee,
    bordereaux_gross_discount,
    bordereaux_net,
    bordereaux_tax,
    bordereaux_tax_discount,
  ]
}
dimension: bordereaux_brokerage {
  hidden: yes 
  type: number
  sql: ${TABLE}.bordereaux_brokerage ;;
  description: "the brokerage element of a bordereaux in local currency"
}
dimension_group: bordereaux_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.bordereaux_created_at_ts ;;
  description: "the creation time of a bordereaux"
}
dimension: bordereaux_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.bordereaux_fee ;;
  description: "the transaction fee element of a bordereaux in local currency"
}
dimension: bordereaux_gross_discount {
  hidden: yes 
  type: number
  sql: ${TABLE}.bordereaux_gross_discount ;;
  description: "the amount of gross premium flock has had to pay as a result of the discount applied"
}
dimension: bordereaux_net {
  hidden: yes 
  type: number
  sql: ${TABLE}.bordereaux_net ;;
  description: "the net premium of a bordereaux"
}
dimension: bordereaux_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.bordereaux_pk ;;
  description: "a surrogate key for the uuid of a bordereaux"
}
dimension: bordereaux_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.bordereaux_tax ;;
  description: "the ipt of a bordereaux"
}
dimension: bordereaux_tax_discount {
  hidden: yes 
  type: number
  sql: ${TABLE}.bordereaux_tax_discount ;;
  description: "the amount of ipt flock has had to pay as a result of the discount applied"
}
dimension: business_type_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.business_type_fk ;;
  description: "a surrogate key for a business type"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
dimension: schedule_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.schedule_fk ;;
  description: "a surrogate key for the uuid of a schedule"
}
}
view: wh_platform__brokers_bridge {
sql_table_name: wh_platform__brokers_bridge ;;
set: wh_platform__brokers_bridge_set {
  fields: [broker_fees_split, broker_gross_premium_split]
}
dimension: broker_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.broker_bridge_pk ;;
  description: "a surrogate key for the uuid of a quote broker"
}
dimension: broker_fees_split {
  hidden: yes 
  type: number
  sql: ${TABLE}.broker_fees_split ;;
  description: "the percentage split of the risk fees to be paid to the broker"
}
dimension: broker_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.broker_fk ;;
  description: "a surrogate key for the uuid of a broker"
}
dimension: broker_gross_premium_split {
  hidden: yes 
  type: number
  sql: ${TABLE}.broker_gross_premium_split ;;
  description: "the percentage split of the risk gross premium to be paid to the broker"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
}
view: wh_platform__brokers_dim {
sql_table_name: wh_platform__brokers_dim ;;
set: wh_platform__brokers_dim_set {
  fields: [broker_email_addresses, broker_name, broker_remuneration_rate]
}
dimension_group: broker_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.broker_created_at_ts ;;
  description: "the time a broker was created at in the back end"
}
dimension: broker_email_addresses {
  type: string
  sql: ${TABLE}.broker_email_addresses ;;
  description: "the broker's email address"
  drill_fields: [wh_platform__brokers_dim_set*]
}
dimension: broker_name {
  type: string
  sql: ${TABLE}.broker_name ;;
  description: "the broker's name"
  drill_fields: [wh_platform__brokers_dim_set*]
}
dimension: broker_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.broker_pk ;;
  description: "a surrogate key for the uuid of a broker"
}
dimension: broker_remuneration_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.broker_remuneration_rate ;;
  description: "the % used against the gross written premium to calculate the commission owed to a broker"
}
}
view: wh_platform__capacity_providers_dim {
sql_table_name: wh_platform__capacity_providers_dim ;;
set: wh_platform__capacity_providers_dim_set {
  fields: [capacity_provider_formal_name, capacity_provider_name]
}
dimension: capacity_provider_formal_name {
  type: string
  sql: ${TABLE}.capacity_provider_formal_name ;;
  description: "the formal name for a capacity provider"
  drill_fields: [wh_platform__capacity_providers_dim_set*]
}
dimension: capacity_provider_name {
  type: string
  sql: ${TABLE}.capacity_provider_name ;;
  description: "the informal name for a capacity provider"
  drill_fields: [wh_platform__capacity_providers_dim_set*]
}
dimension: capacity_provider_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.capacity_provider_pk ;;
  description: "a surrogate key for the uuid of a broker"
}
}
view: wh_platform__invoices_fact {
sql_table_name: wh_platform__invoices_fact ;;
set: wh_platform__invoices_fact_set {
  fields: [
    invoice_fees,
    invoice_gross_premium,
    invoice_local_currency,
    invoice_status,
    invoice_tax,
  ]
}
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "a surrogate key for the currency"
}
dimension_group: invoice_closed_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.invoice_closed_at_ts ;;
  description: "the utc timestamp of when an invoice was closed and ready to be issued to a customer"
}
dimension_group: invoice_due_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.invoice_due_at_ts ;;
  description: "the local timestamp of when an invoice is due to be paid"
}
dimension: invoice_fees {
  hidden: yes 
  type: number
  sql: ${TABLE}.invoice_fees ;;
  description: "the total transaction fees for an invoice"
}
dimension: invoice_gross_premium {
  hidden: yes 
  type: number
  sql: ${TABLE}.invoice_gross_premium ;;
  description: "the gross premium for an invoice"
}
dimension: invoice_local_currency {
  type: string
  sql: ${TABLE}.invoice_local_currency ;;
  description: "the local currency of an invoice"
  drill_fields: [wh_platform__invoices_fact_set*]
}
dimension: invoice_natural_key {
  type: string
  sql: ${TABLE}.invoice_natural_key ;;
  description: "the uuid for an invoice"
  drill_fields: [wh_platform__invoices_fact_set*]
}
dimension_group: invoice_opened_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.invoice_opened_at_ts ;;
  description: "the timestamp for when an invoice is created/opened"
}
dimension_group: invoice_payment_confirmed_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.invoice_payment_confirmed_at_ts ;;
  description: "the timestamp for when an invoice payment is confirmed"
}
dimension: invoice_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.invoice_pk ;;
  description: "a surrogate key for the uuid of an invoice"
}
dimension: invoice_status {
  type: string
  sql: ${TABLE}.invoice_status ;;
  description: "the current status of an invoice e.g. voided"
  drill_fields: [wh_platform__invoices_fact_set*]
}
dimension: invoice_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.invoice_tax ;;
  description: "the ipt for an invoice"
}
dimension: payment_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.payment_fk ;;
  description: "a surrogate key for the uuid of a payment"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
dimension: timezone_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.timezone_fk ;;
  description: "a surrogate key for a time zone"
}
}
view: wh_platform__mid_upload_fact {
sql_table_name: wh_platform__mid_upload_fact ;;
set: wh_platform__mid_upload_fact_set {
  fields: [
    file_category,
    file_path,
    policy_holder_name,
    upload_type,
    vehicle_make,
    vehicle_model,
    vehicle_registration_number,
  ]
}
dimension_group: end_date_cleaned {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.end_date_cleaned ;;
  description: "not available"
}
dimension: file_category {
  type: string
  sql: ${TABLE}.file_category ;;
  description: "the uploaded file category"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
dimension: file_path {
  type: string
  sql: ${TABLE}.file_path ;;
  description: "the file path location on the sftp server"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
dimension_group: fivetran_synced_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.fivetran_synced_at_ts ;;
  description: "the timestamp of the last fivetran sync with the sftp server"
}
dimension: policy_external_natural_key {
  type: string
  sql: ${TABLE}.policy_external_natural_key ;;
  description: "the external id for a policy"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
dimension: policy_holder_name {
  type: string
  sql: ${TABLE}.policy_holder_name ;;
  description: "not available"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
dimension_group: row_modified_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.row_modified_at_ts ;;
  description: "the timestamp of when the row was modified"
}
dimension_group: start_date_cleaned {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.start_date_cleaned ;;
  description: "not available"
}
dimension: upload_type {
  type: string
  sql: ${TABLE}.upload_type ;;
  description: "categorises whether this is a policy mds upload or a vehicle one"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
dimension: vehicle_make {
  type: string
  sql: ${TABLE}.vehicle_make ;;
  description: "the make of the uploaded vehicle"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
dimension: vehicle_model {
  type: string
  sql: ${TABLE}.vehicle_model ;;
  description: "the vehicle model"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
dimension: vehicle_registration_number {
  type: string
  sql: ${TABLE}.vehicle_registration_number ;;
  description: "the vehicle registration number"
  drill_fields: [wh_platform__mid_upload_fact_set*]
}
}
view: wh_platform__policies_fact {
sql_table_name: wh_platform__policies_fact ;;
set: wh_platform__policies_fact_set {
  fields: [
    policy_holder,
    policy_installment_base,
    policy_operation,
    policy_status,
    policy_vertical,
  ]
}
dimension: business_type_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.business_type_fk ;;
  description: "a surrogate key for a business type"
}
dimension: claim_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.claim_fk ;;
  description: "a surrogate key for a claim"
}
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "a surrogate key for the currency"
}
dimension: customer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.customer_fk ;;
  description: "a surrogate key for the uuid of a customer"
}
dimension: deposit_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.deposit_fk ;;
  description: "a surrogate key for the uuid of a deposit"
}
dimension: external_natural_key {
  type: string
  sql: ${TABLE}.external_natural_key ;;
  description: "the external id for a policy"
  drill_fields: [wh_platform__policies_fact_set*]
}
dimension: introducer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.introducer_fk ;;
  description: "a surrogate key for the uuid of an introducer"
}
dimension_group: policy_bound_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.policy_bound_at_ts ;;
  description: "the timestamp for when a policy was created"
}
dimension_group: policy_end_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.policy_end_at_ts ;;
  description: "the time a policy is due to end"
}
dimension: policy_holder {
  type: string
  sql: ${TABLE}.policy_holder ;;
  description: "the policy holder name"
  drill_fields: [wh_platform__policies_fact_set*]
}
dimension_group: policy_inception_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.policy_inception_ts ;;
  description: "the local timestamp for when a policy incepts/starts"
}
dimension: policy_installment_base {
  type: yesno
  sql: ${TABLE}.policy_installment_base ;;
  description: "a boolean (true/false) flag to state whether the policy is being paid in installments"
  drill_fields: [wh_platform__policies_fact_set*]
}
dimension: policy_natural_key {
  type: string
  sql: ${TABLE}.policy_natural_key ;;
  description: "the uuid for a policy"
  drill_fields: [wh_platform__policies_fact_set*]
}
dimension: policy_operation {
  type: string
  sql: ${TABLE}.policy_operation ;;
  description: "the operation of the policy i.e. trades, courier or self-drive hire"
  drill_fields: [wh_platform__policies_fact_set*]
}
dimension: policy_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.policy_pk ;;
  description: "a surrogate key for the uuid of a policy"
}
dimension: policy_status {
  type: string
  sql: ${TABLE}.policy_status ;;
  description: "the status of a policy i.e. cancelled, expired or bound"
  drill_fields: [wh_platform__policies_fact_set*]
}
dimension: policy_vertical {
  type: string
  sql: ${TABLE}.policy_vertical ;;
  description: "the vertical for a policy e.g. motor"
  drill_fields: [wh_platform__policies_fact_set*]
}
dimension: product_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.product_fk ;;
  description: "a surrogate key for the uuid of a product"
}
dimension: timezone_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.timezone_fk ;;
  description: "a surrogate key for a time zone"
}
dimension: underwriter_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.underwriter_fk ;;
  description: "a surrogate key for the uuid of an underwriter"
}
}
view: wh_platform__policy_capacity_providers_bridge {
sql_table_name: wh_platform__policy_capacity_providers_bridge ;;
set: wh_platform__policy_capacity_providers_bridge_set {
  fields: [capacity_provider_net_premium_split, capacity_provider_tax_split]
}
dimension: capacity_provider_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.capacity_provider_fk ;;
  description: "a surrogate key for the uuid of a capacity provider"
}
dimension: capacity_provider_net_premium_split {
  hidden: yes 
  type: number
  sql: ${TABLE}.capacity_provider_net_premium_split ;;
  description: "the perc split of the net premium of a risk for the capacity provider"
}
dimension: capacity_provider_tax_split {
  hidden: yes 
  type: number
  sql: ${TABLE}.capacity_provider_tax_split ;;
  description: "the perc split of the ipt for a risk for the capacity provider"
}
dimension: policy_capacity_providers_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.policy_capacity_providers_bridge_pk ;;
  description: "a surrogate key for the uuid of a policy capacity provider"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
}
view: wh_platform__policy_deposits_dim {
sql_table_name: wh_platform__policy_deposits_dim ;;
set: wh_platform__policy_deposits_dim_set {
  fields: [policy_deposit]
}
dimension: policy_deposit {
  hidden: yes 
  type: number
  sql: ${TABLE}.policy_deposit ;;
  description: "the deposit of the risk"
}
dimension: policy_deposit_natural_key {
  type: string
  sql: ${TABLE}.policy_deposit_natural_key ;;
  description: "the natural key of the policy deposit table"
  drill_fields: [wh_platform__policy_deposits_dim_set*]
}
dimension: policy_deposit_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.policy_deposit_pk ;;
  description: "the primary key of the policy deposit table"
}
}
view: wh_platform__premium_xa {
sql_table_name: wh_platform__premium_xa ;;
set: wh_platform__premium_xa_set {
  fields: [earned_gross_written_premium, earned_net_written_premium, gross_written_premium, net_written_premium]
}
dimension: earned_gross_written_premium {
  hidden: yes 
  type: number
  sql: ${TABLE}.earned_gross_written_premium ;;
  description: "the total gwp earned so far on a risk"
}
dimension: earned_net_written_premium {
  hidden: yes 
  type: number
  sql: ${TABLE}.earned_net_written_premium ;;
  description: "the total nwp earned so far on a risk"
}
dimension: gross_written_premium {
  hidden: yes 
  type: number
  sql: ${TABLE}.gross_written_premium ;;
  description: "the gwp for a risk. net premium + brokerage"
}
dimension: net_written_premium {
  hidden: yes 
  type: number
  sql: ${TABLE}.net_written_premium ;;
  description: "the nwp for a risk"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
dimension: premium_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.premium_pk ;;
  description: "the surrogate primary key for the premium xa table"
}
dimension: schedule_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.schedule_fk ;;
  description: "a surrogate key for the uuid of a schedule"
}
}
view: wh_platform__products_dim {
sql_table_name: wh_platform__products_dim ;;
set: wh_platform__products_dim_set {
  fields: [product_display_name, product_name, product_type]
}
dimension: product_display_name {
  type: string
  sql: ${TABLE}.product_display_name ;;
  description: "the display name of a product"
  drill_fields: [wh_platform__products_dim_set*]
}
dimension: product_name {
  type: string
  sql: ${TABLE}.product_name ;;
  description: "the name of a product"
  drill_fields: [wh_platform__products_dim_set*]
}
dimension: product_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.product_pk ;;
  description: "a surrogate key for the uuid of a product"
}
dimension: product_type {
  type: string
  sql: ${TABLE}.product_type ;;
  description: "the product type i.e. hourly, flat-fee or ubi"
  drill_fields: [wh_platform__products_dim_set*]
}
}
view: wh_platform__quotes_fact {
sql_table_name: wh_platform__quotes_fact ;;
set: wh_platform__quotes_fact_set {
  fields: [
    quote_average_annual_burning_cost,
    quote_brokerage,
    quote_excess,
    quote_fee,
    quote_net_premium,
    quote_operation,
    quote_status,
    quote_tax,
  ]
}
dimension: business_type_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.business_type_fk ;;
  description: "a surrogate key for a business type"
}
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "a surrogate key for the currency"
}
dimension: customer_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.customer_fk ;;
  description: "a surrogate key for the uuid of a customer"
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
  description: "a surrogate key for the uuid of an introducer"
}
dimension: product_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.product_fk ;;
  description: "a surrogate key for the uuid of a product"
}
dimension: quote_average_annual_burning_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.quote_average_annual_burning_cost ;;
  description: "the average annual burning calculated from the actuarial algorithms"
}
dimension: quote_brokerage {
  hidden: yes 
  type: number
  sql: ${TABLE}.quote_brokerage ;;
  description: "the brokerage of a quote"
}
dimension_group: quote_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.quote_created_at_ts ;;
  description: "the time a quote was created at"
}
dimension: quote_excess {
  hidden: yes 
  type: number
  sql: ${TABLE}.quote_excess ;;
  description: "the excess on a quote"
}
dimension: quote_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.quote_fee ;;
  description: "the fee for a quote"
}
dimension: quote_net_premium {
  hidden: yes 
  type: number
  sql: ${TABLE}.quote_net_premium ;;
  description: "the net premium for a quote"
}
dimension: quote_operation {
  type: string
  sql: ${TABLE}.quote_operation ;;
  description: "the operation of the quote i.e. trades, courier or self-drive hire"
  drill_fields: [wh_platform__quotes_fact_set*]
}
dimension: quote_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.quote_pk ;;
  description: "a surrogate key for the uuid of a quote"
}
dimension: quote_status {
  type: string
  sql: ${TABLE}.quote_status ;;
  description: "the status of a quote i.e. superseded, bound, rejected, void, expired, unconfirmed, quoted"
  drill_fields: [wh_platform__quotes_fact_set*]
}
dimension: quote_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.quote_tax ;;
  description: "the ipt of a quote"
}
dimension: timezone_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.timezone_fk ;;
  description: "a surrogate key for a time zone"
}
dimension: underwriter_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.underwriter_fk ;;
  description: "a surrogate key for the uuid of an underwriter"
}
}
view: wh_platform__schedules_fact {
sql_table_name: wh_platform__schedules_fact ;;
set: wh_platform__schedules_fact_set {
  fields: [is_effective_schedule]
}
dimension: batch_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.batch_fk ;;
  description: "a surrogate key for the uuid of a batch"
}
dimension: business_type_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.business_type_fk ;;
  description: "a surrogate key for a business type"
}
dimension: is_effective_schedule {
  type: yesno
  sql: ${TABLE}.is_effective_schedule ;;
  description: "a flag to mark whether a schedule is the latest one"
  drill_fields: [wh_platform__schedules_fact_set*]
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
dimension: quote_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.quote_fk ;;
  description: "a surrogate key for the uuid of a quote"
}
dimension_group: schedule_bound_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.schedule_bound_at_ts ;;
  description: "the local time stamp a schedule was bound"
}
dimension_group: schedule_end_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.schedule_end_at_ts ;;
  description: "the local timestamp of the expiry of a schedule"
}
dimension_group: schedule_inception_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.schedule_inception_ts ;;
  description: "the local timestamp of the inception of this schedule"
}
dimension: schedule_natural_key {
  type: string
  sql: ${TABLE}.schedule_natural_key ;;
  description: "the uuid for a schedule"
  drill_fields: [wh_platform__schedules_fact_set*]
}
dimension: schedule_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.schedule_pk ;;
  description: "a surrogate key for the uuid of a schedule"
}
}
view: wh_platform__vehicles_bridge {
sql_table_name: wh_platform__vehicles_bridge ;;
set: wh_platform__vehicles_bridge_set {
  fields: [vehicle_registration_number]
}
dimension: quote_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.quote_fk ;;
  description: "a surrogate key for the uuid of a quote"
}
dimension: vehicle_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.vehicle_bridge_pk ;;
  description: "a surrogate key for the uuid of a quote vehicle"
}
dimension: vehicle_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.vehicle_fk ;;
  description: "a surrogate key for the uuid of a vehicle"
}
dimension_group: vehicle_off_cover_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.vehicle_off_cover_date ;;
  description: "the date at the end of the period of cover for a vehicle"
}
dimension_group: vehicle_on_cover_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.vehicle_on_cover_date ;;
  description: "the date at the start of the period of cover for a vehicle"
}
dimension: vehicle_registration_number {
  type: string
  sql: ${TABLE}.vehicle_registration_number ;;
  description: "the vehicle registration number"
  drill_fields: [wh_platform__vehicles_bridge_set*]
}
}
view: wh_platform__vehicles_dim {
sql_table_name: wh_platform__vehicles_dim ;;
set: wh_platform__vehicles_dim_set {
  fields: [vehicle_gross_weight_kg, vehicle_manufacturer, vehicle_model, vehicle_type]
}
dimension: vehicle_gross_weight_kg {
  hidden: yes 
  type: number
  sql: ${TABLE}.vehicle_gross_weight_kg ;;
  description: "the gross weight of a vehicle in kilograms"
}
dimension: vehicle_manufacturer {
  type: string
  sql: ${TABLE}.vehicle_manufacturer ;;
  description: "the vehicle manufacturer"
  drill_fields: [wh_platform__vehicles_dim_set*]
}
dimension: vehicle_model {
  type: string
  sql: ${TABLE}.vehicle_model ;;
  description: "the vehicle model"
  drill_fields: [wh_platform__vehicles_dim_set*]
}
dimension: vehicle_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.vehicle_pk ;;
  description: "a surrogate key for the uuid for a vehicle"
}
dimension: vehicle_type {
  type: string
  sql: ${TABLE}.vehicle_type ;;
  description: "the type of vehicle e.g. car, hgv"
  drill_fields: [wh_platform__vehicles_dim_set*]
}
}
view: wh_targets__targets_dim {
sql_table_name: wh_targets__targets_dim ;;
set: wh_targets__targets_dim_set {
  fields: [
    target_active_brokers,
    target_average_deal_size,
    target_bound_count,
    target_bound_new_gwp,
    target_broker_nps,
    target_cash,
    target_conversion,
    target_fleet_nps,
    target_mta_gwp,
    target_new_broker_offices_monthly,
    target_number_of_deals_per_broker_monthly,
    target_proportion_in_appetite_flat,
    target_quote_to_issued_rate_flat,
    target_renewal_gwp,
    target_renewal_rate_flat,
    target_strike_rate_flat,
    target_submissions,
    target_total_broker_offices,
    target_ultimate_loss_ratio,
    target_vehicles_connected,
  ]
}
dimension: target_active_brokers {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_active_brokers ;;
  description: "the target for active brokers"
}
dimension: target_average_deal_size {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_average_deal_size ;;
  description: "the target for average deal size for new business"
}
dimension: target_bound_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_bound_count ;;
  description: "the bound count target for new business"
}
dimension: target_bound_new_gwp {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_bound_new_gwp ;;
  description: "the target for bound gwp for new business"
}
dimension: target_broker_nps {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_broker_nps ;;
  description: "the target for broker nps"
}
dimension: target_cash {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_cash ;;
  description: "the cash target"
}
dimension: target_conversion {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_conversion ;;
  description: "the target conversion rate for new business"
}
dimension_group: target_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.target_date ;;
  description: "the date for a target"
}
dimension: target_fleet_nps {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_fleet_nps ;;
  description: "the target for fleet nps"
}
dimension: target_mta_gwp {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_mta_gwp ;;
  description: "the target gwp for mtas"
}
dimension: target_new_broker_offices_monthly {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_new_broker_offices_monthly ;;
  description: "the target for number of broker offices (monthly)"
}
dimension: target_number_of_deals_per_broker_monthly {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_number_of_deals_per_broker_monthly ;;
  description: "the target for number of deals per broker (monthly) for new business"
}
dimension: target_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.target_pk ;;
  description: "the date for a target"
}
dimension: target_proportion_in_appetite_flat {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_proportion_in_appetite_flat ;;
  description: "the % in appetite (flat) target for new business"
}
dimension: target_quote_to_issued_rate_flat {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_quote_to_issued_rate_flat ;;
  description: "the target for quote to issued rate (flat) for new business"
}
dimension: target_renewal_gwp {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_renewal_gwp ;;
  description: "the target gwp for renewals"
}
dimension: target_renewal_rate_flat {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_renewal_rate_flat ;;
  description: "the target for renewal % (flat)"
}
dimension: target_strike_rate_flat {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_strike_rate_flat ;;
  description: "the strike rate target for new business"
}
dimension: target_submissions {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_submissions ;;
  description: "the submissions target for new business"
}
dimension: target_total_broker_offices {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_total_broker_offices ;;
  description: "the target for total broker offices"
}
dimension: target_ultimate_loss_ratio {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_ultimate_loss_ratio ;;
  description: "the target for ultimate loss ratio"
}
dimension: target_vehicles_connected {
  hidden: yes 
  type: number
  sql: ${TABLE}.target_vehicles_connected ;;
  description: "the target for the proportion of vehicles connected"
}
}
view: wh_underwriting__claims_fact {
sql_table_name: wh_underwriting__claims_fact ;;
set: wh_underwriting__claims_fact_set {
  fields: [
    claim_accident_circumstances,
    claim_accident_location,
    claim_age_of_driver,
    claim_blame,
    claim_contact_method,
    claim_days_to_report,
    claim_direction_of_travel,
    claim_driver_name,
    claim_insurer_ad_paid,
    claim_insurer_ad_recovered,
    claim_insurer_ad_reserve,
    claim_insurer_total_incurred,
    claim_insurer_total_paid,
    claim_insurer_total_recovered,
    claim_insurer_total_reserve,
    claim_insurer_tppd_paid,
    claim_insurer_tppd_recovered,
    claim_insurer_tppd_reserve,
    claim_insurer_tppi_paid,
    claim_insurer_tppi_recovered,
    claim_insurer_tppi_reserve,
    claim_reporting_party,
    claim_status,
    claim_vehicle_registration_number,
    claim_year_of_account,
  ]
}
dimension: claim_accident_circumstances {
  type: string
  sql: ${TABLE}.claim_accident_circumstances ;;
  description: "the circumstances of the accident in a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_accident_location {
  type: string
  sql: ${TABLE}.claim_accident_location ;;
  description: "the location of the accident in a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_age_of_driver {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_age_of_driver ;;
  description: "the age of the driver on a claim"
}
dimension: claim_blame {
  type: string
  sql: ${TABLE}.claim_blame ;;
  description: "who is at fault in this claim?"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_contact_method {
  type: string
  sql: ${TABLE}.claim_contact_method ;;
  description: "the method that a claim was reported by"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension_group: claim_date_of_loss {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.claim_date_of_loss ;;
  description: "the date the loss being reported in a claim took place"
}
dimension_group: claim_date_received {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.claim_date_received ;;
  description: "the date a claim was received"
}
dimension_group: claim_date_settled {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.claim_date_settled ;;
  description: "the date a claim was settled"
}
dimension: claim_days_to_report {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_days_to_report ;;
  description: "the number of days between an accident happening and a claim being reported"
}
dimension: claim_direction_of_travel {
  type: string
  sql: ${TABLE}.claim_direction_of_travel ;;
  description: "the direction of travel of the vehicle involed in a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension_group: claim_driver_dob {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.claim_driver_dob ;;
  description: "the date of birth of the driver in a claim"
}
dimension: claim_driver_name {
  type: string
  sql: ${TABLE}.claim_driver_name ;;
  description: "the name of the driver on a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_insurer_ad_paid {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_ad_paid ;;
  description: "the amount paid for our insured's vehicle damage"
}
dimension: claim_insurer_ad_recovered {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_ad_recovered ;;
  description: "the amount recovered after paying for our insured's vehicle damage"
}
dimension: claim_insurer_ad_reserve {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_ad_reserve ;;
  description: "the amount we anticipate to pay for our insured's vehicle damage"
}
dimension: claim_insurer_total_incurred {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_total_incurred ;;
  description: "the total claim amount"
}
dimension: claim_insurer_total_paid {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_total_paid ;;
  description: "the total amount paid"
}
dimension: claim_insurer_total_recovered {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_total_recovered ;;
  description: "the total amount recovered"
}
dimension: claim_insurer_total_reserve {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_total_reserve ;;
  description: "the total amount we anticipate to pay"
}
dimension: claim_insurer_tppd_paid {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_tppd_paid ;;
  description: "the amount paid for third party property damage"
}
dimension: claim_insurer_tppd_recovered {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_tppd_recovered ;;
  description: "the amount recovered after paying for third party property damage"
}
dimension: claim_insurer_tppd_reserve {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_tppd_reserve ;;
  description: "the amount we anticipate to pay for third party property damage"
}
dimension: claim_insurer_tppi_paid {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_tppi_paid ;;
  description: "the amount paid for third party personal injury"
}
dimension: claim_insurer_tppi_recovered {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_tppi_recovered ;;
  description: "the amount recovered after paying for third party personal injury"
}
dimension: claim_insurer_tppi_reserve {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_insurer_tppi_reserve ;;
  description: "the amount we anticipate to pay for third party personal injury"
}
dimension: claim_natural_key {
  type: string
  sql: ${TABLE}.claim_natural_key ;;
  description: "the id for a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.claim_pk ;;
  description: "a surrogate key for a claim"
}
dimension: claim_reporting_party {
  type: string
  sql: ${TABLE}.claim_reporting_party ;;
  description: "the party who reported a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_status {
  type: string
  sql: ${TABLE}.claim_status ;;
  description: "the status of a claim i.e. opened, closed, re-opened"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_vehicle_registration_number {
  type: string
  sql: ${TABLE}.claim_vehicle_registration_number ;;
  description: "the vehicle registration on a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
dimension: claim_year_of_account {
  hidden: yes 
  type: number
  sql: ${TABLE}.claim_year_of_account ;;
  description: "the year the account associated with a claim was opened"
}
dimension: currency_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.currency_fk ;;
  description: "a surrogate key for the currency"
}
dimension: policy_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.policy_fk ;;
  description: "a surrogate key for the uuid of a policy"
}
dimension: policy_natural_key {
  type: string
  sql: ${TABLE}.policy_natural_key ;;
  description: "the uuid for a policy"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
}

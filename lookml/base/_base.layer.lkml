view: wh_commerce_attribution_fintech_xa {
sql_table_name: wh_commerce_attribution_fintech_xa ;;
set: wh_commerce_attribution_fintech_xa_set {
  fields: [
    acquisition_channel,
    attribution_pk,
    channel,
    conversion_status,
    first_click_attribution,
    last_click_attribution,
    linear_attribution,
    marketing_cost,
    position_based_attribution,
    revenue,
    roi,
    time_decay_attribution,
    u_shaped_attribution,
    w_shaped_attribution,
  ]
}
dimension: attribution_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
}
dimension: product_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.product_fk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: journey_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
}
dimension: campaign_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.campaign_fk ;;
  description: "not available"
}
dimension: channel {
  type: string
  sql: ${TABLE}.channel ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
dimension_group: interaction_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.interaction_date ;;
  description: "not available"
}
dimension: conversion_status {
  type: yesno
  sql: ${TABLE}.conversion_status ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
dimension_group: conversion_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.conversion_date ;;
  description: "not available"
}
dimension: revenue {
  hidden: yes
  type: number
  sql: ${TABLE}.revenue ;;
  description: "not available"
}
dimension: marketing_cost {
  hidden: yes
  type: number
  sql: ${TABLE}.marketing_cost ;;
  description: "not available"
}
dimension: roi {
  hidden: yes
  type: number
  sql: ${TABLE}.roi ;;
  description: "not available"
}
dimension: first_click_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.first_click_attribution ;;
  description: "not available"
}
dimension: last_click_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.last_click_attribution ;;
  description: "not available"
}
dimension: linear_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.linear_attribution ;;
  description: "not available"
}
dimension: time_decay_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.time_decay_attribution ;;
  description: "not available"
}
dimension: position_based_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.position_based_attribution ;;
  description: "not available"
}
dimension: u_shaped_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.u_shaped_attribution ;;
  description: "not available"
}
dimension: w_shaped_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.w_shaped_attribution ;;
  description: "not available"
}
dimension: acquisition_channel {
  type: string
  sql: ${TABLE}.acquisition_channel ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
}
explore: wh_commerce_attribution_fintech_xa
{ hidden: yes }
view: wh_commerce_attribution_xa {
sql_table_name: wh_commerce_attribution_xa ;;
set: wh_commerce_attribution_xa_set {
  fields: [
    attribution_pk,
    channel,
    conversion_status,
    first_click_attribution,
    last_click_attribution,
    linear_attribution,
    marketing_cost,
    position_based_attribution,
    revenue,
    roi,
    time_decay_attribution,
    u_shaped_attribution,
    w_shaped_attribution,
  ]
}
dimension: attribution_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
}
dimension: product_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.product_fk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: journey_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
}
dimension: campaign_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.campaign_fk ;;
  description: "not available"
}
dimension: channel {
  type: string
  sql: ${TABLE}.channel ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
dimension_group: interaction_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.interaction_date ;;
  description: "not available"
}
dimension: conversion_status {
  type: yesno
  sql: ${TABLE}.conversion_status ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
dimension_group: conversion_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.conversion_date ;;
  description: "not available"
}
dimension: revenue {
  hidden: yes
  type: number
  sql: ${TABLE}.revenue ;;
  description: "not available"
}
dimension: marketing_cost {
  hidden: yes
  type: number
  sql: ${TABLE}.marketing_cost ;;
  description: "not available"
}
dimension: roi {
  hidden: yes
  type: number
  sql: ${TABLE}.roi ;;
  description: "not available"
}
dimension: first_click_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.first_click_attribution ;;
  description: "not available"
}
dimension: last_click_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.last_click_attribution ;;
  description: "not available"
}
dimension: linear_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.linear_attribution ;;
  description: "not available"
}
dimension: time_decay_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.time_decay_attribution ;;
  description: "not available"
}
dimension: position_based_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.position_based_attribution ;;
  description: "not available"
}
dimension: u_shaped_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.u_shaped_attribution ;;
  description: "not available"
}
dimension: w_shaped_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.w_shaped_attribution ;;
  description: "not available"
}
}
explore: wh_commerce_attribution_xa
{ hidden: yes }
view: wh_commerce_attribution_xa_legacy {
sql_table_name: wh_commerce_attribution_xa_legacy ;;
set: wh_commerce_attribution_xa_legacy_set {
  fields: [
    attribution_pk,
    channel,
    conversion_status,
    first_click_attribution,
    last_click_attribution,
    linear_attribution,
    marketing_cost,
    position_based_attribution,
    revenue,
    roi,
    time_decay_attribution,
    u_shaped_attribution,
    w_shaped_attribution,
  ]
}
dimension: attribution_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
}
dimension: product_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.product_fk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: journey_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
}
dimension: campaign_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.campaign_fk ;;
  description: "not available"
}
dimension: channel {
  type: string
  sql: ${TABLE}.channel ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
dimension_group: interaction_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.interaction_date ;;
  description: "not available"
}
dimension: conversion_status {
  type: yesno
  sql: ${TABLE}.conversion_status ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
dimension_group: conversion_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.conversion_date ;;
  description: "not available"
}
dimension: revenue {
  hidden: yes
  type: number
  sql: ${TABLE}.revenue ;;
  description: "not available"
}
dimension: marketing_cost {
  hidden: yes
  type: number
  sql: ${TABLE}.marketing_cost ;;
  description: "not available"
}
dimension: roi {
  hidden: yes
  type: number
  sql: ${TABLE}.roi ;;
  description: "not available"
}
dimension: first_click_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.first_click_attribution ;;
  description: "not available"
}
dimension: last_click_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.last_click_attribution ;;
  description: "not available"
}
dimension: linear_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.linear_attribution ;;
  description: "not available"
}
dimension: time_decay_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.time_decay_attribution ;;
  description: "not available"
}
dimension: position_based_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.position_based_attribution ;;
  description: "not available"
}
dimension: u_shaped_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.u_shaped_attribution ;;
  description: "not available"
}
dimension: w_shaped_attribution {
  hidden: yes
  type: number
  sql: ${TABLE}.w_shaped_attribution ;;
  description: "not available"
}
}
explore: wh_commerce_attribution_xa_legacy
{ hidden: yes }
view: wh_commerce_cac_ltv_xa {
sql_table_name: wh_commerce_cac_ltv_xa ;;
set: wh_commerce_cac_ltv_xa_set {
  fields: [
    acquisition_channel,
    average_purchase_value,
    churn_rate,
    cost_of_goods_sold_cogs,
    customer_acquisition_cost_cac,
    customer_feedback_scores,
    customer_lifespan,
    customer_segments,
    discount_rate,
    engagement_metrics,
    gross_margin,
    lifetime_value_ltv,
    ltv_pk,
    marketing_expenses,
    profit_margin_per_customer,
    purchase_frequency,
    retention_rate,
    revenue,
    sales_expenses,
  ]
}
dimension: ltv_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.ltv_pk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: journey_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
}
dimension: customer_acquisition_cost_cac {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_acquisition_cost_cac ;;
  description: "not available"
}
dimension: revenue {
  hidden: yes
  type: number
  sql: ${TABLE}.revenue ;;
  description: "not available"
}
dimension: gross_margin {
  hidden: yes
  type: number
  sql: ${TABLE}.gross_margin ;;
  description: "not available"
}
dimension: lifetime_value_ltv {
  hidden: yes
  type: number
  sql: ${TABLE}.lifetime_value_ltv ;;
  description: "not available"
}
dimension: average_purchase_value {
  hidden: yes
  type: number
  sql: ${TABLE}.average_purchase_value ;;
  description: "not available"
}
dimension: purchase_frequency {
  hidden: yes
  type: number
  sql: ${TABLE}.purchase_frequency ;;
  description: "not available"
}
dimension: customer_lifespan {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_lifespan ;;
  description: "not available"
}
dimension: retention_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.retention_rate ;;
  description: "not available"
}
dimension: churn_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.churn_rate ;;
  description: "not available"
}
dimension: customer_segments {
  type: string
  sql: ${TABLE}.customer_segments ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
dimension: acquisition_channel {
  type: string
  sql: ${TABLE}.acquisition_channel ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
dimension: engagement_metrics {
  hidden: yes
  type: number
  sql: ${TABLE}.engagement_metrics ;;
  description: "not available"
}
dimension: customer_feedback_scores {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_feedback_scores ;;
  description: "not available"
}
dimension: discount_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.discount_rate ;;
  description: "not available"
}
dimension: cost_of_goods_sold_cogs {
  hidden: yes
  type: number
  sql: ${TABLE}.cost_of_goods_sold_cogs ;;
  description: "not available"
}
dimension: marketing_expenses {
  hidden: yes
  type: number
  sql: ${TABLE}.marketing_expenses ;;
  description: "not available"
}
dimension: sales_expenses {
  hidden: yes
  type: number
  sql: ${TABLE}.sales_expenses ;;
  description: "not available"
}
dimension: profit_margin_per_customer {
  hidden: yes
  type: number
  sql: ${TABLE}.profit_margin_per_customer ;;
  description: "not available"
}
dimension_group: transaction_timestamp {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.transaction_timestamp ;;
  description: "not available"
}
}
explore: wh_commerce_cac_ltv_xa
{ hidden: yes }
view: wh_commerce_campaigns_dim {
sql_table_name: wh_commerce_campaigns_dim ;;
set: wh_commerce_campaigns_dim_set {
  fields: [
    budget,
    campaign_name,
    campaign_pk,
    channel,
    platform,
  ]
}
dimension: campaign_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.campaign_pk ;;
  description: "not available"
}
dimension: campaign_name {
  type: string
  sql: ${TABLE}.campaign_name ;;
  description: "not available"
  drill_fields: [wh_commerce_campaigns_dim_set*]
}
dimension: channel {
  type: string
  sql: ${TABLE}.channel ;;
  description: "not available"
  drill_fields: [wh_commerce_campaigns_dim_set*]
}
dimension: platform {
  type: string
  sql: ${TABLE}.platform ;;
  description: "not available"
  drill_fields: [wh_commerce_campaigns_dim_set*]
}
dimension_group: start_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.start_date ;;
  description: "not available"
}
dimension_group: end_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.end_date ;;
  description: "not available"
}
dimension: budget {
  hidden: yes
  type: number
  sql: ${TABLE}.budget ;;
  description: "not available"
}
}
explore: wh_commerce_campaigns_dim
{ hidden: yes }
view: wh_commerce_customer_journeys_xa {
sql_table_name: wh_commerce_customer_journeys_xa ;;
set: wh_commerce_customer_journeys_xa_set {
  fields: [
    action,
    channel,
    conversion_point,
    device,
    duration,
    entry_point,
    feedback,
    journey_index,
    journey_pk,
    location,
    next_stage,
    outcome,
    previous_stage,
    revenue,
    segment,
    stage,
  ]
}
dimension: journey_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.journey_pk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: journey_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
}
dimension: stage {
  type: string
  sql: ${TABLE}.stage ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension_group: timestamp {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.timestamp ;;
  description: "not available"
}
dimension: channel {
  type: string
  sql: ${TABLE}.channel ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: action {
  type: string
  sql: ${TABLE}.action ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: outcome {
  type: string
  sql: ${TABLE}.outcome ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: journey_index {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_index ;;
  description: "not available"
}
dimension: duration {
  hidden: yes
  type: number
  sql: ${TABLE}.duration ;;
  description: "not available"
}
dimension: entry_point {
  type: string
  sql: ${TABLE}.entry_point ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: conversion_point {
  type: string
  sql: ${TABLE}.conversion_point ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: feedback {
  hidden: yes
  type: number
  sql: ${TABLE}.feedback ;;
  description: "not available"
}
dimension: device {
  type: string
  sql: ${TABLE}.device ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: location {
  type: string
  sql: ${TABLE}.location ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: segment {
  type: string
  sql: ${TABLE}.segment ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: previous_stage {
  type: string
  sql: ${TABLE}.previous_stage ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: next_stage {
  type: string
  sql: ${TABLE}.next_stage ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
dimension: revenue {
  hidden: yes
  type: number
  sql: ${TABLE}.revenue ;;
  description: "not available"
}
}
explore: wh_commerce_customer_journeys_xa
{ hidden: yes }
view: wh_commerce_rfm_segments_xa {
sql_table_name: wh_commerce_rfm_segments_xa ;;
set: wh_commerce_rfm_segments_xa_set {
  fields: [
    average_time_between_purchases,
    average_transaction_value,
    customer_segment,
    f_score,
    frequency,
    loyalty_program_membership,
    m_score,
    max_purchase_value,
    min_purchase_value,
    monetary,
    number_of_items_purchased,
    promotions_used,
    r_score,
    recency,
    return_rate,
    rfm_pk,
    rfm_score,
    rfm_sum,
    total_spend,
    total_transactions,
  ]
}
dimension: rfm_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.rfm_pk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension_group: last_purchase_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.last_purchase_date ;;
  description: "not available"
}
dimension_group: first_purchase_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.first_purchase_date ;;
  description: "not available"
}
dimension: total_transactions {
  hidden: yes
  type: number
  sql: ${TABLE}.total_transactions ;;
  description: "not available"
}
dimension: total_spend {
  hidden: yes
  type: number
  sql: ${TABLE}.total_spend ;;
  description: "not available"
}
dimension: average_transaction_value {
  hidden: yes
  type: number
  sql: ${TABLE}.average_transaction_value ;;
  description: "not available"
}
dimension: max_purchase_value {
  hidden: yes
  type: number
  sql: ${TABLE}.max_purchase_value ;;
  description: "not available"
}
dimension: min_purchase_value {
  hidden: yes
  type: number
  sql: ${TABLE}.min_purchase_value ;;
  description: "not available"
}
dimension: number_of_items_purchased {
  hidden: yes
  type: number
  sql: ${TABLE}.number_of_items_purchased ;;
  description: "not available"
}
dimension: return_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.return_rate ;;
  description: "not available"
}
dimension: loyalty_program_membership {
  type: yesno
  sql: ${TABLE}.loyalty_program_membership ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
dimension: promotions_used {
  hidden: yes
  type: number
  sql: ${TABLE}.promotions_used ;;
  description: "not available"
}
dimension: average_time_between_purchases {
  hidden: yes
  type: number
  sql: ${TABLE}.average_time_between_purchases ;;
  description: "not available"
}
dimension: customer_segment {
  type: string
  sql: ${TABLE}.customer_segment ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
dimension: recency {
  hidden: yes
  type: number
  sql: ${TABLE}.recency ;;
  description: "not available"
}
dimension: frequency {
  hidden: yes
  type: number
  sql: ${TABLE}.frequency ;;
  description: "not available"
}
dimension: monetary {
  hidden: yes
  type: number
  sql: ${TABLE}.monetary ;;
  description: "not available"
}
dimension: r_score {
  hidden: yes
  type: number
  sql: ${TABLE}.r_score ;;
  description: "not available"
}
dimension: f_score {
  hidden: yes
  type: number
  sql: ${TABLE}.f_score ;;
  description: "not available"
}
dimension: m_score {
  hidden: yes
  type: number
  sql: ${TABLE}.m_score ;;
  description: "not available"
}
dimension: rfm_score {
  hidden: yes
  type: number
  sql: ${TABLE}.rfm_score ;;
  description: "not available"
}
dimension: rfm_sum {
  hidden: yes
  type: number
  sql: ${TABLE}.rfm_sum ;;
  description: "not available"
}
}
explore: wh_commerce_rfm_segments_xa
{ hidden: yes }
view: wh_commerce_web_events {
sql_table_name: wh_commerce_web_events ;;
set: wh_commerce_web_events_set {
  fields: [event_name, event_pk]
}
dimension: event_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.event_pk ;;
  description: "not available"
}
dimension: session_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.session_fk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: event_name {
  type: string
  sql: ${TABLE}.event_name ;;
  description: "not available"
  drill_fields: [wh_commerce_web_events_set*]
}
}
explore: wh_commerce_web_events
{ hidden: yes }
view: wh_core_customers_dim {
sql_table_name: wh_core_customers_dim ;;
set: wh_core_customers_dim_set {
  fields: [customer_email, customer_pk, persona_type, segment_type]
}
dimension: customer_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.customer_pk ;;
  description: "not available"
}
dimension: persona_type {
  type: string
  sql: ${TABLE}.persona_type ;;
  description: "not available"
  drill_fields: [wh_core_customers_dim_set*]
}
dimension: segment_type {
  type: string
  sql: ${TABLE}.segment_type ;;
  description: "not available"
  drill_fields: [wh_core_customers_dim_set*]
}
dimension: customer_email {
  type: string
  sql: ${TABLE}.customer_email ;;
  description: "not available"
  drill_fields: [wh_core_customers_dim_set*]
}
}
explore: wh_core_customers_dim
{ hidden: yes }
view: wh_core_fintech_customers_dim {
sql_table_name: wh_core_fintech_customers_dim ;;
set: wh_core_fintech_customers_dim_set {
  fields: [customer_email, customer_pk, persona_type, segment_type]
}
dimension: customer_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.customer_pk ;;
  description: "not available"
}
dimension: persona_type {
  type: string
  sql: ${TABLE}.persona_type ;;
  description: "not available"
  drill_fields: [wh_core_fintech_customers_dim_set*]
}
dimension: segment_type {
  type: string
  sql: ${TABLE}.segment_type ;;
  description: "not available"
  drill_fields: [wh_core_fintech_customers_dim_set*]
}
dimension: customer_email {
  type: string
  sql: ${TABLE}.customer_email ;;
  description: "not available"
  drill_fields: [wh_core_fintech_customers_dim_set*]
}
}
explore: wh_core_fintech_customers_dim
{ hidden: yes }
view: wh_core_fintech_products_dim {
sql_table_name: wh_core_fintech_products_dim ;;
set: wh_core_fintech_products_dim_set {
  fields: [
    Cost,
    DAU,
    MAU,
    category,
    price,
    product_name,
    product_pk,
  ]
}
dimension: product_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.product_pk ;;
  description: "not available"
}
dimension: product_name {
  type: string
  sql: ${TABLE}.product_name ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
dimension: category {
  type: string
  sql: ${TABLE}.category ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
dimension: price {
  hidden: yes
  type: number
  sql: ${TABLE}.price ;;
  description: "not available"
}
dimension: Cost {
  hidden: yes
  type: number
  sql: ${TABLE}.Cost ;;
  description: "not available"
}
dimension: DAU {
  hidden: yes
  type: number
  sql: ${TABLE}.DAU ;;
  description: "not available"
}
dimension: MAU {
  hidden: yes
  type: number
  sql: ${TABLE}.MAU ;;
  description: "not available"
}
}
explore: wh_core_fintech_products_dim
{ hidden: yes }
view: wh_core_products_dim {
sql_table_name: wh_core_products_dim ;;
set: wh_core_products_dim_set {
  fields: [
    Cost,
    category,
    price,
    product_name,
    product_pk,
  ]
}
dimension: product_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.product_pk ;;
  description: "not available"
}
dimension: product_name {
  type: string
  sql: ${TABLE}.product_name ;;
  description: "not available"
  drill_fields: [wh_core_products_dim_set*]
}
dimension: category {
  type: string
  sql: ${TABLE}.category ;;
  description: "not available"
  drill_fields: [wh_core_products_dim_set*]
}
dimension: price {
  hidden: yes
  type: number
  sql: ${TABLE}.price ;;
  description: "not available"
}
dimension: Cost {
  hidden: yes
  type: number
  sql: ${TABLE}.Cost ;;
  description: "not available"
}
}
explore: wh_core_products_dim
{ hidden: yes }
view: wh_finance_financial_performance_xa {
sql_table_name: wh_finance_financial_performance_xa ;;
set: wh_finance_financial_performance_xa_set {
  fields: [
    gross_amount,
    net_amount,
    net_margin,
    trading_pk,
    transaction_volume,
  ]
}
dimension: trading_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.trading_pk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: transaction_volume {
  hidden: yes
  type: number
  sql: ${TABLE}.transaction_volume ;;
  description: "not available"
}
dimension: net_margin {
  hidden: yes
  type: number
  sql: ${TABLE}.net_margin ;;
  description: "not available"
}
dimension: gross_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.gross_amount ;;
  description: "not available"
}
dimension: net_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.net_amount ;;
  description: "not available"
}
}
explore: wh_finance_financial_performance_xa
{ hidden: yes }
view: wh_marketing_campaigns_dim {
sql_table_name: wh_marketing_campaigns_dim ;;
set: wh_marketing_campaigns_dim_set {
  fields: [
    budget,
    campaign_name,
    campaign_pk,
    channel,
    platform,
  ]
}
dimension: campaign_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.campaign_pk ;;
  description: "not available"
}
dimension: campaign_name {
  type: string
  sql: ${TABLE}.campaign_name ;;
  description: "not available"
  drill_fields: [wh_marketing_campaigns_dim_set*]
}
dimension: channel {
  type: string
  sql: ${TABLE}.channel ;;
  description: "not available"
  drill_fields: [wh_marketing_campaigns_dim_set*]
}
dimension: platform {
  type: string
  sql: ${TABLE}.platform ;;
  description: "not available"
  drill_fields: [wh_marketing_campaigns_dim_set*]
}
dimension_group: start_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.start_date ;;
  description: "not available"
}
dimension_group: end_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.end_date ;;
  description: "not available"
}
dimension: budget {
  hidden: yes
  type: number
  sql: ${TABLE}.budget ;;
  description: "not available"
}
}
explore: wh_marketing_campaigns_dim
{ hidden: yes }
view: wh_marketing_web_events {
sql_table_name: wh_marketing_web_events ;;
set: wh_marketing_web_events_set {
  fields: [event_name, event_pk]
}
dimension: event_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.event_pk ;;
  description: "not available"
}
dimension: session_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.session_fk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: event_name {
  type: string
  sql: ${TABLE}.event_name ;;
  description: "not available"
  drill_fields: [wh_marketing_web_events_set*]
}
}
explore: wh_marketing_web_events
{ hidden: yes }
view: wh_product_customer_journeys_xa {
sql_table_name: wh_product_customer_journeys_xa ;;
set: wh_product_customer_journeys_xa_set {
  fields: [
    action,
    channel,
    conversion_point,
    device,
    duration,
    entry_point,
    feedback,
    journey_index,
    journey_pk,
    location,
    next_stage,
    outcome,
    previous_stage,
    revenue,
    segment,
    stage,
  ]
}
dimension: journey_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.journey_pk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: journey_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
}
dimension: stage {
  type: string
  sql: ${TABLE}.stage ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension_group: timestamp {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.timestamp ;;
  description: "not available"
}
dimension: channel {
  type: string
  sql: ${TABLE}.channel ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: action {
  type: string
  sql: ${TABLE}.action ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: outcome {
  type: string
  sql: ${TABLE}.outcome ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: journey_index {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_index ;;
  description: "not available"
}
dimension: duration {
  hidden: yes
  type: number
  sql: ${TABLE}.duration ;;
  description: "not available"
}
dimension: entry_point {
  type: string
  sql: ${TABLE}.entry_point ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: conversion_point {
  type: string
  sql: ${TABLE}.conversion_point ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: feedback {
  hidden: yes
  type: number
  sql: ${TABLE}.feedback ;;
  description: "not available"
}
dimension: device {
  type: string
  sql: ${TABLE}.device ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: location {
  type: string
  sql: ${TABLE}.location ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: segment {
  type: string
  sql: ${TABLE}.segment ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: previous_stage {
  type: string
  sql: ${TABLE}.previous_stage ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: next_stage {
  type: string
  sql: ${TABLE}.next_stage ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
dimension: revenue {
  hidden: yes
  type: number
  sql: ${TABLE}.revenue ;;
  description: "not available"
}
}
explore: wh_product_customer_journeys_xa
{ hidden: yes }
view: wh_revenue_cac_ltv_fintech_xa {
sql_table_name: wh_revenue_cac_ltv_fintech_xa ;;
set: wh_revenue_cac_ltv_fintech_xa_set {
  fields: [
    acquisition_channel,
    average_purchase_value,
    churn_rate,
    cost_of_goods_sold_cogs,
    customer_acquisition_cost_cac,
    customer_feedback_scores,
    customer_lifespan,
    customer_segments,
    discount_rate,
    engagement_metrics,
    gross_margin,
    lifetime_value_ltv,
    ltv_pk,
    marketing_expenses,
    profit_margin_per_customer,
    purchase_frequency,
    retention_rate,
    revenue,
    sales_expenses,
  ]
}
dimension: ltv_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.ltv_pk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension: journey_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
}
dimension: customer_acquisition_cost_cac {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_acquisition_cost_cac ;;
  description: "not available"
}
dimension: revenue {
  hidden: yes
  type: number
  sql: ${TABLE}.revenue ;;
  description: "not available"
}
dimension: gross_margin {
  hidden: yes
  type: number
  sql: ${TABLE}.gross_margin ;;
  description: "not available"
}
dimension: lifetime_value_ltv {
  hidden: yes
  type: number
  sql: ${TABLE}.lifetime_value_ltv ;;
  description: "not available"
}
dimension: average_purchase_value {
  hidden: yes
  type: number
  sql: ${TABLE}.average_purchase_value ;;
  description: "not available"
}
dimension: purchase_frequency {
  hidden: yes
  type: number
  sql: ${TABLE}.purchase_frequency ;;
  description: "not available"
}
dimension: customer_lifespan {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_lifespan ;;
  description: "not available"
}
dimension: retention_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.retention_rate ;;
  description: "not available"
}
dimension: churn_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.churn_rate ;;
  description: "not available"
}
dimension: customer_segments {
  type: string
  sql: ${TABLE}.customer_segments ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
dimension: acquisition_channel {
  type: string
  sql: ${TABLE}.acquisition_channel ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
dimension: engagement_metrics {
  hidden: yes
  type: number
  sql: ${TABLE}.engagement_metrics ;;
  description: "not available"
}
dimension: customer_feedback_scores {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_feedback_scores ;;
  description: "not available"
}
dimension: discount_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.discount_rate ;;
  description: "not available"
}
dimension: cost_of_goods_sold_cogs {
  hidden: yes
  type: number
  sql: ${TABLE}.cost_of_goods_sold_cogs ;;
  description: "not available"
}
dimension: marketing_expenses {
  hidden: yes
  type: number
  sql: ${TABLE}.marketing_expenses ;;
  description: "not available"
}
dimension: sales_expenses {
  hidden: yes
  type: number
  sql: ${TABLE}.sales_expenses ;;
  description: "not available"
}
dimension: profit_margin_per_customer {
  hidden: yes
  type: number
  sql: ${TABLE}.profit_margin_per_customer ;;
  description: "not available"
}
dimension_group: transaction_timestamp {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.transaction_timestamp ;;
  description: "not available"
}
}
explore: wh_revenue_cac_ltv_fintech_xa
{ hidden: yes }
view: wh_revenue_rfm_segments_xa {
sql_table_name: wh_revenue_rfm_segments_xa ;;
set: wh_revenue_rfm_segments_xa_set {
  fields: [
    average_time_between_purchases,
    average_transaction_value,
    customer_segment,
    f_score,
    frequency,
    loyalty_program_membership,
    m_score,
    max_purchase_value,
    min_purchase_value,
    monetary,
    number_of_items_purchased,
    promotions_used,
    r_score,
    recency,
    return_rate,
    rfm_pk,
    rfm_score,
    rfm_sum,
    total_spend,
    total_transactions,
  ]
}
dimension: rfm_pk {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.rfm_pk ;;
  description: "not available"
}
dimension: customer_fk {
  hidden: yes
  type: number
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
}
dimension_group: last_purchase_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.last_purchase_date ;;
  description: "not available"
}
dimension_group: first_purchase_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.first_purchase_date ;;
  description: "not available"
}
dimension: total_transactions {
  hidden: yes
  type: number
  sql: ${TABLE}.total_transactions ;;
  description: "not available"
}
dimension: total_spend {
  hidden: yes
  type: number
  sql: ${TABLE}.total_spend ;;
  description: "not available"
}
dimension: average_transaction_value {
  hidden: yes
  type: number
  sql: ${TABLE}.average_transaction_value ;;
  description: "not available"
}
dimension: max_purchase_value {
  hidden: yes
  type: number
  sql: ${TABLE}.max_purchase_value ;;
  description: "not available"
}
dimension: min_purchase_value {
  hidden: yes
  type: number
  sql: ${TABLE}.min_purchase_value ;;
  description: "not available"
}
dimension: number_of_items_purchased {
  hidden: yes
  type: number
  sql: ${TABLE}.number_of_items_purchased ;;
  description: "not available"
}
dimension: return_rate {
  hidden: yes
  type: number
  sql: ${TABLE}.return_rate ;;
  description: "not available"
}
dimension: loyalty_program_membership {
  type: yesno
  sql: ${TABLE}.loyalty_program_membership ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
dimension: promotions_used {
  hidden: yes
  type: number
  sql: ${TABLE}.promotions_used ;;
  description: "not available"
}
dimension: average_time_between_purchases {
  hidden: yes
  type: number
  sql: ${TABLE}.average_time_between_purchases ;;
  description: "not available"
}
dimension: customer_segment {
  type: string
  sql: ${TABLE}.customer_segment ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
dimension: recency {
  hidden: yes
  type: number
  sql: ${TABLE}.recency ;;
  description: "not available"
}
dimension: frequency {
  hidden: yes
  type: number
  sql: ${TABLE}.frequency ;;
  description: "not available"
}
dimension: monetary {
  hidden: yes
  type: number
  sql: ${TABLE}.monetary ;;
  description: "not available"
}
dimension: r_score {
  hidden: yes
  type: number
  sql: ${TABLE}.r_score ;;
  description: "not available"
}
dimension: f_score {
  hidden: yes
  type: number
  sql: ${TABLE}.f_score ;;
  description: "not available"
}
dimension: m_score {
  hidden: yes
  type: number
  sql: ${TABLE}.m_score ;;
  description: "not available"
}
dimension: rfm_score {
  hidden: yes
  type: number
  sql: ${TABLE}.rfm_score ;;
  description: "not available"
}
dimension: rfm_sum {
  hidden: yes
  type: number
  sql: ${TABLE}.rfm_sum ;;
  description: "not available"
}
}
explore: wh_revenue_rfm_segments_xa
{ hidden: yes }

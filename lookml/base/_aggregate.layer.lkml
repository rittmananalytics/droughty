include: "test path"
view: +wh_commerce_attribution_fintech_xa {
measure: count_of_attribution_pk {
  type: count_distinct
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_attribution_pk {
  type: sum_distinct
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_product_fk {
  type: sum_distinct
  sql: ${TABLE}.product_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_journey_fk {
  type: sum_distinct
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_campaign_fk {
  type: sum_distinct
  sql: ${TABLE}.campaign_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_revenue {
  type: sum_distinct
  sql: ${TABLE}.revenue ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_marketing_cost {
  type: sum_distinct
  sql: ${TABLE}.marketing_cost ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_roi {
  type: sum_distinct
  sql: ${TABLE}.roi ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_first_click_attribution {
  type: sum_distinct
  sql: ${TABLE}.first_click_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_last_click_attribution {
  type: sum_distinct
  sql: ${TABLE}.last_click_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_linear_attribution {
  type: sum_distinct
  sql: ${TABLE}.linear_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_time_decay_attribution {
  type: sum_distinct
  sql: ${TABLE}.time_decay_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_position_based_attribution {
  type: sum_distinct
  sql: ${TABLE}.position_based_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_u_shaped_attribution {
  type: sum_distinct
  sql: ${TABLE}.u_shaped_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
measure: sum_of_w_shaped_attribution {
  type: sum_distinct
  sql: ${TABLE}.w_shaped_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_fintech_xa_set*]
}
}
view: +wh_commerce_attribution_xa {
measure: count_of_attribution_pk {
  type: count_distinct
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_attribution_pk {
  type: sum_distinct
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_product_fk {
  type: sum_distinct
  sql: ${TABLE}.product_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_journey_fk {
  type: sum_distinct
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_campaign_fk {
  type: sum_distinct
  sql: ${TABLE}.campaign_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_revenue {
  type: sum_distinct
  sql: ${TABLE}.revenue ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_marketing_cost {
  type: sum_distinct
  sql: ${TABLE}.marketing_cost ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_roi {
  type: sum_distinct
  sql: ${TABLE}.roi ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_first_click_attribution {
  type: sum_distinct
  sql: ${TABLE}.first_click_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_last_click_attribution {
  type: sum_distinct
  sql: ${TABLE}.last_click_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_linear_attribution {
  type: sum_distinct
  sql: ${TABLE}.linear_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_time_decay_attribution {
  type: sum_distinct
  sql: ${TABLE}.time_decay_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_position_based_attribution {
  type: sum_distinct
  sql: ${TABLE}.position_based_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_u_shaped_attribution {
  type: sum_distinct
  sql: ${TABLE}.u_shaped_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
measure: sum_of_w_shaped_attribution {
  type: sum_distinct
  sql: ${TABLE}.w_shaped_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_set*]
}
}
view: +wh_commerce_attribution_xa_legacy {
measure: count_of_attribution_pk {
  type: count_distinct
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_attribution_pk {
  type: sum_distinct
  sql: ${TABLE}.attribution_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_product_fk {
  type: sum_distinct
  sql: ${TABLE}.product_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_journey_fk {
  type: sum_distinct
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_campaign_fk {
  type: sum_distinct
  sql: ${TABLE}.campaign_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_revenue {
  type: sum_distinct
  sql: ${TABLE}.revenue ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_marketing_cost {
  type: sum_distinct
  sql: ${TABLE}.marketing_cost ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_roi {
  type: sum_distinct
  sql: ${TABLE}.roi ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_first_click_attribution {
  type: sum_distinct
  sql: ${TABLE}.first_click_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_last_click_attribution {
  type: sum_distinct
  sql: ${TABLE}.last_click_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_linear_attribution {
  type: sum_distinct
  sql: ${TABLE}.linear_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_time_decay_attribution {
  type: sum_distinct
  sql: ${TABLE}.time_decay_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_position_based_attribution {
  type: sum_distinct
  sql: ${TABLE}.position_based_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_u_shaped_attribution {
  type: sum_distinct
  sql: ${TABLE}.u_shaped_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
measure: sum_of_w_shaped_attribution {
  type: sum_distinct
  sql: ${TABLE}.w_shaped_attribution ;;
  description: "not available"
  drill_fields: [wh_commerce_attribution_xa_legacy_set*]
}
}
view: +wh_commerce_cac_ltv_xa {
measure: count_of_ltv_pk {
  type: count_distinct
  sql: ${TABLE}.ltv_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_ltv_pk {
  type: sum_distinct
  sql: ${TABLE}.ltv_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_journey_fk {
  type: sum_distinct
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_customer_acquisition_cost_cac {
  type: sum_distinct
  sql: ${TABLE}.customer_acquisition_cost_cac ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_revenue {
  type: sum_distinct
  sql: ${TABLE}.revenue ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_gross_margin {
  type: sum_distinct
  sql: ${TABLE}.gross_margin ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_lifetime_value_ltv {
  type: sum_distinct
  sql: ${TABLE}.lifetime_value_ltv ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_average_purchase_value {
  type: sum_distinct
  sql: ${TABLE}.average_purchase_value ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_purchase_frequency {
  type: sum_distinct
  sql: ${TABLE}.purchase_frequency ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_customer_lifespan {
  type: sum_distinct
  sql: ${TABLE}.customer_lifespan ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_retention_rate {
  type: sum_distinct
  sql: ${TABLE}.retention_rate ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_churn_rate {
  type: sum_distinct
  sql: ${TABLE}.churn_rate ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_engagement_metrics {
  type: sum_distinct
  sql: ${TABLE}.engagement_metrics ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_customer_feedback_scores {
  type: sum_distinct
  sql: ${TABLE}.customer_feedback_scores ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_discount_rate {
  type: sum_distinct
  sql: ${TABLE}.discount_rate ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_cost_of_goods_sold_cogs {
  type: sum_distinct
  sql: ${TABLE}.cost_of_goods_sold_cogs ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_marketing_expenses {
  type: sum_distinct
  sql: ${TABLE}.marketing_expenses ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_sales_expenses {
  type: sum_distinct
  sql: ${TABLE}.sales_expenses ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
measure: sum_of_profit_margin_per_customer {
  type: sum_distinct
  sql: ${TABLE}.profit_margin_per_customer ;;
  description: "not available"
  drill_fields: [wh_commerce_cac_ltv_xa_set*]
}
}
view: +wh_commerce_campaigns_dim {
measure: count_of_campaign_pk {
  type: count_distinct
  sql: ${TABLE}.campaign_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_campaigns_dim_set*]
}
measure: sum_of_campaign_pk {
  type: sum_distinct
  sql: ${TABLE}.campaign_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_campaigns_dim_set*]
}
measure: sum_of_budget {
  type: sum_distinct
  sql: ${TABLE}.budget ;;
  description: "not available"
  drill_fields: [wh_commerce_campaigns_dim_set*]
}
}
view: +wh_commerce_customer_journeys_xa {
measure: count_of_journey_pk {
  type: count_distinct
  sql: ${TABLE}.journey_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
measure: sum_of_journey_pk {
  type: sum_distinct
  sql: ${TABLE}.journey_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
measure: sum_of_journey_fk {
  type: sum_distinct
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
measure: sum_of_journey_index {
  type: sum_distinct
  sql: ${TABLE}.journey_index ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
measure: sum_of_duration {
  type: sum_distinct
  sql: ${TABLE}.duration ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
measure: sum_of_feedback {
  type: sum_distinct
  sql: ${TABLE}.feedback ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
measure: sum_of_revenue {
  type: sum_distinct
  sql: ${TABLE}.revenue ;;
  description: "not available"
  drill_fields: [wh_commerce_customer_journeys_xa_set*]
}
}
view: +wh_commerce_rfm_segments_xa {
measure: count_of_rfm_pk {
  type: count_distinct
  sql: ${TABLE}.rfm_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_rfm_pk {
  type: sum_distinct
  sql: ${TABLE}.rfm_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_total_transactions {
  type: sum_distinct
  sql: ${TABLE}.total_transactions ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_total_spend {
  type: sum_distinct
  sql: ${TABLE}.total_spend ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_average_transaction_value {
  type: sum_distinct
  sql: ${TABLE}.average_transaction_value ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_max_purchase_value {
  type: sum_distinct
  sql: ${TABLE}.max_purchase_value ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_min_purchase_value {
  type: sum_distinct
  sql: ${TABLE}.min_purchase_value ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_number_of_items_purchased {
  type: sum_distinct
  sql: ${TABLE}.number_of_items_purchased ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_return_rate {
  type: sum_distinct
  sql: ${TABLE}.return_rate ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_promotions_used {
  type: sum_distinct
  sql: ${TABLE}.promotions_used ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_average_time_between_purchases {
  type: sum_distinct
  sql: ${TABLE}.average_time_between_purchases ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_recency {
  type: sum_distinct
  sql: ${TABLE}.recency ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_frequency {
  type: sum_distinct
  sql: ${TABLE}.frequency ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_monetary {
  type: sum_distinct
  sql: ${TABLE}.monetary ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_r_score {
  type: sum_distinct
  sql: ${TABLE}.r_score ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_f_score {
  type: sum_distinct
  sql: ${TABLE}.f_score ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_m_score {
  type: sum_distinct
  sql: ${TABLE}.m_score ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_rfm_score {
  type: sum_distinct
  sql: ${TABLE}.rfm_score ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
measure: sum_of_rfm_sum {
  type: sum_distinct
  sql: ${TABLE}.rfm_sum ;;
  description: "not available"
  drill_fields: [wh_commerce_rfm_segments_xa_set*]
}
}
view: +wh_commerce_web_events {
measure: count_of_event_pk {
  type: count_distinct
  sql: ${TABLE}.event_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_web_events_set*]
}
measure: sum_of_event_pk {
  type: sum_distinct
  sql: ${TABLE}.event_pk ;;
  description: "not available"
  drill_fields: [wh_commerce_web_events_set*]
}
measure: sum_of_session_fk {
  type: sum_distinct
  sql: ${TABLE}.session_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_web_events_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_commerce_web_events_set*]
}
}
view: +wh_core_customers_dim {
measure: count_of_customer_pk {
  type: count_distinct
  sql: ${TABLE}.customer_pk ;;
  description: "not available"
  drill_fields: [wh_core_customers_dim_set*]
}
measure: sum_of_customer_pk {
  type: sum_distinct
  sql: ${TABLE}.customer_pk ;;
  description: "not available"
  drill_fields: [wh_core_customers_dim_set*]
}
}
view: +wh_core_fintech_customers_dim {
measure: count_of_customer_pk {
  type: count_distinct
  sql: ${TABLE}.customer_pk ;;
  description: "not available"
  drill_fields: [wh_core_fintech_customers_dim_set*]
}
measure: sum_of_customer_pk {
  type: sum_distinct
  sql: ${TABLE}.customer_pk ;;
  description: "not available"
  drill_fields: [wh_core_fintech_customers_dim_set*]
}
}
view: +wh_core_fintech_products_dim {
measure: count_of_product_pk {
  type: count_distinct
  sql: ${TABLE}.product_pk ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
measure: sum_of_product_pk {
  type: sum_distinct
  sql: ${TABLE}.product_pk ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
measure: sum_of_price {
  type: sum_distinct
  sql: ${TABLE}.price ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
measure: sum_of_Cost {
  type: sum_distinct
  sql: ${TABLE}.Cost ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
measure: sum_of_DAU {
  type: sum_distinct
  sql: ${TABLE}.DAU ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
measure: sum_of_MAU {
  type: sum_distinct
  sql: ${TABLE}.MAU ;;
  description: "not available"
  drill_fields: [wh_core_fintech_products_dim_set*]
}
}
view: +wh_core_products_dim {
measure: count_of_product_pk {
  type: count_distinct
  sql: ${TABLE}.product_pk ;;
  description: "not available"
  drill_fields: [wh_core_products_dim_set*]
}
measure: sum_of_product_pk {
  type: sum_distinct
  sql: ${TABLE}.product_pk ;;
  description: "not available"
  drill_fields: [wh_core_products_dim_set*]
}
measure: sum_of_price {
  type: sum_distinct
  sql: ${TABLE}.price ;;
  description: "not available"
  drill_fields: [wh_core_products_dim_set*]
}
measure: sum_of_Cost {
  type: sum_distinct
  sql: ${TABLE}.Cost ;;
  description: "not available"
  drill_fields: [wh_core_products_dim_set*]
}
}
view: +wh_finance_financial_performance_xa {
measure: count_of_trading_pk {
  type: count_distinct
  sql: ${TABLE}.trading_pk ;;
  description: "not available"
  drill_fields: [wh_finance_financial_performance_xa_set*]
}
measure: sum_of_trading_pk {
  type: sum_distinct
  sql: ${TABLE}.trading_pk ;;
  description: "not available"
  drill_fields: [wh_finance_financial_performance_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_finance_financial_performance_xa_set*]
}
measure: sum_of_transaction_volume {
  type: sum_distinct
  sql: ${TABLE}.transaction_volume ;;
  description: "not available"
  drill_fields: [wh_finance_financial_performance_xa_set*]
}
measure: sum_of_net_margin {
  type: sum_distinct
  sql: ${TABLE}.net_margin ;;
  description: "not available"
  drill_fields: [wh_finance_financial_performance_xa_set*]
}
measure: sum_of_gross_amount {
  type: sum_distinct
  sql: ${TABLE}.gross_amount ;;
  description: "not available"
  drill_fields: [wh_finance_financial_performance_xa_set*]
}
measure: sum_of_net_amount {
  type: sum_distinct
  sql: ${TABLE}.net_amount ;;
  description: "not available"
  drill_fields: [wh_finance_financial_performance_xa_set*]
}
}
view: +wh_marketing_campaigns_dim {
measure: count_of_campaign_pk {
  type: count_distinct
  sql: ${TABLE}.campaign_pk ;;
  description: "not available"
  drill_fields: [wh_marketing_campaigns_dim_set*]
}
measure: sum_of_campaign_pk {
  type: sum_distinct
  sql: ${TABLE}.campaign_pk ;;
  description: "not available"
  drill_fields: [wh_marketing_campaigns_dim_set*]
}
measure: sum_of_budget {
  type: sum_distinct
  sql: ${TABLE}.budget ;;
  description: "not available"
  drill_fields: [wh_marketing_campaigns_dim_set*]
}
}
view: +wh_marketing_web_events {
measure: count_of_event_pk {
  type: count_distinct
  sql: ${TABLE}.event_pk ;;
  description: "not available"
  drill_fields: [wh_marketing_web_events_set*]
}
measure: sum_of_event_pk {
  type: sum_distinct
  sql: ${TABLE}.event_pk ;;
  description: "not available"
  drill_fields: [wh_marketing_web_events_set*]
}
measure: sum_of_session_fk {
  type: sum_distinct
  sql: ${TABLE}.session_fk ;;
  description: "not available"
  drill_fields: [wh_marketing_web_events_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_marketing_web_events_set*]
}
}
view: +wh_product_customer_journeys_xa {
measure: count_of_journey_pk {
  type: count_distinct
  sql: ${TABLE}.journey_pk ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
measure: sum_of_journey_pk {
  type: sum_distinct
  sql: ${TABLE}.journey_pk ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
measure: sum_of_journey_fk {
  type: sum_distinct
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
measure: sum_of_journey_index {
  type: sum_distinct
  sql: ${TABLE}.journey_index ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
measure: sum_of_duration {
  type: sum_distinct
  sql: ${TABLE}.duration ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
measure: sum_of_feedback {
  type: sum_distinct
  sql: ${TABLE}.feedback ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
measure: sum_of_revenue {
  type: sum_distinct
  sql: ${TABLE}.revenue ;;
  description: "not available"
  drill_fields: [wh_product_customer_journeys_xa_set*]
}
}
view: +wh_revenue_cac_ltv_fintech_xa {
measure: count_of_ltv_pk {
  type: count_distinct
  sql: ${TABLE}.ltv_pk ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_ltv_pk {
  type: sum_distinct
  sql: ${TABLE}.ltv_pk ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_journey_fk {
  type: sum_distinct
  sql: ${TABLE}.journey_fk ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_customer_acquisition_cost_cac {
  type: sum_distinct
  sql: ${TABLE}.customer_acquisition_cost_cac ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_revenue {
  type: sum_distinct
  sql: ${TABLE}.revenue ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_gross_margin {
  type: sum_distinct
  sql: ${TABLE}.gross_margin ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_lifetime_value_ltv {
  type: sum_distinct
  sql: ${TABLE}.lifetime_value_ltv ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_average_purchase_value {
  type: sum_distinct
  sql: ${TABLE}.average_purchase_value ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_purchase_frequency {
  type: sum_distinct
  sql: ${TABLE}.purchase_frequency ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_customer_lifespan {
  type: sum_distinct
  sql: ${TABLE}.customer_lifespan ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_retention_rate {
  type: sum_distinct
  sql: ${TABLE}.retention_rate ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_churn_rate {
  type: sum_distinct
  sql: ${TABLE}.churn_rate ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_engagement_metrics {
  type: sum_distinct
  sql: ${TABLE}.engagement_metrics ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_customer_feedback_scores {
  type: sum_distinct
  sql: ${TABLE}.customer_feedback_scores ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_discount_rate {
  type: sum_distinct
  sql: ${TABLE}.discount_rate ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_cost_of_goods_sold_cogs {
  type: sum_distinct
  sql: ${TABLE}.cost_of_goods_sold_cogs ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_marketing_expenses {
  type: sum_distinct
  sql: ${TABLE}.marketing_expenses ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_sales_expenses {
  type: sum_distinct
  sql: ${TABLE}.sales_expenses ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
measure: sum_of_profit_margin_per_customer {
  type: sum_distinct
  sql: ${TABLE}.profit_margin_per_customer ;;
  description: "not available"
  drill_fields: [wh_revenue_cac_ltv_fintech_xa_set*]
}
}
view: +wh_revenue_rfm_segments_xa {
measure: count_of_rfm_pk {
  type: count_distinct
  sql: ${TABLE}.rfm_pk ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_rfm_pk {
  type: sum_distinct
  sql: ${TABLE}.rfm_pk ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_customer_fk {
  type: sum_distinct
  sql: ${TABLE}.customer_fk ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_total_transactions {
  type: sum_distinct
  sql: ${TABLE}.total_transactions ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_total_spend {
  type: sum_distinct
  sql: ${TABLE}.total_spend ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_average_transaction_value {
  type: sum_distinct
  sql: ${TABLE}.average_transaction_value ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_max_purchase_value {
  type: sum_distinct
  sql: ${TABLE}.max_purchase_value ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_min_purchase_value {
  type: sum_distinct
  sql: ${TABLE}.min_purchase_value ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_number_of_items_purchased {
  type: sum_distinct
  sql: ${TABLE}.number_of_items_purchased ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_return_rate {
  type: sum_distinct
  sql: ${TABLE}.return_rate ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_promotions_used {
  type: sum_distinct
  sql: ${TABLE}.promotions_used ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_average_time_between_purchases {
  type: sum_distinct
  sql: ${TABLE}.average_time_between_purchases ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_recency {
  type: sum_distinct
  sql: ${TABLE}.recency ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_frequency {
  type: sum_distinct
  sql: ${TABLE}.frequency ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_monetary {
  type: sum_distinct
  sql: ${TABLE}.monetary ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_r_score {
  type: sum_distinct
  sql: ${TABLE}.r_score ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_f_score {
  type: sum_distinct
  sql: ${TABLE}.f_score ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_m_score {
  type: sum_distinct
  sql: ${TABLE}.m_score ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_rfm_score {
  type: sum_distinct
  sql: ${TABLE}.rfm_score ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
measure: sum_of_rfm_sum {
  type: sum_distinct
  sql: ${TABLE}.rfm_sum ;;
  description: "not available"
  drill_fields: [wh_revenue_rfm_segments_xa_set*]
}
}

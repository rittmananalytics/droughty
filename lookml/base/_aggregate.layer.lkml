include: "/lookml/base/_base.layer.lkml"
view: +wh_connectivity__connectivity_heartbeats_fact {
measure: count_of_connectivity_heartbeat_pk {
  type: count_distinct
  sql: ${TABLE}.connectivity_heartbeat_pk ;;
  description: "the primary key for the connectivity summary table - a hash of the vrn"
  drill_fields: [wh_connectivity__connectivity_heartbeats_fact_set*]
}
}
view: +wh_connectivity__connectivity_summary_xa {
measure: count_of_connectivity_summary_pk {
  type: count_distinct
  sql: ${TABLE}.connectivity_summary_pk ;;
  description: "the primary key for the connectivity summary table - a hash of the vrn"
  drill_fields: [wh_connectivity__connectivity_summary_xa_set*]
}
}
view: +wh_core__business_types_dim {
measure: count_of_business_type_pk {
  type: count_distinct
  sql: ${TABLE}.business_type_pk ;;
  description: "the primary key for a business type"
  drill_fields: [wh_core__business_types_dim_set*]
}
}
view: +wh_core__customers_dim {
measure: sum_of_customer_numeric_natural_key {
  type: sum_distinct
  sql: ${TABLE}.customer_numeric_natural_key ;;
  description: "the numeric id for a customer"
  drill_fields: [wh_core__customers_dim_set*]
}
measure: count_of_customer_pk {
  type: count_distinct
  sql: ${TABLE}.customer_pk ;;
  description: "a surrogate key for the uuid of a customer"
  drill_fields: [wh_core__customers_dim_set*]
}
}
view: +wh_gocardless__transactions_fact {
measure: sum_of_transaction_amount {
  type: sum_distinct
  sql: ${TABLE}.transaction_amount ;;
  description: "the amount of the gocardless payment"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
measure: count_of_transaction_pk {
  type: count_distinct
  sql: ${TABLE}.transaction_pk ;;
  description: "the natural key from the gocardless transaction table"
  drill_fields: [wh_gocardless__transactions_fact_set*]
}
}
view: +wh_hubspot__companies_dim {
measure: count_of_company_pk {
  type: count_distinct
  sql: ${TABLE}.company_pk ;;
  description: "a surrogate primary key for a company"
  drill_fields: [wh_hubspot__companies_dim_set*]
}
}
view: +wh_hubspot__deal_company_bridge {
measure: count_of_deal_company_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.deal_company_bridge_pk ;;
  description: "a surrogate primary key for an entry in the deal company bridge table"
  drill_fields: [wh_hubspot__deal_company_bridge_set*]
}
}
view: +wh_hubspot__deal_pipelines_dim {
measure: count_of_deal_pipeline_pk {
  type: count_distinct
  sql: ${TABLE}.deal_pipeline_pk ;;
  description: "a surrogate primary key for a deal pipeline"
  drill_fields: [wh_hubspot__deal_pipelines_dim_set*]
}
}
view: +wh_hubspot__deal_stage_changes_fact {
measure: count_of_deal_stage_change_pk {
  type: count_distinct
  sql: ${TABLE}.deal_stage_change_pk ;;
  description: "a surrogate primary key for a deal stage change"
  drill_fields: [wh_hubspot__deal_stage_changes_fact_set*]
}
}
view: +wh_hubspot__deal_stages_dim {
measure: sum_of_deal_stage_display_order {
  type: sum_distinct
  sql: ${TABLE}.deal_stage_display_order ;;
  description: "the order of deal stages through a pipeline"
  drill_fields: [wh_hubspot__deal_stages_dim_set*]
}
measure: count_of_deal_stage_pk {
  type: count_distinct
  sql: ${TABLE}.deal_stage_pk ;;
  description: "a surrogate foreign key for a deal stage"
  drill_fields: [wh_hubspot__deal_stages_dim_set*]
}
measure: sum_of_deal_stage_probability {
  type: sum_distinct
  sql: ${TABLE}.deal_stage_probability ;;
  description: "the probability for a deal stage in hubspot"
  drill_fields: [wh_hubspot__deal_stages_dim_set*]
}
}
view: +wh_hubspot__deals_dim {
measure: sum_of_deal_broker_commission_percentage {
  type: sum_distinct
  sql: ${TABLE}.deal_broker_commission_percentage ;;
  description: "the broker's commission percentage for a deal"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
measure: sum_of_deal_closed_amount {
  type: sum_distinct
  sql: ${TABLE}.deal_closed_amount ;;
  description: "the amount a deal closed for in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
measure: sum_of_deal_days_to_close {
  type: sum_distinct
  sql: ${TABLE}.deal_days_to_close ;;
  description: "the number of days between a deal being submitted and either the current date or the date it closed"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
measure: sum_of_deal_fleet_size {
  type: sum_distinct
  sql: ${TABLE}.deal_fleet_size ;;
  description: "the fleet size for a deal in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
measure: count_of_deal_pk {
  type: count_distinct
  sql: ${TABLE}.deal_pk ;;
  description: "a surrogate primary key for a deal"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
measure: sum_of_deal_projected_amount {
  type: sum_distinct
  sql: ${TABLE}.deal_projected_amount ;;
  description: "the projected amount for a deal in hubspot"
  drill_fields: [wh_hubspot__deals_dim_set*]
}
}
view: +wh_hubspot__owners_dim {
measure: count_of_owner_pk {
  type: count_distinct
  sql: ${TABLE}.owner_pk ;;
  description: "a surrogate primary key for an owner"
  drill_fields: [wh_hubspot__owners_dim_set*]
}
}
view: +wh_platform__bordereaux_fact {
measure: sum_of_bordereaux_brokerage {
  type: sum_distinct
  sql: ${TABLE}.bordereaux_brokerage ;;
  description: "the brokerage element of a bordereaux in local currency"
  drill_fields: [wh_platform__bordereaux_fact_set*]
}
measure: sum_of_bordereaux_fee {
  type: sum_distinct
  sql: ${TABLE}.bordereaux_fee ;;
  description: "the transaction fee element of a bordereaux in local currency"
  drill_fields: [wh_platform__bordereaux_fact_set*]
}
measure: sum_of_bordereaux_gross_discount {
  type: sum_distinct
  sql: ${TABLE}.bordereaux_gross_discount ;;
  description: "the amount of gross premium flock has had to pay as a result of the discount applied"
  drill_fields: [wh_platform__bordereaux_fact_set*]
}
measure: sum_of_bordereaux_net {
  type: sum_distinct
  sql: ${TABLE}.bordereaux_net ;;
  description: "the net premium of a bordereaux"
  drill_fields: [wh_platform__bordereaux_fact_set*]
}
measure: count_of_bordereaux_pk {
  type: count_distinct
  sql: ${TABLE}.bordereaux_pk ;;
  description: "a surrogate key for the uuid of a bordereaux"
  drill_fields: [wh_platform__bordereaux_fact_set*]
}
measure: sum_of_bordereaux_tax {
  type: sum_distinct
  sql: ${TABLE}.bordereaux_tax ;;
  description: "the ipt of a bordereaux"
  drill_fields: [wh_platform__bordereaux_fact_set*]
}
measure: sum_of_bordereaux_tax_discount {
  type: sum_distinct
  sql: ${TABLE}.bordereaux_tax_discount ;;
  description: "the amount of ipt flock has had to pay as a result of the discount applied"
  drill_fields: [wh_platform__bordereaux_fact_set*]
}
}
view: +wh_platform__brokers_bridge {
measure: count_of_broker_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.broker_bridge_pk ;;
  description: "a surrogate key for the uuid of a quote broker"
  drill_fields: [wh_platform__brokers_bridge_set*]
}
measure: sum_of_broker_fees_split {
  type: sum_distinct
  sql: ${TABLE}.broker_fees_split ;;
  description: "the percentage split of the risk fees to be paid to the broker"
  drill_fields: [wh_platform__brokers_bridge_set*]
}
measure: sum_of_broker_gross_premium_split {
  type: sum_distinct
  sql: ${TABLE}.broker_gross_premium_split ;;
  description: "the percentage split of the risk gross premium to be paid to the broker"
  drill_fields: [wh_platform__brokers_bridge_set*]
}
}
view: +wh_platform__brokers_dim {
measure: count_of_broker_pk {
  type: count_distinct
  sql: ${TABLE}.broker_pk ;;
  description: "a surrogate key for the uuid of a broker"
  drill_fields: [wh_platform__brokers_dim_set*]
}
measure: sum_of_broker_remuneration_rate {
  type: sum_distinct
  sql: ${TABLE}.broker_remuneration_rate ;;
  description: "the % used against the gross written premium to calculate the commission owed to a broker"
  drill_fields: [wh_platform__brokers_dim_set*]
}
}
view: +wh_platform__capacity_providers_dim {
measure: count_of_capacity_provider_pk {
  type: count_distinct
  sql: ${TABLE}.capacity_provider_pk ;;
  description: "a surrogate key for the uuid of a broker"
  drill_fields: [wh_platform__capacity_providers_dim_set*]
}
}
view: +wh_platform__invoices_fact {
measure: sum_of_invoice_fees {
  type: sum_distinct
  sql: ${TABLE}.invoice_fees ;;
  description: "the total transaction fees for an invoice"
  drill_fields: [wh_platform__invoices_fact_set*]
}
measure: sum_of_invoice_gross_premium {
  type: sum_distinct
  sql: ${TABLE}.invoice_gross_premium ;;
  description: "the gross premium for an invoice"
  drill_fields: [wh_platform__invoices_fact_set*]
}
measure: count_of_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.invoice_pk ;;
  description: "a surrogate key for the uuid of an invoice"
  drill_fields: [wh_platform__invoices_fact_set*]
}
measure: sum_of_invoice_tax {
  type: sum_distinct
  sql: ${TABLE}.invoice_tax ;;
  description: "the ipt for an invoice"
  drill_fields: [wh_platform__invoices_fact_set*]
}
}
view: +wh_platform__mid_upload_fact {
}
view: +wh_platform__policies_fact {
measure: count_of_policy_pk {
  type: count_distinct
  sql: ${TABLE}.policy_pk ;;
  description: "a surrogate key for the uuid of a policy"
  drill_fields: [wh_platform__policies_fact_set*]
}
}
view: +wh_platform__policy_capacity_providers_bridge {
measure: sum_of_capacity_provider_net_premium_split {
  type: sum_distinct
  sql: ${TABLE}.capacity_provider_net_premium_split ;;
  description: "the perc split of the net premium of a risk for the capacity provider"
  drill_fields: [wh_platform__policy_capacity_providers_bridge_set*]
}
measure: sum_of_capacity_provider_tax_split {
  type: sum_distinct
  sql: ${TABLE}.capacity_provider_tax_split ;;
  description: "the perc split of the ipt for a risk for the capacity provider"
  drill_fields: [wh_platform__policy_capacity_providers_bridge_set*]
}
measure: count_of_policy_capacity_providers_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.policy_capacity_providers_bridge_pk ;;
  description: "a surrogate key for the uuid of a policy capacity provider"
  drill_fields: [wh_platform__policy_capacity_providers_bridge_set*]
}
}
view: +wh_platform__policy_deposits_dim {
measure: sum_of_policy_deposit {
  type: sum_distinct
  sql: ${TABLE}.policy_deposit ;;
  description: "the deposit of the risk"
  drill_fields: [wh_platform__policy_deposits_dim_set*]
}
measure: count_of_policy_deposit_pk {
  type: count_distinct
  sql: ${TABLE}.policy_deposit_pk ;;
  description: "the primary key of the policy deposit table"
  drill_fields: [wh_platform__policy_deposits_dim_set*]
}
}
view: +wh_platform__premium_xa {
measure: sum_of_earned_gross_written_premium {
  type: sum_distinct
  sql: ${TABLE}.earned_gross_written_premium ;;
  description: "the total gwp earned so far on a risk"
  drill_fields: [wh_platform__premium_xa_set*]
}
measure: sum_of_earned_net_written_premium {
  type: sum_distinct
  sql: ${TABLE}.earned_net_written_premium ;;
  description: "the total nwp earned so far on a risk"
  drill_fields: [wh_platform__premium_xa_set*]
}
measure: sum_of_gross_written_premium {
  type: sum_distinct
  sql: ${TABLE}.gross_written_premium ;;
  description: "the gwp for a risk. net premium + brokerage"
  drill_fields: [wh_platform__premium_xa_set*]
}
measure: sum_of_net_written_premium {
  type: sum_distinct
  sql: ${TABLE}.net_written_premium ;;
  description: "the nwp for a risk"
  drill_fields: [wh_platform__premium_xa_set*]
}
measure: count_of_premium_pk {
  type: count_distinct
  sql: ${TABLE}.premium_pk ;;
  description: "the surrogate primary key for the premium xa table"
  drill_fields: [wh_platform__premium_xa_set*]
}
}
view: +wh_platform__products_dim {
measure: count_of_product_pk {
  type: count_distinct
  sql: ${TABLE}.product_pk ;;
  description: "a surrogate key for the uuid of a product"
  drill_fields: [wh_platform__products_dim_set*]
}
}
view: +wh_platform__quotes_fact {
measure: sum_of_quote_average_annual_burning_cost {
  type: sum_distinct
  sql: ${TABLE}.quote_average_annual_burning_cost ;;
  description: "the average annual burning calculated from the actuarial algorithms"
  drill_fields: [wh_platform__quotes_fact_set*]
}
measure: sum_of_quote_brokerage {
  type: sum_distinct
  sql: ${TABLE}.quote_brokerage ;;
  description: "the brokerage of a quote"
  drill_fields: [wh_platform__quotes_fact_set*]
}
measure: sum_of_quote_excess {
  type: sum_distinct
  sql: ${TABLE}.quote_excess ;;
  description: "the excess on a quote"
  drill_fields: [wh_platform__quotes_fact_set*]
}
measure: sum_of_quote_fee {
  type: sum_distinct
  sql: ${TABLE}.quote_fee ;;
  description: "the fee for a quote"
  drill_fields: [wh_platform__quotes_fact_set*]
}
measure: sum_of_quote_net_premium {
  type: sum_distinct
  sql: ${TABLE}.quote_net_premium ;;
  description: "the net premium for a quote"
  drill_fields: [wh_platform__quotes_fact_set*]
}
measure: count_of_quote_pk {
  type: count_distinct
  sql: ${TABLE}.quote_pk ;;
  description: "a surrogate key for the uuid of a quote"
  drill_fields: [wh_platform__quotes_fact_set*]
}
measure: sum_of_quote_tax {
  type: sum_distinct
  sql: ${TABLE}.quote_tax ;;
  description: "the ipt of a quote"
  drill_fields: [wh_platform__quotes_fact_set*]
}
}
view: +wh_platform__schedules_fact {
measure: count_of_schedule_pk {
  type: count_distinct
  sql: ${TABLE}.schedule_pk ;;
  description: "a surrogate key for the uuid of a schedule"
  drill_fields: [wh_platform__schedules_fact_set*]
}
}
view: +wh_platform__vehicles_bridge {
measure: count_of_vehicle_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.vehicle_bridge_pk ;;
  description: "a surrogate key for the uuid of a quote vehicle"
  drill_fields: [wh_platform__vehicles_bridge_set*]
}
}
view: +wh_platform__vehicles_dim {
measure: sum_of_vehicle_gross_weight_kg {
  type: sum_distinct
  sql: ${TABLE}.vehicle_gross_weight_kg ;;
  description: "the gross weight of a vehicle in kilograms"
  drill_fields: [wh_platform__vehicles_dim_set*]
}
measure: count_of_vehicle_pk {
  type: count_distinct
  sql: ${TABLE}.vehicle_pk ;;
  description: "a surrogate key for the uuid for a vehicle"
  drill_fields: [wh_platform__vehicles_dim_set*]
}
}
view: +wh_targets__targets_dim {
measure: sum_of_target_active_brokers {
  type: sum_distinct
  sql: ${TABLE}.target_active_brokers ;;
  description: "the target for active brokers"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_average_deal_size {
  type: sum_distinct
  sql: ${TABLE}.target_average_deal_size ;;
  description: "the target for average deal size for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_bound_count {
  type: sum_distinct
  sql: ${TABLE}.target_bound_count ;;
  description: "the bound count target for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_bound_new_gwp {
  type: sum_distinct
  sql: ${TABLE}.target_bound_new_gwp ;;
  description: "the target for bound gwp for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_broker_nps {
  type: sum_distinct
  sql: ${TABLE}.target_broker_nps ;;
  description: "the target for broker nps"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_cash {
  type: sum_distinct
  sql: ${TABLE}.target_cash ;;
  description: "the cash target"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_conversion {
  type: sum_distinct
  sql: ${TABLE}.target_conversion ;;
  description: "the target conversion rate for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_fleet_nps {
  type: sum_distinct
  sql: ${TABLE}.target_fleet_nps ;;
  description: "the target for fleet nps"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_mta_gwp {
  type: sum_distinct
  sql: ${TABLE}.target_mta_gwp ;;
  description: "the target gwp for mtas"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_new_broker_offices_monthly {
  type: sum_distinct
  sql: ${TABLE}.target_new_broker_offices_monthly ;;
  description: "the target for number of broker offices (monthly)"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_number_of_deals_per_broker_monthly {
  type: sum_distinct
  sql: ${TABLE}.target_number_of_deals_per_broker_monthly ;;
  description: "the target for number of deals per broker (monthly) for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: count_of_target_pk {
  type: count_distinct
  sql: ${TABLE}.target_pk ;;
  description: "the date for a target"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_proportion_in_appetite_flat {
  type: sum_distinct
  sql: ${TABLE}.target_proportion_in_appetite_flat ;;
  description: "the % in appetite (flat) target for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_quote_to_issued_rate_flat {
  type: sum_distinct
  sql: ${TABLE}.target_quote_to_issued_rate_flat ;;
  description: "the target for quote to issued rate (flat) for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_renewal_gwp {
  type: sum_distinct
  sql: ${TABLE}.target_renewal_gwp ;;
  description: "the target gwp for renewals"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_renewal_rate_flat {
  type: sum_distinct
  sql: ${TABLE}.target_renewal_rate_flat ;;
  description: "the target for renewal % (flat)"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_strike_rate_flat {
  type: sum_distinct
  sql: ${TABLE}.target_strike_rate_flat ;;
  description: "the strike rate target for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_submissions {
  type: sum_distinct
  sql: ${TABLE}.target_submissions ;;
  description: "the submissions target for new business"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_total_broker_offices {
  type: sum_distinct
  sql: ${TABLE}.target_total_broker_offices ;;
  description: "the target for total broker offices"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_ultimate_loss_ratio {
  type: sum_distinct
  sql: ${TABLE}.target_ultimate_loss_ratio ;;
  description: "the target for ultimate loss ratio"
  drill_fields: [wh_targets__targets_dim_set*]
}
measure: sum_of_target_vehicles_connected {
  type: sum_distinct
  sql: ${TABLE}.target_vehicles_connected ;;
  description: "the target for the proportion of vehicles connected"
  drill_fields: [wh_targets__targets_dim_set*]
}
}
view: +wh_underwriting__claims_fact {
measure: sum_of_claim_age_of_driver {
  type: sum_distinct
  sql: ${TABLE}.claim_age_of_driver ;;
  description: "the age of the driver on a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_days_to_report {
  type: sum_distinct
  sql: ${TABLE}.claim_days_to_report ;;
  description: "the number of days between an accident happening and a claim being reported"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_ad_paid {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_ad_paid ;;
  description: "the amount paid for our insured's vehicle damage"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_ad_recovered {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_ad_recovered ;;
  description: "the amount recovered after paying for our insured's vehicle damage"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_ad_reserve {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_ad_reserve ;;
  description: "the amount we anticipate to pay for our insured's vehicle damage"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_total_incurred {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_total_incurred ;;
  description: "the total claim amount"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_total_paid {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_total_paid ;;
  description: "the total amount paid"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_total_recovered {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_total_recovered ;;
  description: "the total amount recovered"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_total_reserve {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_total_reserve ;;
  description: "the total amount we anticipate to pay"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_tppd_paid {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_tppd_paid ;;
  description: "the amount paid for third party property damage"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_tppd_recovered {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_tppd_recovered ;;
  description: "the amount recovered after paying for third party property damage"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_tppd_reserve {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_tppd_reserve ;;
  description: "the amount we anticipate to pay for third party property damage"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_tppi_paid {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_tppi_paid ;;
  description: "the amount paid for third party personal injury"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_tppi_recovered {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_tppi_recovered ;;
  description: "the amount recovered after paying for third party personal injury"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_insurer_tppi_reserve {
  type: sum_distinct
  sql: ${TABLE}.claim_insurer_tppi_reserve ;;
  description: "the amount we anticipate to pay for third party personal injury"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: count_of_claim_pk {
  type: count_distinct
  sql: ${TABLE}.claim_pk ;;
  description: "a surrogate key for a claim"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
measure: sum_of_claim_year_of_account {
  type: sum_distinct
  sql: ${TABLE}.claim_year_of_account ;;
  description: "the year the account associated with a claim was opened"
  drill_fields: [wh_underwriting__claims_fact_set*]
}
}

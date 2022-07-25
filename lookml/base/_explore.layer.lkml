include: "/lookml/base/_base.layer.lkml"
include: "/lookml/aggregate/_aggregate.layer.lkml"
explore: wh_platform__quotes_fact_explore {
hidden: no
view_name: wh_platform__quotes_fact
join: wh_hubspot__deal_company_bridge_wh_hubspot__deals_dim {
  sql_on: ${wh_hubspot__deals_dim.deal_fk} = ${wh_hubspot__deal_company_bridge.deal_pk} ;;
  relationship: one_to_many
  from: wh_hubspot__deals_dim
}
join: wh_platform__capacity_providers_dim {
  sql_on: ${wh_platform__capacity_providers_dim.capacity_provider_fk} = ${wh_platform__policy_capacity_providers_bridge.capacity_provider_pk} ;;
  relationship: one_to_many
}
join: wh_platform__vehicles_bridge_wh_platform__quotes_fact {
  sql_on: ${wh_platform__quotes_fact.quote_fk} = ${wh_platform__vehicles_bridge.quote_pk} ;;
  relationship: one_to_many
  from: wh_platform__quotes_fact
}
join: wh_hubspot__companies_dim {
  sql_on: ${wh_hubspot__companies_dim.company_fk} = ${wh_hubspot__deal_company_bridge.company_pk} ;;
  relationship: many_to_one
}
join: wh_platform__policy_capacity_providers_bridge_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__policy_capacity_providers_bridge.policy_pk} ;;
  relationship: one_to_one
  from: wh_platform__policies_fact
}
join: wh_platform__quotes_fact_wh_platform__products_dim {
  sql_on: ${wh_platform__products_dim.product_fk} = ${wh_platform__quotes_fact.product_pk} ;;
  relationship: one_to_many
  from: wh_platform__products_dim
}
join: wh_platform__premium_xa_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__premium_xa.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
join: wh_hubspot__deal_stage_changes_fact_wh_hubspot__deals_dim {
  sql_on: ${wh_hubspot__deals_dim.deal_fk} = ${wh_hubspot__deal_stage_changes_fact.deal_pk} ;;
  relationship: one_to_many
  from: wh_hubspot__deals_dim
}
join: wh_platform__bordereaux_fact_wh_core__business_types_dim {
  sql_on: ${wh_core__business_types_dim.business_type_fk} = ${wh_platform__bordereaux_fact.business_type_pk} ;;
  relationship: one_to_many
  from: wh_core__business_types_dim
}
join: wh_platform__policies_fact_wh_core__customers_dim {
  sql_on: ${wh_core__customers_dim.customer_fk} = ${wh_platform__policies_fact.customer_pk} ;;
  relationship: many_to_one
  from: wh_core__customers_dim
}
join: wh_underwriting__claims_fact_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_underwriting__claims_fact.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
join: wh_platform__schedules_fact_wh_platform__quotes_fact {
  sql_on: ${wh_platform__quotes_fact.quote_fk} = ${wh_platform__schedules_fact.quote_pk} ;;
  relationship: many_to_one
  from: wh_platform__quotes_fact
}
join: wh_platform__vehicles_dim {
  sql_on: ${wh_platform__vehicles_dim.vehicle_fk} = ${wh_platform__vehicles_bridge.vehicle_pk} ;;
  relationship: one_to_many
}
join: wh_platform__premium_xa_wh_platform__schedules_fact {
  sql_on: ${wh_platform__schedules_fact.schedule_fk} = ${wh_platform__premium_xa.schedule_pk} ;;
  relationship: many_to_one
  from: wh_platform__schedules_fact
}
join: wh_hubspot__deals_dim_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_hubspot__deals_dim.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
join: wh_platform__bordereaux_fact_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__bordereaux_fact.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
join: wh_platform__brokers_dim {
  sql_on: ${wh_platform__brokers_dim.broker_fk} = ${wh_platform__brokers_bridge.broker_pk} ;;
  relationship: one_to_many
}
join: wh_platform__quotes_fact_wh_core__customers_dim {
  sql_on: ${wh_core__customers_dim.customer_fk} = ${wh_platform__quotes_fact.customer_pk} ;;
  relationship: many_to_one
  from: wh_core__customers_dim
}
join: wh_platform__bordereaux_fact_wh_platform__schedules_fact {
  sql_on: ${wh_platform__schedules_fact.schedule_fk} = ${wh_platform__bordereaux_fact.schedule_pk} ;;
  relationship: one_to_many
  from: wh_platform__schedules_fact
}
join: wh_platform__quotes_fact_wh_core__business_types_dim {
  sql_on: ${wh_core__business_types_dim.business_type_fk} = ${wh_platform__quotes_fact.business_type_pk} ;;
  relationship: one_to_many
  from: wh_core__business_types_dim
}
join: wh_hubspot__deals_dim_wh_hubspot__deal_stages_dim {
  sql_on: ${wh_hubspot__deal_stages_dim.deal_stage_fk} = ${wh_hubspot__deals_dim.deal_stage_pk} ;;
  relationship: one_to_many
  from: wh_hubspot__deal_stages_dim
}
join: wh_platform__invoices_fact_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__invoices_fact.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
join: wh_hubspot__deal_stage_changes_fact_wh_hubspot__deal_stages_dim {
  sql_on: ${wh_hubspot__deal_stages_dim.deal_stage_fk} = ${wh_hubspot__deal_stage_changes_fact.deal_stage_pk} ;;
  relationship: one_to_many
  from: wh_hubspot__deal_stages_dim
}
join: wh_platform__brokers_bridge_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__brokers_bridge.policy_pk} ;;
  relationship: many_to_one
  from: wh_platform__policies_fact
}
join: wh_platform__schedules_fact_wh_core__business_types_dim {
  sql_on: ${wh_core__business_types_dim.business_type_fk} = ${wh_platform__schedules_fact.business_type_pk} ;;
  relationship: one_to_many
  from: wh_core__business_types_dim
}
join: wh_hubspot__deals_dim_wh_hubspot__deal_pipelines_dim {
  sql_on: ${wh_hubspot__deal_pipelines_dim.deal_pipeline_fk} = ${wh_hubspot__deals_dim.deal_pipeline_pk} ;;
  relationship: one_to_many
  from: wh_hubspot__deal_pipelines_dim
}
join: wh_hubspot__owners_dim {
  sql_on: ${wh_hubspot__owners_dim.owner_fk} = ${wh_hubspot__deals_dim.owner_pk} ;;
  relationship: one_to_many
}
join: wh_hubspot__deal_stages_dim_wh_hubspot__deal_pipelines_dim {
  sql_on: ${wh_hubspot__deal_pipelines_dim.deal_pipeline_fk} = ${wh_hubspot__deal_stages_dim.deal_pipeline_pk} ;;
  relationship: one_to_many
  from: wh_hubspot__deal_pipelines_dim
}
join: wh_platform__policies_fact_wh_core__business_types_dim {
  sql_on: ${wh_core__business_types_dim.business_type_fk} = ${wh_platform__policies_fact.business_type_pk} ;;
  relationship: one_to_many
  from: wh_core__business_types_dim
}
join: wh_underwriting__claims_fact {
  sql_on: ${wh_underwriting__claims_fact.claim_fk} = ${wh_platform__policies_fact.claim_pk} ;;
  relationship: many_to_one
}
join: wh_platform__policies_fact_wh_platform__products_dim {
  sql_on: ${wh_platform__products_dim.product_fk} = ${wh_platform__policies_fact.product_pk} ;;
  relationship: one_to_many
  from: wh_platform__products_dim
}
join: wh_platform__schedules_fact_wh_platform__policies_fact {
  sql_on: ${wh_platform__policies_fact.policy_fk} = ${wh_platform__schedules_fact.policy_pk} ;;
  relationship: one_to_many
  from: wh_platform__policies_fact
}
}

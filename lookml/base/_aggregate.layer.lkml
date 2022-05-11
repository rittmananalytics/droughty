include: "/lookml/base/_base.layer.lkml"
view: +call_center {
measure: sum_of_cc_call_center_sk {
  type: sum_distinct
  sql: ${TABLE}.cc_call_center_sk ;;
  description: "not available"
}
measure: sum_of_cc_closed_date_sk {
  type: sum_distinct
  sql: ${TABLE}.cc_closed_date_sk ;;
  description: "not available"
}
measure: sum_of_cc_company {
  type: sum_distinct
  sql: ${TABLE}.cc_company ;;
  description: "not available"
}
measure: sum_of_cc_division {
  type: sum_distinct
  sql: ${TABLE}.cc_division ;;
  description: "not available"
}
measure: sum_of_cc_employees {
  type: sum_distinct
  sql: ${TABLE}.cc_employees ;;
  description: "not available"
}
measure: sum_of_cc_gmt_offset {
  type: sum_distinct
  sql: ${TABLE}.cc_gmt_offset ;;
  description: "not available"
}
measure: sum_of_cc_mkt_id {
  type: sum_distinct
  sql: ${TABLE}.cc_mkt_id ;;
  description: "not available"
}
measure: sum_of_cc_open_date_sk {
  type: sum_distinct
  sql: ${TABLE}.cc_open_date_sk ;;
  description: "not available"
}
measure: sum_of_cc_sq_ft {
  type: sum_distinct
  sql: ${TABLE}.cc_sq_ft ;;
  description: "not available"
}
measure: sum_of_cc_tax_percentage {
  type: sum_distinct
  sql: ${TABLE}.cc_tax_percentage ;;
  description: "not available"
}
}
view: +catalog_page {
measure: sum_of_cp_catalog_number {
  type: sum_distinct
  sql: ${TABLE}.cp_catalog_number ;;
  description: "not available"
}
measure: sum_of_cp_catalog_page_number {
  type: sum_distinct
  sql: ${TABLE}.cp_catalog_page_number ;;
  description: "not available"
}
measure: sum_of_cp_catalog_page_sk {
  type: sum_distinct
  sql: ${TABLE}.cp_catalog_page_sk ;;
  description: "not available"
}
measure: sum_of_cp_end_date_sk {
  type: sum_distinct
  sql: ${TABLE}.cp_end_date_sk ;;
  description: "not available"
}
measure: sum_of_cp_start_date_sk {
  type: sum_distinct
  sql: ${TABLE}.cp_start_date_sk ;;
  description: "not available"
}
}
view: +catalog_returns {
measure: sum_of_cr_call_center_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_call_center_sk ;;
  description: "not available"
}
measure: sum_of_cr_catalog_page_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_catalog_page_sk ;;
  description: "not available"
}
measure: sum_of_cr_fee {
  type: sum_distinct
  sql: ${TABLE}.cr_fee ;;
  description: "not available"
}
measure: sum_of_cr_item_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_item_sk ;;
  description: "not available"
}
measure: sum_of_cr_net_loss {
  type: sum_distinct
  sql: ${TABLE}.cr_net_loss ;;
  description: "not available"
}
measure: sum_of_cr_order_number {
  type: sum_distinct
  sql: ${TABLE}.cr_order_number ;;
  description: "not available"
}
measure: sum_of_cr_reason_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_reason_sk ;;
  description: "not available"
}
measure: sum_of_cr_refunded_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_refunded_addr_sk ;;
  description: "not available"
}
measure: sum_of_cr_refunded_cash {
  type: sum_distinct
  sql: ${TABLE}.cr_refunded_cash ;;
  description: "not available"
}
measure: sum_of_cr_refunded_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_refunded_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_cr_refunded_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_refunded_customer_sk ;;
  description: "not available"
}
measure: sum_of_cr_refunded_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_refunded_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_cr_return_amount {
  type: sum_distinct
  sql: ${TABLE}.cr_return_amount ;;
  description: "not available"
}
measure: sum_of_cr_return_amt_inc_tax {
  type: sum_distinct
  sql: ${TABLE}.cr_return_amt_inc_tax ;;
  description: "not available"
}
measure: sum_of_cr_return_quantity {
  type: sum_distinct
  sql: ${TABLE}.cr_return_quantity ;;
  description: "not available"
}
measure: sum_of_cr_return_ship_cost {
  type: sum_distinct
  sql: ${TABLE}.cr_return_ship_cost ;;
  description: "not available"
}
measure: sum_of_cr_return_tax {
  type: sum_distinct
  sql: ${TABLE}.cr_return_tax ;;
  description: "not available"
}
measure: sum_of_cr_returned_date_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_returned_date_sk ;;
  description: "not available"
}
measure: sum_of_cr_returned_time_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_returned_time_sk ;;
  description: "not available"
}
measure: sum_of_cr_returning_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_returning_addr_sk ;;
  description: "not available"
}
measure: sum_of_cr_returning_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_returning_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_cr_returning_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_returning_customer_sk ;;
  description: "not available"
}
measure: sum_of_cr_returning_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_returning_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_cr_reversed_charge {
  type: sum_distinct
  sql: ${TABLE}.cr_reversed_charge ;;
  description: "not available"
}
measure: sum_of_cr_ship_mode_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_ship_mode_sk ;;
  description: "not available"
}
measure: sum_of_cr_store_credit {
  type: sum_distinct
  sql: ${TABLE}.cr_store_credit ;;
  description: "not available"
}
measure: sum_of_cr_warehouse_sk {
  type: sum_distinct
  sql: ${TABLE}.cr_warehouse_sk ;;
  description: "not available"
}
}
view: +catalog_sales {
measure: sum_of_cs_bill_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_bill_addr_sk ;;
  description: "not available"
}
measure: sum_of_cs_bill_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_bill_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_cs_bill_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_bill_customer_sk ;;
  description: "not available"
}
measure: sum_of_cs_bill_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_bill_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_cs_call_center_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_call_center_sk ;;
  description: "not available"
}
measure: sum_of_cs_catalog_page_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_catalog_page_sk ;;
  description: "not available"
}
measure: sum_of_cs_coupon_amt {
  type: sum_distinct
  sql: ${TABLE}.cs_coupon_amt ;;
  description: "not available"
}
measure: sum_of_cs_ext_discount_amt {
  type: sum_distinct
  sql: ${TABLE}.cs_ext_discount_amt ;;
  description: "not available"
}
measure: sum_of_cs_ext_list_price {
  type: sum_distinct
  sql: ${TABLE}.cs_ext_list_price ;;
  description: "not available"
}
measure: sum_of_cs_ext_sales_price {
  type: sum_distinct
  sql: ${TABLE}.cs_ext_sales_price ;;
  description: "not available"
}
measure: sum_of_cs_ext_ship_cost {
  type: sum_distinct
  sql: ${TABLE}.cs_ext_ship_cost ;;
  description: "not available"
}
measure: sum_of_cs_ext_tax {
  type: sum_distinct
  sql: ${TABLE}.cs_ext_tax ;;
  description: "not available"
}
measure: sum_of_cs_ext_wholesale_cost {
  type: sum_distinct
  sql: ${TABLE}.cs_ext_wholesale_cost ;;
  description: "not available"
}
measure: sum_of_cs_item_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_item_sk ;;
  description: "not available"
}
measure: sum_of_cs_list_price {
  type: sum_distinct
  sql: ${TABLE}.cs_list_price ;;
  description: "not available"
}
measure: sum_of_cs_net_paid {
  type: sum_distinct
  sql: ${TABLE}.cs_net_paid ;;
  description: "not available"
}
measure: sum_of_cs_net_paid_inc_ship {
  type: sum_distinct
  sql: ${TABLE}.cs_net_paid_inc_ship ;;
  description: "not available"
}
measure: sum_of_cs_net_paid_inc_ship_tax {
  type: sum_distinct
  sql: ${TABLE}.cs_net_paid_inc_ship_tax ;;
  description: "not available"
}
measure: sum_of_cs_net_paid_inc_tax {
  type: sum_distinct
  sql: ${TABLE}.cs_net_paid_inc_tax ;;
  description: "not available"
}
measure: sum_of_cs_net_profit {
  type: sum_distinct
  sql: ${TABLE}.cs_net_profit ;;
  description: "not available"
}
measure: sum_of_cs_order_number {
  type: sum_distinct
  sql: ${TABLE}.cs_order_number ;;
  description: "not available"
}
measure: sum_of_cs_promo_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_promo_sk ;;
  description: "not available"
}
measure: sum_of_cs_quantity {
  type: sum_distinct
  sql: ${TABLE}.cs_quantity ;;
  description: "not available"
}
measure: sum_of_cs_sales_price {
  type: sum_distinct
  sql: ${TABLE}.cs_sales_price ;;
  description: "not available"
}
measure: sum_of_cs_ship_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_ship_addr_sk ;;
  description: "not available"
}
measure: sum_of_cs_ship_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_ship_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_cs_ship_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_ship_customer_sk ;;
  description: "not available"
}
measure: sum_of_cs_ship_date_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_ship_date_sk ;;
  description: "not available"
}
measure: sum_of_cs_ship_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_ship_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_cs_ship_mode_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_ship_mode_sk ;;
  description: "not available"
}
measure: sum_of_cs_sold_date_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_sold_date_sk ;;
  description: "not available"
}
measure: sum_of_cs_sold_time_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_sold_time_sk ;;
  description: "not available"
}
measure: sum_of_cs_warehouse_sk {
  type: sum_distinct
  sql: ${TABLE}.cs_warehouse_sk ;;
  description: "not available"
}
measure: sum_of_cs_wholesale_cost {
  type: sum_distinct
  sql: ${TABLE}.cs_wholesale_cost ;;
  description: "not available"
}
}
view: +customer {
measure: sum_of_c_birth_day {
  type: sum_distinct
  sql: ${TABLE}.c_birth_day ;;
  description: "not available"
}
measure: sum_of_c_birth_month {
  type: sum_distinct
  sql: ${TABLE}.c_birth_month ;;
  description: "not available"
}
measure: sum_of_c_birth_year {
  type: sum_distinct
  sql: ${TABLE}.c_birth_year ;;
  description: "not available"
}
measure: sum_of_c_current_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.c_current_addr_sk ;;
  description: "not available"
}
measure: sum_of_c_current_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.c_current_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_c_current_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.c_current_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_c_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.c_customer_sk ;;
  description: "not available"
}
measure: sum_of_c_first_sales_date_sk {
  type: sum_distinct
  sql: ${TABLE}.c_first_sales_date_sk ;;
  description: "not available"
}
measure: sum_of_c_first_shipto_date_sk {
  type: sum_distinct
  sql: ${TABLE}.c_first_shipto_date_sk ;;
  description: "not available"
}
}
view: +customer_address {
measure: sum_of_ca_address_sk {
  type: sum_distinct
  sql: ${TABLE}.ca_address_sk ;;
  description: "not available"
}
measure: sum_of_ca_gmt_offset {
  type: sum_distinct
  sql: ${TABLE}.ca_gmt_offset ;;
  description: "not available"
}
}
view: +customer_demographics {
measure: sum_of_cd_demo_sk {
  type: sum_distinct
  sql: ${TABLE}.cd_demo_sk ;;
  description: "not available"
}
measure: sum_of_cd_dep_college_count {
  type: sum_distinct
  sql: ${TABLE}.cd_dep_college_count ;;
  description: "not available"
}
measure: sum_of_cd_dep_count {
  type: sum_distinct
  sql: ${TABLE}.cd_dep_count ;;
  description: "not available"
}
measure: sum_of_cd_dep_employed_count {
  type: sum_distinct
  sql: ${TABLE}.cd_dep_employed_count ;;
  description: "not available"
}
measure: sum_of_cd_purchase_estimate {
  type: sum_distinct
  sql: ${TABLE}.cd_purchase_estimate ;;
  description: "not available"
}
}
view: +date_dim {
measure: sum_of_d_date_sk {
  type: sum_distinct
  sql: ${TABLE}.d_date_sk ;;
  description: "not available"
}
measure: sum_of_d_dom {
  type: sum_distinct
  sql: ${TABLE}.d_dom ;;
  description: "not available"
}
measure: sum_of_d_dow {
  type: sum_distinct
  sql: ${TABLE}.d_dow ;;
  description: "not available"
}
measure: sum_of_d_first_dom {
  type: sum_distinct
  sql: ${TABLE}.d_first_dom ;;
  description: "not available"
}
measure: sum_of_d_fy_quarter_seq {
  type: sum_distinct
  sql: ${TABLE}.d_fy_quarter_seq ;;
  description: "not available"
}
measure: sum_of_d_fy_week_seq {
  type: sum_distinct
  sql: ${TABLE}.d_fy_week_seq ;;
  description: "not available"
}
measure: sum_of_d_fy_year {
  type: sum_distinct
  sql: ${TABLE}.d_fy_year ;;
  description: "not available"
}
measure: sum_of_d_last_dom {
  type: sum_distinct
  sql: ${TABLE}.d_last_dom ;;
  description: "not available"
}
measure: sum_of_d_month_seq {
  type: sum_distinct
  sql: ${TABLE}.d_month_seq ;;
  description: "not available"
}
measure: sum_of_d_moy {
  type: sum_distinct
  sql: ${TABLE}.d_moy ;;
  description: "not available"
}
measure: sum_of_d_qoy {
  type: sum_distinct
  sql: ${TABLE}.d_qoy ;;
  description: "not available"
}
measure: sum_of_d_quarter_seq {
  type: sum_distinct
  sql: ${TABLE}.d_quarter_seq ;;
  description: "not available"
}
measure: sum_of_d_same_day_lq {
  type: sum_distinct
  sql: ${TABLE}.d_same_day_lq ;;
  description: "not available"
}
measure: sum_of_d_same_day_ly {
  type: sum_distinct
  sql: ${TABLE}.d_same_day_ly ;;
  description: "not available"
}
measure: sum_of_d_week_seq {
  type: sum_distinct
  sql: ${TABLE}.d_week_seq ;;
  description: "not available"
}
measure: sum_of_d_year {
  type: sum_distinct
  sql: ${TABLE}.d_year ;;
  description: "not available"
}
}
view: +household_demographics {
measure: sum_of_hd_demo_sk {
  type: sum_distinct
  sql: ${TABLE}.hd_demo_sk ;;
  description: "not available"
}
measure: sum_of_hd_dep_count {
  type: sum_distinct
  sql: ${TABLE}.hd_dep_count ;;
  description: "not available"
}
measure: sum_of_hd_income_band_sk {
  type: sum_distinct
  sql: ${TABLE}.hd_income_band_sk ;;
  description: "not available"
}
measure: sum_of_hd_vehicle_count {
  type: sum_distinct
  sql: ${TABLE}.hd_vehicle_count ;;
  description: "not available"
}
}
view: +income_band {
measure: sum_of_ib_income_band_sk {
  type: sum_distinct
  sql: ${TABLE}.ib_income_band_sk ;;
  description: "not available"
}
measure: sum_of_ib_lower_bound {
  type: sum_distinct
  sql: ${TABLE}.ib_lower_bound ;;
  description: "not available"
}
measure: sum_of_ib_upper_bound {
  type: sum_distinct
  sql: ${TABLE}.ib_upper_bound ;;
  description: "not available"
}
}
view: +inventory {
measure: sum_of_inv_date_sk {
  type: sum_distinct
  sql: ${TABLE}.inv_date_sk ;;
  description: "not available"
}
measure: sum_of_inv_item_sk {
  type: sum_distinct
  sql: ${TABLE}.inv_item_sk ;;
  description: "not available"
}
measure: sum_of_inv_quantity_on_hand {
  type: sum_distinct
  sql: ${TABLE}.inv_quantity_on_hand ;;
  description: "not available"
}
measure: sum_of_inv_warehouse_sk {
  type: sum_distinct
  sql: ${TABLE}.inv_warehouse_sk ;;
  description: "not available"
}
}
view: +item {
measure: sum_of_i_brand_id {
  type: sum_distinct
  sql: ${TABLE}.i_brand_id ;;
  description: "not available"
}
measure: sum_of_i_category_id {
  type: sum_distinct
  sql: ${TABLE}.i_category_id ;;
  description: "not available"
}
measure: sum_of_i_class_id {
  type: sum_distinct
  sql: ${TABLE}.i_class_id ;;
  description: "not available"
}
measure: sum_of_i_current_price {
  type: sum_distinct
  sql: ${TABLE}.i_current_price ;;
  description: "not available"
}
measure: sum_of_i_item_sk {
  type: sum_distinct
  sql: ${TABLE}.i_item_sk ;;
  description: "not available"
}
measure: sum_of_i_manager_id {
  type: sum_distinct
  sql: ${TABLE}.i_manager_id ;;
  description: "not available"
}
measure: sum_of_i_manufact_id {
  type: sum_distinct
  sql: ${TABLE}.i_manufact_id ;;
  description: "not available"
}
measure: sum_of_i_wholesale_cost {
  type: sum_distinct
  sql: ${TABLE}.i_wholesale_cost ;;
  description: "not available"
}
}
view: +promotion {
measure: sum_of_p_cost {
  type: sum_distinct
  sql: ${TABLE}.p_cost ;;
  description: "not available"
}
measure: sum_of_p_end_date_sk {
  type: sum_distinct
  sql: ${TABLE}.p_end_date_sk ;;
  description: "not available"
}
measure: sum_of_p_item_sk {
  type: sum_distinct
  sql: ${TABLE}.p_item_sk ;;
  description: "not available"
}
measure: sum_of_p_promo_sk {
  type: sum_distinct
  sql: ${TABLE}.p_promo_sk ;;
  description: "not available"
}
measure: sum_of_p_response_target {
  type: sum_distinct
  sql: ${TABLE}.p_response_target ;;
  description: "not available"
}
measure: sum_of_p_start_date_sk {
  type: sum_distinct
  sql: ${TABLE}.p_start_date_sk ;;
  description: "not available"
}
}
view: +reason {
measure: sum_of_r_reason_sk {
  type: sum_distinct
  sql: ${TABLE}.r_reason_sk ;;
  description: "not available"
}
}
view: +ship_mode {
measure: sum_of_sm_ship_mode_sk {
  type: sum_distinct
  sql: ${TABLE}.sm_ship_mode_sk ;;
  description: "not available"
}
}
view: +store {
measure: sum_of_s_closed_date_sk {
  type: sum_distinct
  sql: ${TABLE}.s_closed_date_sk ;;
  description: "not available"
}
measure: sum_of_s_company_id {
  type: sum_distinct
  sql: ${TABLE}.s_company_id ;;
  description: "not available"
}
measure: sum_of_s_division_id {
  type: sum_distinct
  sql: ${TABLE}.s_division_id ;;
  description: "not available"
}
measure: sum_of_s_floor_space {
  type: sum_distinct
  sql: ${TABLE}.s_floor_space ;;
  description: "not available"
}
measure: sum_of_s_gmt_offset {
  type: sum_distinct
  sql: ${TABLE}.s_gmt_offset ;;
  description: "not available"
}
measure: sum_of_s_market_id {
  type: sum_distinct
  sql: ${TABLE}.s_market_id ;;
  description: "not available"
}
measure: sum_of_s_number_employees {
  type: sum_distinct
  sql: ${TABLE}.s_number_employees ;;
  description: "not available"
}
measure: sum_of_s_store_sk {
  type: sum_distinct
  sql: ${TABLE}.s_store_sk ;;
  description: "not available"
}
measure: sum_of_s_tax_precentage {
  type: sum_distinct
  sql: ${TABLE}.s_tax_precentage ;;
  description: "not available"
}
}
view: +store_returns {
measure: sum_of_sr_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_addr_sk ;;
  description: "not available"
}
measure: sum_of_sr_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_sr_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_customer_sk ;;
  description: "not available"
}
measure: sum_of_sr_fee {
  type: sum_distinct
  sql: ${TABLE}.sr_fee ;;
  description: "not available"
}
measure: sum_of_sr_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_sr_item_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_item_sk ;;
  description: "not available"
}
measure: sum_of_sr_net_loss {
  type: sum_distinct
  sql: ${TABLE}.sr_net_loss ;;
  description: "not available"
}
measure: sum_of_sr_reason_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_reason_sk ;;
  description: "not available"
}
measure: sum_of_sr_refunded_cash {
  type: sum_distinct
  sql: ${TABLE}.sr_refunded_cash ;;
  description: "not available"
}
measure: sum_of_sr_return_amt {
  type: sum_distinct
  sql: ${TABLE}.sr_return_amt ;;
  description: "not available"
}
measure: sum_of_sr_return_amt_inc_tax {
  type: sum_distinct
  sql: ${TABLE}.sr_return_amt_inc_tax ;;
  description: "not available"
}
measure: sum_of_sr_return_quantity {
  type: sum_distinct
  sql: ${TABLE}.sr_return_quantity ;;
  description: "not available"
}
measure: sum_of_sr_return_ship_cost {
  type: sum_distinct
  sql: ${TABLE}.sr_return_ship_cost ;;
  description: "not available"
}
measure: sum_of_sr_return_tax {
  type: sum_distinct
  sql: ${TABLE}.sr_return_tax ;;
  description: "not available"
}
measure: sum_of_sr_return_time_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_return_time_sk ;;
  description: "not available"
}
measure: sum_of_sr_returned_date_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_returned_date_sk ;;
  description: "not available"
}
measure: sum_of_sr_reversed_charge {
  type: sum_distinct
  sql: ${TABLE}.sr_reversed_charge ;;
  description: "not available"
}
measure: sum_of_sr_store_credit {
  type: sum_distinct
  sql: ${TABLE}.sr_store_credit ;;
  description: "not available"
}
measure: sum_of_sr_store_sk {
  type: sum_distinct
  sql: ${TABLE}.sr_store_sk ;;
  description: "not available"
}
measure: sum_of_sr_ticket_number {
  type: sum_distinct
  sql: ${TABLE}.sr_ticket_number ;;
  description: "not available"
}
}
view: +store_sales {
measure: sum_of_ss_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_addr_sk ;;
  description: "not available"
}
measure: sum_of_ss_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_ss_coupon_amt {
  type: sum_distinct
  sql: ${TABLE}.ss_coupon_amt ;;
  description: "not available"
}
measure: sum_of_ss_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_customer_sk ;;
  description: "not available"
}
measure: sum_of_ss_ext_discount_amt {
  type: sum_distinct
  sql: ${TABLE}.ss_ext_discount_amt ;;
  description: "not available"
}
measure: sum_of_ss_ext_list_price {
  type: sum_distinct
  sql: ${TABLE}.ss_ext_list_price ;;
  description: "not available"
}
measure: sum_of_ss_ext_sales_price {
  type: sum_distinct
  sql: ${TABLE}.ss_ext_sales_price ;;
  description: "not available"
}
measure: sum_of_ss_ext_tax {
  type: sum_distinct
  sql: ${TABLE}.ss_ext_tax ;;
  description: "not available"
}
measure: sum_of_ss_ext_wholesale_cost {
  type: sum_distinct
  sql: ${TABLE}.ss_ext_wholesale_cost ;;
  description: "not available"
}
measure: sum_of_ss_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_ss_item_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_item_sk ;;
  description: "not available"
}
measure: sum_of_ss_list_price {
  type: sum_distinct
  sql: ${TABLE}.ss_list_price ;;
  description: "not available"
}
measure: sum_of_ss_net_paid {
  type: sum_distinct
  sql: ${TABLE}.ss_net_paid ;;
  description: "not available"
}
measure: sum_of_ss_net_paid_inc_tax {
  type: sum_distinct
  sql: ${TABLE}.ss_net_paid_inc_tax ;;
  description: "not available"
}
measure: sum_of_ss_net_profit {
  type: sum_distinct
  sql: ${TABLE}.ss_net_profit ;;
  description: "not available"
}
measure: sum_of_ss_promo_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_promo_sk ;;
  description: "not available"
}
measure: sum_of_ss_quantity {
  type: sum_distinct
  sql: ${TABLE}.ss_quantity ;;
  description: "not available"
}
measure: sum_of_ss_sales_price {
  type: sum_distinct
  sql: ${TABLE}.ss_sales_price ;;
  description: "not available"
}
measure: sum_of_ss_sold_date_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_sold_date_sk ;;
  description: "not available"
}
measure: sum_of_ss_sold_time_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_sold_time_sk ;;
  description: "not available"
}
measure: sum_of_ss_store_sk {
  type: sum_distinct
  sql: ${TABLE}.ss_store_sk ;;
  description: "not available"
}
measure: sum_of_ss_ticket_number {
  type: sum_distinct
  sql: ${TABLE}.ss_ticket_number ;;
  description: "not available"
}
measure: sum_of_ss_wholesale_cost {
  type: sum_distinct
  sql: ${TABLE}.ss_wholesale_cost ;;
  description: "not available"
}
}
view: +time_dim {
measure: sum_of_t_hour {
  type: sum_distinct
  sql: ${TABLE}.t_hour ;;
  description: "not available"
}
measure: sum_of_t_minute {
  type: sum_distinct
  sql: ${TABLE}.t_minute ;;
  description: "not available"
}
measure: sum_of_t_second {
  type: sum_distinct
  sql: ${TABLE}.t_second ;;
  description: "not available"
}
measure: sum_of_t_time {
  type: sum_distinct
  sql: ${TABLE}.t_time ;;
  description: "not available"
}
measure: sum_of_t_time_sk {
  type: sum_distinct
  sql: ${TABLE}.t_time_sk ;;
  description: "not available"
}
}
view: +warehouse {
measure: sum_of_w_gmt_offset {
  type: sum_distinct
  sql: ${TABLE}.w_gmt_offset ;;
  description: "not available"
}
measure: sum_of_w_warehouse_sk {
  type: sum_distinct
  sql: ${TABLE}.w_warehouse_sk ;;
  description: "not available"
}
measure: sum_of_w_warehouse_sq_ft {
  type: sum_distinct
  sql: ${TABLE}.w_warehouse_sq_ft ;;
  description: "not available"
}
}
view: +web_page {
measure: sum_of_wp_access_date_sk {
  type: sum_distinct
  sql: ${TABLE}.wp_access_date_sk ;;
  description: "not available"
}
measure: sum_of_wp_char_count {
  type: sum_distinct
  sql: ${TABLE}.wp_char_count ;;
  description: "not available"
}
measure: sum_of_wp_creation_date_sk {
  type: sum_distinct
  sql: ${TABLE}.wp_creation_date_sk ;;
  description: "not available"
}
measure: sum_of_wp_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.wp_customer_sk ;;
  description: "not available"
}
measure: sum_of_wp_image_count {
  type: sum_distinct
  sql: ${TABLE}.wp_image_count ;;
  description: "not available"
}
measure: sum_of_wp_link_count {
  type: sum_distinct
  sql: ${TABLE}.wp_link_count ;;
  description: "not available"
}
measure: sum_of_wp_max_ad_count {
  type: sum_distinct
  sql: ${TABLE}.wp_max_ad_count ;;
  description: "not available"
}
measure: sum_of_wp_web_page_sk {
  type: sum_distinct
  sql: ${TABLE}.wp_web_page_sk ;;
  description: "not available"
}
}
view: +web_returns {
measure: sum_of_wr_account_credit {
  type: sum_distinct
  sql: ${TABLE}.wr_account_credit ;;
  description: "not available"
}
measure: sum_of_wr_fee {
  type: sum_distinct
  sql: ${TABLE}.wr_fee ;;
  description: "not available"
}
measure: sum_of_wr_item_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_item_sk ;;
  description: "not available"
}
measure: sum_of_wr_net_loss {
  type: sum_distinct
  sql: ${TABLE}.wr_net_loss ;;
  description: "not available"
}
measure: sum_of_wr_order_number {
  type: sum_distinct
  sql: ${TABLE}.wr_order_number ;;
  description: "not available"
}
measure: sum_of_wr_reason_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_reason_sk ;;
  description: "not available"
}
measure: sum_of_wr_refunded_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_refunded_addr_sk ;;
  description: "not available"
}
measure: sum_of_wr_refunded_cash {
  type: sum_distinct
  sql: ${TABLE}.wr_refunded_cash ;;
  description: "not available"
}
measure: sum_of_wr_refunded_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_refunded_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_wr_refunded_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_refunded_customer_sk ;;
  description: "not available"
}
measure: sum_of_wr_refunded_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_refunded_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_wr_return_amt {
  type: sum_distinct
  sql: ${TABLE}.wr_return_amt ;;
  description: "not available"
}
measure: sum_of_wr_return_amt_inc_tax {
  type: sum_distinct
  sql: ${TABLE}.wr_return_amt_inc_tax ;;
  description: "not available"
}
measure: sum_of_wr_return_quantity {
  type: sum_distinct
  sql: ${TABLE}.wr_return_quantity ;;
  description: "not available"
}
measure: sum_of_wr_return_ship_cost {
  type: sum_distinct
  sql: ${TABLE}.wr_return_ship_cost ;;
  description: "not available"
}
measure: sum_of_wr_return_tax {
  type: sum_distinct
  sql: ${TABLE}.wr_return_tax ;;
  description: "not available"
}
measure: sum_of_wr_returned_date_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_returned_date_sk ;;
  description: "not available"
}
measure: sum_of_wr_returned_time_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_returned_time_sk ;;
  description: "not available"
}
measure: sum_of_wr_returning_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_returning_addr_sk ;;
  description: "not available"
}
measure: sum_of_wr_returning_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_returning_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_wr_returning_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_returning_customer_sk ;;
  description: "not available"
}
measure: sum_of_wr_returning_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_returning_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_wr_reversed_charge {
  type: sum_distinct
  sql: ${TABLE}.wr_reversed_charge ;;
  description: "not available"
}
measure: sum_of_wr_web_page_sk {
  type: sum_distinct
  sql: ${TABLE}.wr_web_page_sk ;;
  description: "not available"
}
}
view: +web_sales {
measure: sum_of_ws_bill_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_bill_addr_sk ;;
  description: "not available"
}
measure: sum_of_ws_bill_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_bill_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_ws_bill_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_bill_customer_sk ;;
  description: "not available"
}
measure: sum_of_ws_bill_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_bill_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_ws_coupon_amt {
  type: sum_distinct
  sql: ${TABLE}.ws_coupon_amt ;;
  description: "not available"
}
measure: sum_of_ws_ext_discount_amt {
  type: sum_distinct
  sql: ${TABLE}.ws_ext_discount_amt ;;
  description: "not available"
}
measure: sum_of_ws_ext_list_price {
  type: sum_distinct
  sql: ${TABLE}.ws_ext_list_price ;;
  description: "not available"
}
measure: sum_of_ws_ext_sales_price {
  type: sum_distinct
  sql: ${TABLE}.ws_ext_sales_price ;;
  description: "not available"
}
measure: sum_of_ws_ext_ship_cost {
  type: sum_distinct
  sql: ${TABLE}.ws_ext_ship_cost ;;
  description: "not available"
}
measure: sum_of_ws_ext_tax {
  type: sum_distinct
  sql: ${TABLE}.ws_ext_tax ;;
  description: "not available"
}
measure: sum_of_ws_ext_wholesale_cost {
  type: sum_distinct
  sql: ${TABLE}.ws_ext_wholesale_cost ;;
  description: "not available"
}
measure: sum_of_ws_item_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_item_sk ;;
  description: "not available"
}
measure: sum_of_ws_list_price {
  type: sum_distinct
  sql: ${TABLE}.ws_list_price ;;
  description: "not available"
}
measure: sum_of_ws_net_paid {
  type: sum_distinct
  sql: ${TABLE}.ws_net_paid ;;
  description: "not available"
}
measure: sum_of_ws_net_paid_inc_ship {
  type: sum_distinct
  sql: ${TABLE}.ws_net_paid_inc_ship ;;
  description: "not available"
}
measure: sum_of_ws_net_paid_inc_ship_tax {
  type: sum_distinct
  sql: ${TABLE}.ws_net_paid_inc_ship_tax ;;
  description: "not available"
}
measure: sum_of_ws_net_paid_inc_tax {
  type: sum_distinct
  sql: ${TABLE}.ws_net_paid_inc_tax ;;
  description: "not available"
}
measure: sum_of_ws_net_profit {
  type: sum_distinct
  sql: ${TABLE}.ws_net_profit ;;
  description: "not available"
}
measure: sum_of_ws_order_number {
  type: sum_distinct
  sql: ${TABLE}.ws_order_number ;;
  description: "not available"
}
measure: sum_of_ws_promo_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_promo_sk ;;
  description: "not available"
}
measure: sum_of_ws_quantity {
  type: sum_distinct
  sql: ${TABLE}.ws_quantity ;;
  description: "not available"
}
measure: sum_of_ws_sales_price {
  type: sum_distinct
  sql: ${TABLE}.ws_sales_price ;;
  description: "not available"
}
measure: sum_of_ws_ship_addr_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_ship_addr_sk ;;
  description: "not available"
}
measure: sum_of_ws_ship_cdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_ship_cdemo_sk ;;
  description: "not available"
}
measure: sum_of_ws_ship_customer_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_ship_customer_sk ;;
  description: "not available"
}
measure: sum_of_ws_ship_date_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_ship_date_sk ;;
  description: "not available"
}
measure: sum_of_ws_ship_hdemo_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_ship_hdemo_sk ;;
  description: "not available"
}
measure: sum_of_ws_ship_mode_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_ship_mode_sk ;;
  description: "not available"
}
measure: sum_of_ws_sold_date_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_sold_date_sk ;;
  description: "not available"
}
measure: sum_of_ws_sold_time_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_sold_time_sk ;;
  description: "not available"
}
measure: sum_of_ws_warehouse_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_warehouse_sk ;;
  description: "not available"
}
measure: sum_of_ws_web_page_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_web_page_sk ;;
  description: "not available"
}
measure: sum_of_ws_web_site_sk {
  type: sum_distinct
  sql: ${TABLE}.ws_web_site_sk ;;
  description: "not available"
}
measure: sum_of_ws_wholesale_cost {
  type: sum_distinct
  sql: ${TABLE}.ws_wholesale_cost ;;
  description: "not available"
}
}
view: +web_site {
measure: sum_of_web_close_date_sk {
  type: sum_distinct
  sql: ${TABLE}.web_close_date_sk ;;
  description: "not available"
}
measure: sum_of_web_company_id {
  type: sum_distinct
  sql: ${TABLE}.web_company_id ;;
  description: "not available"
}
measure: sum_of_web_gmt_offset {
  type: sum_distinct
  sql: ${TABLE}.web_gmt_offset ;;
  description: "not available"
}
measure: sum_of_web_mkt_id {
  type: sum_distinct
  sql: ${TABLE}.web_mkt_id ;;
  description: "not available"
}
measure: sum_of_web_open_date_sk {
  type: sum_distinct
  sql: ${TABLE}.web_open_date_sk ;;
  description: "not available"
}
measure: sum_of_web_site_sk {
  type: sum_distinct
  sql: ${TABLE}.web_site_sk ;;
  description: "not available"
}
measure: sum_of_web_tax_percentage {
  type: sum_distinct
  sql: ${TABLE}.web_tax_percentage ;;
  description: "not available"
}
}

explore: call_center
{ hidden: yes }
explore: catalog_page
{ hidden: yes }
explore: catalog_returns
{ hidden: yes }
explore: catalog_sales
{ hidden: yes }
explore: customer
{ hidden: yes }
explore: customer_address
{ hidden: yes }
explore: customer_demographics
{ hidden: yes }
explore: date_dim
{ hidden: yes }
explore: household_demographics
{ hidden: yes }
explore: income_band
{ hidden: yes }
explore: inventory
{ hidden: yes }
explore: item
{ hidden: yes }
explore: promotion
{ hidden: yes }
explore: reason
{ hidden: yes }
explore: ship_mode
{ hidden: yes }
explore: store
{ hidden: yes }
explore: store_returns
{ hidden: yes }
explore: store_sales
{ hidden: yes }
explore: time_dim
{ hidden: yes }
explore: warehouse
{ hidden: yes }
explore: web_page
{ hidden: yes }
explore: web_returns
{ hidden: yes }
explore: web_sales
{ hidden: yes }
explore: web_site
{ hidden: yes }
view: call_center {
sql_table_name: call_center ;;
dimension: cc_call_center_id {
  type: string
  sql: ${TABLE}.cc_call_center_id ;;
  description: "not available"
}
dimension: cc_call_center_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_call_center_sk ;;
  description: "not available"
}
dimension: cc_city {
  type: string
  sql: ${TABLE}.cc_city ;;
  description: "not available"
}
dimension: cc_class {
  type: string
  sql: ${TABLE}.cc_class ;;
  description: "not available"
}
dimension: cc_closed_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_closed_date_sk ;;
  description: "not available"
}
dimension: cc_company {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_company ;;
  description: "not available"
}
dimension: cc_company_name {
  type: string
  sql: ${TABLE}.cc_company_name ;;
  description: "not available"
}
dimension: cc_country {
  type: string
  sql: ${TABLE}.cc_country ;;
  description: "not available"
}
dimension: cc_county {
  type: string
  sql: ${TABLE}.cc_county ;;
  description: "not available"
}
dimension: cc_division {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_division ;;
  description: "not available"
}
dimension: cc_division_name {
  type: string
  sql: ${TABLE}.cc_division_name ;;
  description: "not available"
}
dimension: cc_employees {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_employees ;;
  description: "not available"
}
dimension: cc_gmt_offset {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_gmt_offset ;;
  description: "not available"
}
dimension: cc_hours {
  type: string
  sql: ${TABLE}.cc_hours ;;
  description: "not available"
}
dimension: cc_manager {
  type: string
  sql: ${TABLE}.cc_manager ;;
  description: "not available"
}
dimension: cc_market_manager {
  type: string
  sql: ${TABLE}.cc_market_manager ;;
  description: "not available"
}
dimension: cc_mkt_class {
  type: string
  sql: ${TABLE}.cc_mkt_class ;;
  description: "not available"
}
dimension: cc_mkt_desc {
  type: string
  sql: ${TABLE}.cc_mkt_desc ;;
  description: "not available"
}
dimension: cc_mkt_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_mkt_id ;;
  description: "not available"
}
dimension: cc_name {
  type: string
  sql: ${TABLE}.cc_name ;;
  description: "not available"
}
dimension: cc_open_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_open_date_sk ;;
  description: "not available"
}
dimension_group: cc_rec_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.cc_rec_end_date ;;
  description: "not available"
}
dimension_group: cc_rec_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.cc_rec_start_date ;;
  description: "not available"
}
dimension: cc_sq_ft {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_sq_ft ;;
  description: "not available"
}
dimension: cc_state {
  type: string
  sql: ${TABLE}.cc_state ;;
  description: "not available"
}
dimension: cc_street_name {
  type: string
  sql: ${TABLE}.cc_street_name ;;
  description: "not available"
}
dimension: cc_street_number {
  type: string
  sql: ${TABLE}.cc_street_number ;;
  description: "not available"
}
dimension: cc_street_type {
  type: string
  sql: ${TABLE}.cc_street_type ;;
  description: "not available"
}
dimension: cc_suite_number {
  type: string
  sql: ${TABLE}.cc_suite_number ;;
  description: "not available"
}
dimension: cc_tax_percentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.cc_tax_percentage ;;
  description: "not available"
}
dimension: cc_zip {
  type: string
  sql: ${TABLE}.cc_zip ;;
  description: "not available"
}
}
view: catalog_page {
sql_table_name: catalog_page ;;
dimension: cp_catalog_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.cp_catalog_number ;;
  description: "not available"
}
dimension: cp_catalog_page_id {
  type: string
  sql: ${TABLE}.cp_catalog_page_id ;;
  description: "not available"
}
dimension: cp_catalog_page_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.cp_catalog_page_number ;;
  description: "not available"
}
dimension: cp_catalog_page_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cp_catalog_page_sk ;;
  description: "not available"
}
dimension: cp_department {
  type: string
  sql: ${TABLE}.cp_department ;;
  description: "not available"
}
dimension: cp_description {
  type: string
  sql: ${TABLE}.cp_description ;;
  description: "not available"
}
dimension: cp_end_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cp_end_date_sk ;;
  description: "not available"
}
dimension: cp_start_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cp_start_date_sk ;;
  description: "not available"
}
dimension: cp_type {
  type: string
  sql: ${TABLE}.cp_type ;;
  description: "not available"
}
}
view: catalog_returns {
sql_table_name: catalog_returns ;;
dimension: cr_call_center_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_call_center_sk ;;
  description: "not available"
}
dimension: cr_catalog_page_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_catalog_page_sk ;;
  description: "not available"
}
dimension: cr_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_fee ;;
  description: "not available"
}
dimension: cr_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_item_sk ;;
  description: "not available"
}
dimension: cr_net_loss {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_net_loss ;;
  description: "not available"
}
dimension: cr_order_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_order_number ;;
  description: "not available"
}
dimension: cr_reason_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_reason_sk ;;
  description: "not available"
}
dimension: cr_refunded_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_refunded_addr_sk ;;
  description: "not available"
}
dimension: cr_refunded_cash {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_refunded_cash ;;
  description: "not available"
}
dimension: cr_refunded_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_refunded_cdemo_sk ;;
  description: "not available"
}
dimension: cr_refunded_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_refunded_customer_sk ;;
  description: "not available"
}
dimension: cr_refunded_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_refunded_hdemo_sk ;;
  description: "not available"
}
dimension: cr_return_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_return_amount ;;
  description: "not available"
}
dimension: cr_return_amt_inc_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_return_amt_inc_tax ;;
  description: "not available"
}
dimension: cr_return_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_return_quantity ;;
  description: "not available"
}
dimension: cr_return_ship_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_return_ship_cost ;;
  description: "not available"
}
dimension: cr_return_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_return_tax ;;
  description: "not available"
}
dimension: cr_returned_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_returned_date_sk ;;
  description: "not available"
}
dimension: cr_returned_time_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_returned_time_sk ;;
  description: "not available"
}
dimension: cr_returning_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_returning_addr_sk ;;
  description: "not available"
}
dimension: cr_returning_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_returning_cdemo_sk ;;
  description: "not available"
}
dimension: cr_returning_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_returning_customer_sk ;;
  description: "not available"
}
dimension: cr_returning_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_returning_hdemo_sk ;;
  description: "not available"
}
dimension: cr_reversed_charge {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_reversed_charge ;;
  description: "not available"
}
dimension: cr_ship_mode_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_ship_mode_sk ;;
  description: "not available"
}
dimension: cr_store_credit {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_store_credit ;;
  description: "not available"
}
dimension: cr_warehouse_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cr_warehouse_sk ;;
  description: "not available"
}
}
view: catalog_sales {
sql_table_name: catalog_sales ;;
dimension: cs_bill_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_bill_addr_sk ;;
  description: "not available"
}
dimension: cs_bill_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_bill_cdemo_sk ;;
  description: "not available"
}
dimension: cs_bill_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_bill_customer_sk ;;
  description: "not available"
}
dimension: cs_bill_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_bill_hdemo_sk ;;
  description: "not available"
}
dimension: cs_call_center_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_call_center_sk ;;
  description: "not available"
}
dimension: cs_catalog_page_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_catalog_page_sk ;;
  description: "not available"
}
dimension: cs_coupon_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_coupon_amt ;;
  description: "not available"
}
dimension: cs_ext_discount_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ext_discount_amt ;;
  description: "not available"
}
dimension: cs_ext_list_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ext_list_price ;;
  description: "not available"
}
dimension: cs_ext_sales_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ext_sales_price ;;
  description: "not available"
}
dimension: cs_ext_ship_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ext_ship_cost ;;
  description: "not available"
}
dimension: cs_ext_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ext_tax ;;
  description: "not available"
}
dimension: cs_ext_wholesale_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ext_wholesale_cost ;;
  description: "not available"
}
dimension: cs_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_item_sk ;;
  description: "not available"
}
dimension: cs_list_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_list_price ;;
  description: "not available"
}
dimension: cs_net_paid {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_net_paid ;;
  description: "not available"
}
dimension: cs_net_paid_inc_ship {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_net_paid_inc_ship ;;
  description: "not available"
}
dimension: cs_net_paid_inc_ship_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_net_paid_inc_ship_tax ;;
  description: "not available"
}
dimension: cs_net_paid_inc_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_net_paid_inc_tax ;;
  description: "not available"
}
dimension: cs_net_profit {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_net_profit ;;
  description: "not available"
}
dimension: cs_order_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_order_number ;;
  description: "not available"
}
dimension: cs_promo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_promo_sk ;;
  description: "not available"
}
dimension: cs_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_quantity ;;
  description: "not available"
}
dimension: cs_sales_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_sales_price ;;
  description: "not available"
}
dimension: cs_ship_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ship_addr_sk ;;
  description: "not available"
}
dimension: cs_ship_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ship_cdemo_sk ;;
  description: "not available"
}
dimension: cs_ship_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ship_customer_sk ;;
  description: "not available"
}
dimension: cs_ship_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ship_date_sk ;;
  description: "not available"
}
dimension: cs_ship_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ship_hdemo_sk ;;
  description: "not available"
}
dimension: cs_ship_mode_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_ship_mode_sk ;;
  description: "not available"
}
dimension: cs_sold_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_sold_date_sk ;;
  description: "not available"
}
dimension: cs_sold_time_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_sold_time_sk ;;
  description: "not available"
}
dimension: cs_warehouse_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_warehouse_sk ;;
  description: "not available"
}
dimension: cs_wholesale_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.cs_wholesale_cost ;;
  description: "not available"
}
}
view: customer {
sql_table_name: customer ;;
dimension: c_birth_country {
  type: string
  sql: ${TABLE}.c_birth_country ;;
  description: "not available"
}
dimension: c_birth_day {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_birth_day ;;
  description: "not available"
}
dimension: c_birth_month {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_birth_month ;;
  description: "not available"
}
dimension: c_birth_year {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_birth_year ;;
  description: "not available"
}
dimension: c_current_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_current_addr_sk ;;
  description: "not available"
}
dimension: c_current_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_current_cdemo_sk ;;
  description: "not available"
}
dimension: c_current_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_current_hdemo_sk ;;
  description: "not available"
}
dimension: c_customer_id {
  type: string
  sql: ${TABLE}.c_customer_id ;;
  description: "not available"
}
dimension: c_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_customer_sk ;;
  description: "not available"
}
dimension: c_email_address {
  type: string
  sql: ${TABLE}.c_email_address ;;
  description: "not available"
}
dimension: c_first_name {
  type: string
  sql: ${TABLE}.c_first_name ;;
  description: "not available"
}
dimension: c_first_sales_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_first_sales_date_sk ;;
  description: "not available"
}
dimension: c_first_shipto_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.c_first_shipto_date_sk ;;
  description: "not available"
}
dimension: c_last_name {
  type: string
  sql: ${TABLE}.c_last_name ;;
  description: "not available"
}
dimension: c_last_review_date {
  type: string
  sql: ${TABLE}.c_last_review_date ;;
  description: "not available"
}
dimension: c_login {
  type: string
  sql: ${TABLE}.c_login ;;
  description: "not available"
}
dimension: c_preferred_cust_flag {
  type: string
  sql: ${TABLE}.c_preferred_cust_flag ;;
  description: "not available"
}
dimension: c_salutation {
  type: string
  sql: ${TABLE}.c_salutation ;;
  description: "not available"
}
}
view: customer_address {
sql_table_name: customer_address ;;
dimension: ca_address_id {
  type: string
  sql: ${TABLE}.ca_address_id ;;
  description: "not available"
}
dimension: ca_address_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ca_address_sk ;;
  description: "not available"
}
dimension: ca_city {
  type: string
  sql: ${TABLE}.ca_city ;;
  description: "not available"
}
dimension: ca_country {
  type: string
  sql: ${TABLE}.ca_country ;;
  description: "not available"
}
dimension: ca_county {
  type: string
  sql: ${TABLE}.ca_county ;;
  description: "not available"
}
dimension: ca_gmt_offset {
  hidden: yes 
  type: number
  sql: ${TABLE}.ca_gmt_offset ;;
  description: "not available"
}
dimension: ca_location_type {
  type: string
  sql: ${TABLE}.ca_location_type ;;
  description: "not available"
}
dimension: ca_state {
  type: string
  sql: ${TABLE}.ca_state ;;
  description: "not available"
}
dimension: ca_street_name {
  type: string
  sql: ${TABLE}.ca_street_name ;;
  description: "not available"
}
dimension: ca_street_number {
  type: string
  sql: ${TABLE}.ca_street_number ;;
  description: "not available"
}
dimension: ca_street_type {
  type: string
  sql: ${TABLE}.ca_street_type ;;
  description: "not available"
}
dimension: ca_suite_number {
  type: string
  sql: ${TABLE}.ca_suite_number ;;
  description: "not available"
}
dimension: ca_zip {
  type: string
  sql: ${TABLE}.ca_zip ;;
  description: "not available"
}
}
view: customer_demographics {
sql_table_name: customer_demographics ;;
dimension: cd_credit_rating {
  type: string
  sql: ${TABLE}.cd_credit_rating ;;
  description: "not available"
}
dimension: cd_demo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.cd_demo_sk ;;
  description: "not available"
}
dimension: cd_dep_college_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.cd_dep_college_count ;;
  description: "not available"
}
dimension: cd_dep_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.cd_dep_count ;;
  description: "not available"
}
dimension: cd_dep_employed_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.cd_dep_employed_count ;;
  description: "not available"
}
dimension: cd_education_status {
  type: string
  sql: ${TABLE}.cd_education_status ;;
  description: "not available"
}
dimension: cd_gender {
  type: string
  sql: ${TABLE}.cd_gender ;;
  description: "not available"
}
dimension: cd_marital_status {
  type: string
  sql: ${TABLE}.cd_marital_status ;;
  description: "not available"
}
dimension: cd_purchase_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.cd_purchase_estimate ;;
  description: "not available"
}
}
view: date_dim {
sql_table_name: date_dim ;;
dimension: d_current_day {
  type: string
  sql: ${TABLE}.d_current_day ;;
  description: "not available"
}
dimension: d_current_month {
  type: string
  sql: ${TABLE}.d_current_month ;;
  description: "not available"
}
dimension: d_current_quarter {
  type: string
  sql: ${TABLE}.d_current_quarter ;;
  description: "not available"
}
dimension: d_current_week {
  type: string
  sql: ${TABLE}.d_current_week ;;
  description: "not available"
}
dimension: d_current_year {
  type: string
  sql: ${TABLE}.d_current_year ;;
  description: "not available"
}
dimension_group: d_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.d_date ;;
  description: "not available"
}
dimension: d_date_id {
  type: string
  sql: ${TABLE}.d_date_id ;;
  description: "not available"
}
dimension: d_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_date_sk ;;
  description: "not available"
}
dimension: d_day_name {
  type: string
  sql: ${TABLE}.d_day_name ;;
  description: "not available"
}
dimension: d_dom {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_dom ;;
  description: "not available"
}
dimension: d_dow {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_dow ;;
  description: "not available"
}
dimension: d_first_dom {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_first_dom ;;
  description: "not available"
}
dimension: d_following_holiday {
  type: string
  sql: ${TABLE}.d_following_holiday ;;
  description: "not available"
}
dimension: d_fy_quarter_seq {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_fy_quarter_seq ;;
  description: "not available"
}
dimension: d_fy_week_seq {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_fy_week_seq ;;
  description: "not available"
}
dimension: d_fy_year {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_fy_year ;;
  description: "not available"
}
dimension: d_holiday {
  type: string
  sql: ${TABLE}.d_holiday ;;
  description: "not available"
}
dimension: d_last_dom {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_last_dom ;;
  description: "not available"
}
dimension: d_month_seq {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_month_seq ;;
  description: "not available"
}
dimension: d_moy {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_moy ;;
  description: "not available"
}
dimension: d_qoy {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_qoy ;;
  description: "not available"
}
dimension: d_quarter_name {
  type: string
  sql: ${TABLE}.d_quarter_name ;;
  description: "not available"
}
dimension: d_quarter_seq {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_quarter_seq ;;
  description: "not available"
}
dimension: d_same_day_lq {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_same_day_lq ;;
  description: "not available"
}
dimension: d_same_day_ly {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_same_day_ly ;;
  description: "not available"
}
dimension: d_week_seq {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_week_seq ;;
  description: "not available"
}
dimension: d_weekend {
  type: string
  sql: ${TABLE}.d_weekend ;;
  description: "not available"
}
dimension: d_year {
  hidden: yes 
  type: number
  sql: ${TABLE}.d_year ;;
  description: "not available"
}
}
view: household_demographics {
sql_table_name: household_demographics ;;
dimension: hd_buy_potential {
  type: string
  sql: ${TABLE}.hd_buy_potential ;;
  description: "not available"
}
dimension: hd_demo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.hd_demo_sk ;;
  description: "not available"
}
dimension: hd_dep_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.hd_dep_count ;;
  description: "not available"
}
dimension: hd_income_band_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.hd_income_band_sk ;;
  description: "not available"
}
dimension: hd_vehicle_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.hd_vehicle_count ;;
  description: "not available"
}
}
view: income_band {
sql_table_name: income_band ;;
dimension: ib_income_band_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ib_income_band_sk ;;
  description: "not available"
}
dimension: ib_lower_bound {
  hidden: yes 
  type: number
  sql: ${TABLE}.ib_lower_bound ;;
  description: "not available"
}
dimension: ib_upper_bound {
  hidden: yes 
  type: number
  sql: ${TABLE}.ib_upper_bound ;;
  description: "not available"
}
}
view: inventory {
sql_table_name: inventory ;;
dimension: inv_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.inv_date_sk ;;
  description: "not available"
}
dimension: inv_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.inv_item_sk ;;
  description: "not available"
}
dimension: inv_quantity_on_hand {
  hidden: yes 
  type: number
  sql: ${TABLE}.inv_quantity_on_hand ;;
  description: "not available"
}
dimension: inv_warehouse_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.inv_warehouse_sk ;;
  description: "not available"
}
}
view: item {
sql_table_name: item ;;
dimension: i_brand {
  type: string
  sql: ${TABLE}.i_brand ;;
  description: "not available"
}
dimension: i_brand_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_brand_id ;;
  description: "not available"
}
dimension: i_category {
  type: string
  sql: ${TABLE}.i_category ;;
  description: "not available"
}
dimension: i_category_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_category_id ;;
  description: "not available"
}
dimension: i_class {
  type: string
  sql: ${TABLE}.i_class ;;
  description: "not available"
}
dimension: i_class_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_class_id ;;
  description: "not available"
}
dimension: i_color {
  type: string
  sql: ${TABLE}.i_color ;;
  description: "not available"
}
dimension: i_container {
  type: string
  sql: ${TABLE}.i_container ;;
  description: "not available"
}
dimension: i_current_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_current_price ;;
  description: "not available"
}
dimension: i_formulation {
  type: string
  sql: ${TABLE}.i_formulation ;;
  description: "not available"
}
dimension: i_item_desc {
  type: string
  sql: ${TABLE}.i_item_desc ;;
  description: "not available"
}
dimension: i_item_id {
  type: string
  sql: ${TABLE}.i_item_id ;;
  description: "not available"
}
dimension: i_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_item_sk ;;
  description: "not available"
}
dimension: i_manager_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_manager_id ;;
  description: "not available"
}
dimension: i_manufact {
  type: string
  sql: ${TABLE}.i_manufact ;;
  description: "not available"
}
dimension: i_manufact_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_manufact_id ;;
  description: "not available"
}
dimension: i_product_name {
  type: string
  sql: ${TABLE}.i_product_name ;;
  description: "not available"
}
dimension_group: i_rec_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.i_rec_end_date ;;
  description: "not available"
}
dimension_group: i_rec_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.i_rec_start_date ;;
  description: "not available"
}
dimension: i_size {
  type: string
  sql: ${TABLE}.i_size ;;
  description: "not available"
}
dimension: i_units {
  type: string
  sql: ${TABLE}.i_units ;;
  description: "not available"
}
dimension: i_wholesale_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.i_wholesale_cost ;;
  description: "not available"
}
}
view: promotion {
sql_table_name: promotion ;;
dimension: p_channel_catalog {
  type: string
  sql: ${TABLE}.p_channel_catalog ;;
  description: "not available"
}
dimension: p_channel_demo {
  type: string
  sql: ${TABLE}.p_channel_demo ;;
  description: "not available"
}
dimension: p_channel_details {
  type: string
  sql: ${TABLE}.p_channel_details ;;
  description: "not available"
}
dimension: p_channel_dmail {
  type: string
  sql: ${TABLE}.p_channel_dmail ;;
  description: "not available"
}
dimension: p_channel_email {
  type: string
  sql: ${TABLE}.p_channel_email ;;
  description: "not available"
}
dimension: p_channel_event {
  type: string
  sql: ${TABLE}.p_channel_event ;;
  description: "not available"
}
dimension: p_channel_press {
  type: string
  sql: ${TABLE}.p_channel_press ;;
  description: "not available"
}
dimension: p_channel_radio {
  type: string
  sql: ${TABLE}.p_channel_radio ;;
  description: "not available"
}
dimension: p_channel_tv {
  type: string
  sql: ${TABLE}.p_channel_tv ;;
  description: "not available"
}
dimension: p_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.p_cost ;;
  description: "not available"
}
dimension: p_discount_active {
  type: string
  sql: ${TABLE}.p_discount_active ;;
  description: "not available"
}
dimension: p_end_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.p_end_date_sk ;;
  description: "not available"
}
dimension: p_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.p_item_sk ;;
  description: "not available"
}
dimension: p_promo_id {
  type: string
  sql: ${TABLE}.p_promo_id ;;
  description: "not available"
}
dimension: p_promo_name {
  type: string
  sql: ${TABLE}.p_promo_name ;;
  description: "not available"
}
dimension: p_promo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.p_promo_sk ;;
  description: "not available"
}
dimension: p_purpose {
  type: string
  sql: ${TABLE}.p_purpose ;;
  description: "not available"
}
dimension: p_response_target {
  hidden: yes 
  type: number
  sql: ${TABLE}.p_response_target ;;
  description: "not available"
}
dimension: p_start_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.p_start_date_sk ;;
  description: "not available"
}
}
view: reason {
sql_table_name: reason ;;
dimension: r_reason_desc {
  type: string
  sql: ${TABLE}.r_reason_desc ;;
  description: "not available"
}
dimension: r_reason_id {
  type: string
  sql: ${TABLE}.r_reason_id ;;
  description: "not available"
}
dimension: r_reason_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.r_reason_sk ;;
  description: "not available"
}
}
view: ship_mode {
sql_table_name: ship_mode ;;
dimension: sm_carrier {
  type: string
  sql: ${TABLE}.sm_carrier ;;
  description: "not available"
}
dimension: sm_code {
  type: string
  sql: ${TABLE}.sm_code ;;
  description: "not available"
}
dimension: sm_contract {
  type: string
  sql: ${TABLE}.sm_contract ;;
  description: "not available"
}
dimension: sm_ship_mode_id {
  type: string
  sql: ${TABLE}.sm_ship_mode_id ;;
  description: "not available"
}
dimension: sm_ship_mode_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sm_ship_mode_sk ;;
  description: "not available"
}
dimension: sm_type {
  type: string
  sql: ${TABLE}.sm_type ;;
  description: "not available"
}
}
view: store {
sql_table_name: store ;;
dimension: s_city {
  type: string
  sql: ${TABLE}.s_city ;;
  description: "not available"
}
dimension: s_closed_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_closed_date_sk ;;
  description: "not available"
}
dimension: s_company_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_company_id ;;
  description: "not available"
}
dimension: s_company_name {
  type: string
  sql: ${TABLE}.s_company_name ;;
  description: "not available"
}
dimension: s_country {
  type: string
  sql: ${TABLE}.s_country ;;
  description: "not available"
}
dimension: s_county {
  type: string
  sql: ${TABLE}.s_county ;;
  description: "not available"
}
dimension: s_division_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_division_id ;;
  description: "not available"
}
dimension: s_division_name {
  type: string
  sql: ${TABLE}.s_division_name ;;
  description: "not available"
}
dimension: s_floor_space {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_floor_space ;;
  description: "not available"
}
dimension: s_geography_class {
  type: string
  sql: ${TABLE}.s_geography_class ;;
  description: "not available"
}
dimension: s_gmt_offset {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_gmt_offset ;;
  description: "not available"
}
dimension: s_hours {
  type: string
  sql: ${TABLE}.s_hours ;;
  description: "not available"
}
dimension: s_manager {
  type: string
  sql: ${TABLE}.s_manager ;;
  description: "not available"
}
dimension: s_market_desc {
  type: string
  sql: ${TABLE}.s_market_desc ;;
  description: "not available"
}
dimension: s_market_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_market_id ;;
  description: "not available"
}
dimension: s_market_manager {
  type: string
  sql: ${TABLE}.s_market_manager ;;
  description: "not available"
}
dimension: s_number_employees {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_number_employees ;;
  description: "not available"
}
dimension_group: s_rec_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.s_rec_end_date ;;
  description: "not available"
}
dimension_group: s_rec_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.s_rec_start_date ;;
  description: "not available"
}
dimension: s_state {
  type: string
  sql: ${TABLE}.s_state ;;
  description: "not available"
}
dimension: s_store_id {
  type: string
  sql: ${TABLE}.s_store_id ;;
  description: "not available"
}
dimension: s_store_name {
  type: string
  sql: ${TABLE}.s_store_name ;;
  description: "not available"
}
dimension: s_store_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_store_sk ;;
  description: "not available"
}
dimension: s_street_name {
  type: string
  sql: ${TABLE}.s_street_name ;;
  description: "not available"
}
dimension: s_street_number {
  type: string
  sql: ${TABLE}.s_street_number ;;
  description: "not available"
}
dimension: s_street_type {
  type: string
  sql: ${TABLE}.s_street_type ;;
  description: "not available"
}
dimension: s_suite_number {
  type: string
  sql: ${TABLE}.s_suite_number ;;
  description: "not available"
}
dimension: s_tax_precentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.s_tax_precentage ;;
  description: "not available"
}
dimension: s_zip {
  type: string
  sql: ${TABLE}.s_zip ;;
  description: "not available"
}
}
view: store_returns {
sql_table_name: store_returns ;;
dimension: sr_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_addr_sk ;;
  description: "not available"
}
dimension: sr_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_cdemo_sk ;;
  description: "not available"
}
dimension: sr_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_customer_sk ;;
  description: "not available"
}
dimension: sr_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_fee ;;
  description: "not available"
}
dimension: sr_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_hdemo_sk ;;
  description: "not available"
}
dimension: sr_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_item_sk ;;
  description: "not available"
}
dimension: sr_net_loss {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_net_loss ;;
  description: "not available"
}
dimension: sr_reason_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_reason_sk ;;
  description: "not available"
}
dimension: sr_refunded_cash {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_refunded_cash ;;
  description: "not available"
}
dimension: sr_return_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_return_amt ;;
  description: "not available"
}
dimension: sr_return_amt_inc_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_return_amt_inc_tax ;;
  description: "not available"
}
dimension: sr_return_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_return_quantity ;;
  description: "not available"
}
dimension: sr_return_ship_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_return_ship_cost ;;
  description: "not available"
}
dimension: sr_return_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_return_tax ;;
  description: "not available"
}
dimension: sr_return_time_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_return_time_sk ;;
  description: "not available"
}
dimension: sr_returned_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_returned_date_sk ;;
  description: "not available"
}
dimension: sr_reversed_charge {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_reversed_charge ;;
  description: "not available"
}
dimension: sr_store_credit {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_store_credit ;;
  description: "not available"
}
dimension: sr_store_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_store_sk ;;
  description: "not available"
}
dimension: sr_ticket_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.sr_ticket_number ;;
  description: "not available"
}
}
view: store_sales {
sql_table_name: store_sales ;;
dimension: ss_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_addr_sk ;;
  description: "not available"
}
dimension: ss_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_cdemo_sk ;;
  description: "not available"
}
dimension: ss_coupon_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_coupon_amt ;;
  description: "not available"
}
dimension: ss_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_customer_sk ;;
  description: "not available"
}
dimension: ss_ext_discount_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_ext_discount_amt ;;
  description: "not available"
}
dimension: ss_ext_list_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_ext_list_price ;;
  description: "not available"
}
dimension: ss_ext_sales_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_ext_sales_price ;;
  description: "not available"
}
dimension: ss_ext_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_ext_tax ;;
  description: "not available"
}
dimension: ss_ext_wholesale_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_ext_wholesale_cost ;;
  description: "not available"
}
dimension: ss_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_hdemo_sk ;;
  description: "not available"
}
dimension: ss_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_item_sk ;;
  description: "not available"
}
dimension: ss_list_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_list_price ;;
  description: "not available"
}
dimension: ss_net_paid {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_net_paid ;;
  description: "not available"
}
dimension: ss_net_paid_inc_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_net_paid_inc_tax ;;
  description: "not available"
}
dimension: ss_net_profit {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_net_profit ;;
  description: "not available"
}
dimension: ss_promo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_promo_sk ;;
  description: "not available"
}
dimension: ss_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_quantity ;;
  description: "not available"
}
dimension: ss_sales_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_sales_price ;;
  description: "not available"
}
dimension: ss_sold_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_sold_date_sk ;;
  description: "not available"
}
dimension: ss_sold_time_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_sold_time_sk ;;
  description: "not available"
}
dimension: ss_store_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_store_sk ;;
  description: "not available"
}
dimension: ss_ticket_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_ticket_number ;;
  description: "not available"
}
dimension: ss_wholesale_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.ss_wholesale_cost ;;
  description: "not available"
}
}
view: time_dim {
sql_table_name: time_dim ;;
dimension: t_am_pm {
  type: string
  sql: ${TABLE}.t_am_pm ;;
  description: "not available"
}
dimension: t_hour {
  hidden: yes 
  type: number
  sql: ${TABLE}.t_hour ;;
  description: "not available"
}
dimension: t_meal_time {
  type: string
  sql: ${TABLE}.t_meal_time ;;
  description: "not available"
}
dimension: t_minute {
  hidden: yes 
  type: number
  sql: ${TABLE}.t_minute ;;
  description: "not available"
}
dimension: t_second {
  hidden: yes 
  type: number
  sql: ${TABLE}.t_second ;;
  description: "not available"
}
dimension: t_shift {
  type: string
  sql: ${TABLE}.t_shift ;;
  description: "not available"
}
dimension: t_sub_shift {
  type: string
  sql: ${TABLE}.t_sub_shift ;;
  description: "not available"
}
dimension: t_time {
  hidden: yes 
  type: number
  sql: ${TABLE}.t_time ;;
  description: "not available"
}
dimension: t_time_id {
  type: string
  sql: ${TABLE}.t_time_id ;;
  description: "not available"
}
dimension: t_time_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.t_time_sk ;;
  description: "not available"
}
}
view: warehouse {
sql_table_name: warehouse ;;
dimension: w_city {
  type: string
  sql: ${TABLE}.w_city ;;
  description: "not available"
}
dimension: w_country {
  type: string
  sql: ${TABLE}.w_country ;;
  description: "not available"
}
dimension: w_county {
  type: string
  sql: ${TABLE}.w_county ;;
  description: "not available"
}
dimension: w_gmt_offset {
  hidden: yes 
  type: number
  sql: ${TABLE}.w_gmt_offset ;;
  description: "not available"
}
dimension: w_state {
  type: string
  sql: ${TABLE}.w_state ;;
  description: "not available"
}
dimension: w_street_name {
  type: string
  sql: ${TABLE}.w_street_name ;;
  description: "not available"
}
dimension: w_street_number {
  type: string
  sql: ${TABLE}.w_street_number ;;
  description: "not available"
}
dimension: w_street_type {
  type: string
  sql: ${TABLE}.w_street_type ;;
  description: "not available"
}
dimension: w_suite_number {
  type: string
  sql: ${TABLE}.w_suite_number ;;
  description: "not available"
}
dimension: w_warehouse_id {
  type: string
  sql: ${TABLE}.w_warehouse_id ;;
  description: "not available"
}
dimension: w_warehouse_name {
  type: string
  sql: ${TABLE}.w_warehouse_name ;;
  description: "not available"
}
dimension: w_warehouse_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.w_warehouse_sk ;;
  description: "not available"
}
dimension: w_warehouse_sq_ft {
  hidden: yes 
  type: number
  sql: ${TABLE}.w_warehouse_sq_ft ;;
  description: "not available"
}
dimension: w_zip {
  type: string
  sql: ${TABLE}.w_zip ;;
  description: "not available"
}
}
view: web_page {
sql_table_name: web_page ;;
dimension: wp_access_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_access_date_sk ;;
  description: "not available"
}
dimension: wp_autogen_flag {
  type: string
  sql: ${TABLE}.wp_autogen_flag ;;
  description: "not available"
}
dimension: wp_char_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_char_count ;;
  description: "not available"
}
dimension: wp_creation_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_creation_date_sk ;;
  description: "not available"
}
dimension: wp_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_customer_sk ;;
  description: "not available"
}
dimension: wp_image_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_image_count ;;
  description: "not available"
}
dimension: wp_link_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_link_count ;;
  description: "not available"
}
dimension: wp_max_ad_count {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_max_ad_count ;;
  description: "not available"
}
dimension_group: wp_rec_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.wp_rec_end_date ;;
  description: "not available"
}
dimension_group: wp_rec_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.wp_rec_start_date ;;
  description: "not available"
}
dimension: wp_type {
  type: string
  sql: ${TABLE}.wp_type ;;
  description: "not available"
}
dimension: wp_url {
  type: string
  sql: ${TABLE}.wp_url ;;
  description: "not available"
}
dimension: wp_web_page_id {
  type: string
  sql: ${TABLE}.wp_web_page_id ;;
  description: "not available"
}
dimension: wp_web_page_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wp_web_page_sk ;;
  description: "not available"
}
}
view: web_returns {
sql_table_name: web_returns ;;
dimension: wr_account_credit {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_account_credit ;;
  description: "not available"
}
dimension: wr_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_fee ;;
  description: "not available"
}
dimension: wr_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_item_sk ;;
  description: "not available"
}
dimension: wr_net_loss {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_net_loss ;;
  description: "not available"
}
dimension: wr_order_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_order_number ;;
  description: "not available"
}
dimension: wr_reason_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_reason_sk ;;
  description: "not available"
}
dimension: wr_refunded_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_refunded_addr_sk ;;
  description: "not available"
}
dimension: wr_refunded_cash {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_refunded_cash ;;
  description: "not available"
}
dimension: wr_refunded_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_refunded_cdemo_sk ;;
  description: "not available"
}
dimension: wr_refunded_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_refunded_customer_sk ;;
  description: "not available"
}
dimension: wr_refunded_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_refunded_hdemo_sk ;;
  description: "not available"
}
dimension: wr_return_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_return_amt ;;
  description: "not available"
}
dimension: wr_return_amt_inc_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_return_amt_inc_tax ;;
  description: "not available"
}
dimension: wr_return_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_return_quantity ;;
  description: "not available"
}
dimension: wr_return_ship_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_return_ship_cost ;;
  description: "not available"
}
dimension: wr_return_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_return_tax ;;
  description: "not available"
}
dimension: wr_returned_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_returned_date_sk ;;
  description: "not available"
}
dimension: wr_returned_time_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_returned_time_sk ;;
  description: "not available"
}
dimension: wr_returning_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_returning_addr_sk ;;
  description: "not available"
}
dimension: wr_returning_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_returning_cdemo_sk ;;
  description: "not available"
}
dimension: wr_returning_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_returning_customer_sk ;;
  description: "not available"
}
dimension: wr_returning_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_returning_hdemo_sk ;;
  description: "not available"
}
dimension: wr_reversed_charge {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_reversed_charge ;;
  description: "not available"
}
dimension: wr_web_page_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.wr_web_page_sk ;;
  description: "not available"
}
}
view: web_sales {
sql_table_name: web_sales ;;
dimension: ws_bill_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_bill_addr_sk ;;
  description: "not available"
}
dimension: ws_bill_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_bill_cdemo_sk ;;
  description: "not available"
}
dimension: ws_bill_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_bill_customer_sk ;;
  description: "not available"
}
dimension: ws_bill_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_bill_hdemo_sk ;;
  description: "not available"
}
dimension: ws_coupon_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_coupon_amt ;;
  description: "not available"
}
dimension: ws_ext_discount_amt {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ext_discount_amt ;;
  description: "not available"
}
dimension: ws_ext_list_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ext_list_price ;;
  description: "not available"
}
dimension: ws_ext_sales_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ext_sales_price ;;
  description: "not available"
}
dimension: ws_ext_ship_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ext_ship_cost ;;
  description: "not available"
}
dimension: ws_ext_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ext_tax ;;
  description: "not available"
}
dimension: ws_ext_wholesale_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ext_wholesale_cost ;;
  description: "not available"
}
dimension: ws_item_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_item_sk ;;
  description: "not available"
}
dimension: ws_list_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_list_price ;;
  description: "not available"
}
dimension: ws_net_paid {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_net_paid ;;
  description: "not available"
}
dimension: ws_net_paid_inc_ship {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_net_paid_inc_ship ;;
  description: "not available"
}
dimension: ws_net_paid_inc_ship_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_net_paid_inc_ship_tax ;;
  description: "not available"
}
dimension: ws_net_paid_inc_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_net_paid_inc_tax ;;
  description: "not available"
}
dimension: ws_net_profit {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_net_profit ;;
  description: "not available"
}
dimension: ws_order_number {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_order_number ;;
  description: "not available"
}
dimension: ws_promo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_promo_sk ;;
  description: "not available"
}
dimension: ws_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_quantity ;;
  description: "not available"
}
dimension: ws_sales_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_sales_price ;;
  description: "not available"
}
dimension: ws_ship_addr_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ship_addr_sk ;;
  description: "not available"
}
dimension: ws_ship_cdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ship_cdemo_sk ;;
  description: "not available"
}
dimension: ws_ship_customer_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ship_customer_sk ;;
  description: "not available"
}
dimension: ws_ship_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ship_date_sk ;;
  description: "not available"
}
dimension: ws_ship_hdemo_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ship_hdemo_sk ;;
  description: "not available"
}
dimension: ws_ship_mode_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_ship_mode_sk ;;
  description: "not available"
}
dimension: ws_sold_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_sold_date_sk ;;
  description: "not available"
}
dimension: ws_sold_time_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_sold_time_sk ;;
  description: "not available"
}
dimension: ws_warehouse_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_warehouse_sk ;;
  description: "not available"
}
dimension: ws_web_page_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_web_page_sk ;;
  description: "not available"
}
dimension: ws_web_site_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_web_site_sk ;;
  description: "not available"
}
dimension: ws_wholesale_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.ws_wholesale_cost ;;
  description: "not available"
}
}
view: web_site {
sql_table_name: web_site ;;
dimension: web_city {
  type: string
  sql: ${TABLE}.web_city ;;
  description: "not available"
}
dimension: web_class {
  type: string
  sql: ${TABLE}.web_class ;;
  description: "not available"
}
dimension: web_close_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_close_date_sk ;;
  description: "not available"
}
dimension: web_company_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_company_id ;;
  description: "not available"
}
dimension: web_company_name {
  type: string
  sql: ${TABLE}.web_company_name ;;
  description: "not available"
}
dimension: web_country {
  type: string
  sql: ${TABLE}.web_country ;;
  description: "not available"
}
dimension: web_county {
  type: string
  sql: ${TABLE}.web_county ;;
  description: "not available"
}
dimension: web_gmt_offset {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_gmt_offset ;;
  description: "not available"
}
dimension: web_manager {
  type: string
  sql: ${TABLE}.web_manager ;;
  description: "not available"
}
dimension: web_market_manager {
  type: string
  sql: ${TABLE}.web_market_manager ;;
  description: "not available"
}
dimension: web_mkt_class {
  type: string
  sql: ${TABLE}.web_mkt_class ;;
  description: "not available"
}
dimension: web_mkt_desc {
  type: string
  sql: ${TABLE}.web_mkt_desc ;;
  description: "not available"
}
dimension: web_mkt_id {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_mkt_id ;;
  description: "not available"
}
dimension: web_name {
  type: string
  sql: ${TABLE}.web_name ;;
  description: "not available"
}
dimension: web_open_date_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_open_date_sk ;;
  description: "not available"
}
dimension_group: web_rec_end_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.web_rec_end_date ;;
  description: "not available"
}
dimension_group: web_rec_start_date {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.web_rec_start_date ;;
  description: "not available"
}
dimension: web_site_id {
  type: string
  sql: ${TABLE}.web_site_id ;;
  description: "not available"
}
dimension: web_site_sk {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_site_sk ;;
  description: "not available"
}
dimension: web_state {
  type: string
  sql: ${TABLE}.web_state ;;
  description: "not available"
}
dimension: web_street_name {
  type: string
  sql: ${TABLE}.web_street_name ;;
  description: "not available"
}
dimension: web_street_number {
  type: string
  sql: ${TABLE}.web_street_number ;;
  description: "not available"
}
dimension: web_street_type {
  type: string
  sql: ${TABLE}.web_street_type ;;
  description: "not available"
}
dimension: web_suite_number {
  type: string
  sql: ${TABLE}.web_suite_number ;;
  description: "not available"
}
dimension: web_tax_percentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.web_tax_percentage ;;
  description: "not available"
}
dimension: web_zip {
  type: string
  sql: ${TABLE}.web_zip ;;
  description: "not available"
}
}

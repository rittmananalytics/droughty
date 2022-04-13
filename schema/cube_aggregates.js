cube (`call_center_extended`, {
sql: `select * from TPCDS_SF100TCL.call_center`,
extends: call_center,
measures: {
}});
cube (`catalog_page_extended`, {
sql: `select * from TPCDS_SF100TCL.catalog_page`,
extends: catalog_page,
measures: {
}});
cube (`catalog_returns_extended`, {
sql: `select * from TPCDS_SF100TCL.catalog_returns`,
extends: catalog_returns,
measures: {
}});
cube (`catalog_sales_extended`, {
sql: `select * from TPCDS_SF100TCL.catalog_sales`,
extends: catalog_sales,
measures: {
}});
cube (`customer_extended`, {
sql: `select * from TPCDS_SF100TCL.customer`,
extends: customer,
measures: {
}});
cube (`customer_address_extended`, {
sql: `select * from TPCDS_SF100TCL.customer_address`,
extends: customer_address,
measures: {
}});
cube (`customer_demographics_extended`, {
sql: `select * from TPCDS_SF100TCL.customer_demographics`,
extends: customer_demographics,
measures: {
}});
cube (`date_dim_extended`, {
sql: `select * from TPCDS_SF100TCL.date_dim`,
extends: date_dim,
measures: {
}});
cube (`household_demographics_extended`, {
sql: `select * from TPCDS_SF100TCL.household_demographics`,
extends: household_demographics,
measures: {
}});
cube (`income_band_extended`, {
sql: `select * from TPCDS_SF100TCL.income_band`,
extends: income_band,
measures: {
}});
cube (`inventory_extended`, {
sql: `select * from TPCDS_SF100TCL.inventory`,
extends: inventory,
measures: {
}});
cube (`item_extended`, {
sql: `select * from TPCDS_SF100TCL.item`,
extends: item,
measures: {
}});
cube (`promotion_extended`, {
sql: `select * from TPCDS_SF100TCL.promotion`,
extends: promotion,
measures: {
}});
cube (`reason_extended`, {
sql: `select * from TPCDS_SF100TCL.reason`,
extends: reason,
measures: {
}});
cube (`ship_mode_extended`, {
sql: `select * from TPCDS_SF100TCL.ship_mode`,
extends: ship_mode,
measures: {
}});
cube (`store_extended`, {
sql: `select * from TPCDS_SF100TCL.store`,
extends: store,
measures: {
}});
cube (`store_returns_extended`, {
sql: `select * from TPCDS_SF100TCL.store_returns`,
extends: store_returns,
measures: {
}});
cube (`store_sales_extended`, {
sql: `select * from TPCDS_SF100TCL.store_sales`,
extends: store_sales,
measures: {
}});
cube (`time_dim_extended`, {
sql: `select * from TPCDS_SF100TCL.time_dim`,
extends: time_dim,
measures: {
}});
cube (`warehouse_extended`, {
sql: `select * from TPCDS_SF100TCL.warehouse`,
extends: warehouse,
measures: {
}});
cube (`web_page_extended`, {
sql: `select * from TPCDS_SF100TCL.web_page`,
extends: web_page,
measures: {
}});
cube (`web_returns_extended`, {
sql: `select * from TPCDS_SF100TCL.web_returns`,
extends: web_returns,
measures: {
}});
cube (`web_sales_extended`, {
sql: `select * from TPCDS_SF100TCL.web_sales`,
extends: web_sales,
measures: {
}});
cube (`web_site_extended`, {
sql: `select * from TPCDS_SF100TCL.web_site`,
extends: web_site,
measures: {
}});

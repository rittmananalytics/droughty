explore: APPLICABLE_ROLES
{ hidden: yes }
explore: CALL_CENTER
{ hidden: yes }
explore: CATALOG_PAGE
{ hidden: yes }
explore: CATALOG_RETURNS
{ hidden: yes }
explore: CATALOG_SALES
{ hidden: yes }
explore: COLUMNS
{ hidden: yes }
explore: CUSTOMER
{ hidden: yes }
explore: CUSTOMER_ADDRESS
{ hidden: yes }
explore: CUSTOMER_DEMOGRAPHICS
{ hidden: yes }
explore: DAILY_14_TOTAL
{ hidden: yes }
explore: DAILY_16_TOTAL
{ hidden: yes }
explore: DATABASES
{ hidden: yes }
explore: DATE_DIM
{ hidden: yes }
explore: DBGEN_VERSION
{ hidden: yes }
explore: ENABLED_ROLES
{ hidden: yes }
explore: EXTERNAL_TABLES
{ hidden: yes }
explore: FILE_FORMATS
{ hidden: yes }
explore: FUNCTIONS
{ hidden: yes }
explore: HOURLY_14_TOTAL
{ hidden: yes }
explore: HOURLY_16_TOTAL
{ hidden: yes }
explore: HOUSEHOLD_DEMOGRAPHICS
{ hidden: yes }
explore: INCOME_BAND
{ hidden: yes }
explore: INFORMATION_SCHEMA_CATALOG_NAME
{ hidden: yes }
explore: INVENTORY
{ hidden: yes }
explore: ITEM
{ hidden: yes }
explore: LINEITEM
{ hidden: yes }
explore: LOAD_HISTORY
{ hidden: yes }
explore: NATION
{ hidden: yes }
explore: OBJECT_PRIVILEGES
{ hidden: yes }
explore: ORDERS
{ hidden: yes }
explore: PACKAGES
{ hidden: yes }
explore: PART
{ hidden: yes }
explore: PARTSUPP
{ hidden: yes }
explore: PIPES
{ hidden: yes }
explore: PROCEDURES
{ hidden: yes }
explore: PROMOTION
{ hidden: yes }
explore: REASON
{ hidden: yes }
explore: REFERENTIAL_CONSTRAINTS
{ hidden: yes }
explore: REGION
{ hidden: yes }
explore: REPLICATION_DATABASES
{ hidden: yes }
explore: SCHEMATA
{ hidden: yes }
explore: SEQUENCES
{ hidden: yes }
explore: SHIP_MODE
{ hidden: yes }
explore: STAGES
{ hidden: yes }
explore: STORE
{ hidden: yes }
explore: STORE_RETURNS
{ hidden: yes }
explore: STORE_SALES
{ hidden: yes }
explore: SUPPLIER
{ hidden: yes }
explore: TABLES
{ hidden: yes }
explore: TABLE_CONSTRAINTS
{ hidden: yes }
explore: TABLE_PRIVILEGES
{ hidden: yes }
explore: TABLE_STORAGE_METRICS
{ hidden: yes }
explore: TIME_DIM
{ hidden: yes }
explore: USAGE_PRIVILEGES
{ hidden: yes }
explore: VIEWS
{ hidden: yes }
explore: WAREHOUSE
{ hidden: yes }
explore: WEATHER_14_TOTAL
{ hidden: yes }
explore: WEB_PAGE
{ hidden: yes }
explore: WEB_RETURNS
{ hidden: yes }
explore: WEB_SALES
{ hidden: yes }
explore: WEB_SITE
{ hidden: yes }
view: APPLICABLE_ROLES {
sql_table_name: APPLICABLE_ROLES ;;
dimension: GRANTEE {
  type: string
  sql: ${TABLE}.GRANTEE ;;
  description: "Role or user to whom the privilege is granted"
}
dimension: IS_GRANTABLE {
  type: string
  sql: ${TABLE}.IS_GRANTABLE ;;
  description: "Whether this role can be granted to others"
}
dimension: ROLE_NAME {
  type: string
  sql: ${TABLE}.ROLE_NAME ;;
  description: "Name of the role"
}
dimension: ROLE_OWNER {
  type: string
  sql: ${TABLE}.ROLE_OWNER ;;
  description: "Owner of the role"
}
}
view: CALL_CENTER {
sql_table_name: CALL_CENTER ;;
dimension: CC_CALL_CENTER_ID {
  type: string
  sql: ${TABLE}.CC_CALL_CENTER_ID ;;
  description: "not available"
}
dimension: CC_CALL_CENTER_SK {
  type: number
  sql: ${TABLE}.CC_CALL_CENTER_SK ;;
  description: "not available"
}
dimension: CC_CITY {
  type: string
  sql: ${TABLE}.CC_CITY ;;
  description: "not available"
}
dimension: CC_CLASS {
  type: string
  sql: ${TABLE}.CC_CLASS ;;
  description: "not available"
}
dimension: CC_CLOSED_DATE_SK {
  type: number
  sql: ${TABLE}.CC_CLOSED_DATE_SK ;;
  description: "not available"
}
dimension: CC_COMPANY {
  type: number
  sql: ${TABLE}.CC_COMPANY ;;
  description: "not available"
}
dimension: CC_COMPANY_NAME {
  type: string
  sql: ${TABLE}.CC_COMPANY_NAME ;;
  description: "not available"
}
dimension: CC_COUNTRY {
  type: string
  sql: ${TABLE}.CC_COUNTRY ;;
  description: "not available"
}
dimension: CC_COUNTY {
  type: string
  sql: ${TABLE}.CC_COUNTY ;;
  description: "not available"
}
dimension: CC_DIVISION {
  type: number
  sql: ${TABLE}.CC_DIVISION ;;
  description: "not available"
}
dimension: CC_DIVISION_NAME {
  type: string
  sql: ${TABLE}.CC_DIVISION_NAME ;;
  description: "not available"
}
dimension: CC_EMPLOYEES {
  type: number
  sql: ${TABLE}.CC_EMPLOYEES ;;
  description: "not available"
}
dimension: CC_GMT_OFFSET {
  type: number
  sql: ${TABLE}.CC_GMT_OFFSET ;;
  description: "not available"
}
dimension: CC_HOURS {
  type: string
  sql: ${TABLE}.CC_HOURS ;;
  description: "not available"
}
dimension: CC_MANAGER {
  type: string
  sql: ${TABLE}.CC_MANAGER ;;
  description: "not available"
}
dimension: CC_MARKET_MANAGER {
  type: string
  sql: ${TABLE}.CC_MARKET_MANAGER ;;
  description: "not available"
}
dimension: CC_MKT_CLASS {
  type: string
  sql: ${TABLE}.CC_MKT_CLASS ;;
  description: "not available"
}
dimension: CC_MKT_DESC {
  type: string
  sql: ${TABLE}.CC_MKT_DESC ;;
  description: "not available"
}
dimension: CC_MKT_ID {
  type: number
  sql: ${TABLE}.CC_MKT_ID ;;
  description: "not available"
}
dimension: CC_NAME {
  type: string
  sql: ${TABLE}.CC_NAME ;;
  description: "not available"
}
dimension: CC_OPEN_DATE_SK {
  type: number
  sql: ${TABLE}.CC_OPEN_DATE_SK ;;
  description: "not available"
}
dimension_group: CC_REC_END_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.CC_REC_END_DATE ;;
  description: "not available"
}
dimension_group: CC_REC_START_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.CC_REC_START_DATE ;;
  description: "not available"
}
dimension: CC_SQ_FT {
  type: number
  sql: ${TABLE}.CC_SQ_FT ;;
  description: "not available"
}
dimension: CC_STATE {
  type: string
  sql: ${TABLE}.CC_STATE ;;
  description: "not available"
}
dimension: CC_STREET_NAME {
  type: string
  sql: ${TABLE}.CC_STREET_NAME ;;
  description: "not available"
}
dimension: CC_STREET_NUMBER {
  type: string
  sql: ${TABLE}.CC_STREET_NUMBER ;;
  description: "not available"
}
dimension: CC_STREET_TYPE {
  type: string
  sql: ${TABLE}.CC_STREET_TYPE ;;
  description: "not available"
}
dimension: CC_SUITE_NUMBER {
  type: string
  sql: ${TABLE}.CC_SUITE_NUMBER ;;
  description: "not available"
}
dimension: CC_TAX_PERCENTAGE {
  type: number
  sql: ${TABLE}.CC_TAX_PERCENTAGE ;;
  description: "not available"
}
dimension: CC_ZIP {
  type: string
  sql: ${TABLE}.CC_ZIP ;;
  description: "not available"
}
}
view: CATALOG_PAGE {
sql_table_name: CATALOG_PAGE ;;
dimension: CP_CATALOG_NUMBER {
  type: number
  sql: ${TABLE}.CP_CATALOG_NUMBER ;;
  description: "not available"
}
dimension: CP_CATALOG_PAGE_ID {
  type: string
  sql: ${TABLE}.CP_CATALOG_PAGE_ID ;;
  description: "not available"
}
dimension: CP_CATALOG_PAGE_NUMBER {
  type: number
  sql: ${TABLE}.CP_CATALOG_PAGE_NUMBER ;;
  description: "not available"
}
dimension: CP_CATALOG_PAGE_SK {
  type: number
  sql: ${TABLE}.CP_CATALOG_PAGE_SK ;;
  description: "not available"
}
dimension: CP_DEPARTMENT {
  type: string
  sql: ${TABLE}.CP_DEPARTMENT ;;
  description: "not available"
}
dimension: CP_DESCRIPTION {
  type: string
  sql: ${TABLE}.CP_DESCRIPTION ;;
  description: "not available"
}
dimension: CP_END_DATE_SK {
  type: number
  sql: ${TABLE}.CP_END_DATE_SK ;;
  description: "not available"
}
dimension: CP_START_DATE_SK {
  type: number
  sql: ${TABLE}.CP_START_DATE_SK ;;
  description: "not available"
}
dimension: CP_TYPE {
  type: string
  sql: ${TABLE}.CP_TYPE ;;
  description: "not available"
}
}
view: CATALOG_RETURNS {
sql_table_name: CATALOG_RETURNS ;;
dimension: CR_CALL_CENTER_SK {
  type: number
  sql: ${TABLE}.CR_CALL_CENTER_SK ;;
  description: "not available"
}
dimension: CR_CATALOG_PAGE_SK {
  type: number
  sql: ${TABLE}.CR_CATALOG_PAGE_SK ;;
  description: "not available"
}
dimension: CR_FEE {
  type: number
  sql: ${TABLE}.CR_FEE ;;
  description: "not available"
}
dimension: CR_ITEM_SK {
  type: number
  sql: ${TABLE}.CR_ITEM_SK ;;
  description: "not available"
}
dimension: CR_NET_LOSS {
  type: number
  sql: ${TABLE}.CR_NET_LOSS ;;
  description: "not available"
}
dimension: CR_ORDER_NUMBER {
  type: number
  sql: ${TABLE}.CR_ORDER_NUMBER ;;
  description: "not available"
}
dimension: CR_REASON_SK {
  type: number
  sql: ${TABLE}.CR_REASON_SK ;;
  description: "not available"
}
dimension: CR_REFUNDED_ADDR_SK {
  type: number
  sql: ${TABLE}.CR_REFUNDED_ADDR_SK ;;
  description: "not available"
}
dimension: CR_REFUNDED_CASH {
  type: number
  sql: ${TABLE}.CR_REFUNDED_CASH ;;
  description: "not available"
}
dimension: CR_REFUNDED_CDEMO_SK {
  type: number
  sql: ${TABLE}.CR_REFUNDED_CDEMO_SK ;;
  description: "not available"
}
dimension: CR_REFUNDED_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.CR_REFUNDED_CUSTOMER_SK ;;
  description: "not available"
}
dimension: CR_REFUNDED_HDEMO_SK {
  type: number
  sql: ${TABLE}.CR_REFUNDED_HDEMO_SK ;;
  description: "not available"
}
dimension: CR_RETURNED_DATE_SK {
  type: number
  sql: ${TABLE}.CR_RETURNED_DATE_SK ;;
  description: "not available"
}
dimension: CR_RETURNED_TIME_SK {
  type: number
  sql: ${TABLE}.CR_RETURNED_TIME_SK ;;
  description: "not available"
}
dimension: CR_RETURNING_ADDR_SK {
  type: number
  sql: ${TABLE}.CR_RETURNING_ADDR_SK ;;
  description: "not available"
}
dimension: CR_RETURNING_CDEMO_SK {
  type: number
  sql: ${TABLE}.CR_RETURNING_CDEMO_SK ;;
  description: "not available"
}
dimension: CR_RETURNING_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.CR_RETURNING_CUSTOMER_SK ;;
  description: "not available"
}
dimension: CR_RETURNING_HDEMO_SK {
  type: number
  sql: ${TABLE}.CR_RETURNING_HDEMO_SK ;;
  description: "not available"
}
dimension: CR_RETURN_AMOUNT {
  type: number
  sql: ${TABLE}.CR_RETURN_AMOUNT ;;
  description: "not available"
}
dimension: CR_RETURN_AMT_INC_TAX {
  type: number
  sql: ${TABLE}.CR_RETURN_AMT_INC_TAX ;;
  description: "not available"
}
dimension: CR_RETURN_QUANTITY {
  type: number
  sql: ${TABLE}.CR_RETURN_QUANTITY ;;
  description: "not available"
}
dimension: CR_RETURN_SHIP_COST {
  type: number
  sql: ${TABLE}.CR_RETURN_SHIP_COST ;;
  description: "not available"
}
dimension: CR_RETURN_TAX {
  type: number
  sql: ${TABLE}.CR_RETURN_TAX ;;
  description: "not available"
}
dimension: CR_REVERSED_CHARGE {
  type: number
  sql: ${TABLE}.CR_REVERSED_CHARGE ;;
  description: "not available"
}
dimension: CR_SHIP_MODE_SK {
  type: number
  sql: ${TABLE}.CR_SHIP_MODE_SK ;;
  description: "not available"
}
dimension: CR_STORE_CREDIT {
  type: number
  sql: ${TABLE}.CR_STORE_CREDIT ;;
  description: "not available"
}
dimension: CR_WAREHOUSE_SK {
  type: number
  sql: ${TABLE}.CR_WAREHOUSE_SK ;;
  description: "not available"
}
}
view: CATALOG_SALES {
sql_table_name: CATALOG_SALES ;;
dimension: CS_BILL_ADDR_SK {
  type: number
  sql: ${TABLE}.CS_BILL_ADDR_SK ;;
  description: "not available"
}
dimension: CS_BILL_CDEMO_SK {
  type: number
  sql: ${TABLE}.CS_BILL_CDEMO_SK ;;
  description: "not available"
}
dimension: CS_BILL_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.CS_BILL_CUSTOMER_SK ;;
  description: "not available"
}
dimension: CS_BILL_HDEMO_SK {
  type: number
  sql: ${TABLE}.CS_BILL_HDEMO_SK ;;
  description: "not available"
}
dimension: CS_CALL_CENTER_SK {
  type: number
  sql: ${TABLE}.CS_CALL_CENTER_SK ;;
  description: "not available"
}
dimension: CS_CATALOG_PAGE_SK {
  type: number
  sql: ${TABLE}.CS_CATALOG_PAGE_SK ;;
  description: "not available"
}
dimension: CS_COUPON_AMT {
  type: number
  sql: ${TABLE}.CS_COUPON_AMT ;;
  description: "not available"
}
dimension: CS_EXT_DISCOUNT_AMT {
  type: number
  sql: ${TABLE}.CS_EXT_DISCOUNT_AMT ;;
  description: "not available"
}
dimension: CS_EXT_LIST_PRICE {
  type: number
  sql: ${TABLE}.CS_EXT_LIST_PRICE ;;
  description: "not available"
}
dimension: CS_EXT_SALES_PRICE {
  type: number
  sql: ${TABLE}.CS_EXT_SALES_PRICE ;;
  description: "not available"
}
dimension: CS_EXT_SHIP_COST {
  type: number
  sql: ${TABLE}.CS_EXT_SHIP_COST ;;
  description: "not available"
}
dimension: CS_EXT_TAX {
  type: number
  sql: ${TABLE}.CS_EXT_TAX ;;
  description: "not available"
}
dimension: CS_EXT_WHOLESALE_COST {
  type: number
  sql: ${TABLE}.CS_EXT_WHOLESALE_COST ;;
  description: "not available"
}
dimension: CS_ITEM_SK {
  type: number
  sql: ${TABLE}.CS_ITEM_SK ;;
  description: "not available"
}
dimension: CS_LIST_PRICE {
  type: number
  sql: ${TABLE}.CS_LIST_PRICE ;;
  description: "not available"
}
dimension: CS_NET_PAID {
  type: number
  sql: ${TABLE}.CS_NET_PAID ;;
  description: "not available"
}
dimension: CS_NET_PAID_INC_SHIP {
  type: number
  sql: ${TABLE}.CS_NET_PAID_INC_SHIP ;;
  description: "not available"
}
dimension: CS_NET_PAID_INC_SHIP_TAX {
  type: number
  sql: ${TABLE}.CS_NET_PAID_INC_SHIP_TAX ;;
  description: "not available"
}
dimension: CS_NET_PAID_INC_TAX {
  type: number
  sql: ${TABLE}.CS_NET_PAID_INC_TAX ;;
  description: "not available"
}
dimension: CS_NET_PROFIT {
  type: number
  sql: ${TABLE}.CS_NET_PROFIT ;;
  description: "not available"
}
dimension: CS_ORDER_NUMBER {
  type: number
  sql: ${TABLE}.CS_ORDER_NUMBER ;;
  description: "not available"
}
dimension: CS_PROMO_SK {
  type: number
  sql: ${TABLE}.CS_PROMO_SK ;;
  description: "not available"
}
dimension: CS_QUANTITY {
  type: number
  sql: ${TABLE}.CS_QUANTITY ;;
  description: "not available"
}
dimension: CS_SALES_PRICE {
  type: number
  sql: ${TABLE}.CS_SALES_PRICE ;;
  description: "not available"
}
dimension: CS_SHIP_ADDR_SK {
  type: number
  sql: ${TABLE}.CS_SHIP_ADDR_SK ;;
  description: "not available"
}
dimension: CS_SHIP_CDEMO_SK {
  type: number
  sql: ${TABLE}.CS_SHIP_CDEMO_SK ;;
  description: "not available"
}
dimension: CS_SHIP_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.CS_SHIP_CUSTOMER_SK ;;
  description: "not available"
}
dimension: CS_SHIP_DATE_SK {
  type: number
  sql: ${TABLE}.CS_SHIP_DATE_SK ;;
  description: "not available"
}
dimension: CS_SHIP_HDEMO_SK {
  type: number
  sql: ${TABLE}.CS_SHIP_HDEMO_SK ;;
  description: "not available"
}
dimension: CS_SHIP_MODE_SK {
  type: number
  sql: ${TABLE}.CS_SHIP_MODE_SK ;;
  description: "not available"
}
dimension: CS_SOLD_DATE_SK {
  type: number
  sql: ${TABLE}.CS_SOLD_DATE_SK ;;
  description: "not available"
}
dimension: CS_SOLD_TIME_SK {
  type: number
  sql: ${TABLE}.CS_SOLD_TIME_SK ;;
  description: "not available"
}
dimension: CS_WAREHOUSE_SK {
  type: number
  sql: ${TABLE}.CS_WAREHOUSE_SK ;;
  description: "not available"
}
dimension: CS_WHOLESALE_COST {
  type: number
  sql: ${TABLE}.CS_WHOLESALE_COST ;;
  description: "not available"
}
}
view: COLUMNS {
sql_table_name: COLUMNS ;;
dimension: CHARACTER_MAXIMUM_LENGTH {
  type: number
  sql: ${TABLE}.CHARACTER_MAXIMUM_LENGTH ;;
  description: "Maximum length in characters of string columns"
}
dimension: CHARACTER_OCTET_LENGTH {
  type: number
  sql: ${TABLE}.CHARACTER_OCTET_LENGTH ;;
  description: "Maximum length in bytes of string columns"
}
dimension: CHARACTER_SET_CATALOG {
  type: string
  sql: ${TABLE}.CHARACTER_SET_CATALOG ;;
  description: "Not applicable for Snowflake."
}
dimension: CHARACTER_SET_NAME {
  type: string
  sql: ${TABLE}.CHARACTER_SET_NAME ;;
  description: "Not applicable for Snowflake."
}
dimension: CHARACTER_SET_SCHEMA {
  type: string
  sql: ${TABLE}.CHARACTER_SET_SCHEMA ;;
  description: "Not applicable for Snowflake."
}
dimension: COLLATION_CATALOG {
  type: string
  sql: ${TABLE}.COLLATION_CATALOG ;;
  description: "Not applicable for Snowflake."
}
dimension: COLLATION_NAME {
  type: string
  sql: ${TABLE}.COLLATION_NAME ;;
  description: "The name of collation, if present"
}
dimension: COLLATION_SCHEMA {
  type: string
  sql: ${TABLE}.COLLATION_SCHEMA ;;
  description: "Not applicable for Snowflake."
}
dimension: COLUMN_DEFAULT {
  type: string
  sql: ${TABLE}.COLUMN_DEFAULT ;;
  description: "Default value of the column"
}
dimension: COLUMN_NAME {
  type: string
  sql: ${TABLE}.COLUMN_NAME ;;
  description: "Name of the column"
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this column"
}
dimension: DATA_TYPE {
  type: string
  sql: ${TABLE}.DATA_TYPE ;;
  description: "Data type of the column"
}
dimension: DATETIME_PRECISION {
  type: number
  sql: ${TABLE}.DATETIME_PRECISION ;;
  description: "Not applicable for Snowflake."
}
dimension: DOMAIN_CATALOG {
  type: string
  sql: ${TABLE}.DOMAIN_CATALOG ;;
  description: "Not applicable for Snowflake."
}
dimension: DOMAIN_NAME {
  type: string
  sql: ${TABLE}.DOMAIN_NAME ;;
  description: "Not applicable for Snowflake."
}
dimension: DOMAIN_SCHEMA {
  type: string
  sql: ${TABLE}.DOMAIN_SCHEMA ;;
  description: "Not applicable for Snowflake."
}
dimension: DTD_IDENTIFIER {
  type: string
  sql: ${TABLE}.DTD_IDENTIFIER ;;
  description: "Not applicable for Snowflake."
}
dimension: IDENTITY_CYCLE {
  type: string
  sql: ${TABLE}.IDENTITY_CYCLE ;;
  description: "Whether the value of an identity column may cycle.  Snowflake only supports NO CYCLE."
}
dimension: IDENTITY_GENERATION {
  type: string
  sql: ${TABLE}.IDENTITY_GENERATION ;;
  description: "Whether an identity column's value is always generated or only generated by default.  Snowflake only supports BY DEFAULT"
}
dimension: IDENTITY_INCREMENT {
  type: string
  sql: ${TABLE}.IDENTITY_INCREMENT ;;
  description: "Not applicable for Snowflake."
}
dimension: IDENTITY_MAXIMUM {
  type: string
  sql: ${TABLE}.IDENTITY_MAXIMUM ;;
  description: "Not applicable for Snowflake."
}
dimension: IDENTITY_MINIMUM {
  type: string
  sql: ${TABLE}.IDENTITY_MINIMUM ;;
  description: "Not applicable for Snowflake."
}
dimension: IDENTITY_START {
  type: string
  sql: ${TABLE}.IDENTITY_START ;;
  description: "Not applicable for Snowflake."
}
dimension: INTERVAL_PRECISION {
  type: number
  sql: ${TABLE}.INTERVAL_PRECISION ;;
  description: "Not applicable for Snowflake."
}
dimension: INTERVAL_TYPE {
  type: string
  sql: ${TABLE}.INTERVAL_TYPE ;;
  description: "Not applicable for Snowflake."
}
dimension: IS_IDENTITY {
  type: string
  sql: ${TABLE}.IS_IDENTITY ;;
  description: "Whether this column is an identity column"
}
dimension: IS_NULLABLE {
  type: string
  sql: ${TABLE}.IS_NULLABLE ;;
  description: "'YES' if the column may contain NULL, 'NO' otherwise"
}
dimension: IS_SELF_REFERENCING {
  type: string
  sql: ${TABLE}.IS_SELF_REFERENCING ;;
  description: "Not applicable for Snowflake."
}
dimension: MAXIMUM_CARDINALITY {
  type: number
  sql: ${TABLE}.MAXIMUM_CARDINALITY ;;
  description: "Not applicable for Snowflake."
}
dimension: NUMERIC_PRECISION {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION ;;
  description: "Numeric precision of numeric columns"
}
dimension: NUMERIC_PRECISION_RADIX {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
  description: "Radix of precision of numeric columns"
}
dimension: NUMERIC_SCALE {
  type: number
  sql: ${TABLE}.NUMERIC_SCALE ;;
  description: "Scale of numeric columns"
}
dimension: ORDINAL_POSITION {
  type: number
  sql: ${TABLE}.ORDINAL_POSITION ;;
  description: "Ordinal position of the column in the table"
}
dimension: SCOPE_CATALOG {
  type: string
  sql: ${TABLE}.SCOPE_CATALOG ;;
  description: "Not applicable for Snowflake."
}
dimension: SCOPE_NAME {
  type: string
  sql: ${TABLE}.SCOPE_NAME ;;
  description: "Not applicable for Snowflake."
}
dimension: SCOPE_SCHEMA {
  type: string
  sql: ${TABLE}.SCOPE_SCHEMA ;;
  description: "Not applicable for Snowflake."
}
dimension: TABLE_CATALOG {
  type: string
  sql: ${TABLE}.TABLE_CATALOG ;;
  description: "Database that the table belongs to"
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Table that the column belongs to"
}
dimension: TABLE_SCHEMA {
  type: string
  sql: ${TABLE}.TABLE_SCHEMA ;;
  description: "Schema that the table belongs to"
}
dimension: UDT_CATALOG {
  type: string
  sql: ${TABLE}.UDT_CATALOG ;;
  description: "Not applicable for Snowflake."
}
dimension: UDT_NAME {
  type: string
  sql: ${TABLE}.UDT_NAME ;;
  description: "Not applicable for Snowflake."
}
dimension: UDT_SCHEMA {
  type: string
  sql: ${TABLE}.UDT_SCHEMA ;;
  description: "Not applicable for Snowflake."
}
}
view: CUSTOMER {
sql_table_name: CUSTOMER ;;
dimension: C_ACCTBAL {
  type: number
  sql: ${TABLE}.C_ACCTBAL ;;
  description: "not available"
}
dimension: C_ADDRESS {
  type: string
  sql: ${TABLE}.C_ADDRESS ;;
  description: "not available"
}
dimension: C_BIRTH_COUNTRY {
  type: string
  sql: ${TABLE}.C_BIRTH_COUNTRY ;;
  description: "not available"
}
dimension: C_BIRTH_DAY {
  type: number
  sql: ${TABLE}.C_BIRTH_DAY ;;
  description: "not available"
}
dimension: C_BIRTH_MONTH {
  type: number
  sql: ${TABLE}.C_BIRTH_MONTH ;;
  description: "not available"
}
dimension: C_BIRTH_YEAR {
  type: number
  sql: ${TABLE}.C_BIRTH_YEAR ;;
  description: "not available"
}
dimension: C_COMMENT {
  type: string
  sql: ${TABLE}.C_COMMENT ;;
  description: "not available"
}
dimension: C_CURRENT_ADDR_SK {
  type: number
  sql: ${TABLE}.C_CURRENT_ADDR_SK ;;
  description: "not available"
}
dimension: C_CURRENT_CDEMO_SK {
  type: number
  sql: ${TABLE}.C_CURRENT_CDEMO_SK ;;
  description: "not available"
}
dimension: C_CURRENT_HDEMO_SK {
  type: number
  sql: ${TABLE}.C_CURRENT_HDEMO_SK ;;
  description: "not available"
}
dimension: C_CUSTKEY {
  type: number
  sql: ${TABLE}.C_CUSTKEY ;;
  description: "not available"
}
dimension: C_CUSTOMER_ID {
  type: string
  sql: ${TABLE}.C_CUSTOMER_ID ;;
  description: "not available"
}
dimension: C_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.C_CUSTOMER_SK ;;
  description: "not available"
}
dimension: C_EMAIL_ADDRESS {
  type: string
  sql: ${TABLE}.C_EMAIL_ADDRESS ;;
  description: "not available"
}
dimension: C_FIRST_NAME {
  type: string
  sql: ${TABLE}.C_FIRST_NAME ;;
  description: "not available"
}
dimension: C_FIRST_SALES_DATE_SK {
  type: number
  sql: ${TABLE}.C_FIRST_SALES_DATE_SK ;;
  description: "not available"
}
dimension: C_FIRST_SHIPTO_DATE_SK {
  type: number
  sql: ${TABLE}.C_FIRST_SHIPTO_DATE_SK ;;
  description: "not available"
}
dimension: C_LAST_NAME {
  type: string
  sql: ${TABLE}.C_LAST_NAME ;;
  description: "not available"
}
dimension: C_LAST_REVIEW_DATE {
  type: string
  sql: ${TABLE}.C_LAST_REVIEW_DATE ;;
  description: "not available"
}
dimension: C_LOGIN {
  type: string
  sql: ${TABLE}.C_LOGIN ;;
  description: "not available"
}
dimension: C_MKTSEGMENT {
  type: string
  sql: ${TABLE}.C_MKTSEGMENT ;;
  description: "not available"
}
dimension: C_NAME {
  type: string
  sql: ${TABLE}.C_NAME ;;
  description: "Customer Name"
}
dimension: C_NAME {
  type: string
  sql: ${TABLE}.C_NAME ;;
  description: "not available"
}
dimension: C_NATIONKEY {
  type: number
  sql: ${TABLE}.C_NATIONKEY ;;
  description: "not available"
}
dimension: C_PHONE {
  type: string
  sql: ${TABLE}.C_PHONE ;;
  description: "not available"
}
dimension: C_PREFERRED_CUST_FLAG {
  type: string
  sql: ${TABLE}.C_PREFERRED_CUST_FLAG ;;
  description: "not available"
}
dimension: C_SALUTATION {
  type: string
  sql: ${TABLE}.C_SALUTATION ;;
  description: "not available"
}
}
view: CUSTOMER_ADDRESS {
sql_table_name: CUSTOMER_ADDRESS ;;
dimension: CA_ADDRESS_ID {
  type: string
  sql: ${TABLE}.CA_ADDRESS_ID ;;
  description: "not available"
}
dimension: CA_ADDRESS_SK {
  type: number
  sql: ${TABLE}.CA_ADDRESS_SK ;;
  description: "not available"
}
dimension: CA_CITY {
  type: string
  sql: ${TABLE}.CA_CITY ;;
  description: "not available"
}
dimension: CA_COUNTRY {
  type: string
  sql: ${TABLE}.CA_COUNTRY ;;
  description: "not available"
}
dimension: CA_COUNTY {
  type: string
  sql: ${TABLE}.CA_COUNTY ;;
  description: "not available"
}
dimension: CA_GMT_OFFSET {
  type: number
  sql: ${TABLE}.CA_GMT_OFFSET ;;
  description: "not available"
}
dimension: CA_LOCATION_TYPE {
  type: string
  sql: ${TABLE}.CA_LOCATION_TYPE ;;
  description: "not available"
}
dimension: CA_STATE {
  type: string
  sql: ${TABLE}.CA_STATE ;;
  description: "not available"
}
dimension: CA_STREET_NAME {
  type: string
  sql: ${TABLE}.CA_STREET_NAME ;;
  description: "not available"
}
dimension: CA_STREET_NUMBER {
  type: string
  sql: ${TABLE}.CA_STREET_NUMBER ;;
  description: "not available"
}
dimension: CA_STREET_TYPE {
  type: string
  sql: ${TABLE}.CA_STREET_TYPE ;;
  description: "not available"
}
dimension: CA_SUITE_NUMBER {
  type: string
  sql: ${TABLE}.CA_SUITE_NUMBER ;;
  description: "not available"
}
dimension: CA_ZIP {
  type: string
  sql: ${TABLE}.CA_ZIP ;;
  description: "not available"
}
}
view: CUSTOMER_DEMOGRAPHICS {
sql_table_name: CUSTOMER_DEMOGRAPHICS ;;
dimension: CD_CREDIT_RATING {
  type: string
  sql: ${TABLE}.CD_CREDIT_RATING ;;
  description: "not available"
}
dimension: CD_DEMO_SK {
  type: number
  sql: ${TABLE}.CD_DEMO_SK ;;
  description: "not available"
}
dimension: CD_DEP_COLLEGE_COUNT {
  type: number
  sql: ${TABLE}.CD_DEP_COLLEGE_COUNT ;;
  description: "not available"
}
dimension: CD_DEP_COUNT {
  type: number
  sql: ${TABLE}.CD_DEP_COUNT ;;
  description: "not available"
}
dimension: CD_DEP_EMPLOYED_COUNT {
  type: number
  sql: ${TABLE}.CD_DEP_EMPLOYED_COUNT ;;
  description: "not available"
}
dimension: CD_EDUCATION_STATUS {
  type: string
  sql: ${TABLE}.CD_EDUCATION_STATUS ;;
  description: "not available"
}
dimension: CD_GENDER {
  type: string
  sql: ${TABLE}.CD_GENDER ;;
  description: "not available"
}
dimension: CD_MARITAL_STATUS {
  type: string
  sql: ${TABLE}.CD_MARITAL_STATUS ;;
  description: "not available"
}
dimension: CD_PURCHASE_ESTIMATE {
  type: number
  sql: ${TABLE}.CD_PURCHASE_ESTIMATE ;;
  description: "not available"
}
}
view: DAILY_14_TOTAL {
sql_table_name: DAILY_14_TOTAL ;;
dimension_group: T {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.T ;;
  description: "not available"
}
dimension: V {
  type: VARIANT
  sql: ${TABLE}.V ;;
  description: "not available"
}
}
view: DAILY_16_TOTAL {
sql_table_name: DAILY_16_TOTAL ;;
dimension_group: T {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.T ;;
  description: "not available"
}
dimension: V {
  type: VARIANT
  sql: ${TABLE}.V ;;
  description: "not available"
}
}
view: DATABASES {
sql_table_name: DATABASES ;;
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this database"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the database"
}
dimension: DATABASE_NAME {
  type: string
  sql: ${TABLE}.DATABASE_NAME ;;
  description: "Name of the database"
}
dimension: DATABASE_OWNER {
  type: string
  sql: ${TABLE}.DATABASE_OWNER ;;
  description: "Name of the role that owns the schema"
}
dimension: IS_TRANSIENT {
  type: string
  sql: ${TABLE}.IS_TRANSIENT ;;
  description: "Whether this is a transient table"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the database"
}
dimension: RETENTION_TIME {
  type: number
  sql: ${TABLE}.RETENTION_TIME ;;
  description: "Number of days that historical data is retained for Time Travel"
}
}
view: DATE_DIM {
sql_table_name: DATE_DIM ;;
dimension: D_CURRENT_DAY {
  type: string
  sql: ${TABLE}.D_CURRENT_DAY ;;
  description: "not available"
}
dimension: D_CURRENT_MONTH {
  type: string
  sql: ${TABLE}.D_CURRENT_MONTH ;;
  description: "not available"
}
dimension: D_CURRENT_QUARTER {
  type: string
  sql: ${TABLE}.D_CURRENT_QUARTER ;;
  description: "not available"
}
dimension: D_CURRENT_WEEK {
  type: string
  sql: ${TABLE}.D_CURRENT_WEEK ;;
  description: "not available"
}
dimension: D_CURRENT_YEAR {
  type: string
  sql: ${TABLE}.D_CURRENT_YEAR ;;
  description: "not available"
}
dimension_group: D_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.D_DATE ;;
  description: "not available"
}
dimension: D_DATE_ID {
  type: string
  sql: ${TABLE}.D_DATE_ID ;;
  description: "not available"
}
dimension: D_DATE_SK {
  type: number
  sql: ${TABLE}.D_DATE_SK ;;
  description: "not available"
}
dimension: D_DAY_NAME {
  type: string
  sql: ${TABLE}.D_DAY_NAME ;;
  description: "not available"
}
dimension: D_DOM {
  type: number
  sql: ${TABLE}.D_DOM ;;
  description: "not available"
}
dimension: D_DOW {
  type: number
  sql: ${TABLE}.D_DOW ;;
  description: "not available"
}
dimension: D_FIRST_DOM {
  type: number
  sql: ${TABLE}.D_FIRST_DOM ;;
  description: "not available"
}
dimension: D_FOLLOWING_HOLIDAY {
  type: string
  sql: ${TABLE}.D_FOLLOWING_HOLIDAY ;;
  description: "not available"
}
dimension: D_FY_QUARTER_SEQ {
  type: number
  sql: ${TABLE}.D_FY_QUARTER_SEQ ;;
  description: "not available"
}
dimension: D_FY_WEEK_SEQ {
  type: number
  sql: ${TABLE}.D_FY_WEEK_SEQ ;;
  description: "not available"
}
dimension: D_FY_YEAR {
  type: number
  sql: ${TABLE}.D_FY_YEAR ;;
  description: "not available"
}
dimension: D_HOLIDAY {
  type: string
  sql: ${TABLE}.D_HOLIDAY ;;
  description: "not available"
}
dimension: D_LAST_DOM {
  type: number
  sql: ${TABLE}.D_LAST_DOM ;;
  description: "not available"
}
dimension: D_MONTH_SEQ {
  type: number
  sql: ${TABLE}.D_MONTH_SEQ ;;
  description: "not available"
}
dimension: D_MOY {
  type: number
  sql: ${TABLE}.D_MOY ;;
  description: "not available"
}
dimension: D_QOY {
  type: number
  sql: ${TABLE}.D_QOY ;;
  description: "not available"
}
dimension: D_QUARTER_NAME {
  type: string
  sql: ${TABLE}.D_QUARTER_NAME ;;
  description: "not available"
}
dimension: D_QUARTER_SEQ {
  type: number
  sql: ${TABLE}.D_QUARTER_SEQ ;;
  description: "not available"
}
dimension: D_SAME_DAY_LQ {
  type: number
  sql: ${TABLE}.D_SAME_DAY_LQ ;;
  description: "not available"
}
dimension: D_SAME_DAY_LY {
  type: number
  sql: ${TABLE}.D_SAME_DAY_LY ;;
  description: "not available"
}
dimension: D_WEEKEND {
  type: string
  sql: ${TABLE}.D_WEEKEND ;;
  description: "not available"
}
dimension: D_WEEK_SEQ {
  type: number
  sql: ${TABLE}.D_WEEK_SEQ ;;
  description: "not available"
}
dimension: D_YEAR {
  type: number
  sql: ${TABLE}.D_YEAR ;;
  description: "not available"
}
}
view: DBGEN_VERSION {
sql_table_name: DBGEN_VERSION ;;
dimension: DV_CMDLINE_ARGS {
  type: string
  sql: ${TABLE}.DV_CMDLINE_ARGS ;;
  description: "not available"
}
dimension_group: DV_CREATE_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.DV_CREATE_DATE ;;
  description: "not available"
}
dimension: DV_CREATE_TIME {
  type: string
  sql: ${TABLE}.DV_CREATE_TIME ;;
  description: "not available"
}
dimension: DV_VERSION {
  type: string
  sql: ${TABLE}.DV_VERSION ;;
  description: "not available"
}
}
view: ENABLED_ROLES {
sql_table_name: ENABLED_ROLES ;;
dimension: ROLE_NAME {
  type: string
  sql: ${TABLE}.ROLE_NAME ;;
  description: "Name of the role"
}
dimension: ROLE_OWNER {
  type: string
  sql: ${TABLE}.ROLE_OWNER ;;
  description: "Owner of the role"
}
}
view: EXTERNAL_TABLES {
sql_table_name: EXTERNAL_TABLES ;;
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this external table"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the external table"
}
dimension: FILE_FORMAT_NAME {
  type: string
  sql: ${TABLE}.FILE_FORMAT_NAME ;;
  description: "File format name (if there is one) of the external table"
}
dimension: FILE_FORMAT_TYPE {
  type: string
  sql: ${TABLE}.FILE_FORMAT_TYPE ;;
  description: "File format type (if not named) of the external table"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the external table"
}
dimension: LOCATION {
  type: string
  sql: ${TABLE}.LOCATION ;;
  description: "Location of the external table"
}
dimension: TABLE_CATALOG {
  type: string
  sql: ${TABLE}.TABLE_CATALOG ;;
  description: "Database that the external table belongs to"
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Name of the external table"
}
dimension: TABLE_OWNER {
  type: string
  sql: ${TABLE}.TABLE_OWNER ;;
  description: "Name of the role that owns the external table"
}
dimension: TABLE_SCHEMA {
  type: string
  sql: ${TABLE}.TABLE_SCHEMA ;;
  description: "Schema that the external table belongs to"
}
}
view: FILE_FORMATS {
sql_table_name: FILE_FORMATS ;;
dimension: BINARY_FORMAT {
  type: string
  sql: ${TABLE}.BINARY_FORMAT ;;
  description: "Binary format"
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this file format"
}
dimension: COMPRESSION {
  type: string
  sql: ${TABLE}.COMPRESSION ;;
  description: "Compression method for the data file"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the file format"
}
dimension: DATE_FORMAT {
  type: string
  sql: ${TABLE}.DATE_FORMAT ;;
  description: "Date format"
}
dimension: ERROR_ON_COLUMN_COUNT_MISMATCH {
  type: string
  sql: ${TABLE}.ERROR_ON_COLUMN_COUNT_MISMATCH ;;
  description: "Whether to generate a parsing error if the number of fields in an input file does not match the number of columns in the corresponding table"
}
dimension: ESCAPE {
  type: string
  sql: ${TABLE}.ESCAPE ;;
  description: "String used as the escape character for any field values"
}
dimension: ESCAPE_UNENCLOSED_FIELD {
  type: string
  sql: ${TABLE}.ESCAPE_UNENCLOSED_FIELD ;;
  description: "String used as the escape character for unenclosed field values"
}
dimension: FIELD_DELIMITER {
  type: string
  sql: ${TABLE}.FIELD_DELIMITER ;;
  description: "Character that separates fields"
}
dimension: FIELD_OPTIONALLY_ENCLOSED_BY {
  type: string
  sql: ${TABLE}.FIELD_OPTIONALLY_ENCLOSED_BY ;;
  description: "Character used to enclose strings"
}
dimension: FILE_FORMAT_CATALOG {
  type: string
  sql: ${TABLE}.FILE_FORMAT_CATALOG ;;
  description: "Database that the file format belongs to"
}
dimension: FILE_FORMAT_NAME {
  type: string
  sql: ${TABLE}.FILE_FORMAT_NAME ;;
  description: "Name of the file format"
}
dimension: FILE_FORMAT_OWNER {
  type: string
  sql: ${TABLE}.FILE_FORMAT_OWNER ;;
  description: "Name of the role that owns the file format"
}
dimension: FILE_FORMAT_SCHEMA {
  type: string
  sql: ${TABLE}.FILE_FORMAT_SCHEMA ;;
  description: "Schema that the file format belongs to"
}
dimension: FILE_FORMAT_TYPE {
  type: string
  sql: ${TABLE}.FILE_FORMAT_TYPE ;;
  description: "Type of the file format"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the file format"
}
dimension: NULL_IF {
  type: string
  sql: ${TABLE}.NULL_IF ;;
  description: "A list of strings to be replaced by null"
}
dimension: RECORD_DELIMITER {
  type: string
  sql: ${TABLE}.RECORD_DELIMITER ;;
  description: "Character that separates records"
}
dimension: SKIP_HEADER {
  type: number
  sql: ${TABLE}.SKIP_HEADER ;;
  description: "Number of lines skipped at the start of the file"
}
dimension: TIMESTAMP_FORMAT {
  type: string
  sql: ${TABLE}.TIMESTAMP_FORMAT ;;
  description: "Timestamp format"
}
dimension: TIME_FORMAT {
  type: string
  sql: ${TABLE}.TIME_FORMAT ;;
  description: "Time format"
}
dimension: TRIM_SPACE {
  type: string
  sql: ${TABLE}.TRIM_SPACE ;;
  description: "Whether whitespace is removed from fields"
}
}
view: FUNCTIONS {
sql_table_name: FUNCTIONS ;;
dimension: API_INTEGRATION {
  type: string
  sql: ${TABLE}.API_INTEGRATION ;;
  description: "Integration for this function"
}
dimension: ARGUMENT_SIGNATURE {
  type: string
  sql: ${TABLE}.ARGUMENT_SIGNATURE ;;
  description: "Type signature of the function's arguments"
}
dimension: CHARACTER_MAXIMUM_LENGTH {
  type: number
  sql: ${TABLE}.CHARACTER_MAXIMUM_LENGTH ;;
  description: "Maximum length in characters of string return value"
}
dimension: CHARACTER_OCTET_LENGTH {
  type: number
  sql: ${TABLE}.CHARACTER_OCTET_LENGTH ;;
  description: "Maximum length in bytes of string return value"
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this function"
}
dimension: COMPRESSION {
  type: string
  sql: ${TABLE}.COMPRESSION ;;
  description: "Type of compression used for serializing function payload"
}
dimension: CONTEXT_HEADERS {
  type: string
  sql: ${TABLE}.CONTEXT_HEADERS ;;
  description: "Context headers for this function"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the function"
}
dimension: DATA_TYPE {
  type: string
  sql: ${TABLE}.DATA_TYPE ;;
  description: "Return value data type"
}
dimension: FUNCTION_CATALOG {
  type: string
  sql: ${TABLE}.FUNCTION_CATALOG ;;
  description: "Database which the function belongs to"
}
dimension: FUNCTION_DEFINITION {
  type: string
  sql: ${TABLE}.FUNCTION_DEFINITION ;;
  description: "Function definition"
}
dimension: FUNCTION_LANGUAGE {
  type: string
  sql: ${TABLE}.FUNCTION_LANGUAGE ;;
  description: "Language of the function"
}
dimension: FUNCTION_NAME {
  type: string
  sql: ${TABLE}.FUNCTION_NAME ;;
  description: "Name of the function"
}
dimension: FUNCTION_OWNER {
  type: string
  sql: ${TABLE}.FUNCTION_OWNER ;;
  description: "Name of the role that owns the function"
}
dimension: FUNCTION_SCHEMA {
  type: string
  sql: ${TABLE}.FUNCTION_SCHEMA ;;
  description: "Schema which the function belongs to"
}
dimension: HANDLER {
  type: string
  sql: ${TABLE}.HANDLER ;;
  description: "Handler for the function"
}
dimension: IMPORTS {
  type: string
  sql: ${TABLE}.IMPORTS ;;
  description: "List of imports for the function"
}
dimension: IS_EXTERNAL {
  type: string
  sql: ${TABLE}.IS_EXTERNAL ;;
  description: "Whether this function is external"
}
dimension: IS_NULL_CALL {
  type: string
  sql: ${TABLE}.IS_NULL_CALL ;;
  description: "Whether the function is called on null input"
}
dimension: IS_SECURE {
  type: string
  sql: ${TABLE}.IS_SECURE ;;
  description: "Whether this function is secure."
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the function"
}
dimension: MAX_BATCH_ROWS {
  type: number
  sql: ${TABLE}.MAX_BATCH_ROWS ;;
  description: "Max batch rows for this function"
}
dimension: NUMERIC_PRECISION {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION ;;
  description: "Numeric precision of numeric return value"
}
dimension: NUMERIC_PRECISION_RADIX {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
  description: "Radix of precision of numeric return value"
}
dimension: NUMERIC_SCALE {
  type: number
  sql: ${TABLE}.NUMERIC_SCALE ;;
  description: "Scale of numeric return value"
}
dimension: TARGET_PATH {
  type: string
  sql: ${TABLE}.TARGET_PATH ;;
  description: "Stage path for storage of compiled inline Java UDF code"
}
dimension: VOLATILITY {
  type: string
  sql: ${TABLE}.VOLATILITY ;;
  description: "Whether the function is volatile or immutable"
}
}
view: HOURLY_14_TOTAL {
sql_table_name: HOURLY_14_TOTAL ;;
dimension_group: T {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.T ;;
  description: "not available"
}
dimension: V {
  type: VARIANT
  sql: ${TABLE}.V ;;
  description: "not available"
}
}
view: HOURLY_16_TOTAL {
sql_table_name: HOURLY_16_TOTAL ;;
dimension_group: T {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.T ;;
  description: "not available"
}
dimension: V {
  type: VARIANT
  sql: ${TABLE}.V ;;
  description: "not available"
}
}
view: HOUSEHOLD_DEMOGRAPHICS {
sql_table_name: HOUSEHOLD_DEMOGRAPHICS ;;
dimension: HD_BUY_POTENTIAL {
  type: string
  sql: ${TABLE}.HD_BUY_POTENTIAL ;;
  description: "not available"
}
dimension: HD_DEMO_SK {
  type: number
  sql: ${TABLE}.HD_DEMO_SK ;;
  description: "not available"
}
dimension: HD_DEP_COUNT {
  type: number
  sql: ${TABLE}.HD_DEP_COUNT ;;
  description: "not available"
}
dimension: HD_INCOME_BAND_SK {
  type: number
  sql: ${TABLE}.HD_INCOME_BAND_SK ;;
  description: "not available"
}
dimension: HD_VEHICLE_COUNT {
  type: number
  sql: ${TABLE}.HD_VEHICLE_COUNT ;;
  description: "not available"
}
}
view: INCOME_BAND {
sql_table_name: INCOME_BAND ;;
dimension: IB_INCOME_BAND_SK {
  type: number
  sql: ${TABLE}.IB_INCOME_BAND_SK ;;
  description: "not available"
}
dimension: IB_LOWER_BOUND {
  type: number
  sql: ${TABLE}.IB_LOWER_BOUND ;;
  description: "not available"
}
dimension: IB_UPPER_BOUND {
  type: number
  sql: ${TABLE}.IB_UPPER_BOUND ;;
  description: "not available"
}
}
view: INFORMATION_SCHEMA_CATALOG_NAME {
sql_table_name: INFORMATION_SCHEMA_CATALOG_NAME ;;
dimension: CATALOG_NAME {
  type: string
  sql: ${TABLE}.CATALOG_NAME ;;
  description: "The name of the database in which this information_schema resides."
}
}
view: INVENTORY {
sql_table_name: INVENTORY ;;
dimension: INV_DATE_SK {
  type: number
  sql: ${TABLE}.INV_DATE_SK ;;
  description: "not available"
}
dimension: INV_ITEM_SK {
  type: number
  sql: ${TABLE}.INV_ITEM_SK ;;
  description: "not available"
}
dimension: INV_QUANTITY_ON_HAND {
  type: number
  sql: ${TABLE}.INV_QUANTITY_ON_HAND ;;
  description: "not available"
}
dimension: INV_WAREHOUSE_SK {
  type: number
  sql: ${TABLE}.INV_WAREHOUSE_SK ;;
  description: "not available"
}
}
view: ITEM {
sql_table_name: ITEM ;;
dimension: I_BRAND {
  type: string
  sql: ${TABLE}.I_BRAND ;;
  description: "not available"
}
dimension: I_BRAND_ID {
  type: number
  sql: ${TABLE}.I_BRAND_ID ;;
  description: "not available"
}
dimension: I_CATEGORY {
  type: string
  sql: ${TABLE}.I_CATEGORY ;;
  description: "not available"
}
dimension: I_CATEGORY_ID {
  type: number
  sql: ${TABLE}.I_CATEGORY_ID ;;
  description: "not available"
}
dimension: I_CLASS {
  type: string
  sql: ${TABLE}.I_CLASS ;;
  description: "not available"
}
dimension: I_CLASS_ID {
  type: number
  sql: ${TABLE}.I_CLASS_ID ;;
  description: "not available"
}
dimension: I_COLOR {
  type: string
  sql: ${TABLE}.I_COLOR ;;
  description: "not available"
}
dimension: I_CONTAINER {
  type: string
  sql: ${TABLE}.I_CONTAINER ;;
  description: "not available"
}
dimension: I_CURRENT_PRICE {
  type: number
  sql: ${TABLE}.I_CURRENT_PRICE ;;
  description: "not available"
}
dimension: I_FORMULATION {
  type: string
  sql: ${TABLE}.I_FORMULATION ;;
  description: "not available"
}
dimension: I_ITEM_DESC {
  type: string
  sql: ${TABLE}.I_ITEM_DESC ;;
  description: "not available"
}
dimension: I_ITEM_ID {
  type: string
  sql: ${TABLE}.I_ITEM_ID ;;
  description: "not available"
}
dimension: I_ITEM_SK {
  type: number
  sql: ${TABLE}.I_ITEM_SK ;;
  description: "not available"
}
dimension: I_MANAGER_ID {
  type: number
  sql: ${TABLE}.I_MANAGER_ID ;;
  description: "not available"
}
dimension: I_MANUFACT {
  type: string
  sql: ${TABLE}.I_MANUFACT ;;
  description: "not available"
}
dimension: I_MANUFACT_ID {
  type: number
  sql: ${TABLE}.I_MANUFACT_ID ;;
  description: "not available"
}
dimension: I_PRODUCT_NAME {
  type: string
  sql: ${TABLE}.I_PRODUCT_NAME ;;
  description: "not available"
}
dimension_group: I_REC_END_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.I_REC_END_DATE ;;
  description: "not available"
}
dimension_group: I_REC_START_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.I_REC_START_DATE ;;
  description: "not available"
}
dimension: I_SIZE {
  type: string
  sql: ${TABLE}.I_SIZE ;;
  description: "not available"
}
dimension: I_UNITS {
  type: string
  sql: ${TABLE}.I_UNITS ;;
  description: "not available"
}
dimension: I_WHOLESALE_COST {
  type: number
  sql: ${TABLE}.I_WHOLESALE_COST ;;
  description: "not available"
}
}
view: LINEITEM {
sql_table_name: LINEITEM ;;
dimension: L_COMMENT {
  type: string
  sql: ${TABLE}.L_COMMENT ;;
  description: "not available"
}
dimension_group: L_COMMITDATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.L_COMMITDATE ;;
  description: "not available"
}
dimension: L_DISCOUNT {
  type: number
  sql: ${TABLE}.L_DISCOUNT ;;
  description: "not available"
}
dimension: L_EXTENDEDPRICE {
  type: number
  sql: ${TABLE}.L_EXTENDEDPRICE ;;
  description: "not available"
}
dimension: L_LINENUMBER {
  type: number
  sql: ${TABLE}.L_LINENUMBER ;;
  description: "not available"
}
dimension: L_LINESTATUS {
  type: string
  sql: ${TABLE}.L_LINESTATUS ;;
  description: "not available"
}
dimension: L_ORDERKEY {
  type: number
  sql: ${TABLE}.L_ORDERKEY ;;
  description: "not available"
}
dimension: L_PARTKEY {
  type: number
  sql: ${TABLE}.L_PARTKEY ;;
  description: "not available"
}
dimension: L_QUANTITY {
  type: number
  sql: ${TABLE}.L_QUANTITY ;;
  description: "not available"
}
dimension_group: L_RECEIPTDATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.L_RECEIPTDATE ;;
  description: "not available"
}
dimension: L_RETURNFLAG {
  type: string
  sql: ${TABLE}.L_RETURNFLAG ;;
  description: "not available"
}
dimension_group: L_SHIPDATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.L_SHIPDATE ;;
  description: "not available"
}
dimension: L_SHIPINSTRUCT {
  type: string
  sql: ${TABLE}.L_SHIPINSTRUCT ;;
  description: "not available"
}
dimension: L_SHIPMODE {
  type: string
  sql: ${TABLE}.L_SHIPMODE ;;
  description: "not available"
}
dimension: L_SUPPKEY {
  type: number
  sql: ${TABLE}.L_SUPPKEY ;;
  description: "not available"
}
dimension: L_TAX {
  type: number
  sql: ${TABLE}.L_TAX ;;
  description: "not available"
}
}
view: LOAD_HISTORY {
sql_table_name: LOAD_HISTORY ;;
dimension: ERROR_COUNT {
  type: number
  sql: ${TABLE}.ERROR_COUNT ;;
  description: "Number of error rows in the source file"
}
dimension: ERROR_LIMIT {
  type: number
  sql: ${TABLE}.ERROR_LIMIT ;;
  description: "If the number of error reach this limit, then abort"
}
dimension: FILE_NAME {
  type: string
  sql: ${TABLE}.FILE_NAME ;;
  description: "Name of source file"
}
dimension: FIRST_ERROR_CHARACTER_POSITION {
  type: number
  sql: ${TABLE}.FIRST_ERROR_CHARACTER_POSITION ;;
  description: "Position of the first error character"
}
dimension: FIRST_ERROR_COL_NAME {
  type: string
  sql: ${TABLE}.FIRST_ERROR_COL_NAME ;;
  description: "Column name of the first error"
}
dimension: FIRST_ERROR_LINE_NUMBER {
  type: number
  sql: ${TABLE}.FIRST_ERROR_LINE_NUMBER ;;
  description: "Line number of the first error"
}
dimension: FIRST_ERROR_MESSAGE {
  type: string
  sql: ${TABLE}.FIRST_ERROR_MESSAGE ;;
  description: "First error of the source file"
}
dimension_group: LAST_LOAD_TIME {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_LOAD_TIME ;;
  description: "Timestamp of the load record"
}
dimension: ROW_COUNT {
  type: number
  sql: ${TABLE}.ROW_COUNT ;;
  description: "Number of rows loaded from the source file"
}
dimension: ROW_PARSED {
  type: number
  sql: ${TABLE}.ROW_PARSED ;;
  description: "Number of rows parsed from the source file"
}
dimension: SCHEMA_NAME {
  type: string
  sql: ${TABLE}.SCHEMA_NAME ;;
  description: "Schema of target table"
}
dimension: STATUS {
  type: string
  sql: ${TABLE}.STATUS ;;
  description: "Status: loaded, load failed or partially loaded"
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Name of target table"
}
}
view: NATION {
sql_table_name: NATION ;;
dimension: N_COMMENT {
  type: string
  sql: ${TABLE}.N_COMMENT ;;
  description: "not available"
}
dimension: N_NAME {
  type: string
  sql: ${TABLE}.N_NAME ;;
  description: "not available"
}
dimension: N_NATIONKEY {
  type: number
  sql: ${TABLE}.N_NATIONKEY ;;
  description: "not available"
}
dimension: N_REGIONKEY {
  type: number
  sql: ${TABLE}.N_REGIONKEY ;;
  description: "not available"
}
}
view: OBJECT_PRIVILEGES {
sql_table_name: OBJECT_PRIVILEGES ;;
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the privilege"
}
dimension: GRANTEE {
  type: string
  sql: ${TABLE}.GRANTEE ;;
  description: "Role to whom the privilege is granted"
}
dimension: GRANTOR {
  type: string
  sql: ${TABLE}.GRANTOR ;;
  description: "Role who granted the privilege"
}
dimension: IS_GRANTABLE {
  type: string
  sql: ${TABLE}.IS_GRANTABLE ;;
  description: "Whether the privilege was granted WITH GRANT OPTION"
}
dimension: OBJECT_CATALOG {
  type: string
  sql: ${TABLE}.OBJECT_CATALOG ;;
  description: "Database containing the object on which the privilege is granted"
}
dimension: OBJECT_NAME {
  type: string
  sql: ${TABLE}.OBJECT_NAME ;;
  description: "Name of the object on which the privilege is granted"
}
dimension: OBJECT_SCHEMA {
  type: string
  sql: ${TABLE}.OBJECT_SCHEMA ;;
  description: "Schema containing the object on which the privilege is granted"
}
dimension: OBJECT_TYPE {
  type: string
  sql: ${TABLE}.OBJECT_TYPE ;;
  description: "Type of the object on which the privilege is granted"
}
dimension: PRIVILEGE_TYPE {
  type: string
  sql: ${TABLE}.PRIVILEGE_TYPE ;;
  description: "Type of the granted privilege"
}
}
view: ORDERS {
sql_table_name: ORDERS ;;
dimension: O_CLERK {
  type: string
  sql: ${TABLE}.O_CLERK ;;
  description: "not available"
}
dimension: O_COMMENT {
  type: string
  sql: ${TABLE}.O_COMMENT ;;
  description: "not available"
}
dimension: O_CUSTKEY {
  type: number
  sql: ${TABLE}.O_CUSTKEY ;;
  description: "not available"
}
dimension_group: O_ORDERDATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.O_ORDERDATE ;;
  description: "not available"
}
dimension: O_ORDERKEY {
  type: number
  sql: ${TABLE}.O_ORDERKEY ;;
  description: "not available"
}
dimension: O_ORDERPRIORITY {
  type: string
  sql: ${TABLE}.O_ORDERPRIORITY ;;
  description: "not available"
}
dimension: O_ORDERSTATUS {
  type: string
  sql: ${TABLE}.O_ORDERSTATUS ;;
  description: "not available"
}
dimension: O_SHIPPRIORITY {
  type: number
  sql: ${TABLE}.O_SHIPPRIORITY ;;
  description: "not available"
}
dimension: O_TOTALPRICE {
  type: number
  sql: ${TABLE}.O_TOTALPRICE ;;
  description: "not available"
}
}
view: PACKAGES {
sql_table_name: PACKAGES ;;
dimension: LANGUAGE {
  type: string
  sql: ${TABLE}.LANGUAGE ;;
  description: "Package language"
}
dimension: PACKAGE_NAME {
  type: string
  sql: ${TABLE}.PACKAGE_NAME ;;
  description: "Package name"
}
dimension: VERSION {
  type: string
  sql: ${TABLE}.VERSION ;;
  description: "Package version"
}
}
view: PART {
sql_table_name: PART ;;
dimension: P_BRAND {
  type: string
  sql: ${TABLE}.P_BRAND ;;
  description: "not available"
}
dimension: P_COMMENT {
  type: string
  sql: ${TABLE}.P_COMMENT ;;
  description: "not available"
}
dimension: P_CONTAINER {
  type: string
  sql: ${TABLE}.P_CONTAINER ;;
  description: "not available"
}
dimension: P_MFGR {
  type: string
  sql: ${TABLE}.P_MFGR ;;
  description: "not available"
}
dimension: P_NAME {
  type: string
  sql: ${TABLE}.P_NAME ;;
  description: "not available"
}
dimension: P_PARTKEY {
  type: number
  sql: ${TABLE}.P_PARTKEY ;;
  description: "not available"
}
dimension: P_RETAILPRICE {
  type: number
  sql: ${TABLE}.P_RETAILPRICE ;;
  description: "not available"
}
dimension: P_SIZE {
  type: number
  sql: ${TABLE}.P_SIZE ;;
  description: "not available"
}
dimension: P_TYPE {
  type: string
  sql: ${TABLE}.P_TYPE ;;
  description: "not available"
}
}
view: PARTSUPP {
sql_table_name: PARTSUPP ;;
dimension: PS_AVAILQTY {
  type: number
  sql: ${TABLE}.PS_AVAILQTY ;;
  description: "not available"
}
dimension: PS_COMMENT {
  type: string
  sql: ${TABLE}.PS_COMMENT ;;
  description: "not available"
}
dimension: PS_PARTKEY {
  type: number
  sql: ${TABLE}.PS_PARTKEY ;;
  description: "not available"
}
dimension: PS_SUPPKEY {
  type: number
  sql: ${TABLE}.PS_SUPPKEY ;;
  description: "not available"
}
dimension: PS_SUPPLYCOST {
  type: number
  sql: ${TABLE}.PS_SUPPLYCOST ;;
  description: "not available"
}
}
view: PIPES {
sql_table_name: PIPES ;;
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this pipe"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the pipe"
}
dimension: DEFINITION {
  type: string
  sql: ${TABLE}.DEFINITION ;;
  description: "Definition of the pipe as it was created"
}
dimension: IS_AUTOINGEST_ENABLED {
  type: string
  sql: ${TABLE}.IS_AUTOINGEST_ENABLED ;;
  description: "Whether this is an auto-ingest tpipe"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the pipe"
}
dimension: NOTIFICATION_CHANNEL_NAME {
  type: string
  sql: ${TABLE}.NOTIFICATION_CHANNEL_NAME ;;
  description: "Notification channel name if it is an auto-ingest pipe"
}
dimension: PATTERN {
  type: string
  sql: ${TABLE}.PATTERN ;;
  description: "Pattern used to filter the files in Snowpipe"
}
dimension: PIPE_CATALOG {
  type: string
  sql: ${TABLE}.PIPE_CATALOG ;;
  description: "Database that the pipe belongs to"
}
dimension: PIPE_NAME {
  type: string
  sql: ${TABLE}.PIPE_NAME ;;
  description: "Name of the pipe"
}
dimension: PIPE_OWNER {
  type: string
  sql: ${TABLE}.PIPE_OWNER ;;
  description: "Name of the role that owns the pipe"
}
dimension: PIPE_SCHEMA {
  type: string
  sql: ${TABLE}.PIPE_SCHEMA ;;
  description: "Schema that the pipe belongs to"
}
}
view: PROCEDURES {
sql_table_name: PROCEDURES ;;
dimension: ARGUMENT_SIGNATURE {
  type: string
  sql: ${TABLE}.ARGUMENT_SIGNATURE ;;
  description: "Type signature of the procedure's arguments"
}
dimension: CHARACTER_MAXIMUM_LENGTH {
  type: number
  sql: ${TABLE}.CHARACTER_MAXIMUM_LENGTH ;;
  description: "Maximum length in characters of string return value"
}
dimension: CHARACTER_OCTET_LENGTH {
  type: number
  sql: ${TABLE}.CHARACTER_OCTET_LENGTH ;;
  description: "Maximum length in bytes of string return value"
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this procedure"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the procedure"
}
dimension: DATA_TYPE {
  type: string
  sql: ${TABLE}.DATA_TYPE ;;
  description: "Return value data type"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the procedure"
}
dimension: NUMERIC_PRECISION {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION ;;
  description: "Numeric precision of numeric return value"
}
dimension: NUMERIC_PRECISION_RADIX {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
  description: "Radix of precision of numeric return value"
}
dimension: NUMERIC_SCALE {
  type: number
  sql: ${TABLE}.NUMERIC_SCALE ;;
  description: "Scale of numeric return value"
}
dimension: PROCEDURE_CATALOG {
  type: string
  sql: ${TABLE}.PROCEDURE_CATALOG ;;
  description: "Database which the procedure belongs to"
}
dimension: PROCEDURE_DEFINITION {
  type: string
  sql: ${TABLE}.PROCEDURE_DEFINITION ;;
  description: "Procedure definition"
}
dimension: PROCEDURE_LANGUAGE {
  type: string
  sql: ${TABLE}.PROCEDURE_LANGUAGE ;;
  description: "Language of the procedure"
}
dimension: PROCEDURE_NAME {
  type: string
  sql: ${TABLE}.PROCEDURE_NAME ;;
  description: "Name of the procedure"
}
dimension: PROCEDURE_OWNER {
  type: string
  sql: ${TABLE}.PROCEDURE_OWNER ;;
  description: "Name of the role that owns the procedure"
}
dimension: PROCEDURE_SCHEMA {
  type: string
  sql: ${TABLE}.PROCEDURE_SCHEMA ;;
  description: "Schema which the procedure belongs to"
}
}
view: PROMOTION {
sql_table_name: PROMOTION ;;
dimension: P_CHANNEL_CATALOG {
  type: string
  sql: ${TABLE}.P_CHANNEL_CATALOG ;;
  description: "not available"
}
dimension: P_CHANNEL_DEMO {
  type: string
  sql: ${TABLE}.P_CHANNEL_DEMO ;;
  description: "not available"
}
dimension: P_CHANNEL_DETAILS {
  type: string
  sql: ${TABLE}.P_CHANNEL_DETAILS ;;
  description: "not available"
}
dimension: P_CHANNEL_DMAIL {
  type: string
  sql: ${TABLE}.P_CHANNEL_DMAIL ;;
  description: "not available"
}
dimension: P_CHANNEL_EMAIL {
  type: string
  sql: ${TABLE}.P_CHANNEL_EMAIL ;;
  description: "not available"
}
dimension: P_CHANNEL_EVENT {
  type: string
  sql: ${TABLE}.P_CHANNEL_EVENT ;;
  description: "not available"
}
dimension: P_CHANNEL_PRESS {
  type: string
  sql: ${TABLE}.P_CHANNEL_PRESS ;;
  description: "not available"
}
dimension: P_CHANNEL_RADIO {
  type: string
  sql: ${TABLE}.P_CHANNEL_RADIO ;;
  description: "not available"
}
dimension: P_CHANNEL_TV {
  type: string
  sql: ${TABLE}.P_CHANNEL_TV ;;
  description: "not available"
}
dimension: P_COST {
  type: number
  sql: ${TABLE}.P_COST ;;
  description: "not available"
}
dimension: P_DISCOUNT_ACTIVE {
  type: string
  sql: ${TABLE}.P_DISCOUNT_ACTIVE ;;
  description: "not available"
}
dimension: P_END_DATE_SK {
  type: number
  sql: ${TABLE}.P_END_DATE_SK ;;
  description: "not available"
}
dimension: P_ITEM_SK {
  type: number
  sql: ${TABLE}.P_ITEM_SK ;;
  description: "not available"
}
dimension: P_PROMO_ID {
  type: string
  sql: ${TABLE}.P_PROMO_ID ;;
  description: "not available"
}
dimension: P_PROMO_NAME {
  type: string
  sql: ${TABLE}.P_PROMO_NAME ;;
  description: "not available"
}
dimension: P_PROMO_SK {
  type: number
  sql: ${TABLE}.P_PROMO_SK ;;
  description: "not available"
}
dimension: P_PURPOSE {
  type: string
  sql: ${TABLE}.P_PURPOSE ;;
  description: "not available"
}
dimension: P_RESPONSE_TARGET {
  type: number
  sql: ${TABLE}.P_RESPONSE_TARGET ;;
  description: "not available"
}
dimension: P_START_DATE_SK {
  type: number
  sql: ${TABLE}.P_START_DATE_SK ;;
  description: "not available"
}
}
view: REASON {
sql_table_name: REASON ;;
dimension: R_REASON_DESC {
  type: string
  sql: ${TABLE}.R_REASON_DESC ;;
  description: "not available"
}
dimension: R_REASON_ID {
  type: string
  sql: ${TABLE}.R_REASON_ID ;;
  description: "not available"
}
dimension: R_REASON_SK {
  type: number
  sql: ${TABLE}.R_REASON_SK ;;
  description: "not available"
}
}
view: REFERENTIAL_CONSTRAINTS {
sql_table_name: REFERENTIAL_CONSTRAINTS ;;
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this constraint"
}
dimension: CONSTRAINT_CATALOG {
  type: string
  sql: ${TABLE}.CONSTRAINT_CATALOG ;;
  description: "Database that the constraint belongs to"
}
dimension: CONSTRAINT_NAME {
  type: string
  sql: ${TABLE}.CONSTRAINT_NAME ;;
  description: "Name of the constraint"
}
dimension: CONSTRAINT_SCHEMA {
  type: string
  sql: ${TABLE}.CONSTRAINT_SCHEMA ;;
  description: "Schema that the constraint belongs to"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the constraint"
}
dimension: DELETE_RULE {
  type: string
  sql: ${TABLE}.DELETE_RULE ;;
  description: "Delete Rule for the current constraint"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the constraint"
}
dimension: MATCH_OPTION {
  type: string
  sql: ${TABLE}.MATCH_OPTION ;;
  description: "Match option for the constraint"
}
dimension: UNIQUE_CONSTRAINT_CATALOG {
  type: string
  sql: ${TABLE}.UNIQUE_CONSTRAINT_CATALOG ;;
  description: "Database of the unique constraint referenced by the current constraint"
}
dimension: UNIQUE_CONSTRAINT_NAME {
  type: string
  sql: ${TABLE}.UNIQUE_CONSTRAINT_NAME ;;
  description: "Name of the unique constraint referenced by the current constraint"
}
dimension: UNIQUE_CONSTRAINT_SCHEMA {
  type: string
  sql: ${TABLE}.UNIQUE_CONSTRAINT_SCHEMA ;;
  description: "Schema of the unique constraint referenced by the current constraint"
}
dimension: UPDATE_RULE {
  type: string
  sql: ${TABLE}.UPDATE_RULE ;;
  description: "Update Rule for the current constraint"
}
}
view: REGION {
sql_table_name: REGION ;;
dimension: R_COMMENT {
  type: string
  sql: ${TABLE}.R_COMMENT ;;
  description: "not available"
}
dimension: R_NAME {
  type: string
  sql: ${TABLE}.R_NAME ;;
  description: "not available"
}
dimension: R_REGIONKEY {
  type: number
  sql: ${TABLE}.R_REGIONKEY ;;
  description: "not available"
}
}
view: REPLICATION_DATABASES {
sql_table_name: REPLICATION_DATABASES ;;
dimension: ACCOUNT_NAME {
  type: string
  sql: ${TABLE}.ACCOUNT_NAME ;;
  description: "Name of the account that owns the database"
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this database"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the database"
}
dimension: DATABASE_NAME {
  type: string
  sql: ${TABLE}.DATABASE_NAME ;;
  description: "Name of the database"
}
dimension: FAILOVER_ALLOWED_TO_ACCOUNTS {
  type: string
  sql: ${TABLE}.FAILOVER_ALLOWED_TO_ACCOUNTS ;;
  description: "List of accounts that can host primary replicas for this database"
}
dimension: IS_PRIMARY {
  type: yesnoEAN
  sql: ${TABLE}.IS_PRIMARY ;;
  description: "Whether this database is the primary"
}
dimension: PRIMARY {
  type: string
  sql: ${TABLE}.PRIMARY ;;
  description: "Primary database of this replication group"
}
dimension: REGION_GROUP {
  type: string
  sql: ${TABLE}.REGION_GROUP ;;
  description: "Region group of this database"
}
dimension: REPLICATION_ALLOWED_TO_ACCOUNTS {
  type: string
  sql: ${TABLE}.REPLICATION_ALLOWED_TO_ACCOUNTS ;;
  description: "List of accounts that can host secondary replicas for this database"
}
dimension: SNOWFLAKE_REGION {
  type: string
  sql: ${TABLE}.SNOWFLAKE_REGION ;;
  description: "Snowflake region of this database"
}
}
view: SCHEMATA {
sql_table_name: SCHEMATA ;;
dimension: CATALOG_NAME {
  type: string
  sql: ${TABLE}.CATALOG_NAME ;;
  description: "Database that the schema belongs to"
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this schema"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the schema"
}
dimension: DEFAULT_CHARACTER_SET_CATALOG {
  type: string
  sql: ${TABLE}.DEFAULT_CHARACTER_SET_CATALOG ;;
  description: "Not applicable for Snowflake."
}
dimension: DEFAULT_CHARACTER_SET_NAME {
  type: string
  sql: ${TABLE}.DEFAULT_CHARACTER_SET_NAME ;;
  description: "Not applicable for Snowflake."
}
dimension: DEFAULT_CHARACTER_SET_SCHEMA {
  type: string
  sql: ${TABLE}.DEFAULT_CHARACTER_SET_SCHEMA ;;
  description: "Not applicable for Snowflake."
}
dimension: IS_MANAGED_ACCESS {
  type: string
  sql: ${TABLE}.IS_MANAGED_ACCESS ;;
  description: "Whether this is a managed access schema"
}
dimension: IS_TRANSIENT {
  type: string
  sql: ${TABLE}.IS_TRANSIENT ;;
  description: "Whether this is a transient table"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the schema"
}
dimension: RETENTION_TIME {
  type: number
  sql: ${TABLE}.RETENTION_TIME ;;
  description: "Number of days that historical data is retained for Time Travel"
}
dimension: SCHEMA_NAME {
  type: string
  sql: ${TABLE}.SCHEMA_NAME ;;
  description: "Name of the schema"
}
dimension: SCHEMA_OWNER {
  type: string
  sql: ${TABLE}.SCHEMA_OWNER ;;
  description: "Name of the role that owns the schema"
}
dimension: SQL_PATH {
  type: string
  sql: ${TABLE}.SQL_PATH ;;
  description: "Not applicable for Snowflake."
}
}
view: SEQUENCES {
sql_table_name: SEQUENCES ;;
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this sequence"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the sequence"
}
dimension: CYCLE_OPTION {
  type: string
  sql: ${TABLE}.CYCLE_OPTION ;;
  description: "Not applicable for Snowflake."
}
dimension: DATA_TYPE {
  type: string
  sql: ${TABLE}.DATA_TYPE ;;
  description: "Data type of the sequence"
}
dimension: INCREMENT {
  type: string
  sql: ${TABLE}.INCREMENT ;;
  description: "Increment of the sequence generator"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the sequence"
}
dimension: MAXIMUM_VALUE {
  type: string
  sql: ${TABLE}.MAXIMUM_VALUE ;;
  description: "Not applicable for Snowflake."
}
dimension: MINIMUM_VALUE {
  type: string
  sql: ${TABLE}.MINIMUM_VALUE ;;
  description: "Not applicable for Snowflake."
}
dimension: NEXT_VALUE {
  type: string
  sql: ${TABLE}.NEXT_VALUE ;;
  description: "Next value that the sequence will produce"
}
dimension: NUMERIC_PRECISION {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION ;;
  description: "Numeric precision of the data type of the sequence"
}
dimension: NUMERIC_PRECISION_RADIX {
  type: number
  sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
  description: "Radix of the numeric precision of the data type of the sequence"
}
dimension: NUMERIC_SCALE {
  type: number
  sql: ${TABLE}.NUMERIC_SCALE ;;
  description: "Scale of the data type of the sequence"
}
dimension: SEQUENCE_CATALOG {
  type: string
  sql: ${TABLE}.SEQUENCE_CATALOG ;;
  description: "Database that the sequence belongs to"
}
dimension: SEQUENCE_NAME {
  type: string
  sql: ${TABLE}.SEQUENCE_NAME ;;
  description: "Name of the sequence"
}
dimension: SEQUENCE_OWNER {
  type: string
  sql: ${TABLE}.SEQUENCE_OWNER ;;
  description: "Name of the role that owns the sequence"
}
dimension: SEQUENCE_SCHEMA {
  type: string
  sql: ${TABLE}.SEQUENCE_SCHEMA ;;
  description: "Schema that the sequence belongs to"
}
dimension: START_VALUE {
  type: string
  sql: ${TABLE}.START_VALUE ;;
  description: "Initial value of the sequence"
}
}
view: SHIP_MODE {
sql_table_name: SHIP_MODE ;;
dimension: SM_CARRIER {
  type: string
  sql: ${TABLE}.SM_CARRIER ;;
  description: "not available"
}
dimension: SM_CODE {
  type: string
  sql: ${TABLE}.SM_CODE ;;
  description: "not available"
}
dimension: SM_CONTRACT {
  type: string
  sql: ${TABLE}.SM_CONTRACT ;;
  description: "not available"
}
dimension: SM_SHIP_MODE_ID {
  type: string
  sql: ${TABLE}.SM_SHIP_MODE_ID ;;
  description: "not available"
}
dimension: SM_SHIP_MODE_SK {
  type: number
  sql: ${TABLE}.SM_SHIP_MODE_SK ;;
  description: "not available"
}
dimension: SM_TYPE {
  type: string
  sql: ${TABLE}.SM_TYPE ;;
  description: "not available"
}
}
view: STAGES {
sql_table_name: STAGES ;;
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this stage"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the stage"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the stage"
}
dimension: STAGE_CATALOG {
  type: string
  sql: ${TABLE}.STAGE_CATALOG ;;
  description: "Database that the stage belongs to"
}
dimension: STAGE_NAME {
  type: string
  sql: ${TABLE}.STAGE_NAME ;;
  description: "Name of the stage"
}
dimension: STAGE_OWNER {
  type: string
  sql: ${TABLE}.STAGE_OWNER ;;
  description: "Name of the role that owns the stage"
}
dimension: STAGE_REGION {
  type: string
  sql: ${TABLE}.STAGE_REGION ;;
  description: "AWS region where the stage resides"
}
dimension: STAGE_SCHEMA {
  type: string
  sql: ${TABLE}.STAGE_SCHEMA ;;
  description: "Schema that the stage belongs to"
}
dimension: STAGE_TYPE {
  type: string
  sql: ${TABLE}.STAGE_TYPE ;;
  description: "Type of stage: User, Table, Internal Named or External Named"
}
dimension: STAGE_URL {
  type: string
  sql: ${TABLE}.STAGE_URL ;;
  description: "Location of an external stage"
}
}
view: STORE {
sql_table_name: STORE ;;
dimension: S_CITY {
  type: string
  sql: ${TABLE}.S_CITY ;;
  description: "not available"
}
dimension: S_CLOSED_DATE_SK {
  type: number
  sql: ${TABLE}.S_CLOSED_DATE_SK ;;
  description: "not available"
}
dimension: S_COMPANY_ID {
  type: number
  sql: ${TABLE}.S_COMPANY_ID ;;
  description: "not available"
}
dimension: S_COMPANY_NAME {
  type: string
  sql: ${TABLE}.S_COMPANY_NAME ;;
  description: "not available"
}
dimension: S_COUNTRY {
  type: string
  sql: ${TABLE}.S_COUNTRY ;;
  description: "not available"
}
dimension: S_COUNTY {
  type: string
  sql: ${TABLE}.S_COUNTY ;;
  description: "not available"
}
dimension: S_DIVISION_ID {
  type: number
  sql: ${TABLE}.S_DIVISION_ID ;;
  description: "not available"
}
dimension: S_DIVISION_NAME {
  type: string
  sql: ${TABLE}.S_DIVISION_NAME ;;
  description: "not available"
}
dimension: S_FLOOR_SPACE {
  type: number
  sql: ${TABLE}.S_FLOOR_SPACE ;;
  description: "not available"
}
dimension: S_GEOGRAPHY_CLASS {
  type: string
  sql: ${TABLE}.S_GEOGRAPHY_CLASS ;;
  description: "not available"
}
dimension: S_GMT_OFFSET {
  type: number
  sql: ${TABLE}.S_GMT_OFFSET ;;
  description: "not available"
}
dimension: S_HOURS {
  type: string
  sql: ${TABLE}.S_HOURS ;;
  description: "not available"
}
dimension: S_MANAGER {
  type: string
  sql: ${TABLE}.S_MANAGER ;;
  description: "not available"
}
dimension: S_MARKET_DESC {
  type: string
  sql: ${TABLE}.S_MARKET_DESC ;;
  description: "not available"
}
dimension: S_MARKET_ID {
  type: number
  sql: ${TABLE}.S_MARKET_ID ;;
  description: "not available"
}
dimension: S_MARKET_MANAGER {
  type: string
  sql: ${TABLE}.S_MARKET_MANAGER ;;
  description: "not available"
}
dimension: S_NUMBER_EMPLOYEES {
  type: number
  sql: ${TABLE}.S_NUMBER_EMPLOYEES ;;
  description: "not available"
}
dimension_group: S_REC_END_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.S_REC_END_DATE ;;
  description: "not available"
}
dimension_group: S_REC_START_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.S_REC_START_DATE ;;
  description: "not available"
}
dimension: S_STATE {
  type: string
  sql: ${TABLE}.S_STATE ;;
  description: "not available"
}
dimension: S_STORE_ID {
  type: string
  sql: ${TABLE}.S_STORE_ID ;;
  description: "not available"
}
dimension: S_STORE_NAME {
  type: string
  sql: ${TABLE}.S_STORE_NAME ;;
  description: "not available"
}
dimension: S_STORE_SK {
  type: number
  sql: ${TABLE}.S_STORE_SK ;;
  description: "not available"
}
dimension: S_STREET_NAME {
  type: string
  sql: ${TABLE}.S_STREET_NAME ;;
  description: "not available"
}
dimension: S_STREET_NUMBER {
  type: string
  sql: ${TABLE}.S_STREET_NUMBER ;;
  description: "not available"
}
dimension: S_STREET_TYPE {
  type: string
  sql: ${TABLE}.S_STREET_TYPE ;;
  description: "not available"
}
dimension: S_SUITE_NUMBER {
  type: string
  sql: ${TABLE}.S_SUITE_NUMBER ;;
  description: "not available"
}
dimension: S_TAX_PRECENTAGE {
  type: number
  sql: ${TABLE}.S_TAX_PRECENTAGE ;;
  description: "not available"
}
dimension: S_ZIP {
  type: string
  sql: ${TABLE}.S_ZIP ;;
  description: "not available"
}
}
view: STORE_RETURNS {
sql_table_name: STORE_RETURNS ;;
dimension: SR_ADDR_SK {
  type: number
  sql: ${TABLE}.SR_ADDR_SK ;;
  description: "not available"
}
dimension: SR_CDEMO_SK {
  type: number
  sql: ${TABLE}.SR_CDEMO_SK ;;
  description: "not available"
}
dimension: SR_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.SR_CUSTOMER_SK ;;
  description: "not available"
}
dimension: SR_FEE {
  type: number
  sql: ${TABLE}.SR_FEE ;;
  description: "not available"
}
dimension: SR_HDEMO_SK {
  type: number
  sql: ${TABLE}.SR_HDEMO_SK ;;
  description: "not available"
}
dimension: SR_ITEM_SK {
  type: number
  sql: ${TABLE}.SR_ITEM_SK ;;
  description: "not available"
}
dimension: SR_NET_LOSS {
  type: number
  sql: ${TABLE}.SR_NET_LOSS ;;
  description: "not available"
}
dimension: SR_REASON_SK {
  type: number
  sql: ${TABLE}.SR_REASON_SK ;;
  description: "not available"
}
dimension: SR_REFUNDED_CASH {
  type: number
  sql: ${TABLE}.SR_REFUNDED_CASH ;;
  description: "not available"
}
dimension: SR_RETURNED_DATE_SK {
  type: number
  sql: ${TABLE}.SR_RETURNED_DATE_SK ;;
  description: "not available"
}
dimension: SR_RETURN_AMT {
  type: number
  sql: ${TABLE}.SR_RETURN_AMT ;;
  description: "not available"
}
dimension: SR_RETURN_AMT_INC_TAX {
  type: number
  sql: ${TABLE}.SR_RETURN_AMT_INC_TAX ;;
  description: "not available"
}
dimension: SR_RETURN_QUANTITY {
  type: number
  sql: ${TABLE}.SR_RETURN_QUANTITY ;;
  description: "not available"
}
dimension: SR_RETURN_SHIP_COST {
  type: number
  sql: ${TABLE}.SR_RETURN_SHIP_COST ;;
  description: "not available"
}
dimension: SR_RETURN_TAX {
  type: number
  sql: ${TABLE}.SR_RETURN_TAX ;;
  description: "not available"
}
dimension: SR_RETURN_TIME_SK {
  type: number
  sql: ${TABLE}.SR_RETURN_TIME_SK ;;
  description: "not available"
}
dimension: SR_REVERSED_CHARGE {
  type: number
  sql: ${TABLE}.SR_REVERSED_CHARGE ;;
  description: "not available"
}
dimension: SR_STORE_CREDIT {
  type: number
  sql: ${TABLE}.SR_STORE_CREDIT ;;
  description: "not available"
}
dimension: SR_STORE_SK {
  type: number
  sql: ${TABLE}.SR_STORE_SK ;;
  description: "not available"
}
dimension: SR_TICKET_NUMBER {
  type: number
  sql: ${TABLE}.SR_TICKET_NUMBER ;;
  description: "not available"
}
}
view: STORE_SALES {
sql_table_name: STORE_SALES ;;
dimension: SS_ADDR_SK {
  type: number
  sql: ${TABLE}.SS_ADDR_SK ;;
  description: "not available"
}
dimension: SS_CDEMO_SK {
  type: number
  sql: ${TABLE}.SS_CDEMO_SK ;;
  description: "not available"
}
dimension: SS_COUPON_AMT {
  type: number
  sql: ${TABLE}.SS_COUPON_AMT ;;
  description: "not available"
}
dimension: SS_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.SS_CUSTOMER_SK ;;
  description: "not available"
}
dimension: SS_EXT_DISCOUNT_AMT {
  type: number
  sql: ${TABLE}.SS_EXT_DISCOUNT_AMT ;;
  description: "not available"
}
dimension: SS_EXT_LIST_PRICE {
  type: number
  sql: ${TABLE}.SS_EXT_LIST_PRICE ;;
  description: "not available"
}
dimension: SS_EXT_SALES_PRICE {
  type: number
  sql: ${TABLE}.SS_EXT_SALES_PRICE ;;
  description: "not available"
}
dimension: SS_EXT_TAX {
  type: number
  sql: ${TABLE}.SS_EXT_TAX ;;
  description: "not available"
}
dimension: SS_EXT_WHOLESALE_COST {
  type: number
  sql: ${TABLE}.SS_EXT_WHOLESALE_COST ;;
  description: "not available"
}
dimension: SS_HDEMO_SK {
  type: number
  sql: ${TABLE}.SS_HDEMO_SK ;;
  description: "not available"
}
dimension: SS_ITEM_SK {
  type: number
  sql: ${TABLE}.SS_ITEM_SK ;;
  description: "not available"
}
dimension: SS_LIST_PRICE {
  type: number
  sql: ${TABLE}.SS_LIST_PRICE ;;
  description: "not available"
}
dimension: SS_NET_PAID {
  type: number
  sql: ${TABLE}.SS_NET_PAID ;;
  description: "not available"
}
dimension: SS_NET_PAID_INC_TAX {
  type: number
  sql: ${TABLE}.SS_NET_PAID_INC_TAX ;;
  description: "not available"
}
dimension: SS_NET_PROFIT {
  type: number
  sql: ${TABLE}.SS_NET_PROFIT ;;
  description: "not available"
}
dimension: SS_PROMO_SK {
  type: number
  sql: ${TABLE}.SS_PROMO_SK ;;
  description: "not available"
}
dimension: SS_QUANTITY {
  type: number
  sql: ${TABLE}.SS_QUANTITY ;;
  description: "not available"
}
dimension: SS_SALES_PRICE {
  type: number
  sql: ${TABLE}.SS_SALES_PRICE ;;
  description: "not available"
}
dimension: SS_SOLD_DATE_SK {
  type: number
  sql: ${TABLE}.SS_SOLD_DATE_SK ;;
  description: "not available"
}
dimension: SS_SOLD_TIME_SK {
  type: number
  sql: ${TABLE}.SS_SOLD_TIME_SK ;;
  description: "not available"
}
dimension: SS_STORE_SK {
  type: number
  sql: ${TABLE}.SS_STORE_SK ;;
  description: "not available"
}
dimension: SS_TICKET_NUMBER {
  type: number
  sql: ${TABLE}.SS_TICKET_NUMBER ;;
  description: "not available"
}
dimension: SS_WHOLESALE_COST {
  type: number
  sql: ${TABLE}.SS_WHOLESALE_COST ;;
  description: "not available"
}
}
view: SUPPLIER {
sql_table_name: SUPPLIER ;;
dimension: S_ACCTBAL {
  type: number
  sql: ${TABLE}.S_ACCTBAL ;;
  description: "not available"
}
dimension: S_ADDRESS {
  type: string
  sql: ${TABLE}.S_ADDRESS ;;
  description: "not available"
}
dimension: S_COMMENT {
  type: string
  sql: ${TABLE}.S_COMMENT ;;
  description: "not available"
}
dimension: S_NAME {
  type: string
  sql: ${TABLE}.S_NAME ;;
  description: "not available"
}
dimension: S_NATIONKEY {
  type: number
  sql: ${TABLE}.S_NATIONKEY ;;
  description: "not available"
}
dimension: S_PHONE {
  type: string
  sql: ${TABLE}.S_PHONE ;;
  description: "not available"
}
dimension: S_SUPPKEY {
  type: number
  sql: ${TABLE}.S_SUPPKEY ;;
  description: "not available"
}
}
view: TABLES {
sql_table_name: TABLES ;;
dimension: AUTO_CLUSTERING_ON {
  type: string
  sql: ${TABLE}.AUTO_CLUSTERING_ON ;;
  description: "Whether automatic clustering is on for the table"
}
dimension: BYTES {
  type: number
  sql: ${TABLE}.BYTES ;;
  description: "Number of bytes accessed by a scan of the table"
}
dimension: CLUSTERING_KEY {
  type: string
  sql: ${TABLE}.CLUSTERING_KEY ;;
  description: "Clustering key for the table"
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this table"
}
dimension: COMMIT_ACTION {
  type: string
  sql: ${TABLE}.COMMIT_ACTION ;;
  description: "Not applicable for Snowflake."
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the function"
}
dimension: IS_INSERTABLE_INTO {
  type: string
  sql: ${TABLE}.IS_INSERTABLE_INTO ;;
  description: "Not applicable for Snowflake."
}
dimension: IS_TRANSIENT {
  type: string
  sql: ${TABLE}.IS_TRANSIENT ;;
  description: "Whether this is a transient table"
}
dimension: IS_TYPED {
  type: string
  sql: ${TABLE}.IS_TYPED ;;
  description: "Not applicable for Snowflake."
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the function"
}
dimension: REFERENCE_GENERATION {
  type: string
  sql: ${TABLE}.REFERENCE_GENERATION ;;
  description: "Not applicable for Snowflake."
}
dimension: RETENTION_TIME {
  type: number
  sql: ${TABLE}.RETENTION_TIME ;;
  description: "Number of days that historical data is retained for Time Travel"
}
dimension: ROW_COUNT {
  type: number
  sql: ${TABLE}.ROW_COUNT ;;
  description: "Number of rows in the table"
}
dimension: SELF_REFERENCING_COLUMN_NAME {
  type: string
  sql: ${TABLE}.SELF_REFERENCING_COLUMN_NAME ;;
  description: "Not applicable for Snowflake."
}
dimension: TABLE_CATALOG {
  type: string
  sql: ${TABLE}.TABLE_CATALOG ;;
  description: "Database that the table belongs to"
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Name of the table"
}
dimension: TABLE_OWNER {
  type: string
  sql: ${TABLE}.TABLE_OWNER ;;
  description: "Name of the role that owns the table"
}
dimension: TABLE_SCHEMA {
  type: string
  sql: ${TABLE}.TABLE_SCHEMA ;;
  description: "Schema that the table belongs to"
}
dimension: TABLE_TYPE {
  type: string
  sql: ${TABLE}.TABLE_TYPE ;;
  description: "Whether the table is a base table, temporary table, or view"
}
dimension: USER_DEFINED_TYPE_CATALOG {
  type: string
  sql: ${TABLE}.USER_DEFINED_TYPE_CATALOG ;;
  description: "Not applicable for Snowflake."
}
dimension: USER_DEFINED_TYPE_NAME {
  type: string
  sql: ${TABLE}.USER_DEFINED_TYPE_NAME ;;
  description: "Not applicable for Snowflake."
}
dimension: USER_DEFINED_TYPE_SCHEMA {
  type: string
  sql: ${TABLE}.USER_DEFINED_TYPE_SCHEMA ;;
  description: "Not applicable for Snowflake."
}
}
view: TABLE_CONSTRAINTS {
sql_table_name: TABLE_CONSTRAINTS ;;
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this constraint"
}
dimension: CONSTRAINT_CATALOG {
  type: string
  sql: ${TABLE}.CONSTRAINT_CATALOG ;;
  description: "Database that the constraint belongs to"
}
dimension: CONSTRAINT_NAME {
  type: string
  sql: ${TABLE}.CONSTRAINT_NAME ;;
  description: "Name of the constraint"
}
dimension: CONSTRAINT_SCHEMA {
  type: string
  sql: ${TABLE}.CONSTRAINT_SCHEMA ;;
  description: "Schema that the constraint belongs to"
}
dimension: CONSTRAINT_TYPE {
  type: string
  sql: ${TABLE}.CONSTRAINT_TYPE ;;
  description: "Type of the constraint"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the constraint"
}
dimension: ENFORCED {
  type: string
  sql: ${TABLE}.ENFORCED ;;
  description: "Whether the constraint is enforced"
}
dimension: INITIALLY_DEFERRED {
  type: string
  sql: ${TABLE}.INITIALLY_DEFERRED ;;
  description: "Whether evaluation of the constraint is deferrable and initially deferred"
}
dimension: IS_DEFERRABLE {
  type: string
  sql: ${TABLE}.IS_DEFERRABLE ;;
  description: "Whether evaluation of the constraint can be deferred"
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the constraint"
}
dimension: TABLE_CATALOG {
  type: string
  sql: ${TABLE}.TABLE_CATALOG ;;
  description: "Name of the database of the current table"
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Name of the current table"
}
dimension: TABLE_SCHEMA {
  type: string
  sql: ${TABLE}.TABLE_SCHEMA ;;
  description: "Name of the schema of the current table"
}
}
view: TABLE_PRIVILEGES {
sql_table_name: TABLE_PRIVILEGES ;;
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the privilege"
}
dimension: GRANTEE {
  type: string
  sql: ${TABLE}.GRANTEE ;;
  description: "Role to whom the table privilege is granted"
}
dimension: GRANTOR {
  type: string
  sql: ${TABLE}.GRANTOR ;;
  description: "Role who granted the table privilege"
}
dimension: IS_GRANTABLE {
  type: string
  sql: ${TABLE}.IS_GRANTABLE ;;
  description: "Whether the privilege was granted WITH GRANT OPTION"
}
dimension: PRIVILEGE_TYPE {
  type: string
  sql: ${TABLE}.PRIVILEGE_TYPE ;;
  description: "Type of the granted privilege"
}
dimension: TABLE_CATALOG {
  type: string
  sql: ${TABLE}.TABLE_CATALOG ;;
  description: "Database containing the table on which the privilege is granted"
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Name of the table on which the privilege is granted"
}
dimension: TABLE_SCHEMA {
  type: string
  sql: ${TABLE}.TABLE_SCHEMA ;;
  description: "Schema containing the table on which the privilege is granted"
}
dimension: WITH_HIERARCHY {
  type: string
  sql: ${TABLE}.WITH_HIERARCHY ;;
  description: "Not applicable for Snowflake."
}
}
view: TABLE_STORAGE_METRICS {
sql_table_name: TABLE_STORAGE_METRICS ;;
dimension: ACTIVE_BYTES {
  type: number
  sql: ${TABLE}.ACTIVE_BYTES ;;
  description: "Bytes in the active version of the table. Some bytes may be billed to another table if this table is a clone."
}
dimension_group: CATALOG_CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CATALOG_CREATED ;;
  description: "Time at which the database was created.  Potentially NULL if table is in failsafe."
}
dimension_group: CATALOG_DROPPED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CATALOG_DROPPED ;;
  description: "Time at which the database was dropped.  Potentially NULL if table is past failsafe."
}
dimension: CLONE_GROUP_ID {
  type: number
  sql: ${TABLE}.CLONE_GROUP_ID ;;
  description: "Unique identifier of the oldest clone ancestor of this table.  Same as this table's ID if it is not a clone."
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Table's comment.  Potentially NULL if table is in failsafe."
}
dimension: FAILSAFE_BYTES {
  type: number
  sql: ${TABLE}.FAILSAFE_BYTES ;;
  description: "Bytes in failsafe versions of the table. All such bytes are billed to this table."
}
dimension: ID {
  type: number
  sql: ${TABLE}.ID ;;
  description: "Unique identifier of the table"
}
dimension: IS_TRANSIENT {
  type: string
  sql: ${TABLE}.IS_TRANSIENT ;;
  description: "'YES' if table is transient, 'NO' otherwise.  Potentially NULL if table is in failsafe."
}
dimension: RETAINED_FOR_CLONE_BYTES {
  type: number
  sql: ${TABLE}.RETAINED_FOR_CLONE_BYTES ;;
  description: "Bytes which used to be owned by this table and are no longer referenced by it. Still, they are retained (and billed) because other clone(s) of that table are still referencing these bytes. Note that the original metadata for this table might have been purged so the table, schema, and database names might be NULL in this case."
}
dimension_group: SCHEMA_CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.SCHEMA_CREATED ;;
  description: "Time at which the schema was created.  Potentially NULL if table is past failsafe."
}
dimension_group: SCHEMA_DROPPED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.SCHEMA_DROPPED ;;
  description: "Time at which the schema was dropped.  Potentially NULL if table is in failsafe."
}
dimension: TABLE_CATALOG {
  type: string
  sql: ${TABLE}.TABLE_CATALOG ;;
  description: "Database that the table belongs to.  Potentially NULL if table is in failsafe."
}
dimension_group: TABLE_CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.TABLE_CREATED ;;
  description: "Time at which this table was created.  Potentially NULL if table is in failsafe."
}
dimension_group: TABLE_DROPPED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.TABLE_DROPPED ;;
  description: "Time at which the table was dropped, or NULL.  Potentially NULL if table is in failsafe."
}
dimension_group: TABLE_ENTERED_FAILSAFE {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.TABLE_ENTERED_FAILSAFE ;;
  description: "Time at which the table entered the failsafe state, or NULL.  Potentially NULL if table is in failsafe."
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Name of the table.  Potentially NULL if table is in failsafe."
}
dimension: TABLE_SCHEMA {
  type: string
  sql: ${TABLE}.TABLE_SCHEMA ;;
  description: "Schema that the table belongs to.  Potentially NULL if table is in failsafe."
}
dimension: TIME_TRAVEL_BYTES {
  type: number
  sql: ${TABLE}.TIME_TRAVEL_BYTES ;;
  description: "Bytes in time travel versions of the table. Some bytes may be billed to another table if this table is a clone"
}
}
view: TIME_DIM {
sql_table_name: TIME_DIM ;;
dimension: T_AM_PM {
  type: string
  sql: ${TABLE}.T_AM_PM ;;
  description: "not available"
}
dimension: T_HOUR {
  type: number
  sql: ${TABLE}.T_HOUR ;;
  description: "not available"
}
dimension: T_MEAL_TIME {
  type: string
  sql: ${TABLE}.T_MEAL_TIME ;;
  description: "not available"
}
dimension: T_MINUTE {
  type: number
  sql: ${TABLE}.T_MINUTE ;;
  description: "not available"
}
dimension: T_SECOND {
  type: number
  sql: ${TABLE}.T_SECOND ;;
  description: "not available"
}
dimension: T_SHIFT {
  type: string
  sql: ${TABLE}.T_SHIFT ;;
  description: "not available"
}
dimension: T_SUB_SHIFT {
  type: string
  sql: ${TABLE}.T_SUB_SHIFT ;;
  description: "not available"
}
dimension: T_TIME {
  type: number
  sql: ${TABLE}.T_TIME ;;
  description: "not available"
}
dimension: T_TIME_ID {
  type: string
  sql: ${TABLE}.T_TIME_ID ;;
  description: "not available"
}
dimension: T_TIME_SK {
  type: number
  sql: ${TABLE}.T_TIME_SK ;;
  description: "not available"
}
}
view: USAGE_PRIVILEGES {
sql_table_name: USAGE_PRIVILEGES ;;
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the privilege"
}
dimension: GRANTEE {
  type: string
  sql: ${TABLE}.GRANTEE ;;
  description: "Role to whom the usage privilege is granted"
}
dimension: GRANTOR {
  type: string
  sql: ${TABLE}.GRANTOR ;;
  description: "Role who granted the usage privilege"
}
dimension: IS_GRANTABLE {
  type: string
  sql: ${TABLE}.IS_GRANTABLE ;;
  description: "Whether the privilege was granted WITH GRANT OPTION"
}
dimension: OBJECT_CATALOG {
  type: string
  sql: ${TABLE}.OBJECT_CATALOG ;;
  description: "Database containing the object on which the privilege is granted"
}
dimension: OBJECT_NAME {
  type: string
  sql: ${TABLE}.OBJECT_NAME ;;
  description: "Name of the object on which the privilege is granted"
}
dimension: OBJECT_SCHEMA {
  type: string
  sql: ${TABLE}.OBJECT_SCHEMA ;;
  description: "Schema containing the object on which the privilege is granted"
}
dimension: OBJECT_TYPE {
  type: string
  sql: ${TABLE}.OBJECT_TYPE ;;
  description: "Type of the object on which the privilege is granted"
}
dimension: PRIVILEGE_TYPE {
  type: string
  sql: ${TABLE}.PRIVILEGE_TYPE ;;
  description: "Type of the granted privilege"
}
}
view: VIEWS {
sql_table_name: VIEWS ;;
dimension: CHECK_OPTION {
  type: string
  sql: ${TABLE}.CHECK_OPTION ;;
  description: "Not applicable for Snowflake."
}
dimension: COMMENT {
  type: string
  sql: ${TABLE}.COMMENT ;;
  description: "Comment for this view"
}
dimension_group: CREATED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.CREATED ;;
  description: "Creation time of the view"
}
dimension: INSERTABLE_INTO {
  type: string
  sql: ${TABLE}.INSERTABLE_INTO ;;
  description: "Not applicable for Snowflake."
}
dimension: IS_SECURE {
  type: string
  sql: ${TABLE}.IS_SECURE ;;
  description: "Whether this view is secure."
}
dimension: IS_UPDATABLE {
  type: string
  sql: ${TABLE}.IS_UPDATABLE ;;
  description: "Not applicable for Snowflake."
}
dimension_group: LAST_ALTERED {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_LTZ
  sql: ${TABLE}.LAST_ALTERED ;;
  description: "Last altered time of the view"
}
dimension: TABLE_CATALOG {
  type: string
  sql: ${TABLE}.TABLE_CATALOG ;;
  description: "Database that the view belongs to"
}
dimension: TABLE_NAME {
  type: string
  sql: ${TABLE}.TABLE_NAME ;;
  description: "Name of the view"
}
dimension: TABLE_OWNER {
  type: string
  sql: ${TABLE}.TABLE_OWNER ;;
  description: "Name of the role that owns the view"
}
dimension: TABLE_SCHEMA {
  type: string
  sql: ${TABLE}.TABLE_SCHEMA ;;
  description: "Schema that the view belongs to"
}
dimension: VIEW_DEFINITION {
  type: string
  sql: ${TABLE}.VIEW_DEFINITION ;;
  description: "Text of the view's query expression"
}
}
view: WAREHOUSE {
sql_table_name: WAREHOUSE ;;
dimension: W_CITY {
  type: string
  sql: ${TABLE}.W_CITY ;;
  description: "not available"
}
dimension: W_COUNTRY {
  type: string
  sql: ${TABLE}.W_COUNTRY ;;
  description: "not available"
}
dimension: W_COUNTY {
  type: string
  sql: ${TABLE}.W_COUNTY ;;
  description: "not available"
}
dimension: W_GMT_OFFSET {
  type: number
  sql: ${TABLE}.W_GMT_OFFSET ;;
  description: "not available"
}
dimension: W_STATE {
  type: string
  sql: ${TABLE}.W_STATE ;;
  description: "not available"
}
dimension: W_STREET_NAME {
  type: string
  sql: ${TABLE}.W_STREET_NAME ;;
  description: "not available"
}
dimension: W_STREET_NUMBER {
  type: string
  sql: ${TABLE}.W_STREET_NUMBER ;;
  description: "not available"
}
dimension: W_STREET_TYPE {
  type: string
  sql: ${TABLE}.W_STREET_TYPE ;;
  description: "not available"
}
dimension: W_SUITE_NUMBER {
  type: string
  sql: ${TABLE}.W_SUITE_NUMBER ;;
  description: "not available"
}
dimension: W_WAREHOUSE_ID {
  type: string
  sql: ${TABLE}.W_WAREHOUSE_ID ;;
  description: "not available"
}
dimension: W_WAREHOUSE_NAME {
  type: string
  sql: ${TABLE}.W_WAREHOUSE_NAME ;;
  description: "not available"
}
dimension: W_WAREHOUSE_SK {
  type: number
  sql: ${TABLE}.W_WAREHOUSE_SK ;;
  description: "not available"
}
dimension: W_WAREHOUSE_SQ_FT {
  type: number
  sql: ${TABLE}.W_WAREHOUSE_SQ_FT ;;
  description: "not available"
}
dimension: W_ZIP {
  type: string
  sql: ${TABLE}.W_ZIP ;;
  description: "not available"
}
}
view: WEATHER_14_TOTAL {
sql_table_name: WEATHER_14_TOTAL ;;
dimension_group: T {
  timeframes: [time,raw,date,week,month,quarter,year]
  type: time
  datatype: timestamp_NTZ
  sql: ${TABLE}.T ;;
  description: "not available"
}
dimension: V {
  type: VARIANT
  sql: ${TABLE}.V ;;
  description: "not available"
}
}
view: WEB_PAGE {
sql_table_name: WEB_PAGE ;;
dimension: WP_ACCESS_DATE_SK {
  type: number
  sql: ${TABLE}.WP_ACCESS_DATE_SK ;;
  description: "not available"
}
dimension: WP_AUTOGEN_FLAG {
  type: string
  sql: ${TABLE}.WP_AUTOGEN_FLAG ;;
  description: "not available"
}
dimension: WP_CHAR_COUNT {
  type: number
  sql: ${TABLE}.WP_CHAR_COUNT ;;
  description: "not available"
}
dimension: WP_CREATION_DATE_SK {
  type: number
  sql: ${TABLE}.WP_CREATION_DATE_SK ;;
  description: "not available"
}
dimension: WP_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.WP_CUSTOMER_SK ;;
  description: "not available"
}
dimension: WP_IMAGE_COUNT {
  type: number
  sql: ${TABLE}.WP_IMAGE_COUNT ;;
  description: "not available"
}
dimension: WP_LINK_COUNT {
  type: number
  sql: ${TABLE}.WP_LINK_COUNT ;;
  description: "not available"
}
dimension: WP_MAX_AD_COUNT {
  type: number
  sql: ${TABLE}.WP_MAX_AD_COUNT ;;
  description: "not available"
}
dimension_group: WP_REC_END_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.WP_REC_END_DATE ;;
  description: "not available"
}
dimension_group: WP_REC_START_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.WP_REC_START_DATE ;;
  description: "not available"
}
dimension: WP_TYPE {
  type: string
  sql: ${TABLE}.WP_TYPE ;;
  description: "not available"
}
dimension: WP_URL {
  type: string
  sql: ${TABLE}.WP_URL ;;
  description: "not available"
}
dimension: WP_WEB_PAGE_ID {
  type: string
  sql: ${TABLE}.WP_WEB_PAGE_ID ;;
  description: "not available"
}
dimension: WP_WEB_PAGE_SK {
  type: number
  sql: ${TABLE}.WP_WEB_PAGE_SK ;;
  description: "not available"
}
}
view: WEB_RETURNS {
sql_table_name: WEB_RETURNS ;;
dimension: WR_ACCOUNT_CREDIT {
  type: number
  sql: ${TABLE}.WR_ACCOUNT_CREDIT ;;
  description: "not available"
}
dimension: WR_FEE {
  type: number
  sql: ${TABLE}.WR_FEE ;;
  description: "not available"
}
dimension: WR_ITEM_SK {
  type: number
  sql: ${TABLE}.WR_ITEM_SK ;;
  description: "not available"
}
dimension: WR_NET_LOSS {
  type: number
  sql: ${TABLE}.WR_NET_LOSS ;;
  description: "not available"
}
dimension: WR_ORDER_NUMBER {
  type: number
  sql: ${TABLE}.WR_ORDER_NUMBER ;;
  description: "not available"
}
dimension: WR_REASON_SK {
  type: number
  sql: ${TABLE}.WR_REASON_SK ;;
  description: "not available"
}
dimension: WR_REFUNDED_ADDR_SK {
  type: number
  sql: ${TABLE}.WR_REFUNDED_ADDR_SK ;;
  description: "not available"
}
dimension: WR_REFUNDED_CASH {
  type: number
  sql: ${TABLE}.WR_REFUNDED_CASH ;;
  description: "not available"
}
dimension: WR_REFUNDED_CDEMO_SK {
  type: number
  sql: ${TABLE}.WR_REFUNDED_CDEMO_SK ;;
  description: "not available"
}
dimension: WR_REFUNDED_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.WR_REFUNDED_CUSTOMER_SK ;;
  description: "not available"
}
dimension: WR_REFUNDED_HDEMO_SK {
  type: number
  sql: ${TABLE}.WR_REFUNDED_HDEMO_SK ;;
  description: "not available"
}
dimension: WR_RETURNED_DATE_SK {
  type: number
  sql: ${TABLE}.WR_RETURNED_DATE_SK ;;
  description: "not available"
}
dimension: WR_RETURNED_TIME_SK {
  type: number
  sql: ${TABLE}.WR_RETURNED_TIME_SK ;;
  description: "not available"
}
dimension: WR_RETURNING_ADDR_SK {
  type: number
  sql: ${TABLE}.WR_RETURNING_ADDR_SK ;;
  description: "not available"
}
dimension: WR_RETURNING_CDEMO_SK {
  type: number
  sql: ${TABLE}.WR_RETURNING_CDEMO_SK ;;
  description: "not available"
}
dimension: WR_RETURNING_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.WR_RETURNING_CUSTOMER_SK ;;
  description: "not available"
}
dimension: WR_RETURNING_HDEMO_SK {
  type: number
  sql: ${TABLE}.WR_RETURNING_HDEMO_SK ;;
  description: "not available"
}
dimension: WR_RETURN_AMT {
  type: number
  sql: ${TABLE}.WR_RETURN_AMT ;;
  description: "not available"
}
dimension: WR_RETURN_AMT_INC_TAX {
  type: number
  sql: ${TABLE}.WR_RETURN_AMT_INC_TAX ;;
  description: "not available"
}
dimension: WR_RETURN_QUANTITY {
  type: number
  sql: ${TABLE}.WR_RETURN_QUANTITY ;;
  description: "not available"
}
dimension: WR_RETURN_SHIP_COST {
  type: number
  sql: ${TABLE}.WR_RETURN_SHIP_COST ;;
  description: "not available"
}
dimension: WR_RETURN_TAX {
  type: number
  sql: ${TABLE}.WR_RETURN_TAX ;;
  description: "not available"
}
dimension: WR_REVERSED_CHARGE {
  type: number
  sql: ${TABLE}.WR_REVERSED_CHARGE ;;
  description: "not available"
}
dimension: WR_WEB_PAGE_SK {
  type: number
  sql: ${TABLE}.WR_WEB_PAGE_SK ;;
  description: "not available"
}
}
view: WEB_SALES {
sql_table_name: WEB_SALES ;;
dimension: WS_BILL_ADDR_SK {
  type: number
  sql: ${TABLE}.WS_BILL_ADDR_SK ;;
  description: "not available"
}
dimension: WS_BILL_CDEMO_SK {
  type: number
  sql: ${TABLE}.WS_BILL_CDEMO_SK ;;
  description: "not available"
}
dimension: WS_BILL_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.WS_BILL_CUSTOMER_SK ;;
  description: "not available"
}
dimension: WS_BILL_HDEMO_SK {
  type: number
  sql: ${TABLE}.WS_BILL_HDEMO_SK ;;
  description: "not available"
}
dimension: WS_COUPON_AMT {
  type: number
  sql: ${TABLE}.WS_COUPON_AMT ;;
  description: "not available"
}
dimension: WS_EXT_DISCOUNT_AMT {
  type: number
  sql: ${TABLE}.WS_EXT_DISCOUNT_AMT ;;
  description: "not available"
}
dimension: WS_EXT_LIST_PRICE {
  type: number
  sql: ${TABLE}.WS_EXT_LIST_PRICE ;;
  description: "not available"
}
dimension: WS_EXT_SALES_PRICE {
  type: number
  sql: ${TABLE}.WS_EXT_SALES_PRICE ;;
  description: "not available"
}
dimension: WS_EXT_SHIP_COST {
  type: number
  sql: ${TABLE}.WS_EXT_SHIP_COST ;;
  description: "not available"
}
dimension: WS_EXT_TAX {
  type: number
  sql: ${TABLE}.WS_EXT_TAX ;;
  description: "not available"
}
dimension: WS_EXT_WHOLESALE_COST {
  type: number
  sql: ${TABLE}.WS_EXT_WHOLESALE_COST ;;
  description: "not available"
}
dimension: WS_ITEM_SK {
  type: number
  sql: ${TABLE}.WS_ITEM_SK ;;
  description: "not available"
}
dimension: WS_LIST_PRICE {
  type: number
  sql: ${TABLE}.WS_LIST_PRICE ;;
  description: "not available"
}
dimension: WS_NET_PAID {
  type: number
  sql: ${TABLE}.WS_NET_PAID ;;
  description: "not available"
}
dimension: WS_NET_PAID_INC_SHIP {
  type: number
  sql: ${TABLE}.WS_NET_PAID_INC_SHIP ;;
  description: "not available"
}
dimension: WS_NET_PAID_INC_SHIP_TAX {
  type: number
  sql: ${TABLE}.WS_NET_PAID_INC_SHIP_TAX ;;
  description: "not available"
}
dimension: WS_NET_PAID_INC_TAX {
  type: number
  sql: ${TABLE}.WS_NET_PAID_INC_TAX ;;
  description: "not available"
}
dimension: WS_NET_PROFIT {
  type: number
  sql: ${TABLE}.WS_NET_PROFIT ;;
  description: "not available"
}
dimension: WS_ORDER_NUMBER {
  type: number
  sql: ${TABLE}.WS_ORDER_NUMBER ;;
  description: "not available"
}
dimension: WS_PROMO_SK {
  type: number
  sql: ${TABLE}.WS_PROMO_SK ;;
  description: "not available"
}
dimension: WS_QUANTITY {
  type: number
  sql: ${TABLE}.WS_QUANTITY ;;
  description: "not available"
}
dimension: WS_SALES_PRICE {
  type: number
  sql: ${TABLE}.WS_SALES_PRICE ;;
  description: "not available"
}
dimension: WS_SHIP_ADDR_SK {
  type: number
  sql: ${TABLE}.WS_SHIP_ADDR_SK ;;
  description: "not available"
}
dimension: WS_SHIP_CDEMO_SK {
  type: number
  sql: ${TABLE}.WS_SHIP_CDEMO_SK ;;
  description: "not available"
}
dimension: WS_SHIP_CUSTOMER_SK {
  type: number
  sql: ${TABLE}.WS_SHIP_CUSTOMER_SK ;;
  description: "not available"
}
dimension: WS_SHIP_DATE_SK {
  type: number
  sql: ${TABLE}.WS_SHIP_DATE_SK ;;
  description: "not available"
}
dimension: WS_SHIP_HDEMO_SK {
  type: number
  sql: ${TABLE}.WS_SHIP_HDEMO_SK ;;
  description: "not available"
}
dimension: WS_SHIP_MODE_SK {
  type: number
  sql: ${TABLE}.WS_SHIP_MODE_SK ;;
  description: "not available"
}
dimension: WS_SOLD_DATE_SK {
  type: number
  sql: ${TABLE}.WS_SOLD_DATE_SK ;;
  description: "not available"
}
dimension: WS_SOLD_TIME_SK {
  type: number
  sql: ${TABLE}.WS_SOLD_TIME_SK ;;
  description: "not available"
}
dimension: WS_WAREHOUSE_SK {
  type: number
  sql: ${TABLE}.WS_WAREHOUSE_SK ;;
  description: "not available"
}
dimension: WS_WEB_PAGE_SK {
  type: number
  sql: ${TABLE}.WS_WEB_PAGE_SK ;;
  description: "not available"
}
dimension: WS_WEB_SITE_SK {
  type: number
  sql: ${TABLE}.WS_WEB_SITE_SK ;;
  description: "not available"
}
dimension: WS_WHOLESALE_COST {
  type: number
  sql: ${TABLE}.WS_WHOLESALE_COST ;;
  description: "not available"
}
}
view: WEB_SITE {
sql_table_name: WEB_SITE ;;
dimension: WEB_CITY {
  type: string
  sql: ${TABLE}.WEB_CITY ;;
  description: "not available"
}
dimension: WEB_CLASS {
  type: string
  sql: ${TABLE}.WEB_CLASS ;;
  description: "not available"
}
dimension: WEB_CLOSE_DATE_SK {
  type: number
  sql: ${TABLE}.WEB_CLOSE_DATE_SK ;;
  description: "not available"
}
dimension: WEB_COMPANY_ID {
  type: number
  sql: ${TABLE}.WEB_COMPANY_ID ;;
  description: "not available"
}
dimension: WEB_COMPANY_NAME {
  type: string
  sql: ${TABLE}.WEB_COMPANY_NAME ;;
  description: "not available"
}
dimension: WEB_COUNTRY {
  type: string
  sql: ${TABLE}.WEB_COUNTRY ;;
  description: "not available"
}
dimension: WEB_COUNTY {
  type: string
  sql: ${TABLE}.WEB_COUNTY ;;
  description: "not available"
}
dimension: WEB_GMT_OFFSET {
  type: number
  sql: ${TABLE}.WEB_GMT_OFFSET ;;
  description: "not available"
}
dimension: WEB_MANAGER {
  type: string
  sql: ${TABLE}.WEB_MANAGER ;;
  description: "not available"
}
dimension: WEB_MARKET_MANAGER {
  type: string
  sql: ${TABLE}.WEB_MARKET_MANAGER ;;
  description: "not available"
}
dimension: WEB_MKT_CLASS {
  type: string
  sql: ${TABLE}.WEB_MKT_CLASS ;;
  description: "not available"
}
dimension: WEB_MKT_DESC {
  type: string
  sql: ${TABLE}.WEB_MKT_DESC ;;
  description: "not available"
}
dimension: WEB_MKT_ID {
  type: number
  sql: ${TABLE}.WEB_MKT_ID ;;
  description: "not available"
}
dimension: WEB_NAME {
  type: string
  sql: ${TABLE}.WEB_NAME ;;
  description: "not available"
}
dimension: WEB_OPEN_DATE_SK {
  type: number
  sql: ${TABLE}.WEB_OPEN_DATE_SK ;;
  description: "not available"
}
dimension_group: WEB_REC_END_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.WEB_REC_END_DATE ;;
  description: "not available"
}
dimension_group: WEB_REC_START_DATE {
  timeframes: [raw,date,week,month,quarter,year]
  type: time
  datatype: date
  sql: ${TABLE}.WEB_REC_START_DATE ;;
  description: "not available"
}
dimension: WEB_SITE_ID {
  type: string
  sql: ${TABLE}.WEB_SITE_ID ;;
  description: "not available"
}
dimension: WEB_SITE_SK {
  type: number
  sql: ${TABLE}.WEB_SITE_SK ;;
  description: "not available"
}
dimension: WEB_STATE {
  type: string
  sql: ${TABLE}.WEB_STATE ;;
  description: "not available"
}
dimension: WEB_STREET_NAME {
  type: string
  sql: ${TABLE}.WEB_STREET_NAME ;;
  description: "not available"
}
dimension: WEB_STREET_NUMBER {
  type: string
  sql: ${TABLE}.WEB_STREET_NUMBER ;;
  description: "not available"
}
dimension: WEB_STREET_TYPE {
  type: string
  sql: ${TABLE}.WEB_STREET_TYPE ;;
  description: "not available"
}
dimension: WEB_SUITE_NUMBER {
  type: string
  sql: ${TABLE}.WEB_SUITE_NUMBER ;;
  description: "not available"
}
dimension: WEB_TAX_PERCENTAGE {
  type: number
  sql: ${TABLE}.WEB_TAX_PERCENTAGE ;;
  description: "not available"
}
dimension: WEB_ZIP {
  type: string
  sql: ${TABLE}.WEB_ZIP ;;
  description: "not available"
}
}

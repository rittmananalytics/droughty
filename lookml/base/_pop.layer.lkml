view: +example_1
dimension: created_month_of_quarter_advanced
label: "Orders Month of Quarter"
group_label: "Orders Dates"
group_item_label: "Month of Quarter"
type: number
sql: case when ${example_1.example_2} IN (1,4,7,10) THEN 1 when ${example_1.example_2} IN (2,5,8,11) THEN 2 else 3 end ;;
view: +example_3
dimension: created_month_of_quarter_advanced
label: "Orders Month of Quarter"
group_label: "Orders Dates"
group_item_label: "Month of Quarter"
type: number
sql: case when ${example_3.example_4} IN (1,4,7,10) THEN 1 when ${example_3.example_4} IN (2,5,8,11) THEN 2 else 3 end ;;

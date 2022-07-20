view: parameters {

    parameter: select_timeframe_advanced {
        label: "select timeframe"
        type: unquoted
        default_value: "month"
        allowed_value: {
        value: "year"
        label: "years"
        }
        allowed_value: {
        value: "quarter"
        label: "quarters"
        }
        allowed_value: {
        value: "month"
        label: "months"
        }
        allowed_value: {
        value: "week"
        label: "weeks"
        }
        allowed_value: {
        value: "day"
        label: "days"
        }
        allowed_value: {
        value: "ytd"
        label: "ytd"
        }
    }

    parameter: select_comparison  {
        label: "select comparison type"
        group_label: ""
        group_item_label: ""

        type: unquoted
        default_value: "period"

        allowed_value: {
        label: "previous year"
        value: "year"
        }

        allowed_value: {
        label: "previous period"
        value: "period"
        }
    }

    parameter: apply_to_date_filter_advanced {
        type: yesno
        default_value: "false"
    }

    parameter: select_reference_date_advanced {
        label: " select reference date"
        description: "choose any date to compare it with the previous day/week/month/year. any date during a week/month/year will act as the entire week/month/year"
        type: date
        convert_tz: no
    }

    dimension_group: current_timestamp_advanced {
        type: time
        hidden: yes
        timeframes: [raw,hour,date,week,month,month_name,month_num,year,hour_of_day,day_of_week_index,day_of_month,day_of_year]
        sql: current_timestamp() ;;

    }


    dimension: current_timestamp_month_of_quarter_advanced {
        type: number
        hidden: yes
        sql:
        case
            when ${current_timestamp_advanced_month_num} in (1,4,7,10) then 1
            when ${current_timestamp_advanced_month_num} in (2,5,8,11) then 2
            else 3
        end
        ;;
    }

    dimension_group: selected_reference_date_default_today_advanced { 
        description: "this dimension will make sure that when "select reference date" is set in  the future then we use the current day for reference"
        hidden: yes
        type: time
        convert_tz: no
        datatype: date
        timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
        sql:
        case
            when {% parameter parameters.select_reference_date_advanced %} is null or ${parameters.current_timestamp_advanced_date} <= date({% parameter parameters.select_reference_date_advanced %})
            then ${parameters.current_timestamp_advanced_date}
            else date({% parameter parameters.select_reference_date_advanced %})
        end
        ;;

    }
view: +example_1 {
  dimension: example_2_created_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${example_1.example_2} IN (1,4,7,10) THEN 1 when ${example_1.example_2} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: example_2_is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if parameters.apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_1.example_2_day_of_week_index} <= ${parameters.current_timestamp_advanced_day_of_week_index} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'day' %}
 ${example_1.example_2_hour_of_day} <= ${parameters.current_timestamp_advanced_hour_of_day}
 {% elsif parameters.select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${example_1.example_2_month_of_quarter_advanced} <= ${parameters.current_timestamp_month_of_quarter_advanced}
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %}
 ${example_1.example_2_day_of_year} <= ${parameters.current_timestamp_advanced_day_of_year}
 {% else %}
 ${example_1.example_2_day_of_month} <= ${parameters.current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: example_2_selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: parameters.select_timeframe_advanced
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_1.example_2} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_1.example_2} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_1.example_2} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_1.example_2} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${example_1.example_2},'-',${parameters.selected_reference_date_default_today_advanced_month_num},'-',${parameters.selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${example_1.example_2} 
 {% endif %} ;;
  }

  dimension: example_2_selected_dynamic_day_of_advanced {
    type: string
    order_by_field: +view_name.selected_dynamic_day_of_sort_advanced
    label: "{% 
if parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'year' %}Months{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% 
else %}Selected Dynamic Timeframe Granularity{% 
endif %} 
"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
${example_1.created_hour_of_day} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
${example_1.created_day_of_week} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
${example_1.created_month_name} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
${example_1.created_month_of_quarter_advanced} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
${example_1.created_day_of_year} 
{% else %} 
${example_1.created_day_of_month} 
{% endif %} ;;
  }

  dimension: example_2_selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: parameters.select_timeframe_advanced
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_1.example_2_hour_of_day} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_1.example_2_day_of_week_index} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_1.example_2_month_num} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_1.example_2_month_of_quarter_advanced} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${example_1.example_2_day_of_year} 
 {% else %} 
 ${example_1.example_2_day_of_month} 
 {% endif %} ;;
  }

  dimension: example_2_current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == ytd %} 
 CASE 
 WHEN ${example_1.example_2_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN ${example_1.example_2_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% else %} 
 {% if parameters.select_comparison._parameter_value == year %} 
 CASE 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% elsif parameters.select_comparison._parameter_value == period %} 
 CASE 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }

  dimension: example_2_current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == ytd %} 
 CASE 
 WHEN ${example_1.example_2_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN 'reference' 
 WHEN ${example_1.example_2_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% else %} 
 {% if parameters.select_comparison._parameter_value == year %} 
 CASE 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% elsif parameters.select_comparison._parameter_value == period %} 
 CASE 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${example_1.example_2_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }
}
view: +example_3 {
  dimension: example_4_created_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${example_3.example_4} IN (1,4,7,10) THEN 1 when ${example_3.example_4} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: example_4_is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if parameters.apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_4_day_of_week_index} <= ${parameters.current_timestamp_advanced_day_of_week_index} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'day' %}
 ${example_3.example_4_hour_of_day} <= ${parameters.current_timestamp_advanced_hour_of_day}
 {% elsif parameters.select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${example_3.example_4_month_of_quarter_advanced} <= ${parameters.current_timestamp_month_of_quarter_advanced}
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %}
 ${example_3.example_4_day_of_year} <= ${parameters.current_timestamp_advanced_day_of_year}
 {% else %}
 ${example_3.example_4_day_of_month} <= ${parameters.current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: example_4_selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: parameters.select_timeframe_advanced
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_4} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_4} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_4} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_4} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${example_3.example_4},'-',${parameters.selected_reference_date_default_today_advanced_month_num},'-',${parameters.selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${example_3.example_4} 
 {% endif %} ;;
  }

  dimension: example_4_selected_dynamic_day_of_advanced {
    type: string
    order_by_field: +view_name.selected_dynamic_day_of_sort_advanced
    label: "{% 
if parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'year' %}Months{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% 
else %}Selected Dynamic Timeframe Granularity{% 
endif %} 
"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
${example_3.created_hour_of_day} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
${example_3.created_day_of_week} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
${example_3.created_month_name} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
${example_3.created_month_of_quarter_advanced} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
${example_3.created_day_of_year} 
{% else %} 
${example_3.created_day_of_month} 
{% endif %} ;;
  }

  dimension: example_4_selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: parameters.select_timeframe_advanced
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_4_hour_of_day} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_4_day_of_week_index} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_4_month_num} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_4_month_of_quarter_advanced} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${example_3.example_4_day_of_year} 
 {% else %} 
 ${example_3.example_4_day_of_month} 
 {% endif %} ;;
  }

  dimension: example_4_current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == ytd %} 
 CASE 
 WHEN ${example_3.example_4_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN ${example_3.example_4_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% else %} 
 {% if parameters.select_comparison._parameter_value == year %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% elsif parameters.select_comparison._parameter_value == period %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }

  dimension: example_4_current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == ytd %} 
 CASE 
 WHEN ${example_3.example_4_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN 'reference' 
 WHEN ${example_3.example_4_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% else %} 
 {% if parameters.select_comparison._parameter_value == year %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% elsif parameters.select_comparison._parameter_value == period %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${example_3.example_4_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }
}
view: +example_3 {
  dimension: example_5_created_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${example_3.example_5} IN (1,4,7,10) THEN 1 when ${example_3.example_5} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: example_5_is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if parameters.apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_5_day_of_week_index} <= ${parameters.current_timestamp_advanced_day_of_week_index} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'day' %}
 ${example_3.example_5_hour_of_day} <= ${parameters.current_timestamp_advanced_hour_of_day}
 {% elsif parameters.select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${example_3.example_5_month_of_quarter_advanced} <= ${parameters.current_timestamp_month_of_quarter_advanced}
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %}
 ${example_3.example_5_day_of_year} <= ${parameters.current_timestamp_advanced_day_of_year}
 {% else %}
 ${example_3.example_5_day_of_month} <= ${parameters.current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: example_5_selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: parameters.select_timeframe_advanced
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_5} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_5} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_5} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_5} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${example_3.example_5},'-',${parameters.selected_reference_date_default_today_advanced_month_num},'-',${parameters.selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${example_3.example_5} 
 {% endif %} ;;
  }

  dimension: example_5_selected_dynamic_day_of_advanced {
    type: string
    order_by_field: +view_name.selected_dynamic_day_of_sort_advanced
    label: "{% 
if parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'year' %}Months{% 
elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% 
else %}Selected Dynamic Timeframe Granularity{% 
endif %} 
"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
${example_3.created_hour_of_day} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
${example_3.created_day_of_week} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
${example_3.created_month_name} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
${example_3.created_month_of_quarter_advanced} 
{% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
${example_3.created_day_of_year} 
{% else %} 
${example_3.created_day_of_month} 
{% endif %} ;;
  }

  dimension: example_5_selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: parameters.select_timeframe_advanced
    sql: {% if parameters.select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_5_hour_of_day} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_5_day_of_week_index} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_5_month_num} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_5_month_of_quarter_advanced} 
 {% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${example_3.example_5_day_of_year} 
 {% else %} 
 ${example_3.example_5_day_of_month} 
 {% endif %} ;;
  }

  dimension: example_5_current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == ytd %} 
 CASE 
 WHEN ${example_3.example_5_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN ${example_3.example_5_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% else %} 
 {% if parameters.select_comparison._parameter_value == year %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% elsif parameters.select_comparison._parameter_value == period %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }

  dimension: example_5_current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if parameters.select_timeframe_advanced._parameter_value == ytd %} 
 CASE 
 WHEN ${example_3.example_5_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN 'reference' 
 WHEN ${example_3.example_5_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% else %} 
 {% if parameters.select_comparison._parameter_value == year %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% elsif parameters.select_comparison._parameter_value == period %} 
 CASE 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${example_3.example_5_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }
}

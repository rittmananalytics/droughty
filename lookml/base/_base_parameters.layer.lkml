
    
    include: "/lookml/base/_base.layer.lkml"

    view: +example_1 {

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
        description: "this dimension will make sure that when select reference date is set in  the future then we use the current day for reference"
        hidden: yes
        type: time
        convert_tz: no
        datatype: date
        timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
        sql:
        case
            when {% parameter select_reference_date_advanced %} is null or ${current_timestamp_advanced_date} <= date({% parameter select_reference_date_advanced %})
            then ${current_timestamp_advanced_date}
            else date({% parameter select_reference_date_advanced %})
        end
        ;;

    }

    parameter: timeframe {
        type: unquoted
        allowed_value: {
        label: "Week to Date"
        value: "Week"
        }
        allowed_value: {
        label: "Month to Date"
        value: "Month"
        }
        allowed_value: {
        label: "Quarter to Date"
        value: "Quarter"
        }
        allowed_value: {
        label: "Year to Date"
        value: "Year"
        }
        default_value: "Quarter"
    }

    dimension: first_date_in_period {
        type: date
        sql: DATE_TRUNC({% parameter timeframe %}, CURRENT_DATE());;
    }

    dimension: days_in_period {
        type: number
        sql: DATE_DIFF(${first_date_in_period}, DAY,CURRENT_DATE()) ;;
    }

    dimension: first_date_in_prior_period {
        type: date
        hidden: no
        sql: DATE_TRUNC({% parameter timeframe %},DATE_SUB(CURRENT_DATE(), INTERVAL 1 {% parameter timeframe %}));;
    }

    dimension: last_date_in_prior_period {
        type: date
        hidden: no
        sql: DATE_ADD(INTERVAL ${days_in_period} DAY,${first_date_in_prior_period}) ;;
    }

    }
    
view: +example_1 {
  dimension_group: example_2_date {
    label: "Date Surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.example_2 as date) ;;
  }

  dimension: example_2_date_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${example_1.example_2_date_month_num} IN (1,4,7,10) THEN 1 when ${example_1.example_2_date_month_num} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: example_2_date_month_of_quarter_advanced {
    label: "Period over Period"
    type: string
    sql: CASE WHEN ${example_1.example_2 >=  ${first_date_in_period} THEN 'This {% parameter timeframe %} to Date' 
WHEN  ${example_1.example_2 >= ${first_date_in_prior_period} 
AND  ${example_1.example_2 <= ${last_date_in_prior_period} 
THEN 'Prior {% parameter timeframe %} to Date' 
ELSE NULL 
END ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_1.example_2_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${example_1.example_2_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${example_1.example_2_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${example_1.example_2_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${example_1.example_2_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_1.example_2_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_1.example_2_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_1.example_2_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_1.example_2_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${example_1.example_2_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${example_1.example_2_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: example_1.selected_dynamic_day_of_sort_advanced
    label: "{% 
if select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'year' %}Months{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% 
else %}Selected Dynamic Timeframe Granularity{% 
endif %} 
"
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
${example_1.example_2_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${example_1.example_2_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${example_1.example_2_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${example_1.example_2_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${example_1.example_2_date_day_of_year} 
{% else %} 
${example_1.example_2_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_1.example_2_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_1.example_2_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_1.example_2_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_1.example_2_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${example_1.example_2_date_day_of_year} 
 {% else %} 
 ${example_1.example_2_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 case 
when ${example_1.example_2 BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_date}
then  ${selected_dynamic_timeframe_advanced}
when  ${example_1.example_2 BETWEEN date_trunc(year, dateadd(year, -1,${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date})
then  ${selected_dynamic_timeframe_advanced}
else  null
end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
 when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
 then ${selected_dynamic_timeframe_advanced} 
 when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
 then ${selected_dynamic_timeframe_advanced} 
 end 
 {% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then ${selected_dynamic_timeframe_advanced} 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then ${selected_dynamic_timeframe_advanced} 
end 
{% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
  case 
 when ${example_1.example_2 BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_raw} 
 then 'reference' 
 when ${example_1.example_2 BETWEEN date_trunc(year, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date}) 
 then 'comparison' 
 else null 
 end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_1.example_2_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% endif %} 
 {% endif %} ;;
  }
}

    
    include: "/lookml/base/_base.layer.lkml"

    view: +example_3 {

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
        description: "this dimension will make sure that when select reference date is set in  the future then we use the current day for reference"
        hidden: yes
        type: time
        convert_tz: no
        datatype: date
        timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
        sql:
        case
            when {% parameter select_reference_date_advanced %} is null or ${current_timestamp_advanced_date} <= date({% parameter select_reference_date_advanced %})
            then ${current_timestamp_advanced_date}
            else date({% parameter select_reference_date_advanced %})
        end
        ;;

    }

    parameter: timeframe {
        type: unquoted
        allowed_value: {
        label: "Week to Date"
        value: "Week"
        }
        allowed_value: {
        label: "Month to Date"
        value: "Month"
        }
        allowed_value: {
        label: "Quarter to Date"
        value: "Quarter"
        }
        allowed_value: {
        label: "Year to Date"
        value: "Year"
        }
        default_value: "Quarter"
    }

    dimension: first_date_in_period {
        type: date
        sql: DATE_TRUNC({% parameter timeframe %}, CURRENT_DATE());;
    }

    dimension: days_in_period {
        type: number
        sql: DATE_DIFF(${first_date_in_period}, DAY,CURRENT_DATE()) ;;
    }

    dimension: first_date_in_prior_period {
        type: date
        hidden: no
        sql: DATE_TRUNC({% parameter timeframe %},DATE_SUB(CURRENT_DATE(), INTERVAL 1 {% parameter timeframe %}));;
    }

    dimension: last_date_in_prior_period {
        type: date
        hidden: no
        sql: DATE_ADD(INTERVAL ${days_in_period} DAY,${first_date_in_prior_period}) ;;
    }

    }
    
view: +example_3 {
  dimension_group: example_4_date {
    label: "Date Surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.example_4 as date) ;;
  }

  dimension: example_4_date_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${example_3.example_4_date_month_num} IN (1,4,7,10) THEN 1 when ${example_3.example_4_date_month_num} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: example_4_date_month_of_quarter_advanced {
    label: "Period over Period"
    type: string
    sql: CASE WHEN ${example_3.example_4 >=  ${first_date_in_period} THEN 'This {% parameter timeframe %} to Date' 
WHEN  ${example_3.example_4 >= ${first_date_in_prior_period} 
AND  ${example_3.example_4 <= ${last_date_in_prior_period} 
THEN 'Prior {% parameter timeframe %} to Date' 
ELSE NULL 
END ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_4_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${example_3.example_4_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${example_3.example_4_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${example_3.example_4_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${example_3.example_4_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_4_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_4_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_4_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_4_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${example_3.example_4_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${example_3.example_4_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: example_3.selected_dynamic_day_of_sort_advanced
    label: "{% 
if select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'year' %}Months{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% 
else %}Selected Dynamic Timeframe Granularity{% 
endif %} 
"
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
${example_3.example_4_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${example_3.example_4_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${example_3.example_4_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${example_3.example_4_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${example_3.example_4_date_day_of_year} 
{% else %} 
${example_3.example_4_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_4_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_4_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_4_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_4_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${example_3.example_4_date_day_of_year} 
 {% else %} 
 ${example_3.example_4_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 case 
when ${example_3.example_4 BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_date}
then  ${selected_dynamic_timeframe_advanced}
when  ${example_3.example_4 BETWEEN date_trunc(year, dateadd(year, -1,${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date})
then  ${selected_dynamic_timeframe_advanced}
else  null
end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
 when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
 then ${selected_dynamic_timeframe_advanced} 
 when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
 then ${selected_dynamic_timeframe_advanced} 
 end 
 {% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then ${selected_dynamic_timeframe_advanced} 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then ${selected_dynamic_timeframe_advanced} 
end 
{% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
  case 
 when ${example_3.example_4 BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_raw} 
 then 'reference' 
 when ${example_3.example_4 BETWEEN date_trunc(year, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date}) 
 then 'comparison' 
 else null 
 end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_4_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% endif %} 
 {% endif %} ;;
  }
}
view: +example_3 {
  dimension_group: example_5_date {
    label: "Date Surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.example_5 as date) ;;
  }

  dimension: example_5_date_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${example_3.example_5_date_month_num} IN (1,4,7,10) THEN 1 when ${example_3.example_5_date_month_num} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: example_5_date_month_of_quarter_advanced {
    label: "Period over Period"
    type: string
    sql: CASE WHEN ${example_3.example_5 >=  ${first_date_in_period} THEN 'This {% parameter timeframe %} to Date' 
WHEN  ${example_3.example_5 >= ${first_date_in_prior_period} 
AND  ${example_3.example_5 <= ${last_date_in_prior_period} 
THEN 'Prior {% parameter timeframe %} to Date' 
ELSE NULL 
END ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_5_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${example_3.example_5_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${example_3.example_5_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${example_3.example_5_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${example_3.example_5_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_5_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_5_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_5_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_5_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${example_3.example_5_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${example_3.example_5_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: example_3.selected_dynamic_day_of_sort_advanced
    label: "{% 
if select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'year' %}Months{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% 
else %}Selected Dynamic Timeframe Granularity{% 
endif %} 
"
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
${example_3.example_5_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${example_3.example_5_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${example_3.example_5_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${example_3.example_5_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${example_3.example_5_date_day_of_year} 
{% else %} 
${example_3.example_5_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${example_3.example_5_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${example_3.example_5_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${example_3.example_5_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${example_3.example_5_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${example_3.example_5_date_day_of_year} 
 {% else %} 
 ${example_3.example_5_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 case 
when ${example_3.example_5 BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_date}
then  ${selected_dynamic_timeframe_advanced}
when  ${example_3.example_5 BETWEEN date_trunc(year, dateadd(year, -1,${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date})
then  ${selected_dynamic_timeframe_advanced}
else  null
end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
 when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
 then ${selected_dynamic_timeframe_advanced} 
 when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
 then ${selected_dynamic_timeframe_advanced} 
 end 
 {% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then ${selected_dynamic_timeframe_advanced} 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then ${selected_dynamic_timeframe_advanced} 
end 
{% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
  case 
 when ${example_3.example_5 BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_raw} 
 then 'reference' 
 when ${example_3.example_5 BETWEEN date_trunc(year, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date}) 
 then 'comparison' 
 else null 
 end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${example_3.example_5_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% endif %} 
 {% endif %} ;;
  }
}

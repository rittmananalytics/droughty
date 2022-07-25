include: /lookml/base/_base.layer.lkml

    
    view: +wh_connectivity__connectivity_heartbeats_fact {

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
        label: "apply to date filter advanced"
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
        label: "timeframe to-date"
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
    
view: +wh_connectivity__connectivity_heartbeats_fact {
  dimension_group: connectivity_heartbeat_recieved_at_date_date {
    label: "date surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.connectivity_heartbeat_recieved_at_date as date) ;;
  }

  dimension: connectivity_heartbeat_recieved_at_date_date_month_of_quarter_advanced {
    label: "orders month of quarter"
    group_label: "orders dates"
    group_item_label: "month of quarter"
    type: number
    sql: case when ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month_num} in (1,4,7,10) then 1 when ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month_num} in (2,5,8,11) then 2 else 3 end ;;
  }

  dimension: connectivity_heartbeat_recieved_at_date_period_selected {
    label: "period over period"
    type: string
    sql: case when ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_raw} >=  ${first_date_in_period} then 'this {% parameter timeframe %} to date' 
when  ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_raw} >= ${first_date_in_prior_period} 
and  ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_raw} <= ${last_date_in_prior_period} 
then 'prior {% parameter timeframe %} to date' 
else null 
end ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 concat('ytd (',${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: wh_connectivity__connectivity_heartbeats_fact.selected_dynamic_day_of_sort_advanced
    label: "{% 
if select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'month' %}day of month{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'week' %}day of week{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'day' %}hour of day{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'year' %}months{% 
elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'ytd' %}day of year{% 
else %}selected dynamic timeframe granularity{% 
endif %} 
"
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_year} 
{% else %} 
${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_year} 
 {% else %} 
 ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "current vs previous period"
    description: "use this dimension alongside \"select timeframe\" and \"select comparison type\" filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 case 
when ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw} between date_trunc(year, ${selected_reference_date_default_today_advanced_raw}) and ${selected_reference_date_default_today_advanced_date}
then  ${selected_dynamic_timeframe_advanced}
when  ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw} between date_trunc(year, dateadd(year, -1,${selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${selected_reference_date_default_today_advanced_date})
then  ${selected_dynamic_timeframe_advanced}
else  null
end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
 when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, ${selected_reference_date_default_today_advanced_raw}) 
 then ${selected_dynamic_timeframe_advanced} 
 when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, dateadd(year, -1, ${selected_reference_date_default_today_advanced_raw})) 
 then ${selected_dynamic_timeframe_advanced} 
 end 
 {% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, ${selected_reference_date_default_today_advanced_raw}) 
then ${selected_dynamic_timeframe_advanced} 
when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, dateadd({% parameter select_timeframe_advanced %}, -1, ${selected_reference_date_default_today_advanced_raw})) 
then ${selected_dynamic_timeframe_advanced} 
end 
{% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "current vs previous period (hidden - for measure only)"
    description: "hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
  case 
 when ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw} between date_trunc(year, ${selected_reference_date_default_today_advanced_raw}) and ${selected_reference_date_default_today_advanced_raw} 
 then 'reference' 
 when ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw} between date_trunc(year, dateadd(year, -1, ${selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${selected_reference_date_default_today_advanced_date}) 
 then 'comparison' 
 else null 
 end 
{% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 case 
when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, ${selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, dateadd(year, -1, ${selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% elsif select_comparison._parameter_value == 'period' %} 
 case 
when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, ${selected_reference_date_default_today_advanced_raw}) 
then 'reference' 
when date_trunc({% parameter select_timeframe_advanced %}, ${wh_connectivity__connectivity_heartbeats_fact.connectivity_heartbeat_recieved_at_date_raw}) = date_trunc({% parameter select_timeframe_advanced %}, dateadd({% parameter select_timeframe_advanced %}, -1, ${selected_reference_date_default_today_advanced_raw})) 
then 'comparison' 
end 
{% endif %} 
 {% endif %} ;;
  }
}
view: +wh_connectivity__connectivity_heartbeats_fact {
measure: count_of_connectivity_heartbeat_pk_reference_advanced {
  label: "connectivity_heartbeat_pk count  ({% if select_reference_date_advanced._is_filtered %}reference {% else %}current {% endif %} {% parameter wh_connectivity__connectivity_heartbeats_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.connectivity_heartbeat_pk ;;
  description: "the primary key for the connectivity summary table - a hash of the vrn"
  drill_fields: [wh_connectivity__connectivity_heartbeats_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_connectivity_heartbeat_pk_previous_advanced {
  label: "connectivity_heartbeat_pk count (previous {% parameter wh_connectivity__connectivity_heartbeats_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.connectivity_heartbeat_pk ;;
  description: "the primary key for the connectivity summary table - a hash of the vrn"
  drill_fields: [wh_connectivity__connectivity_heartbeats_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
}

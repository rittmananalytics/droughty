
    
    include: "/lookml/base/_base.layer.lkml"

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
    }
    
view: +wh_core__engagements_xa {
  dimension_group: engagement_ts_date {
    label: "Date Surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.engagement_ts as date) ;;
  }

  dimension: engagement_ts_date_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${wh_core__engagements_xa.engagement_ts_date_month_num} IN (1,4,7,10) THEN 1 when ${wh_core__engagements_xa.engagement_ts_date_month_num} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_core__engagements_xa.engagement_ts_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${wh_core__engagements_xa.engagement_ts_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${wh_core__engagements_xa.engagement_ts_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${wh_core__engagements_xa.engagement_ts_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${wh_core__engagements_xa.engagement_ts_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_core__engagements_xa.engagement_ts_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_core__engagements_xa.engagement_ts_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_core__engagements_xa.engagement_ts_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_core__engagements_xa.engagement_ts_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${wh_core__engagements_xa.engagement_ts_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${wh_core__engagements_xa.engagement_ts_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: wh_core__engagements_xa.selected_dynamic_day_of_sort_advanced
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
${wh_core__engagements_xa.engagement_ts_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${wh_core__engagements_xa.engagement_ts_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${wh_core__engagements_xa.engagement_ts_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${wh_core__engagements_xa.engagement_ts_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${wh_core__engagements_xa.engagement_ts_date_day_of_year} 
{% else %} 
${wh_core__engagements_xa.engagement_ts_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_core__engagements_xa.engagement_ts_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_core__engagements_xa.engagement_ts_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_core__engagements_xa.engagement_ts_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_core__engagements_xa.engagement_ts_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${wh_core__engagements_xa.engagement_ts_date_day_of_year} 
 {% else %} 
 ${wh_core__engagements_xa.engagement_ts_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_core__engagements_xa.engagement_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN ${wh_core__engagements_xa.engagement_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_core__engagements_xa.engagement_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN 'reference' 
 WHEN ${wh_core__engagements_xa.engagement_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_core__engagements_xa.engagement_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }
}
view: +wh_core__engagements_xa {
measure: count_of_engagement_pk_reference_advanced {
  label: "engagement_pk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.engagement_pk ;;
  description: "Primary key of the engagements table. Generated from hashing the combination of student_key and engagement_index."
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_engagement_pk_previous_advanced {
  label: "engagement_pk count (Previous {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.engagement_pk ;;
  description: "Primary key of the engagements table. Generated from hashing the combination of student_key and engagement_index."
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_student_fk_reference_advanced {
  label: "student_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_student_fk_previous_advanced {
  label: "student_fk count (Previous {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_university_fk_reference_advanced {
  label: "university_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_university_fk_previous_advanced {
  label: "university_fk count (Previous {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_shortlist_fk_reference_advanced {
  label: "shortlist_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_shortlist_fk_previous_advanced {
  label: "shortlist_fk count (Previous {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_event_fk_reference_advanced {
  label: "event_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.event_fk ;;
  description: "Primary key of the platform events table"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_event_fk_previous_advanced {
  label: "event_fk count (Previous {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.event_fk ;;
  description: "Primary key of the platform events table"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_external_event_fk_reference_advanced {
  label: "external_event_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.external_event_fk ;;
  description: "Primary key of the external events table"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_external_event_fk_previous_advanced {
  label: "external_event_fk count (Previous {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.external_event_fk ;;
  description: "Primary key of the external events table"
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: sum_of_engagement_index_previous_advanced {
  label: "engagement_index sum ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.engagement_index ;;
  description: "The engagment's position in the student's chronology of engagements. First engagement: 1, second: 2. Derived from 'engagement_ts'."
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: sum_of_engagement_index_previous_advanced {
  label: "engagement_index sum (Previous {% parameter wh_core__engagements_xa.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.engagement_index ;;
  description: "The engagment's position in the student's chronology of engagements. First engagement: 1, second: 2. Derived from 'engagement_ts'."
  drill_fields: [wh_core__engagements_xa_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
}

    
    include: "/lookml/base/_base.layer.lkml"

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
    }
    
view: +wh_platform__events_fact {
  dimension_group: event_ts_date {
    label: "Date Surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.event_ts as date) ;;
  }

  dimension: event_ts_date_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${wh_platform__events_fact.event_ts_date_month_num} IN (1,4,7,10) THEN 1 when ${wh_platform__events_fact.event_ts_date_month_num} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_platform__events_fact.event_ts_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${wh_platform__events_fact.event_ts_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${wh_platform__events_fact.event_ts_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${wh_platform__events_fact.event_ts_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${wh_platform__events_fact.event_ts_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_platform__events_fact.event_ts_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_platform__events_fact.event_ts_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_platform__events_fact.event_ts_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_platform__events_fact.event_ts_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${wh_platform__events_fact.event_ts_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${wh_platform__events_fact.event_ts_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: wh_platform__events_fact.selected_dynamic_day_of_sort_advanced
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
${wh_platform__events_fact.event_ts_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${wh_platform__events_fact.event_ts_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${wh_platform__events_fact.event_ts_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${wh_platform__events_fact.event_ts_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${wh_platform__events_fact.event_ts_date_day_of_year} 
{% else %} 
${wh_platform__events_fact.event_ts_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_platform__events_fact.event_ts_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_platform__events_fact.event_ts_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_platform__events_fact.event_ts_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_platform__events_fact.event_ts_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${wh_platform__events_fact.event_ts_date_day_of_year} 
 {% else %} 
 ${wh_platform__events_fact.event_ts_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_platform__events_fact.event_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN ${wh_platform__events_fact.event_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_platform__events_fact.event_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN 'reference' 
 WHEN ${wh_platform__events_fact.event_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_platform__events_fact.event_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }
}
view: +wh_platform__events_fact {
measure: count_of_event_pk_reference_advanced {
  label: "event_pk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.event_pk ;;
  description: "Primary key of the events table"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_event_pk_previous_advanced {
  label: "event_pk count (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.event_pk ;;
  description: "Primary key of the events table"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_student_fk_reference_advanced {
  label: "student_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_student_fk_previous_advanced {
  label: "student_fk count (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_advisor_fk_reference_advanced {
  label: "advisor_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.advisor_fk ;;
  description: "A foreign key populated when segment associates an advisor with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_advisor_fk_previous_advanced {
  label: "advisor_fk count (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.advisor_fk ;;
  description: "A foreign key populated when segment associates an advisor with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_university_fk_reference_advanced {
  label: "university_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_university_fk_previous_advanced {
  label: "university_fk count (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.university_fk ;;
  description: "A foreign key populated when segment associates a university with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_course_fk_reference_advanced {
  label: "course_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.course_fk ;;
  description: "A foreign key populated when segment associates a course with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_course_fk_previous_advanced {
  label: "course_fk count (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.course_fk ;;
  description: "A foreign key populated when segment associates a course with an event"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_shortlist_fk_reference_advanced {
  label: "shortlist_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_shortlist_fk_previous_advanced {
  label: "shortlist_fk count (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_session_fk_reference_advanced {
  label: "session_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.session_fk ;;
  description: "A foreign key associated with events occuring within a user session"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_session_fk_previous_advanced {
  label: "session_fk count (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.session_fk ;;
  description: "A foreign key associated with events occuring within a user session"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: sum_of_event_number_previous_advanced {
  label: "event_number sum ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_number ;;
  description: "Event number index by anonymous user and timestamp"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: sum_of_event_number_previous_advanced {
  label: "event_number sum (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_number ;;
  description: "Event number index by anonymous user and timestamp"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: sum_of_event_sequence_previous_advanced {
  label: "event_sequence sum ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_sequence ;;
  description: "Event sequence by blended user id and timestamp"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: sum_of_event_sequence_previous_advanced {
  label: "event_sequence sum (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_sequence ;;
  description: "Event sequence by blended user id and timestamp"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: sum_of_event_in_session_sequence_previous_advanced {
  label: "event_in_session_sequence sum ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_in_session_sequence ;;
  description: "Event sequence by blended user id and timestamp within a session"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: sum_of_event_in_session_sequence_previous_advanced {
  label: "event_in_session_sequence sum (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_in_session_sequence ;;
  description: "Event sequence by blended user id and timestamp within a session"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: sum_of_event_time_on_page_secs_previous_advanced {
  label: "event_time_on_page_secs sum ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_time_on_page_secs ;;
  description: "Time on page in seconds"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: sum_of_event_time_on_page_secs_previous_advanced {
  label: "event_time_on_page_secs sum (Previous {% parameter wh_platform__events_fact.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.event_time_on_page_secs ;;
  description: "Time on page in seconds"
  drill_fields: [wh_platform__events_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
}

    
    include: "/lookml/base/_base.layer.lkml"

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
    }
    
view: +wh_platform__applications_fact {
  dimension_group: application_created_at_ts_date {
    label: "Date Surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.application_created_at_ts as date) ;;
  }

  dimension: application_created_at_ts_date_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${wh_platform__applications_fact.application_created_at_ts_date_month_num} IN (1,4,7,10) THEN 1 when ${wh_platform__applications_fact.application_created_at_ts_date_month_num} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${wh_platform__applications_fact.application_created_at_ts_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${wh_platform__applications_fact.application_created_at_ts_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${wh_platform__applications_fact.application_created_at_ts_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${wh_platform__applications_fact.application_created_at_ts_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${wh_platform__applications_fact.application_created_at_ts_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: wh_platform__applications_fact.selected_dynamic_day_of_sort_advanced
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
${wh_platform__applications_fact.application_created_at_ts_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${wh_platform__applications_fact.application_created_at_ts_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${wh_platform__applications_fact.application_created_at_ts_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${wh_platform__applications_fact.application_created_at_ts_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${wh_platform__applications_fact.application_created_at_ts_date_day_of_year} 
{% else %} 
${wh_platform__applications_fact.application_created_at_ts_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_day_of_year} 
 {% else %} 
 ${wh_platform__applications_fact.application_created_at_ts_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_platform__applications_fact.application_created_at_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN ${wh_platform__applications_fact.application_created_at_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_platform__applications_fact.application_created_at_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN 'reference' 
 WHEN ${wh_platform__applications_fact.application_created_at_ts_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_platform__applications_fact.application_created_at_ts_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }
}
view: +wh_platform__applications_fact {
measure: count_of_application_pk_reference_advanced {
  label: "application_pk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__applications_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.application_pk ;;
  description: "Primary key of the applications table. Generated from hashing the combination of matchable_type, matchable_id and analytics_id ofthe student's user record."
  drill_fields: [wh_platform__applications_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_application_pk_previous_advanced {
  label: "application_pk count (Previous {% parameter wh_platform__applications_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.application_pk ;;
  description: "Primary key of the applications table. Generated from hashing the combination of matchable_type, matchable_id and analytics_id ofthe student's user record."
  drill_fields: [wh_platform__applications_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_shortlist_fk_reference_advanced {
  label: "shortlist_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__applications_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
  drill_fields: [wh_platform__applications_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_shortlist_fk_previous_advanced {
  label: "shortlist_fk count (Previous {% parameter wh_platform__applications_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.shortlist_fk ;;
  description: "Primary key of the shortlists table"
  drill_fields: [wh_platform__applications_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_student_fk_reference_advanced {
  label: "student_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_platform__applications_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
  drill_fields: [wh_platform__applications_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_student_fk_previous_advanced {
  label: "student_fk count (Previous {% parameter wh_platform__applications_fact.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_fk ;;
  description: "A foreign key populated when segment associates a student with an event"
  drill_fields: [wh_platform__applications_fact_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
}

    
    include: "/lookml/base/_base.layer.lkml"

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
    }
    
view: +wh_core__students_dim {
  dimension_group: student_created_at_date {
    label: "Date Surrogate"
    hidden: yes
    type: time
    datatype: datetime
    timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
    sql: cast(${TABLE}.student_created_at as date) ;;
  }

  dimension: student_created_at_date_month_of_quarter_advanced {
    label: "Orders Month of Quarter"
    group_label: "Orders Dates"
    group_item_label: "Month of Quarter"
    type: number
    sql: case when ${wh_core__students_dim.student_created_at_date_month_num} IN (1,4,7,10) THEN 1 when ${wh_core__students_dim.student_created_at_date_month_num} IN (2,5,8,11) THEN 2 else 3 end ;;
  }

  dimension: is_to_date_advanced {
    hidden: yes
    type: yesno
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %}true{% else %}{% if apply_to_date_filter_advanced._parameter_value == 'true' %} 
 {% if select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_core__students_dim.student_created_at_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'day' %}
 ${wh_core__students_dim.student_created_at_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}
 {% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}
 ${wh_core__students_dim.student_created_at_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}
 {% elsif select_timeframe_advanced._parameter_value == 'year' %}
 ${wh_core__students_dim.student_created_at_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}
 {% else %}
 ${wh_core__students_dim.student_created_at_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}
 {% endif %}{% else %} true{% endif %}{% endif %} ;;
  }

  dimension: selected_dynamic_timeframe_advanced {
    hidden: yes
    type: string
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_core__students_dim.student_created_at_date_date} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_core__students_dim.student_created_at_date_week} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_core__students_dim.student_created_at_date_year} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_core__students_dim.student_created_at_date_quarter} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 CONCAT('YTD (',${wh_core__students_dim.student_created_at_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') 
 {% else %} 
 ${wh_core__students_dim.student_created_at_date_month} 
 {% endif %} ;;
  }

  dimension: selected_dynamic_day_of_advanced {
    type: string
    order_by_field: wh_core__students_dim.selected_dynamic_day_of_sort_advanced
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
${wh_core__students_dim.student_created_at_date_hour_of_day} 
{% elsif select_timeframe_advanced._parameter_value == 'week' %} 
${wh_core__students_dim.student_created_at_date_day_of_week} 
{% elsif select_timeframe_advanced._parameter_value == 'year' %} 
${wh_core__students_dim.student_created_at_date_month_name} 
{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
${wh_core__students_dim.student_created_at_date_month_of_quarter_advanced} 
{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
${wh_core__students_dim.student_created_at_date_day_of_year} 
{% else %} 
${wh_core__students_dim.student_created_at_date_day_of_month} 
{% endif %} ;;
  }

  dimension: selected_dynamic_day_of_sort_advanced {
    type: number
    hidden: yes
    label_from_parameter: select_timeframe_advanced
    sql: {% if select_timeframe_advanced._parameter_value == 'day' %} 
 ${wh_core__students_dim.student_created_at_date_hour_of_day} 
 {% elsif select_timeframe_advanced._parameter_value == 'week' %} 
 ${wh_core__students_dim.student_created_at_date_day_of_week_index} 
 {% elsif select_timeframe_advanced._parameter_value == 'year' %} 
 ${wh_core__students_dim.student_created_at_date_month_num} 
 {% elsif select_timeframe_advanced._parameter_value == 'quarter' %} 
 ${wh_core__students_dim.student_created_at_date_month_of_quarter_advanced} 
 {% elsif select_timeframe_advanced._parameter_value == 'ytd' %} 
 ${wh_core__students_dim.student_created_at_date_day_of_year} 
 {% else %} 
 ${wh_core__students_dim.student_created_at_date_day_of_month} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_advanced {
    type: string
    hidden: no
    label: "Current vs Previous Period"
    description: "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_core__students_dim.student_created_at_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN ${wh_core__students_dim.student_created_at_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN ${selected_dynamic_timeframe_advanced} 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }

  dimension: current_vs_previous_period_hidden_advanced {
    type: string
    hidden: yes
    label: "Current vs Previous Period (Hidden - for measure only)"
    description: "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)"
    sql: {% if select_timeframe_advanced._parameter_value == 'ytd' %} 
 CASE 
 WHEN ${wh_core__students_dim.student_created_at_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, DAY) 
 THEN 'reference' 
 WHEN ${wh_core__students_dim.student_created_at_date_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% else %} 
 {% if select_comparison._parameter_value == 'year' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% elsif select_comparison._parameter_value == 'period' %} 
 CASE 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(${selected_reference_date_default_today_advanced_raw}, {% parameter select_timeframe_advanced %}) 
 THEN 'reference' 
 WHEN DATE_TRUNC(${wh_core__students_dim.student_created_at_date_raw},  {% parameter select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter select_timeframe_advanced %}), {% parameter select_timeframe_advanced %}) 
 THEN 'comparison' 
 ELSE NULL 
 END 
 {% endif %} 
 {% endif %} ;;
  }
}
view: +wh_core__students_dim {
measure: count_of_student_pk_reference_advanced {
  label: "student_pk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_pk ;;
  description: "The primary key of the students table"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_student_pk_previous_advanced {
  label: "student_pk count (Previous {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.student_pk ;;
  description: "The primary key of the students table"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_school_fk_reference_advanced {
  label: "school_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.school_fk ;;
  description: "Primary key of the schools table"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_school_fk_previous_advanced {
  label: "school_fk count (Previous {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.school_fk ;;
  description: "Primary key of the schools table"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: count_of_country_fk_reference_advanced {
  label: "country_fk count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: count_of_country_fk_previous_advanced {
  label: "country_fk count (Previous {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: count_distinct
  sql: ${TABLE}.country_fk ;;
  description: "Primary key of the countries table"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
measure: sum_of_student_graduating_year_previous_advanced {
  label: "student_graduating_year sum ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.student_graduating_year ;;
  description: "The graduating year of the student"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "reference"]
}

measure: sum_of_student_graduating_year_previous_advanced {
  label: "student_graduating_year sum (Previous {% parameter wh_core__students_dim.select_timeframe_advanced %})"
  type: sum_distinct
  sql: ${TABLE}.student_graduating_year ;;
  description: "The graduating year of the student"
  drill_fields: [wh_core__students_dim_set*]
  filters: [current_vs_previous_period_hidden_advanced: "comparison"]
}
}

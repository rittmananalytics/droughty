import lkml as looker
import os
from contextlib import redirect_stdout

from droughty.droughty_lookml.lookml_base_dict import get_base_dict

from droughty.droughty_core.config import (
    ExploresVariables,
    IdentifyConfigVariables
)


def pop():


    for view_name, field_name in ExploresVariables.lookml_pop.items():

        view =  """
    
    include: "/lookml/base/_base.layer.lkml"

    view: +"""+view_name+""" {

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
    """

        yield (view)

        if(isinstance(field_name, list)):

            for field_names in field_name:

                pop_refinements = {

                "view": [
                    {
                    
                "dimension_group": [

                    {
                    "label": "Date Surrogate",
                    "hidden": "yes",
                    "type": "time",
                    "datatype": "datetime",
                    "timeframes": "[time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]",
                    "sql": "cast(${TABLE}."+field_names+" as date)",
                    "name": field_names+"_date"

                    },

                ],

                "dimensions": [

                    {
                    "label": "Orders Month of Quarter",
                    "group_label": "Orders Dates",
                    "group_item_label": "Month of Quarter",
                    "type": "number",
                    "sql":
                    "case when ${"+view_name+"."+field_names+"_date_month_num} IN (1,4,7,10) THEN 1 when ${"+view_name+"."+field_names+"_date_month_num} IN (2,5,8,11) THEN 2 else 3 end",
                    "name": field_names+"_date_month_of_quarter_advanced",

                    },

                    {
                    "label": "Period over Period",
                    "type": "string",
                    "sql": "CASE WHEN ${"+view_name+"."+field_names+" >=  ${first_date_in_period} THEN 'This {% parameter timeframe %} to Date' \n"
                            "WHEN  ${"+view_name+"."+field_names+" >= ${first_date_in_prior_period} \n"
                            "AND  ${"+view_name+"."+field_names+" <= ${last_date_in_prior_period} \n"
                            "THEN 'Prior {% parameter timeframe %} to Date' \n"
                            "ELSE NULL \n"
                            "END",
                    "name": field_names+"_date_month_of_quarter_advanced",

                    },
                    
                    {
                    "hidden": "yes",
                    "type": "yesno",
                    "sql":
                    "{% if select_timeframe_advanced._parameter_value == 'ytd' %}true"
                    "{% else %}"
                    "{% if apply_to_date_filter_advanced._parameter_value == 'true' %} \n " 
                        "{% if select_timeframe_advanced._parameter_value == 'week' %} \n "
                        "${"+view_name+"."+field_names+"_date_day_of_week_index} <= ${current_timestamp_advanced_day_of_week_index} \n "
                        "{% elsif select_timeframe_advanced._parameter_value == 'day' %}\n "
                        "${"+view_name+"."+field_names+"_date_hour_of_day} <= ${current_timestamp_advanced_hour_of_day}\n "
                        "{% elsif select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}\n "
                        "${"+view_name+"."+field_names+"_date_month_of_quarter_advanced} <= ${current_timestamp_month_of_quarter_advanced}\n "
                        "{% elsif select_timeframe_advanced._parameter_value == 'year' %}\n "
                        "${"+view_name+"."+field_names+"_date_day_of_year} <= ${current_timestamp_advanced_day_of_year}\n "
                        "{% else %}\n "
                        "${"+view_name+"."+field_names+"_date_day_of_month} <= ${current_timestamp_advanced_day_of_month}\n "
                        "{% endif %}"
                    "{% else %} true"
                    "{% endif %}"
                    "{% endif %}",
                    "name":  "is_to_date_advanced"
                    },

                    {
                    "hidden": "yes",
                    "type": "string",
                    "label_from_parameter": "select_timeframe_advanced",
                    "sql":
                    "{% if select_timeframe_advanced._parameter_value == 'day' %} \n "
                    "${"+view_name+"."+field_names+"_date_date} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'week' %} \n "
                    "${"+view_name+"."+field_names+"_date_week} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'year' %} \n "
                    "${"+view_name+"."+field_names+"_date_year} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} \n "
                    "${"+view_name+"."+field_names+"_date_quarter} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} \n "
                    "CONCAT('YTD (',${"+view_name+"."+field_names+"_date_year},'-',${selected_reference_date_default_today_advanced_month_num},'-',${selected_reference_date_default_today_advanced_day_of_month},')') \n "
                    "{% else %} \n "
                    "${"+view_name+"."+field_names+"_date_month} \n "
                    "{% endif %}",
                    "name":  "selected_dynamic_timeframe_advanced"
                    },

                    {
                    "type": "string",
                    "order_by_field": view_name+".selected_dynamic_day_of_sort_advanced",
                    "label": "{% \n" 
                    "if select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% \n"
                    "elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% \n"
                    "elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% \n"
                    "elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'year' %}Months{% \n"
                    "elsif select_timeframe_advanced._is_filtered and select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% \n"
                    "else %}Selected Dynamic Timeframe Granularity{% \n"
                    "endif %} \n",
                    "sql":
                    "{% if select_timeframe_advanced._parameter_value == 'day' %} \n"
                    "${"+view_name+"."+field_names+"_date_hour_of_day} \n"
                    "{% elsif select_timeframe_advanced._parameter_value == 'week' %} \n"
                    "${"+view_name+"."+field_names+"_date_day_of_week} \n"
                    "{% elsif select_timeframe_advanced._parameter_value == 'year' %} \n"
                    "${"+view_name+"."+field_names+"_date_month_name} \n"
                    "{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} \n"
                    "${"+view_name+"."+field_names+"_date_month_of_quarter_advanced} \n"
                    "{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} \n"
                    "${"+view_name+"."+field_names+"_date_day_of_year} \n"
                    "{% else %} \n"
                    "${"+view_name+"."+field_names+"_date_day_of_month} \n"
                    "{% endif %} \n",
                    "name":  "selected_dynamic_day_of_advanced"
                    },

                    {
                    "type": "number",
                    "hidden": "yes",
                    "label_from_parameter": "select_timeframe_advanced",
                    "sql":
                    "{% if select_timeframe_advanced._parameter_value == 'day' %} \n "
                        "${"+view_name+"."+field_names+"_date_hour_of_day} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'week' %} \n "
                        "${"+view_name+"."+field_names+"_date_day_of_week_index} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'year' %} \n "
                        "${"+view_name+"."+field_names+"_date_month_num} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'quarter' %} \n "
                        "${"+view_name+"."+field_names+"_date_month_of_quarter_advanced} \n "
                    "{% elsif select_timeframe_advanced._parameter_value == 'ytd' %} \n "
                        "${"+view_name+"."+field_names+"_date_day_of_year} \n "
                    "{% else %} \n "
                        "${"+view_name+"."+field_names+"_date_day_of_month} \n "
                    "{% endif %} \n ",
                    "name":  "selected_dynamic_day_of_sort_advanced"
                    },

                    {
                    "type": "string",
                    "hidden": "no",
                    "label": "Current vs Previous Period",
                    "description": "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year",
                    "sql":
                    "{% if select_timeframe_advanced._parameter_value == 'ytd' %} \n "
                        "case \n"
                        "when ${"+view_name+"."+field_names+" BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_date}\n"
                            "then  ${selected_dynamic_timeframe_advanced}\n"
                        "when  ${"+view_name+"."+field_names+" BETWEEN date_trunc(year, dateadd(year, -1,${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date})\n"
                            "then  ${selected_dynamic_timeframe_advanced}\n"
                        "else  null\n"
                        "end \n"
                    "{% else %} \n "
                        "{% if select_comparison._parameter_value == 'year' %} \n "
                        "case \n "
                            "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) \n "
                            "then ${selected_dynamic_timeframe_advanced} \n "
                            "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) \n "
                            "then ${selected_dynamic_timeframe_advanced} \n "
                        "end \n "
                        "{% elsif select_comparison._parameter_value == 'period' %} \n "
                        "case \n"
                            "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) \n"
                            "then ${selected_dynamic_timeframe_advanced} \n"
                            "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) \n"
                            "then ${selected_dynamic_timeframe_advanced} \n"
                        "end \n"
                        "{% endif %} \n "
                    "{% endif %} \n ",
                    "name":  "current_vs_previous_period_advanced"
                    },

                    {
                    "type": "string",
                    "hidden": "yes",
                    "label": "Current vs Previous Period (Hidden - for measure only)",
                    "description": "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)",
                    "sql":
                    "{% if select_timeframe_advanced._parameter_value == 'ytd' %} \n "
                        " case \n"
                        " when ${"+view_name+"."+field_names+" BETWEEN date_trunc(year, ${parameters.selected_reference_date_default_today_advanced_raw}) and ${parameters.selected_reference_date_default_today_advanced_raw} \n"
                            " then 'reference' \n"
                        " when ${"+view_name+"."+field_names+" BETWEEN date_trunc(year, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) and dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_date}) \n"
                            " then 'comparison' \n"
                        " else null \n"
                        " end \n"
                    "{% else %} \n "
                    "{% if select_comparison._parameter_value == 'year' %} \n "
                    "case \n"
                        "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) \n"
                        "then 'reference' \n"
                        "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd(year, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) \n"
                        "then 'comparison' \n"
                    "end \n"
                    "{% elsif select_comparison._parameter_value == 'period' %} \n "
                    "case \n"
                        "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, ${parameters.selected_reference_date_default_today_advanced_raw}) \n"
                        "then 'reference' \n"
                        "when date_trunc({% parameter parameters.select_timeframe_advanced %}, ${"+view_name+"."+field_names+"_raw) = date_trunc({% parameter parameters.select_timeframe_advanced %}, dateadd({% parameter parameters.select_timeframe_advanced %}, -1, ${parameters.selected_reference_date_default_today_advanced_raw})) \n"
                        "then 'comparison' \n"
                    "end \n"
                    "{% endif %} \n "
                    "{% endif %} \n ",
                    "name":  "current_vs_previous_period_hidden_advanced"
                    },

                ],

                "name": "+"+view_name,
                    }
                ],

            }



                yield(looker.dump(pop_refinements))

        
        for key,value in get_base_dict().items():

            if key in view_name:

                view = {

                    "view": "+"+key+" {"
                                        
                    }

                yield(looker.dump(view))
            
                for key1, value in value.items():
                    
                    if "_pk" in key1[0]:

                        count_distinct = {

                            "measures": [
                                
                            {
                                "label" : key1[0]+" count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter "+key+".select_timeframe_advanced %})",
                                "type": "count_distinct",
                                "sql": "${TABLE}."+key1[0],
                                "name": "count_of_"+key1[0]+"_reference_advanced",
                                "description": key1[2],
                                "drill_fields": [key+"_set*"],
                                "filters": "[current_vs_previous_period_hidden_advanced: \"reference\"]"

                            },

                            {
                                "label" :  key1[0]+" count (Previous {% parameter "+key+".select_timeframe_advanced %})",
                                "type": "count_distinct",
                                "sql": "${TABLE}."+key1[0],
                                "name": "count_of_"+key1[0]+"_previous_advanced",
                                "description": key1[2],
                                "drill_fields": [key+"_set*"],
                                "filters": "[current_vs_previous_period_hidden_advanced: \"comparison\"]"

                            }

                            ],
                        }

                        yield(looker.dump(count_distinct))

                    if "_fk" in key1[0]:

                        fk_count_distinct = {

                            "measures": [
                                
                            {
                                "label" : key1[0]+" count  ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter "+key+".select_timeframe_advanced %})",
                                "type": "count_distinct",
                                "sql": "${TABLE}."+key1[0],
                                "name": "count_of_"+key1[0]+"_reference_advanced",
                                "description": key1[2],
                                "drill_fields": [key+"_set*"],
                                "filters": "[current_vs_previous_period_hidden_advanced: \"reference\"]"

                            },

                            {
                                "label" :  key1[0]+" count (Previous {% parameter "+key+".select_timeframe_advanced %})",
                                "type": "count_distinct",
                                "sql": "${TABLE}."+key1[0],
                                "name": "count_of_"+key1[0]+"_previous_advanced",
                                "description": key1[2],
                                "drill_fields": [key+"_set*"],
                                "filters": "[current_vs_previous_period_hidden_advanced: \"comparison\"]"

                            }

                            ],
                        }

                        yield(looker.dump(fk_count_distinct))

                    if key1[1] == 'number':

                        sum_distinct = {

                            "measures": [
                            
                            {
                                "label" : key1[0]+" sum ({% if select_reference_date_advanced._is_filtered %}Reference {% else %}Current {% endif %} {% parameter "+key+".select_timeframe_advanced %})",
                                "type": "sum_distinct",
                                "sql": "${TABLE}."+key1[0],
                                "name": "sum_of_"+key1[0]+"_previous_advanced",
                                "description": key1[2],
                                "drill_fields": [key+"_set*"],
                                "filters": "[current_vs_previous_period_hidden_advanced: \"reference\"]"


                            },

                            {
                                "label" : key1[0]+" sum (Previous {% parameter "+key+".select_timeframe_advanced %})",
                                "type": "sum_distinct",
                                "sql": "${TABLE}."+key1[0],
                                "name": "sum_of_"+key1[0]+"_previous_advanced",
                                "description": key1[2],
                                "drill_fields": [key+"_set*"],
                                "filters": "[current_vs_previous_period_hidden_advanced: \"comparison\"]"


                            }

                            ],
                        }

                        yield(looker.dump(sum_distinct))

                for key,value in get_base_dict().items():

                    syntax = "}"


                yield(syntax)

def pop_output_snowflake():

    if ExploresVariables.lookml_path == None:
    
        git_path = IdentifyConfigVariables.git_path

        rel_path = "lookml/base"

        path = os.path.join(git_path, rel_path)

    elif ExploresVariables.lookml_path != None:

        path = os.path.join(IdentifyConfigVariables.git_path,ExploresVariables.lookml_path)


    if not os.path.exists(path):
        os.makedirs(path)
        
    if ExploresVariables.lookml_base_filename != None:

        filename = ExploresVariables.lookml_base_filename
        
    else:

        filename = '_base_parameters.layer'
   
    suffix = '.lkml'

    extension = filename+suffix

    with open(os.path.join(path,extension), 'w') as file:

        with redirect_stdout(file):

            for value in pop():

                print(value)
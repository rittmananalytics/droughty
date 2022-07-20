import lkml as looker
import os
from contextlib import redirect_stdout

from droughty.droughty_lookml.lookml_base_dict import (
    get_base_dict,
    get_field_dict
)
from droughty.droughty_core.config import (
    ExploresVariables,
    IdentifyConfigVariables
)


def pop():


    view =  """view: parameters {

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
        description: "this dimension will make sure that when \"select reference date\" is set in  the future then we use the current day for reference"
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

    }"""

    print (view)

    for view_name, field_name in ExploresVariables.lookml_pop.items():

        if(isinstance(field_name, list)):

            for field_names in field_name:

                pop_refinements = {

                "view": [
                    {
                    

                "dimensions": [
                    {
                    "label": "Orders Month of Quarter",
                    "group_label": "Orders Dates",
                    "group_item_label": "Month of Quarter",
                    "type": "number",
                    "sql":
                    "case when ${"+view_name+"."+field_names+"} IN (1,4,7,10) THEN 1 when ${"+view_name+"."+field_names+"} IN (2,5,8,11) THEN 2 else 3 end",
                    "name": field_names+"_created_month_of_quarter_advanced",

                    },
                    
                    {
                    "hidden": "yes",
                    "type": "yesno",
                    "sql":
                    "{% if parameters.select_timeframe_advanced._parameter_value == 'ytd' %}true"
                    "{% else %}"
                    "{% if parameters.apply_to_date_filter_advanced._parameter_value == 'true' %} \n " 
                        "{% if parameters.select_timeframe_advanced._parameter_value == 'week' %} \n "
                        "${"+view_name+"."+field_names+"_day_of_week_index} <= ${parameters.current_timestamp_advanced_day_of_week_index} \n "
                        "{% elsif parameters.select_timeframe_advanced._parameter_value == 'day' %}\n "
                        "${"+view_name+"."+field_names+"_hour_of_day} <= ${parameters.current_timestamp_advanced_hour_of_day}\n "
                        "{% elsif parameters.select_dynamic_timeframe_advanced._parameter_value == 'quarter' %}\n "
                        "${"+view_name+"."+field_names+"_month_of_quarter_advanced} <= ${parameters.current_timestamp_month_of_quarter_advanced}\n "
                        "{% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %}\n "
                        "${"+view_name+"."+field_names+"_day_of_year} <= ${parameters.current_timestamp_advanced_day_of_year}\n "
                        "{% else %}\n "
                        "${"+view_name+"."+field_names+"_day_of_month} <= ${parameters.current_timestamp_advanced_day_of_month}\n "
                        "{% endif %}"
                    "{% else %} true"
                    "{% endif %}"
                    "{% endif %}",
                    "name":  field_names+"_is_to_date_advanced"
                    },

                    {
                    "hidden": "yes",
                    "type": "string",
                    "label_from_parameter": "parameters.select_timeframe_advanced",
                    "sql":
                    "{% if parameters.select_timeframe_advanced._parameter_value == 'day' %} \n "
                    "${"+view_name+"."+field_names+"} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} \n "
                    "${"+view_name+"."+field_names+"} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} \n "
                    "${"+view_name+"."+field_names+"} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} \n "
                    "${"+view_name+"."+field_names+"} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} \n "
                    "CONCAT('YTD (',${"+view_name+"."+field_names+"},'-',${parameters.selected_reference_date_default_today_advanced_month_num},'-',${parameters.selected_reference_date_default_today_advanced_day_of_month},')') \n "
                    "{% else %} \n "
                    "${"+view_name+"."+field_names+"} \n "
                    "{% endif %}",
                    "name":  field_names+"_selected_dynamic_timeframe_advanced"
                    },

                    {
                    "type": "string",
                    "order_by_field": "+view_name"+".selected_dynamic_day_of_sort_advanced",
                    "label": "{% \n" 
                    "if parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'month' %}Day of Month{% \n"
                    "elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'week' %}Day of Week{% \n"
                    "elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'day' %}Hour of Day{% \n"
                    "elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'year' %}Months{% \n"
                    "elsif parameters.select_timeframe_advanced._is_filtered and parameters.select_timeframe_advanced._parameter_value == 'ytd' %}Day of Year{% \n"
                    "else %}Selected Dynamic Timeframe Granularity{% \n"
                    "endif %} \n",
                    "sql":
                    "{% if parameters.select_timeframe_advanced._parameter_value == 'day' %} \n"
                    "${"+view_name+".created_hour_of_day} \n"
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} \n"
                    "${"+view_name+".created_day_of_week} \n"
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} \n"
                    "${"+view_name+".created_month_name} \n"
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} \n"
                    "${"+view_name+".created_month_of_quarter_advanced} \n"
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} \n"
                    "${"+view_name+".created_day_of_year} \n"
                    "{% else %} \n"
                    "${"+view_name+".created_day_of_month} \n"
                    "{% endif %} \n",
                    "name":  field_names+"_selected_dynamic_day_of_advanced"
                    },

                    {
                    "type": "number",
                    "hidden": "yes",
                    "label_from_parameter": "parameters.select_timeframe_advanced",
                    "sql":
                    "{% if parameters.select_timeframe_advanced._parameter_value == 'day' %} \n "
                        "${"+view_name+"."+field_names+"_hour_of_day} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'week' %} \n "
                        "${"+view_name+"."+field_names+"_day_of_week_index} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'year' %} \n "
                        "${"+view_name+"."+field_names+"_month_num} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'quarter' %} \n "
                        "${"+view_name+"."+field_names+"_month_of_quarter_advanced} \n "
                    "{% elsif parameters.select_timeframe_advanced._parameter_value == 'ytd' %} \n "
                        "${"+view_name+"."+field_names+"_day_of_year} \n "
                    "{% else %} \n "
                        "${"+view_name+"."+field_names+"_day_of_month} \n "
                    "{% endif %} \n ",
                    "name":  field_names+"_selected_dynamic_day_of_sort_advanced"
                    },

                    {
                    "type": "string",
                    "hidden": "no",
                    "label": "Current vs Previous Period",
                    "description": "Use this dimension alongside \"Select Timeframe\" and \"Select Comparison Type\" Filters to compare a specific timeframe (month, quarter, year) and the corresponding one of the previous year",
                    "sql":
                    "{% if parameters.select_timeframe_advanced._parameter_value == ""ytd"" %} \n "
                        "CASE \n "
                        "WHEN ${"+view_name+"."+field_names+"_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) \n "
                            "THEN ${selected_dynamic_timeframe_advanced} \n "
                        "WHEN ${"+view_name+"."+field_names+"_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) \n "
                            "THEN ${selected_dynamic_timeframe_advanced} \n "
                        "ELSE NULL \n "
                        "END \n "
                    "{% else %} \n "
                        "{% if parameters.select_comparison._parameter_value == ""year"" %} \n "
                        "CASE \n "
                            "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN ${selected_dynamic_timeframe_advanced} \n "
                            "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN ${selected_dynamic_timeframe_advanced} \n "
                            "ELSE NULL \n "
                        "END \n "
                        "{% elsif parameters.select_comparison._parameter_value == ""period"" %} \n "
                        "CASE \n "
                            "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN ${selected_dynamic_timeframe_advanced} \n "
                            "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN ${selected_dynamic_timeframe_advanced} \n "
                            "ELSE NULL \n "
                        "END \n "
                        "{% endif %} \n "
                    "{% endif %} \n ",
                    "name":  field_names+"_current_vs_previous_period_advanced"
                    },

                    {
                    "type": "string",
                    "hidden": "yes",
                    "label": "Current vs Previous Period (Hidden - for measure only)",
                    "description": "Hide this measure so that it doesn't appear in the field picket and use it to filter measures (since the values are static)",
                    "sql":
                    "{% if parameters.select_timeframe_advanced._parameter_value == ""ytd"" %} \n "
                    "CASE \n "
                        "WHEN ${"+view_name+"."+field_names+"_date} BETWEEN DATE_TRUNC(DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, YEAR), MONTH) AND DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, DAY) \n "
                        "THEN 'reference' \n "
                        "WHEN ${"+view_name+"."+field_names+"_date} BETWEEN DATE_TRUNC(DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), YEAR), MONTH) AND DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), MONTH) \n "
                        "THEN 'comparison' \n "
                        "ELSE NULL \n "
                    "END \n "
                    "{% else %} \n "
                    "{% if parameters.select_comparison._parameter_value == ""year"" %} \n "
                        "CASE \n "
                        "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN 'reference' \n "
                        "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 YEAR), {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN 'comparison' \n "
                        "ELSE NULL \n "
                        "END \n "
                    "{% elsif parameters.select_comparison._parameter_value == ""period"" %} \n "
                        "CASE \n "
                        "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(${parameters.selected_reference_date_default_today_advanced_raw}, {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN 'reference' \n "
                        "WHEN DATE_TRUNC(${"+view_name+"."+field_names+"_raw},  {% parameter parameters.select_timeframe_advanced %}) = DATE_TRUNC(DATE_SUB(${parameters.selected_reference_date_default_today_advanced_raw}, INTERVAL 1 {% parameter parameters.select_timeframe_advanced %}), {% parameter parameters.select_timeframe_advanced %}) \n "
                            "THEN 'comparison' \n "
                        "ELSE NULL \n "
                        "END \n "
                    "{% endif %} \n "
                    "{% endif %} \n ",
                    "name":  field_names+"_current_vs_previous_period_hidden_advanced"
                    },

                ],

                "name": "+"+view_name,
                    }
                ],

            }



                yield(looker.dump(pop_refinements))

def pop_output():

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
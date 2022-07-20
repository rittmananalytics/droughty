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
                    "name":"created_month_of_quarter_advanced",

                    }
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
{% macro group_age(age_column) %}
    case
        when {{ age_column }} < 30 then '<30'
        when {{ age_column }} between 30 and 50 then '30–50'
        else '50+'
    end
{% endmacro %}

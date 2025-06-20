{% macro clean_percentage(column_name) %}
    cast(regexp_replace({{ column_name }}, '%', '') as float)
{% endmacro %}

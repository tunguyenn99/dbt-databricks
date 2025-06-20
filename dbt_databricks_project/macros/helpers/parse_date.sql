{% macro parse_date(column_name, format='M/d/yyyy') %}
    to_date({{ column_name }}, '{{ format }}')
{% endmacro %}

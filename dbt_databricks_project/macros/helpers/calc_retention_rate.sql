{% macro calc_retention_rate(separations_column, headcount_column) %}
    1 - ({{ separations_column }} * 1.0 / nullif({{ headcount_column }}, 0))
{% endmacro %}

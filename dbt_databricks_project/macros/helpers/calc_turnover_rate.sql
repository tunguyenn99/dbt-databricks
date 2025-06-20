{% macro calc_turnover_rate(separations_column, headcount_column) %}
    ({{ separations_column }} * 1.0 / nullif({{ headcount_column }}, 0)) * 100
{% endmacro %}

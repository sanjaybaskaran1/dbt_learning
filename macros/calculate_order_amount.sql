{% macro calculate_order_amount(unit_price, quantity) %}
    ( {{unit_price}} * {{quantity}} )
{% endmacro %}
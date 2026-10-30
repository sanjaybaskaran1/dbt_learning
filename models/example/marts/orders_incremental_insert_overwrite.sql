
{{
    config(
        materialized='incremental',
        incremental_strategy='insert_overwrite'
    )
}}

WITH CTE AS (
    SELECT *
    FROM {{ source('raw', 'ORDERS') }}
)

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    PRODUCT_ID,
    ORDER_DATE,
    QUANTITY,
    UNIT_PRICE,
    ORDER_STATUS
FROM CTE

{% if is_incremental() %}

WHERE ORDER_ID >= (
    SELECT COALESCE(MAX(ORDER_ID), 0)
    FROM {{ this }}
)

{% endif %}

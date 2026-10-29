{{
    config(
        materialized='incremental',
        unique_key = 'ORDER_ID',
        incremental_strategy='delete+insert'
    )
}}

WITH CTE AS (
    SELECT *
    FROM {{ source('raw', 'ORDERS') }}
)

SELECT ORDER_ID, ORDER_STATUS,
    QUANTITY
FROM CTE

{% if is_incremental() %}
WHERE ORDER_ID >= (
    SELECT MAX(ORDER_ID)
    FROM {{ this }}
)
{% endif %}


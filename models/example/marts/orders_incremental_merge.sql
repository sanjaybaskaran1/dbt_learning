{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key = 'ORDER_ID'
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

{{
    config(
        materialized='table'
    )
}}

SELECT ORDER_ID, 
       ORDER_STATUS, 
       UNIT_PRICE, 
       QUANTITY,
       {{ calculate_order_amount(unit_price='UNIT_PRICE', quantity='QUANTITY') }} AS ORDER_AMOUNT--calling the macro
FROM 
    {{ source('raw', 'ORDERS') }}



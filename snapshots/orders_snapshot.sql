{% snapshot orders_snapshot %}

{{
    config(
        target_schema = 'DBT_SBASKARAN',
        unique_key = 'ORDER_ID',
        strategy = 'check',
        check_cols = ['ORDER_STATUS', 'QUANTITY']
    )
}}

SELECT ORDER_ID, ORDER_STATUS, QUANTITY
FROM {{ source('raw', 'ORDERS') }}

{% endsnapshot %}

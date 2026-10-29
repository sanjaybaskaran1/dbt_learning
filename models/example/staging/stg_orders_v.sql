{{
    config(materialized = 'view')
}}

with source as
(
    select * from {{ ref('stg_orders') }}
)

SELECT O_ID, QUANTITY
FROM source

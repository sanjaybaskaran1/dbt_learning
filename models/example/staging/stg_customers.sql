{{
    config(materialized = 'table')
}}

with source as
(
     select CUSTOMER_ID, CUSTOMER_NAME, COUNTRY
     from {{ source('raw', 'CUSTOMERS') }}
)

SELECT * FROM source
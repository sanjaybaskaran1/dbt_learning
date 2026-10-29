with source as
(
    select * from {{ source('raw', 'ORDERS') }}
),
renamed as
(
    select 
        ORDER_ID AS O_ID,
        QUANTITY,
        ORDER_STATUS
    from source 
    where ORDER_ID IS NOT NULL
    
)
select * from renamed



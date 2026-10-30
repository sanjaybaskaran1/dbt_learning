WITH CTE AS
(
    SELECT O.*, S.DESCRIPTION
    FROM {{ source('raw', 'ORDERS') }}  AS O 
    LEFT JOIN {{ ref('order_status_lookup') }} AS S 
    ON O.ORDER_STATUS = S.ORDER_STATUS
)
SELECT * FROM CTE
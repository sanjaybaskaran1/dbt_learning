SELECT O_ID,
       QUANTITY
FROM 
    {{ ref('stg_orders.sql') }}
WHERE 
     QUANTITY <= 0
     OR 
     QUANTITY IS NULL;
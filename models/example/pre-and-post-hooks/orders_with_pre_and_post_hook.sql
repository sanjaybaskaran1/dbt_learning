{{
    config(
        materialized='table',
        
        pre_hook = "INSERT INTO FINANCE_DB.DBT_SBASKARAN.DBT_RUN_AUDIT_LOG 
                    VALUES('orders_with_pre_and_post_hook','started',current_timestamp())",

        post_hook = "INSERT INTO FINANCE_DB.DBT_SBASKARAN.DBT_RUN_AUDIT_LOG 
                    VALUES('orders_with_pre_and_post_hook','completed',current_timestamp())"

    )
}}

SELECT * FROM {{ source('raw', 'ORDERS') }}
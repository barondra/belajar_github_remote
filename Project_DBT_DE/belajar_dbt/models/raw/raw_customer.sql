{{ config(
    materialized='table',
    schema='raw'
) }}

select
    CAST(customer_id AS INT) AS customer_id,
    CAST(customer_name AS VARCHAR(100)) as customer_name,
    CAST(email AS VARCHAR(100)) as email,
    CAST(phone_number AS VARCHAR(20)) as phone_number
from {{ source('global', 'customer') }}

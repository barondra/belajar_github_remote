{{ config(
    materialized='table',
    schema='intermediete'
) }}


SELECT
    customer_id,
    customer_name,
    email,
    phone_number
FROM {{ ref('raw_customer') }}

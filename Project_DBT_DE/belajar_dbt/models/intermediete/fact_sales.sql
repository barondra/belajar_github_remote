{{ config(
    materialized='table',
    schema='intermediete'
) }}


SELECT
    sale_id,
    customer_id,
    product_id,
    date_id,
    quantity,
    revenue
FROM {{ ref('raw_sales') }}
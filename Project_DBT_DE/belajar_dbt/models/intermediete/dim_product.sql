{{ config(
    materialized='table',
    schema='intermediete'
) }}


SELECT
    product_id,
    product_name,
    category,
    price
FROM {{ ref('raw_product') }}

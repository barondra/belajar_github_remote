{{ config(
    materialized='table',
    schema='raw'
) }}

select
    CAST(product_id AS INT) AS product_id,
    CAST(product_name AS VARCHAR(100)) as product_name,
    CAST(category AS VARCHAR(50)) AS category,
    CAST(price AS NUMERIC(10, 2)) AS price
from {{ source('global', 'product') }}

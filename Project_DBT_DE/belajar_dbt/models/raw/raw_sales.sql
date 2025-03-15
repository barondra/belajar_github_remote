{{ config(
    materialized='table',
    schema='raw'
) }}

select
    CAST(sale_id AS INT) AS sale_id,
    CAST(customer_id AS INT) AS customer_id,
    CAST(product_id AS INT) AS product_id,
    CAST(date_id AS INT) AS date_id,
    CAST(quantity AS INT) AS quantity,
    CAST(revenue AS NUMERIC(12, 2)) AS revenue
from {{ source('global', 'sales') }}

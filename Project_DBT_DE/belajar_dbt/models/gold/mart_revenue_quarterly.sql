{{ config(
    materialized='table',
    schema='mart'
) }}


SELECT
    quarter,
    year,
    SUM(quantity * revenue) AS total_revenue
FROM {{ ref('fact_sales') }} AS fs
LEFT JOIN {{ ref('dim_time') }} AS dt ON fs.date_id =  dt.date_id
GROUP BY quarter, year

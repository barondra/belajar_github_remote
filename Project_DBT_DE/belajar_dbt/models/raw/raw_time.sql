{{ config(
    materialized='table',
    schema='raw'
) }}

select
    CAST(date_id AS INT) AS date_id,
    CAST(day_of_week AS VARCHAR(10)) AS day_of_week,
    CAST(month AS VARCHAR(10)) AS month,
    CAST(quarter AS INT) AS quarter,
    CAST(year AS INT) AS year
from {{ source('global', 'time') }}

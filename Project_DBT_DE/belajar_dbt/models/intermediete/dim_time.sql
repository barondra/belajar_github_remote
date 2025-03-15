{{ config(
    materialized='table',
    schema='intermediete'
) }}


SELECT
    date_id,
    day_of_week,
    month,
    quarter,
    year
FROM {{ ref('raw_time') }}

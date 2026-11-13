{{
  config(
    materialized = 'table',
    )
}}

with source as (
        select * from {{ source('source', 'dim_date') }}
  ),
  renamed as (
      select
          {{ adapter.quote("date_sk") }},
        {{ adapter.quote("date") }},
        {{ adapter.quote("day") }},
        {{ adapter.quote("month") }},
        {{ adapter.quote("month_name") }},
        {{ adapter.quote("quarter") }},
        {{ adapter.quote("year") }},
        {{ adapter.quote("day_of_week") }},
        {{ adapter.quote("day_name") }},
        {{ adapter.quote("is_weekend") }},
        {{ adapter.quote("is_month_end") }},
        {{ adapter.quote("is_month_start") }},
        {{ adapter.quote("is_quarter_end") }},
        {{ adapter.quote("is_quarter_start") }}

      from source
  )
  select * from renamed
    
{{
  config(
    materialized = 'table',
    )
}}

with source as (
        select * from {{ source('source', 'dim_store') }}
  ),
  renamed as (
      select
          {{ adapter.quote("store_sk") }},
        {{ adapter.quote("store_code") }},
        {{ adapter.quote("store_name") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("state_province") }},
        {{ adapter.quote("region") }},
        {{ adapter.quote("country") }},
        {{ adapter.quote("open_date") }},
        {{ adapter.quote("sq_ft") }}

      from source
  )
  select * from renamed
    
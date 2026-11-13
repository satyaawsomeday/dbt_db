with source as (
        select * from {{ source('source', 'dim_customer') }}
  ),
  renamed as (
      select
          {{ adapter.quote("customer_sk") }},
        {{ adapter.quote("customer_code") }},
        {{ adapter.quote("first_name") }},
        {{ adapter.quote("last_name") }},
        {{ adapter.quote("gender") }},
        {{ adapter.quote("email") }},
        {{ adapter.quote("phone") }},
        {{ adapter.quote("loyalty_tier") }},
        {{ adapter.quote("signup_date") }}

      from source
  )
  select * from renamed
    
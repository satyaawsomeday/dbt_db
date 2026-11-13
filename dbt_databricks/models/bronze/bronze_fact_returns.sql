with source as (
        select * from {{ source('source', 'fact_returns') }}
  ),
  renamed as (
      select
          {{ adapter.quote("sales_id") }},
        {{ adapter.quote("date_sk") }},
        {{ adapter.quote("store_sk") }},
        {{ adapter.quote("product_sk") }},
        {{ adapter.quote("returned_qty") }},
        {{ adapter.quote("return_reason") }},
        {{ adapter.quote("refund_amount") }}

      from source
  )
  select * from renamed
    
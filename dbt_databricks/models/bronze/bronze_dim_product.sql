with source as (
        select * from {{ source('source', 'dim_product') }}
  ),
  renamed as (
      select
          {{ adapter.quote("product_sk") }},
        {{ adapter.quote("product_code") }},
        {{ adapter.quote("product_name") }},
        {{ adapter.quote("department") }},
        {{ adapter.quote("category") }},
        {{ adapter.quote("supplier_sk") }},
        {{ adapter.quote("list_price") }},
        {{ adapter.quote("uom") }}

      from source
  )
  select * from renamed
    
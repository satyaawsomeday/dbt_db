with dedup_query as
(
select 
*,
ROW_NUMBER() OVER (PARTITION BY id ORDER BY updatedDate DESC) as deduplication_id

 from {{ source('source', 'items') }}
)

select id, name, category, updatedDate from dedup_query
 where 
    deduplication_id = 1
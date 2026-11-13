WITH bronze_sales AS
(
    SELECT 
    sales_id,
    product_sk,
    customer_sk,
    {{multiply('unit_price','quantity')}} as calculated_gross_amount,
    gross_amount,
    payment_method
    FROM 
    {{ ref('bronze_fact_sales') }}
),

bronze_product AS
(
    SELECT 
    product_sk,
    category
    from {{ ref('bronze_dim_product') }}

),

bronze_customer AS
(
    SELECT 
    customer_sk,
    gender
    from {{ ref('bronze_dim_customer') }}

),
joined_query as 
(
select
    sales.sales_id,
    sales.gross_amount,
    sales.payment_method,
    sales.calculated_gross_amount,
    product.category,
    customer.gender

from 
    bronze_sales sales
JOIN
    bronze_product product ON sales.product_sk = product.product_sk
JOIN
    bronze_customer customer ON sales.customer_sk = customer.customer_sk)

select
    category,
    gender,
    sum(gross_amount) as total_sales
from
    joined_query
group by 
    category,
    gender
order by 
    total_sales desc




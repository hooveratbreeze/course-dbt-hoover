{{
    config(
        materialized='table'
    )
}}

select
    product_id,
    name,
    price,
    quantity
from {{ref('stg_products')}}
{{
    config(
        materialized='table'
    )
}}

select 
    promo_id,
    discount
from {{ ref('stg_promos') }}
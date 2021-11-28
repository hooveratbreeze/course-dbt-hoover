{{
    config(
        materialized = 'table',
        unique_key = 'created_at'
        )
}}

select
    created_at
    , count(*) as daily_orders
    , count(distinct user_id) as count_of_distinct_users
from {{ ref('int_user_orders') }}
group by
     created_at

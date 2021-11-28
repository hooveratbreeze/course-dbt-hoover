{{
    config(
        materialized = 'table',
        unique_key = 'created_date'
        )
}}

select
    created_date
    , sum(count_of_page_views) as daily_pageviews
    , count(distinct user_id) as count_of_distinct_users

from {{ ref('int_user_pageviews') }}
group by
    created_date
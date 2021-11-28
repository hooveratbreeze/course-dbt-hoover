{{
    config(
        materialized = 'table',
        unique_key = 'user_id'
        )
}}

select
    user_id,
    date(created_at) as created_date,
    count(case
                when event_type = 'page_view' then event_id 
            end) as count_of_page_views
from {{ ref('stg_events') }}
group by user_id,
        created_date
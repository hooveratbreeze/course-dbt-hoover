{{
  config(
    materialized='table'
  )
}}

  SELECT 
    session_id,
    SUM(CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END) as page_views,
    SUM(CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END) as cart_additions,
    SUM(CASE WHEN event_type = 'checkout' THEN 1 ELSE 0 END) as checkouts,
    SUM(CASE WHEN event_type = 'account_created' THEN 1 ELSE 0 END) as signups
    FROM {{ ref('stg_events') }}
    GROUP BY 1

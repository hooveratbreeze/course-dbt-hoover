{{
  config(
    materialized='table'
  )
}}

SELECT
  order_id,
  created_at,
  order_cost,
  user_id
FROM {{ ref('stg_orders') }}
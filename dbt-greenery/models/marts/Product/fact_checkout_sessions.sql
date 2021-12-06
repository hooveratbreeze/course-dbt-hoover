{{
  config(
    materialized='table'
  )
}}

SELECT 
  session_id,
  checkouts
FROM {{ ref('int_sessions') }}
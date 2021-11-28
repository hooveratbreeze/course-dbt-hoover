   select *
   from {{ref ('facts_daily_user_orders') }}
   where (daily_orders) < 0
select
        email,
        date_trunc('month', created_at) as month,
        count(*) as total_month_orders
    from {{ ref('int_orders_users') }}
    group by
        email,
        date_trunc('month', created_at)
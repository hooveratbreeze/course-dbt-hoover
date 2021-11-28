   select
        o.order_id,
        o.created_at,
        u.user_id,
        u.email
    from {{ ref('stg_orders') }} as o
        left join {{ ref('stg_users') }} as u
        on o.user_id = u.user_id
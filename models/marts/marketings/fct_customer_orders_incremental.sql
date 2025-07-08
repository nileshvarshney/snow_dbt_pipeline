{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

with customer_orders as (
    select 
        c.id customer_id,
        name,
        address,
        phone_number,
        nation,
        region,
        o.id as order_id,
        order_status,
        total_price,
        order_date,
        order_priority,
        ship_priority
    from 
        {{ ref('stg_customers') }} c
    left join 
        {{ ref('stg_orders') }} o on c.id = o.customer_id
)
select * from customer_orders
{% if is_incremental() %}
where order_date > (select max(order_date)  from {{this}})
{% endif %}
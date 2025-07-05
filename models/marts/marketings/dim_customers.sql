-- models/marts/dim_customers.sql
{{
    config(
        materialized='view'
    )
}}
with customers as (
    select 
        id,
        name,
        address,
        phone_number,
        nation,
        region
    from 
        {{ ref('stg_customers') }}

),
orders as (
    select 
        customer_id,
        order_status,
        total_price,
        order_date,
        order_priority,
        ship_priority
    from 
        {{ ref('stg_orders') }}
), 
customer_orders as (
    select 
        customer_id,
        min(o.order_date) as first_order_date,
        max(o.order_date) as last_order_date,
        count(o.customer_id) as total_orders,
        sum(o.total_price) as total_spent,
    FROM
        orders o
    group by 
        customer_id
),
final as(
    select 
        c.id,
        c.name,
        c.address,
        c.phone_number,
        c.nation,
        c.region,
        co.first_order_date,
        co.last_order_date,
        co.total_orders,
        co.total_spent
    from 
        customers c
    left join 
        customer_orders co on c.id = co.customer_id
)
select * from final
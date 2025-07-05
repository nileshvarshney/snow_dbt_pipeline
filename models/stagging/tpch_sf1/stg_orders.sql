-- models/stagging/stg_orders.sql

SELECT 
    o_orderkey AS id,
    o_custkey AS customer_id,
    o_orderstatus AS order_status,
    o_totalprice AS total_price,
    o_orderdate AS order_date,
    o_orderpriority AS order_priority,
    o_shippriority AS ship_priority
FROM 
    SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS O

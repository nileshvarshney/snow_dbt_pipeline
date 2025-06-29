-- models/stagging/stg_customers.sql

select 
    c_custkey as id,   
    c_name as name,
    c_address as address,
    c_phone as phone_number,
    n.n_name as nation,
    r.r_name as region
from 
    SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER C
    LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.NATION N
    ON C.C_NATIONKEY = N.N_NATIONKEY
    LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.REGION R
    ON N.N_REGIONKEY = R.R_REGIONKEY
-- models/stagging/stg_customers.sql

select 
    c_custkey as id,   
    c_name as name,
    c_address as address,
    c_phone as phone_number,
    n.n_name as nation,
    r.r_name as region
from 
    {{ source('tpch_sf1_data', 'customer') }} C
    LEFT JOIN {{ source('tpch_sf1_data', 'nation') }} N 
    ON C.C_NATIONKEY = N.N_NATIONKEY
    LEFT JOIN {{ source('tpch_sf1_data', 'region') }} R
    ON N.N_REGIONKEY = R.R_REGIONKEY
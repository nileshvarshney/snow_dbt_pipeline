select 
    total_price
from 
    {{ ref('stg_orders') }}
where 
    total_price <= 0
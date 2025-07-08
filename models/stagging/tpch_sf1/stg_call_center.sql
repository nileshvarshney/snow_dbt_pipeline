-- model/stagging/stg_call_center.sql

SELECT
    cc_call_center_sk AS call_center_sk,
    cc_call_center_id AS call_center_id,
    cc_rec_start_date AS rec_start_date,
    cc_rec_end_date AS rec_end_date,
    cc_closed_date_sk AS closed_date_sk,
    cc_open_date_sk AS open_date_sk,
    cc_name AS call_center_name,
    cc_class AS call_center_class,      
    cc_employees AS employees,
    cc_sq_ft AS square_feet,
    cc_hours AS hours,
    cc_manager AS manager,
    cc_tax_percentage AS tax_percentage
FROM 
    {{ source('call_center_data', 'CALL_CENTER') }}
WHERE cc_rec_end_date IS NULL



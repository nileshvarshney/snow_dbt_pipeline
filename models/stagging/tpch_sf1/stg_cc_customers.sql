-- model/stagging/stg_cc_customers.sql

SELECT 
    c_customer_sk AS customer_sk,
    c_customer_id AS customer_id,
    CONCAT_WS(' ',
        c_salutation,
        c_first_name ,
        c_last_name
    ) AS customer_name,
    DATE_FROM_PARTS(c_birth_year, c_birth_month, c_birth_day) AS birth_date,
    c_email_address AS email_address,
    c_birth_country AS birth_country,
    concat_ws(' ', ca_street_number,ca_street_name, ca_street_type, ca_suite_number) AS street_address_line_1,
    concat_ws(', ', ca_city, ca_county, ca_state, ca.ca_zip) AS street_address_line_2,
    ca.ca_country address_country,
    ca_location_type AS address_location_type
FROM {{ source('call_center_data', 'CUSTOMER') }} c
LEFT JOIN {{ source('call_center_data', 'CUSTOMER_ADDRESS') }} ca
ON c.c_current_addr_sk = ca.ca_address_sk

/* search_cc_by_city_and_partial_name
   Searches the credit card transaction table for a city and name fragment and
   selects unique name / address / email combos (i.e., not each transaction for users).
*/
USE ashmad;
SELECT DISTINCT
    name,
    country,
    state,
    city,
    UPPER(zip) AS postcd,
    addr1,
    LOWER(email) AS cc_email,
    pnum
FROM
    all_cc_trans
    
WHERE
    city = 'oakville'  
      AND country = 'ca'
      AND name LIKE '%garfield%'
ORDER BY name;

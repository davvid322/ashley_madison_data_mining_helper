/* search_cc_by_city_and_partial_addr
   Searches the credit card transaction table for a city and street address fragment and
   selects unique name / address / email combos (i.e., not each transaction for users).
*/
USE ashmad;
SELECT DISTINCT
    name,
    state,
    city,
    UPPER(zip) AS postcd,
    addr1,
    LOWER(email) AS cc_email,
    pnum
FROM
    all_cc_trans
WHERE
    state = 'on'
        AND email LIKE '%ibm.com%'
ORDER BY postcd;

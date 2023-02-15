/* search_cc_by_partial_postcd
   Searches the credit card transaction table for a city and postal code fragment and
   selects unique name / address / email combos (i.e., not each transaction for users).
*/
USE ashmad;
SELECT DISTINCT
    UPPER(zip) AS postcd,
    name,
    country,
    state,
    city,
    addr1,
    LOWER(email) AS cc_email,
    pnum
FROM
    all_cc_trans
WHERE
    zip LIKE 'r7k%'
ORDER BY postcd, name;

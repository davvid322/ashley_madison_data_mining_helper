/* search_cc_by_country_and_city
   Searches the credit card transaction table for a country and city and
   selects unique name / address / email combos (i.e., not each transaction for users).
   With a small tweak you can search by user name fragment as well.
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
    city = 'alphaville'
      AND country = 'ca'
--    AND name LIKE '%garfield%'
ORDER BY name;

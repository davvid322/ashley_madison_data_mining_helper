/* search_cc_multi_criteria_member_detail
   Searches the credit card transaction table for any of several optional criteria, and 
   selects unique name / address / email combos (i.e., not each transaction for users).
   It also displays expanded code values from the main member table.
*/
USE ashmad;
SELECT DISTINCT
    t1.name, t1.country, t1.state, t1.city, UPPER(t1.zip) AS postcd, t1.addr1, 
    LOWER(t1.email) AS cc_email, t2.id,
    t2.profile_caption, 
    t2.pref_opento_abstract, opento_text(t2.pref_opento) as open_to,
    t2.pref_turnsmeon_abstract, turnsmeon_text(t2.pref_turnsmeon) as turns_me_on, 
    t2.pref_lookingfor_abstract, lookingfor_text(t2.pref_lookingfor) as looking_for,
    t2.gender, t2.dob as birthdate, t2.createdon, t2.updatedon, t2.phone
FROM
    all_cc_trans t1
		inner join
	am_am_member t2 on t1.pnum = t2.id
WHERE
    t1.country = 'ca'  -- Canada
        AND t1.state = 'on'
--        AND t1.city = 'alphaville'
--        AND t1.email LIKE '%ibm.com%'
        AND t1.name LIKE '%judas%'
--        AND t1.addr1 LIKE '%soggy%'
--        AND t1.zip LIKE 'r7k%'
-- ORDER BY t1.name;
ORDER BY postcd, t1.addr1;

/* search_members_by_partial_email
   Searches the main and email tables for users with a specified partial email string.
   You can also narrow this down by country, city and/or state; or sort order.
*/
USE ashmad;
SELECT 
    t2.city, t1.email, t2.pref_opento_abstract, opento_text(t2.pref_opento), 
    t2.pref_turnsmeon_abstract, turnsmeon_text(t2.pref_turnsmeon), 
    t2.pref_lookingfor_abstract, lookingfor_text(t2.pref_lookingfor),
    t2.nickname, t2.profile_caption, t2.country, t2.state, t2.gender, t2.dob, t2.id
FROM
    aminno_member_email t1
        INNER JOIN
    am_am_member t2 ON t1.pnum = t2.id
WHERE 
    t1.email LIKE '%@ibm.%'
--    t1.email LIKE '%garfield%'
      AND t2.city = 'oakville'
        AND t2.country = 2  -- Canada
-- ORDER BY t1.email;
ORDER BY t2.city, t1.email;

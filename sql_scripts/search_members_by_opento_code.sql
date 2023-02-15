/* search_members_by_opento_code
   Searches the maste and email tables for users who have a certain 'opento' code.
*/
USE ashmad;
SELECT 
    t1.email, t2.pref_opento_abstract, t2.pref_lookingfor_abstract, 
    t2.pref_turnsmeon_abstract, t2.pref_opento, t2.nickname, t2.profile_caption, 
    t2.city, t2.country, t2.state, t2.gender, t2.dob, t2.id
FROM
    aminno_member_email t1
        INNER JOIN
    am_am_member t2 ON t1.pnum = t2.id
WHERE 
    t2.pref_opento LIKE '%|19|%'
      AND t2.city = 'alphaville'
ORDER BY t1.email;

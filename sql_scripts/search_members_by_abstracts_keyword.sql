/* search_members_by_abstracts_keyword
   Searches the master and email tables for partial keyword matches in 3 different 'abstract' fields.
   You can tweak the script to narrow down searching by city, state, or country.
*/
USE ashmad;
SELECT 
    t1.email, t2.pref_opento_abstract, t2.pref_lookingfor_abstract, 
    t2.pref_turnsmeon_abstract, t2.nickname, t2.profile_caption, t2.city, 
    t2.country, t2.state, t2.gender, t2.dob, t2.pref_opento, t2.id
FROM
    aminno_member_email t1
        INNER JOIN
    am_am_member t2 ON t1.pnum = t2.id
WHERE
    t2.country = '2'  -- Canada
--  AND state = '65'  -- Ontario
    AND city = 'alphaville' 
    AND (t2.pref_opento_abstract LIKE '%kink%'
      OR t2.pref_turnsmeon_abstract LIKE '%kink%'
      OR t2.pref_lookingfor_abstract LIKE '%kink%')
ORDER BY t1.email;

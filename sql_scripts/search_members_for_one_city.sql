/* search_members_for_one_city
   Searches the master and email tables for users within a specified city.
*/
# Query to find all users in the 2015 Ashley Madison data hack dump 
# from a specific city / town.
#
USE ashmad;
SELECT 
    t1.email, t2.city, t2.country, t2.profile_caption,
    t2.pref_opento_abstract, t2.pref_lookingfor_abstract, 
    t2.pref_turnsmeon_abstract, t2.nickname, t2.profile_caption, 
    t2.gender, t2.dob, t2.pref_opento, t2.id
FROM
    aminno_member_email t1
        INNER JOIN
    am_am_member t2 ON t1.pnum = t2.id
WHERE 
    t2.city = 'oakville'
ORDER BY t1.email;

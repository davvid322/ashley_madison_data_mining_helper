/* search_member_detail_by_userids
   Searches the member master and email tables for one or more specific user id's,
   and extracts all columns, even junky ones.  Many of the other search scripts show
   an ID or pnum field, which is the user's numeric ID number for this script.
*/
USE ashmad;
SELECT 
    t1.pnum, t1.email, 
    opento_text(t2.pref_opento), turnsmeon_text(t2.pref_turnsmeon), lookingfor_text(t2.pref_lookingfor),
    t2.*
FROM
    aminno_member_email t1
        INNER JOIN
    am_am_member t2 ON t1.pnum = t2.id
WHERE
    t1.pnum in(60999777, 98765432);

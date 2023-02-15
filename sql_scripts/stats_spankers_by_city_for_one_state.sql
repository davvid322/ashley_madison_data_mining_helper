/* stats_spankers_by_city_for_one_state
This counts spank-preferring users by city for a specified country and state/province.
Refer to the code tables PDF for values to use for 'opento' searching.
*/
USE ashmad;
SELECT country, state, city, COUNT(id) AS count_all, 
       SUM(IF(pref_opento LIKE '%|19|%', 1, 0)) AS count_spank
FROM am_am_member m
WHERE country = 2 AND state = 65  -- Canada, Ontario
GROUP BY country, state, city
HAVING count_all > 5
ORDER BY country, state, city;

/* stats_spankers_by_state_and_city_for_one_country
This counts spank-preferring users by state / city for a specified country.
Refer to the code tables PDF for values to use for 'opento' searching.
*/
USE ashmad;
SELECT country, state, city, count_all, count_spankers,
       ((count_spankers / count_all) * 100) AS pct_spankers
FROM
(
  SELECT country, state, city, COUNT(id) AS count_all, 
	     SUM(IF(pref_opento LIKE '%|19|%', 1, 0)) AS count_spankers
  FROM am_am_member m
  WHERE country = 2   -- Just Canada for this run
      AND state > 0   -- remove garbage values
  GROUP BY country, state, city
  HAVING count_all > 5 -- just major towns / cities
  ORDER BY country, state, city
) t
ORDER BY state, city, pct_spankers DESC;

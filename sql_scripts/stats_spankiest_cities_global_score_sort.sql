/* stats_spankiest_cities_global_score_sort
This counts spank-preferring users by city, globally, from most to least spanky.
You can narrow it down by country and/or state/province by tweaking the code.
Refer to the code tables PDF for values to use for 'opento' searching.
*/
USE ashmad;
SELECT city, country, state, count_all, count_spankers,
       ((count_spankers / count_all) * 100) AS pct_spankers
FROM
(
  SELECT country, state, city, COUNT(id) AS count_all, 
	     SUM(IF(pref_opento LIKE '%|19|%', 1, 0)) AS count_spankers
  FROM am_am_member m
  -- WHERE country = 2  -- Global versus just Canada for this run
  GROUP BY country, state, city
  HAVING count_all > 100 -- just major towns / cities
  ORDER BY country, state, city
) t
ORDER BY pct_spankers DESC, city;

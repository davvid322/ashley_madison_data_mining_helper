/* stats_spankiest_cities_global_geography_sort
This counts spank-preferring users by country, state, and city, globally.
You can narrow it down by country and/or state/province by tweaking the code.
Refer to the code tables PDF for values to use for 'opento' searching.
*/
USE ashmad;
SELECT country, state, city, count_all as 'User Count', 
	   count_spankers as 'Yes to Spanking', 
       ((count_spankers / count_all) * 100) AS Pct_Spankers,
       count_threesome as 'Yes to Threesome',
       ((count_threesome / count_all) * 100) AS Pct_Threesome
FROM
(
  SELECT country, state, city, COUNT(id) AS count_all, 
	     SUM(IF(pref_opento LIKE '%|19|%', 1, 0)) AS count_spankers,
	     SUM(IF(pref_opento LIKE '%|1|%', 1, 0)) AS count_threesome
  FROM am_am_member m
--  WHERE country = 2 AND state = 64  -- No filter so global scope
  GROUP BY country, state, city
  HAVING count_all > 100 -- ignore small towns
  ORDER BY country, state, city
) t
WHERE LENGTH(city) > 2
ORDER BY country, state, city, Pct_Spankers DESC;

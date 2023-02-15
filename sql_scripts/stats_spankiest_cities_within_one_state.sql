/* stats_spankiest_cities_within_one_state
This counts spank-preferring users by city for a specified state and/or country.
Refer to the code tables PDF for values to use for 'opento' searching.
Query to calculate which cities have the highest percentage of members open to spanking
    based on their stated preference codes.  You naughty, naughty people!
*/
USE ashmad;
SELECT city, count_all as 'User Count', 
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
  WHERE country = 2 AND state = 65  -- Just Canada, Ontario for this run
  GROUP BY country, state, city
  HAVING count_all > 5 -- low count are often typos
  ORDER BY country, state, city
) t
WHERE LENGTH(city) > 2
ORDER BY Pct_Spankers DESC, city;

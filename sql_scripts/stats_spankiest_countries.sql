/* stats_spankiest_countries
This counts spank-preferring users by country, and lists from most to least spanky.
*/
USE ashmad;
SELECT country, 
    CASE country 
      WHEN 1 THEN 'United States'
      WHEN 2 THEN 'Canada'
      WHEN 3 THEN 'United Kingdom'
      WHEN 4 THEN 'Ireland'
      WHEN 5 THEN 'Australia'
      WHEN 6 THEN 'New Zealand'
      WHEN 7 THEN 'Germany'
      WHEN 8 THEN 'Austria'
      WHEN 9 THEN 'Switzerland'
      WHEN 10 THEN 'Sweden'
      WHEN 11 THEN 'Spain'
      WHEN 12 THEN 'Denmark'
      WHEN 13 THEN 'Finland'
      WHEN 14 THEN 'Norway'
      WHEN 15 THEN 'Brazil'
      WHEN 16 THEN 'Italy'
      WHEN 17 THEN 'Mexico'
      WHEN 18 THEN 'Netherlands'
      WHEN 19 THEN 'Argentina'
      WHEN 20 THEN 'Columbia'
      WHEN 21 THEN 'Chile'
      WHEN 22 THEN 'Venezuela'
      WHEN 23 THEN 'South Africa'
      WHEN 24 THEN 'France'
      WHEN 25 THEN 'Belgium'
      WHEN 26 THEN 'Eastern Europe'
      WHEN 28 THEN 'India'
      WHEN 29 THEN 'Portugal'
      WHEN 33 THEN 'Peru'
      WHEN 34 THEN 'Luxembourg'
      WHEN 35 THEN 'Israel'
      WHEN 38 THEN 'Slovakia'
      WHEN 39 THEN 'Poland'
      WHEN 40 THEN 'Hungary'
      WHEN 41 THEN 'Czech Republic'
      WHEN 42 THEN 'Turkey'
      WHEN 44 THEN 'Pakistan'
      WHEN 45 THEN 'Philippines'
      WHEN 27 THEN 'Japan/Korea/China'
      WHEN 30 THEN 'Japan/Korea/China'
      WHEN 31 THEN 'Japan/Korea/China'
      WHEN 32 THEN 'Japan/Korea/China'
      WHEN 36 THEN 'Japan/Korea/China'
      WHEN 37 THEN 'Japan/Korea/China'
      WHEN 43 THEN 'Japan/Korea/China'
      ELSE 'Unknown'
	END AS Country_Name,
    count_all AS 'User Count', 
	count_spankers AS 'Yes to Spanking', 
    ((count_spankers / count_all) * 100) AS Pct_Spankers,
	count_threesome AS 'Yes to Threesome',
    ((count_threesome / count_all) * 100) AS Pct_Threesome
FROM
(
  SELECT country, COUNT(id) AS count_all, 
	     SUM(IF(pref_opento LIKE '%|19|%', 1, 0)) AS count_spankers,
	     SUM(IF(pref_opento LIKE '%|1|%', 1, 0)) AS count_threesome
  FROM am_am_member m
  WHERE country between 1 and 45  -- All valid countries
  GROUP BY country
  HAVING count_all > 100 -- ignore invalid code counts, if any
  ORDER BY country
) t
ORDER BY Pct_Spankers DESC, country;

/* stats_spankiestg_provinces_within_Canada
This counts spank-preferring users by province within Canada, from most to least spanky.
You can narrow it down by or change country and/or state/province by tweaking the code.
Refer to the code tables PDF for values to use for 'opento' searching.
*/
USE ashmad;
SELECT state, 
    CASE state 
      WHEN 57 THEN 'Alberta'
      WHEN 58 THEN 'B.C.'
      WHEN 59 THEN 'Manitoba'
      WHEN 60 THEN 'New Brunswick'
      WHEN 61 THEN 'Newfoundland'
      WHEN 62 THEN 'Nova Scotia'
      WHEN 63 THEN 'Nunavit'
      WHEN 64 THEN 'N.W.T.'
      WHEN 65 THEN 'Ontario'
      WHEN 66 THEN 'PEI'
      WHEN 67 THEN 'Quebec'
      WHEN 68 THEN 'Saskatchewan'
      WHEN 69 THEN 'Yukon'
      ELSE 'Unknown'
	END AS Province,
    count_all AS 'User Count', 
	count_spankers AS 'Yes to Spanking', 
    ((count_spankers / count_all) * 100) AS Pct_Spankers,
    count_threesome AS 'Yes to Threesome',
    ((count_threesome / count_all) * 100) AS Pct_Threesome
FROM
(
  SELECT state, COUNT(id) AS count_all, 
	     SUM(IF(pref_opento LIKE '%|19|%', 1, 0)) AS count_spankers,
	     SUM(IF(pref_opento LIKE '%|1|%', 1, 0)) AS count_threesome
  FROM am_am_member m
  WHERE country = 2   -- Canada only scope
  GROUP BY country, state
  HAVING count_all > 100 -- ignore invalid code counts, if any
  ORDER BY country, state
) t
ORDER BY Pct_Spankers DESC, Province;

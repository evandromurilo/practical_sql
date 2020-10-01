/*
 * Was the 2010 median county population higher in California or New York?
 */

SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY p0010001) as "CA Median"
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA';

SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY p0010001) as "NY Median"
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY';

/*
 CA Median
-----------
  179140.5
(1 row)

 NY Median
-----------
     91301
(1 row)
*/

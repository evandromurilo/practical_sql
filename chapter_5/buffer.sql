SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY p0010001) as "CA Median"
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA';

SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY p0010001) as "NY Median"
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY';

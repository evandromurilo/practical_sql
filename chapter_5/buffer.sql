SELECT percentile_cont(array[.25, .5, .75]) WITHIN GROUP (ORDER BY p0010001) AS "Quartiles"
FROM us_counties_2010;

/*
 * Using the 2010 Census county data, find out which New York state county has
 * the highest percentage of the population that identified as "American
 * Indian/Alaska Native Alone." What can you learn about that county from online
 * research that explains the relatively large proportion of American Indian
 * population compared with other New York counties?
 */

SELECT geo_name as "County",
       p0010001 as "Total",
       p0010005 as "American Indian/Alaska Native Alone",
       round(CAST(p0010005 as NUMERIC(8, 1)) / p0010001  * 100, 1) as "%"
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
ORDER BY "%" DESC
LIMIT 5;

/*
       County       |  Total  | American Indian/Alaska Native Alone |  %
--------------------+---------+-------------------------------------+-----
 Franklin County    |   51599 |                                3797 | 7.4
 Cattaraugus County |   80317 |                                2443 | 3.0
 Bronx County       | 1385108 |                               18260 | 1.3
 Genesee County     |   60079 |                                 679 | 1.1
 Niagara County     |  216469 |                                2285 | 1.1
(5 rows)

The Mohawk Preservation is within the area of Franklin County.
*/

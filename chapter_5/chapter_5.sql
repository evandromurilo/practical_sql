SELECT 2 + 2;
SELECT 9 - 1;
SELECT 3 * 4;
SELECT 11 / 6;
SELECT 11 % 6;
SELECT 11.0 / 6;
SELECT CAST (11 AS numeric(3,1)) / 6;
SELECT 3 ^ 4;
SELECT |/ 10;
SELECT sqrt(10);
SELECT ||/ 10;
SELECT 4 !;
SELECT 7 + 8 * 9;
SELECT (7 + 8) * 9;
SELECT 3 ^ 3 - 1;
SELECT 3 ^ (3 - 1);

SELECT geo_name,
       state_us_abbreviation AS "st",
       p0010001 AS "Total Population",
       p0010003 AS "White Alone",
       p0010004 AS "Black of African American Alone",
       p0010005 AS "Am Indian/Alaska Native Alone",
       p0010006 AS "Asian Alone",
       p0010007 AS "Native Hawaiian and Other Pacific Islander Alone",
       p0010008 AS "Some Other Race Alone",
       p0010009 AS "Two or More Races"
FROM us_counties_2010;

SELECT geo_name,
       state_us_abbreviation AS "st",
       p0010001 AS "Total Population",
       p0010003 AS "White Alone",
       p0010004 AS "Black of African American Alone",
       p0010003 + p0010004 AS "Total White and Black"
FROM us_counties_2010;

SELECT geo_name,
  state_us_abbreviation AS "st",
  p0010001 AS "Total",
  p0010003 + p0010004 + p0010005 + p0010006 + p0010007 + p0010008 + p0010009 AS "All Races",
  (p0010003 + p0010004 + p0010005 + p0010006 + p0010007 + p0010008 + p0010009) - p0010001 AS "Difference"
FROM us_counties_2010
ORDER BY "Difference" DESC;

SELECT geo_name,
  state_us_abbreviation AS "st",
  (CAST (p0010006 AS numeric(8, 1)) / p0010001) * 100 AS "pct_asian"
FROM us_counties_2010
ORDER BY "pct_asian" DESC;

CREATE TABLE percent_change (
  department varchar(20),
  spend_2014 numeric(10, 2),
  spend_2017 numeric(10, 2)
);

INSERT INTO percent_change VALUES
  ('Building', 250000, 289000),
  ('Assessor', 178556, 179500),
  ('Library', 87777, 90001),
  ('Clerk', 451980, 650000),
  ('Police', 250000, 223000),
  ('Recreation', 199000, 195000);

SELECT department,
       spend_2014,
       spend_2017,
       round((spend_2017 - spend_2014) / spend_2014 * 100, 1) AS "change"
FROM percent_change
ORDER BY "change" DESC;

/*
 department | spend_2014 | spend_2017 | change
------------+------------+------------+--------
 Clerk      |  451980.00 |  650000.00 |   43.8
 Building   |  250000.00 |  289000.00 |   15.6
 Library    |   87777.00 |   90001.00 |    2.5
 Assessor   |  178556.00 |  179500.00 |    0.5
 Recreation |  199000.00 |  195000.00 |   -2.0
 Police     |  250000.00 |  223000.00 |  -10.8
(6 rows)
*/

SELECT sum(p0010001) AS "County Sum",
       round(avg(p0010001), 0) AS "County Average"
FROM us_counties_2010;

/*
 County Sum | County Average
------------+----------------
  308745538 |          98233
(1 row)
*/

CREATE TABLE percentile_test (
    numbers integer
);

INSERT INTO percentile_test (numbers) VALUES
(1), (2), (3), (4), (5), (6);

SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY numbers),
       percentile_disc(.5) WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;

/*
 percentile_cont | percentile_disc
-----------------+-----------------
             3.5 |               3
(1 row)
*/

INSERT INTO percentile_test (numbers) VALUES (7);

SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY numbers),
       percentile_disc(.5) WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;

/*
 percentile_cont | percentile_disc
-----------------+-----------------
               4 |               4
(1 row)
*/

SELECT sum(p0010001) AS "County Sum",
       round(avg(p0010001), 0) AS "County Average",
       percentile_cont(.5) WITHIN GROUP (ORDER BY p0010001) AS "County Median"
FROM us_counties_2010;

/*
 County Sum | County Average | County Median
------------+----------------+---------------
  308745538 |          98233 |         25857
(1 row)
*/

SELECT percentile_cont(array[.25, .5, .75]) WITHIN GROUP (ORDER BY p0010001) AS "Quartiles"
FROM us_counties_2010;

/*
       Quartiles
-----------------------
 {11104.5,25857,66699}
(1 row)
*/

SELECT unnest(
    percentile_cont(array[.25, .5, .75]) WITHIN GROUP (ORDER BY p0010001)
) as "Quartiles"
FROM us_counties_2010;

/*
 Quartiles
-----------
   11104.5
     25857
     66699
(3 rows)
*/

SELECT unnest(array[.25, .5, .75]) as "Quartiles",
       unnest(
           percentile_cont(array[.25, .5, .75]) WITHIN GROUP (ORDER BY p0010001)
       ) as "Values"
FROM us_counties_2010;

/*

 Quartiles | Values
-----------+---------
      0.25 | 11104.5
       0.5 |   25857
      0.75 |   66699
(3 rows)
*/

SELECT mode() WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010;

/*
 mode
-------
 21720
(1 row)
*/

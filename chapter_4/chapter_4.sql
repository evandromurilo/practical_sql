\copy us_counties_2010 FROM './us_counties_2010.csv' WITH (FORMAT CSV, HEADER);
-- COPY 3143

SELECT geo_name, state_us_abbreviation, area_land
FROM us_counties_2010
ORDER BY area_land DESC
LIMIT 3;

/*
         geo_name          | state_us_abbreviation |  area_land
---------------------------+-----------------------+--------------
 Yukon-Koyukuk Census Area | AK                    | 376855656455
 North Slope Borough       | AK                    | 229720054439
 Bethel Census Area        | AK                    | 105075822708
(3 rows)
*/

SELECT geo_name, state_us_abbreviation, internal_point_lon
FROM us_counties_2010
ORDER BY internal_point_lon DESC
LIMIT 5;

/*
          geo_name          | state_us_abbreviation | internal_point_lon
----------------------------+-----------------------+--------------------
 Aleutians West Census Area | AK                    |        178.3388130
 Washington County          | ME                    |        -67.6093542
 Hancock County             | ME                    |        -68.3707034
 Aroostook County           | ME                    |        -68.6494098
 Penobscot County           | ME                    |        -68.6574869
(5 rows)
*/

CREATE TABLE supervisor_salaries (
    town varchar(30),
    county varchar(30),
    supervisor varchar(30),
    start_date date,
    salary money,
    benefits money
);

\copy supervisor_salaries (town, supervisor, salary)
FROM './supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

-- COPY 5

DELETE FROM supervisor_salaries;

-- DELETE 5

CREATE TEMPORARY TABLE supervisor_salaries_temp (LIKE supervisor_salaries);

\copy supervisor_salaries_temp (town, supervisor, salary) FROM './supervisor_salaries.csv' WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Some County', supervisor, salary
FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;

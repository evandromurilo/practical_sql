CREATE TEMPORARY TABLE supervisor_salaries_temp (LIKE supervisor_salaries);

\copy supervisor_salaries_temp (town, supervisor, salary) FROM './supervisor_salaries.csv' WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Some County', supervisor, salary
FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;

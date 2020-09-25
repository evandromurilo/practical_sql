\copy (SELECT geo_name, state_us_abbreviation FROM us_counties_2010 WHERE geo_name ILIKE '%mill%') TO './us_counties_mill_export.csv' WITH (FORMAT CSV, HEADER);

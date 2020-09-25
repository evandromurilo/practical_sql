/*
 * Using the table us_counties_2010 you created and filled in this chapter,
 * export to a CSV file the 20 counties in the UNited States that have the most
 * housing units.
 */

\copy (SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20) TO './us_counties_most_housing_units_export.csv' WITH (FORMAT CSV, HEADER);

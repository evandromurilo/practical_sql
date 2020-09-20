/*
 * Imagine you're building a database to catalog all the animals at your local zoo.
 * You want one table to track the kinds of animals in the collection and another
 * table to track de specifics on each animal. Write CREATE TABLE statements for each
 * table that include some of the columns you need. Why did you include the columns
 * you chose?
 */

CREATE TABLE species (
    id bigserial,
    english_name varchar(50),
    latin_name varchar(50)
);

CREATE TABLE animals (
    id bigserial,
    species_id numeric,
    weight numeric,
    name varchar(50),
    birth date,
    acquisition date
);

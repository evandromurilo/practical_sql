/*
 * Write a WITH statement to include with COPY to handle the import of an
 * imaginary text file whose first couple of rows look like this:
 * 
 * id:movie:actor
 * 50:#Mission: Impossible#:Tom Cruise
 */

CREATE TABLE actors(
    id serial,
    movie varchar(200),
    actor varchar(200)
);

\copy actors FROM './actors.txt' WITH (FORMAT CSV, HEADER, DELIMITER ':', QUOTE '#');

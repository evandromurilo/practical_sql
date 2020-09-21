CREATE TABLE char_data_types (
    varchar_column varchar(10),
    char_column char(10),
    text_column text
);

INSERT INTO char_data_types
VALUES ('abc', 'abc', 'abc'),
       ('defghi', 'defghi', 'defghi');

COPY char_data_types TO '/home/murilo/Projects/practical_sql/mine/chapter_3/typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

CREATE TABLE number_data_types(
    numeric_column numeric(20, 5),
    real_column real,
    double_column double precision
);

INSERT INTO number_data_types
VALUES (.7, .7, .7),
       (2.13579, 2.13579, 2.13579),
       (2.1357987654, 2.1357987654, 2.1357987654);
      
SELECT * FROM number_data_types;

/*
 numeric_column | real_column | double_column
----------------+-------------+---------------
        0.70000 |         0.7 |           0.7
        2.13579 |     2.13579 |       2.13579
        2.13580 |      2.1358 |  2.1357987654
(3 rows)
*/

SELECT numeric_column * 10000000 AS "Fixed",
       real_column    * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column = .7;

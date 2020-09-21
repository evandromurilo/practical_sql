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

/*
     Fixed     |      Float
---------------+------------------
 7000000.00000 | 6999999.88079071
(1 row)
*/

CREATE TABLE date_time_types (
    timestamp_column timestamp with time zone,
    interval_column interval
);

INSERT INTO date_time_types
VALUES ('2018-12-31 01:00 EST', '2 days'),
       ('2019-12-31 01:00 -8', '1 month'),
       ('2018-12-31 01:00 Australia/Melbourne', '1 century'),
       (now(), '1 week');

SELECT * FROM date_time_types;

/*
       timestamp_column        | interval_column
-------------------------------+-----------------
 2018-12-31 06:00:00+00        | 2 days
 2019-12-31 09:00:00+00        | 1 mon
 2018-12-30 14:00:00+00        | 100 years
 2020-09-21 18:06:08.741195+00 | 7 days
(4 rows)
*/

SELECT timestamp_column,
       interval_column, 
       timestamp_column - interval_column as new_date
FROM date_time_types;

/*
       timestamp_column        | interval_column |           new_date
-------------------------------+-----------------+-------------------------------
 2018-12-31 06:00:00+00        | 2 days          | 2018-12-29 06:00:00+00
 2019-12-31 09:00:00+00        | 1 mon           | 2019-11-30 09:00:00+00
 2018-12-30 14:00:00+00        | 100 years       | 1918-12-30 14:00:00+00
 2020-09-21 18:06:08.741195+00 | 7 days          | 2020-09-14 18:06:08.741195+00
(4 rows)
*/

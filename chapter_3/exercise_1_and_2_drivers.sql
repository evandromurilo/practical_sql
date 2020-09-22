/*
 * Your company delivers fruit and vegetables to local grocery stores, and you
 * need to track the mileage driven by each driver each day to a tenth of a
 * mile. Assuming no driver would ever travel more than 999 miles in a day, what
 * would be an appropriate data type for the mileage column in your table? Why?
 *
 * ANSWER:
 * numeric(5, 2) would be an appropriate data type, because that will give us a
 * precision of 3 digits to the left, and 2 digits to the right of the comma. So
 * we could store values like 983.19. Numeric is more appropriate than a
 * floating point equivalent in this case, as we will propably do some math
 * involving fuel costs.
 */

/*
 * In the table listing each driver in your company, what are appropriate data
 * types for the drivers' first and last names? Why is it a good idea to
 * separate first and last names into two columns rather than having one larger
 * name column?
 *
 * ANSWER:
 * varchar(50), to give us some margin. It is a good idea to have two columns
 * because we may need to sort by last name, or make a specific greeting.
 */

CREATE TABLE drivers (
    id serial,
    first_name varchar(50),
    last_name varchar(50)
);

CREATE TABLE mileages (
    id serial,
    driver_id integer,
    mileage numeric(5, 2),
    day date
);

INSERT INTO drivers (first_name, last_name) VALUES
  ('Anthony', 'Johnson'),
  ('Carl', 'Jung'),
  ('Frederico', 'Andrade');

INSERT INTO mileages (driver_id, mileage, day) VALUES
  (1, 80.3, '2020-01-01'),
  (1, 103.32, '2020-01-02'),
  (1, 45.32, '2020-01-03'),
  (2, 90.12, '2020-01-01'),
  (2, 130.32, '2020-01-02'),
  (2, 42.32, '2020-01-03'),
  (3, 50.12, '2020-01-01'),
  (3, 100.32, '2020-01-02'),
  (3, 41.32, '2020-01-03');

SELECT * FROM mileages ORDER BY day ASC, mileage DESC;

/*
 id | driver_id | mileage |    day
----+-----------+---------+------------
  4 |         2 |   90.12 | 2020-01-01
  1 |         1 |   80.30 | 2020-01-01
  7 |         3 |   50.12 | 2020-01-01
  5 |         2 |  130.32 | 2020-01-02
  2 |         1 |  103.32 | 2020-01-02
  8 |         3 |  100.32 | 2020-01-02
  3 |         1 |   45.32 | 2020-01-03
  6 |         2 |   42.32 | 2020-01-03
  9 |         3 |   41.32 | 2020-01-03
(9 rows)
/*

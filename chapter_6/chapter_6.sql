CREATE TABLE departments (
    dept_id bigserial,
    dept varchar(100),
    city varchar(100),
    CONSTRAINT dept_key PRIMARY KEY (dept_id),
    CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

CREATE TABLE employees (
    emp_id bigserial,
    first_name varchar(100),
    last_name varchar(100),
    salary integer,
    dept_id integer REFERENCES departments (dept_id),
    CONSTRAINT emp_key PRIMARY KEY (emp_id),
    CONSTRAINT emp_dpt_unique UNIQUE (emp_id, dept_id)
);

INSERT INTO departments (dept, city) VALUES
    ('Tax', 'Atlanta'),
    ('IT', 'Boston');

INSERT INTO employees (first_name, last_name, salary, dept_id) VALUES
    ('Nancy', 'Jones', 62500, 1),
    ('Lee', 'Smith', 59300, 1),
    ('Soo', 'Nguyen', 83000, 2),
    ('Janet', 'King', 95000, 2);

SELECT * FROM employees
JOIN departments
ON departments.dept_id = employees.dept_id;

/*
 emp_id | first_name | last_name | salary | dept_id | dept_id | dept |  city
--------+------------+-----------+--------+---------+---------+------+---------
      1 | Nancy      | Jones     |  62500 |       1 |       1 | Tax  | Atlanta
      2 | Lee        | Smith     |  59300 |       1 |       1 | Tax  | Atlanta
      3 | Soo        | Nguyen    |  83000 |       2 |       2 | IT   | Boston
      4 | Janet      | King      |  95000 |       2 |       2 | IT   | Boston
(4 rows)
*/

CREATE TABLE schools_left (
    id integer CONSTRAINT left_id_key PRIMARY KEY,
    left_school varchar(30)
);

CREATE TABLE schools_right (
    id integer CONSTRAINT right_id_key PRIMARY KEY,
    right_school varchar(30)
);

INSERT INTO schools_left (id, left_school) VALUES
    (1, 'Oak Street School'),
    (2, 'Roosevelt High School'),
    (5, 'Washington Middle School'),
    (6, 'Jefferson High School');

INSERT INTO schools_right (id, right_school) VALUES
    (1, 'Oak Street School'),
    (2, 'Roosevelt High School'),
    (3, 'Morrison Elementary'),
    (4, 'Chase Magnet Academy'),
    (6, 'Jefferson High School');

SELECT *
FROM schools_left JOIN schools_right
ON schools_left.id = schools_right.id;

/*
 id |      left_school      | id |     right_school
----+-----------------------+----+-----------------------
  1 | Oak Street School     |  1 | Oak Street School
  2 | Roosevelt High School |  2 | Roosevelt High School
  6 | Jefferson High School |  6 | Jefferson High School
(3 rows)
*/

SELECT *
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

/*
 id |       left_school        | id |     right_school
----+--------------------------+----+-----------------------
  1 | Oak Street School        |  1 | Oak Street School
  2 | Roosevelt High School    |  2 | Roosevelt High School
  5 | Washington Middle School |    |
  6 | Jefferson High School    |  6 | Jefferson High School
(4 rows)
*/

SELECT *
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id
WHERE schools_right.id IS NULL;

/*
 id |       left_school        | id | right_school
----+--------------------------+----+--------------
  5 | Washington Middle School |    |
(1 row)
*/

SELECT *
FROM schools_left RIGHT JOIN schools_right
ON schools_left.id = schools_right.id;


/*
 id |      left_school      | id |     right_school
----+-----------------------+----+-----------------------
  1 | Oak Street School     |  1 | Oak Street School
  2 | Roosevelt High School |  2 | Roosevelt High School
    |                       |  3 | Morrison Elementary
    |                       |  4 | Chase Magnet Academy
  6 | Jefferson High School |  6 | Jefferson High School
(5 rows)
*/

SELECT *
FROM schools_left FULL OUTER JOIN schools_right
ON schools_left.id = schools_right.id;

/*
 id |       left_school        | id |     right_school
----+--------------------------+----+-----------------------
1 | Oak Street School        |  1 | Oak Street School
2 | Roosevelt High School    |  2 | Roosevelt High School
5 | Washington Middle School |    |
6 | Jefferson High School    |  6 | Jefferson High School
  |                          |  4 | Chase Magnet Academy
  |                          |  3 | Morrison Elementary
(6 rows)
*/

SELECT *
FROM schools_left CROSS JOIN schools_right;

/*
 id |       left_school        | id |     right_school
----+--------------------------+----+-----------------------
1 | Oak Street School        |  1 | Oak Street School
1 | Oak Street School        |  2 | Roosevelt High School
1 | Oak Street School        |  3 | Morrison Elementary
1 | Oak Street School        |  4 | Chase Magnet Academy
1 | Oak Street School        |  6 | Jefferson High School
2 | Roosevelt High School    |  1 | Oak Street School
2 | Roosevelt High School    |  2 | Roosevelt High School
2 | Roosevelt High School    |  3 | Morrison Elementary
2 | Roosevelt High School    |  4 | Chase Magnet Academy
2 | Roosevelt High School    |  6 | Jefferson High School
5 | Washington Middle School |  1 | Oak Street School
5 | Washington Middle School |  2 | Roosevelt High School
5 | Washington Middle School |  3 | Morrison Elementary
5 | Washington Middle School |  4 | Chase Magnet Academy
5 | Washington Middle School |  6 | Jefferson High School
6 | Jefferson High School    |  1 | Oak Street School
6 | Jefferson High School    |  2 | Roosevelt High School
6 | Jefferson High School    |  3 | Morrison Elementary
6 | Jefferson High School    |  4 | Chase Magnet Academy
6 | Jefferson High School    |  6 | Jefferson High School
(20 rows)
*/

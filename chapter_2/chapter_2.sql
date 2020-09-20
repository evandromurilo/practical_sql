SELECT * FROM teachers;

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  1 | Janet      | Smith     | F.D. Roosevelt HS   | 2011-10-30 |  36200
  2 | Lee        | Reynolds  | F.D. Roosevelt HS   | 1993-05-22 |  65000
  3 | Samuel     | Cole      | Myers Middle School | 2005-08-01 |  43500
  4 | Samantha   | Bush      | Myers Middle School | 2011-10-30 |  36200
  5 | Betty      | Diaz      | Myers Middle School | 2005-08-30 |  43500
  6 | Kathleen   | Roush     | F.D. Roosevelt HS   | 2010-10-22 |  38500
(6 rows)
*/

SELECT last_name, first_name, salary FROM teachers;

/*
 last_name | first_name | salary
-----------+------------+--------
 Smith     | Janet      |  36200
 Reynolds  | Lee        |  65000
 Cole      | Samuel     |  43500
 Bush      | Samantha   |  36200
 Diaz      | Betty      |  43500
 Roush     | Kathleen   |  38500
(6 rows)
*/

SELECT DISTINCT school FROM teachers;

/*
       school
---------------------
 Myers Middle School
 F.D. Roosevelt HS
(2 rows)
*/

SELECT DISTINCT school, salary FROM teachers;

/*
       school        | salary
---------------------+--------
 Myers Middle School |  36200
 F.D. Roosevelt HS   |  65000
 Myers Middle School |  43500
 F.D. Roosevelt HS   |  38500
 F.D. Roosevelt HS   |  36200
(5 rows)
*/

SELECT first_name, last_name, salary FROM teachers ORDER BY salary DESC;

/*
 first_name | last_name | salary
------------+-----------+--------
 Lee        | Reynolds  |  65000
 Samuel     | Cole      |  43500
 Betty      | Diaz      |  43500
 Kathleen   | Roush     |  38500
 Janet      | Smith     |  36200
 Samantha   | Bush      |  36200
(6 rows)
*/

SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

/*
 first_name | last_name |      school
------------+-----------+-------------------
 Janet      | Smith     | F.D. Roosevelt HS
(1 row)

analysis=# \i buffer.sql
 first_name | last_name |      school
------------+-----------+-------------------
 Janet      | Smith     | F.D. Roosevelt HS
(1 row)
*/

SELECT school
FROM teachers
WHERE school != 'F.D. Roosevelt HS';

/*
       school
---------------------
 Myers Middle School
 Myers Middle School
 Myers Middle School
(3 rows)
*/

SELECT first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2000-01-01';

/*
 first_name | last_name | hire_date
------------+-----------+------------
 Lee        | Reynolds  | 1993-05-22
(1 row)
*/

SELECT first_name, last_name, salary
FROM teachers
WHERE salary > 43500;

/*
 first_name | last_name | salary
------------+-----------+--------
 Lee        | Reynolds  |  65000
 Samuel     | Cole      |  43500
 Betty      | Diaz      |  43500
(3 rows)
*/

SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 43500 AND 65000;

/*
 first_name | last_name |       school        | salary
------------+-----------+---------------------+--------
 Lee        | Reynolds  | F.D. Roosevelt HS   |  65000
 Samuel     | Cole      | Myers Middle School |  43500
 Betty      | Diaz      | Myers Middle School |  43500
(3 rows)
*/

SELECT first_name
FROM teachers 
WHERE first_name LIKE 'sam%';

/*
 first_name
------------
(0 rows)

analysis=# SELECT first_name FROM teachers WHERE first_name ILIKE 'sam%';
 first_name
------------
 Samuel
 Samantha
(2 rows)
*/

SELECT * 
FROM teachers 
WHERE school = 'Myers Middle School' AND salary < 40000;

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  4 | Samantha   | Bush      | Myers Middle School | 2011-10-30 |  36200
(1 row)
*/

SELECT *
FROM teachers
WHERE last_name = 'Cole' OR last_name = 'Bush';

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  3 | Samuel     | Cole      | Myers Middle School | 2005-08-01 |  43500
  4 | Samantha   | Bush      | Myers Middle School | 2011-10-30 |  36200
(2 rows)
*/

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS' AND (salary < 38000 OR salary > 40000);

/*
 id | first_name | last_name |      school       | hire_date  | salary
----+------------+-----------+-------------------+------------+--------
  1 | Janet      | Smith     | F.D. Roosevelt HS | 2011-10-30 |  36200
  2 | Lee        | Reynolds  | F.D. Roosevelt HS | 1993-05-22 |  65000
(2 rows)
*/

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS' AND salary < 3000 OR salary > 30000;

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  1 | Janet      | Smith     | F.D. Roosevelt HS   | 2011-10-30 |  36200
  2 | Lee        | Reynolds  | F.D. Roosevelt HS   | 1993-05-22 |  65000
  3 | Samuel     | Cole      | Myers Middle School | 2005-08-01 |  43500
  4 | Samantha   | Bush      | Myers Middle School | 2011-10-30 |  36200
  5 | Betty      | Diaz      | Myers Middle School | 2005-08-30 |  43500
  6 | Kathleen   | Roush     | F.D. Roosevelt HS   | 2010-10-22 |  38500
(6 rows)
*/

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS' AND salary < 3000 OR salary > 30000 AND school = 'Myers Middle School';

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  3 | Samuel     | Cole      | Myers Middle School | 2005-08-01 |  43500
  4 | Samantha   | Bush      | Myers Middle School | 2011-10-30 |  36200
  5 | Betty      | Diaz      | Myers Middle School | 2005-08-30 |  43500
(3 rows)
*/

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS' AND salary < 3000
   OR salary > 30000 AND school = 'Myers Middle School'
   OR last_name = 'Roush';

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  3 | Samuel     | Cole      | Myers Middle School | 2005-08-01 |  43500
  4 | Samantha   | Bush      | Myers Middle School | 2011-10-30 |  36200
  5 | Betty      | Diaz      | Myers Middle School | 2005-08-30 |  43500
  6 | Kathleen   | Roush     | F.D. Roosevelt HS   | 2010-10-22 |  38500
(4 rows)
*/

SELECT *
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;

/*
 id | first_name | last_name |      school       | hire_date  | salary
----+------------+-----------+-------------------+------------+--------
  1 | Janet      | Smith     | F.D. Roosevelt HS | 2011-10-30 |  36200
  6 | Kathleen   | Roush     | F.D. Roosevelt HS | 2010-10-22 |  38500
  2 | Lee        | Reynolds  | F.D. Roosevelt HS | 1993-05-22 |  65000
(3 rows)
*/


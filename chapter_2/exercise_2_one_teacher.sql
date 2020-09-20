/*
 * Write a query that finds the one teacher whose first name starts with the letter S
 * and who earns more than $40,000.
 */

SELECT *
FROM teachers
WHERE first_name LIKE 'S%'
  AND salary > 40000;

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  3 | Samuel     | Cole      | Myers Middle School | 2005-08-01 |  43500
(1 row)
*/

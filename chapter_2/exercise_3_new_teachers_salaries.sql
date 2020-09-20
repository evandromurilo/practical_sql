/*
 * Rank teachers hired since January 1, 2010, ordered by highest paid to lowest.
 */

SELECT *
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;

/*
 id | first_name | last_name |       school        | hire_date  | salary
----+------------+-----------+---------------------+------------+--------
  6 | Kathleen   | Roush     | F.D. Roosevelt HS   | 2010-10-22 |  38500
  1 | Janet      | Smith     | F.D. Roosevelt HS   | 2011-10-30 |  36200
  4 | Samantha   | Bush      | Myers Middle School | 2011-10-30 |  36200
(3 rows)
*/

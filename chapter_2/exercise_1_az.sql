/*
 * The school district superintendent asks for a list of teachers in each school.
 * Write a query that lists the schools in alphabetical order along with teachers
 * ordered by last name A-Z.
 */

SELECT school, last_name, first_name
FROM teachers
ORDER BY school ASC,
         last_name ASC;

/* 
       school        | last_name | first_name
---------------------+-----------+------------
 F.D. Roosevelt HS   | Reynolds  | Lee
 F.D. Roosevelt HS   | Roush     | Kathleen
 F.D. Roosevelt HS   | Smith     | Janet
 Myers Middle School | Bush      | Samantha
 Myers Middle School | Cole      | Samuel
 Myers Middle School | Diaz      | Betty
(6 rows)
*/

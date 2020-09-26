SELECT department,
       spend_2014,
       spend_2017,
       round((spend_2017 - spend_2014) / spend_2014 * 100, 1) AS "change"
FROM percent_change
ORDER BY "change" DESC;

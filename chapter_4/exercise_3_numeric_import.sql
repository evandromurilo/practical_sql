/*
 * Imagine you're importing a file that contains a column with these values:
 *
 * 17519.668
 * 20084.461
 * 18976.335
 *
 * Will a column in your target table with data type numeric(3,8) work for these
 * values? Why or why not?
 *
 * ANSWER:
 * It will not work. The type should be numeric(8, 3).
 */

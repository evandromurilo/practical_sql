/*
 * Assume you have a text column that includes strings formatted as dates. One
 * of the strings is written as '4//2017'. What will happen when you try to
 * convert that string to the timestamp data type?
 *
 * ANSWER:
 * A casting error will be raised.
 */

CREATE TABLE dates_as_text (
    date_text char(10)
);

INSERT INTO dates_as_text VALUES
  ('2020-01-01'),
  ('2019-01-01'),
  ('4//2017');

SELECT date_text::timestamp FROM dates_as_text;

/*
ERROR:  invalid input syntax for type timestamp: "4//2017   "
/*

-- Now create INSERT statements to load sample data into the tables.

INSERT INTO species(english_name, latin_name)
VALUES ('Lion', 'Panthera leo'),
       ('Eagle', 'Accipitridae'),
       ('Elephant', 'Elephantidae');

INSERT INTO animals(species_id, weight, name, birth, acquisition)
VALUES (1, 100, 'King Leo', '1990-01-01', '1998-01-01'),
       (2, 4, 'Sharp-Eye', '2010-01-01', '2010-02-01'),
       (3, 500, 'Big Tony', '1980-01-01', '1990-01-01');

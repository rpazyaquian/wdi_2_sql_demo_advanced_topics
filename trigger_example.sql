DROP DATABASE IF EXISTS survey_corps;
CREATE DATABASE survey_corps;

\c

DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS shifters;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  name TEXT,
  rank TEXT,
  damaged BOOLEAN
);

CREATE TABLE shifters (
  member_id INTEGER,
  name TEXT,
  shifted BOOLEAN
);

INSERT INTO members (id, name, rank, damaged) VALUES
  (1, 'Yeager', 'Soldier', FALSE),
  (2, 'Ackerman', 'Soldier', FALSE),
  (3, 'Arlert', 'Soldier', FALSE),
  (4, 'Kirstein', 'Soldier', FALSE),
  (5, 'Ackerman', 'Corporal', FALSE),
  (6, 'Zoe', 'Corporal', FALSE),
  (7, 'Smith', 'Commander', FALSE),
  (8, 'Hoover', 'Soldier', FALSE),
  (9, 'Braun', 'Soldier', FALSE),
  (10, 'Lenz', 'Soldier', FALSE),
  (11, 'Ymir', 'Soldier', FALSE),
  (12, 'Springer', 'Soldier', FALSE)
;

INSERT INTO shifters (member_id, name, shifted) VALUES
  (1, 'Yeager', FALSE),
  (8, 'Hoover', FALSE),
  (9, 'Braun', FALSE),
  (11, 'Ymir', FALSE)
;

CREATE OR REPLACE FUNCTION shift(id INTEGER)
RETURNS VOID AS
$$
DECLARE id INTEGER;
BEGIN
  -- whenever a Member's damaged state is set to true,  <--- comes later
  -- select from shifters where their id is the same as member's id
  -- and set their shifted bool to true
  UPDATE shifters
  SET shifted = TRUE
  WHERE shifters.member_id = $1;
END $$ LANGUAGE 'plpgsql';

SELECT shift(1);

SELECT * FROM shifters;
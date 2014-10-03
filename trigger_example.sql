DROP DATABASE IF EXISTS survey_corps;
CREATE DATABASE survey_corps;

\c survey_corps

DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS shifters;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  name TEXT,
  rank TEXT,
  damaged BOOLEAN
);

CREATE TABLE shifters (
  member_id INTEGER REFERENCES members,
  name TEXT,
  shifted BOOLEAN
);

INSERT INTO members (id, name, rank, damaged) VALUES
  (1, 'Yeager', 'Soldier', FALSE),
  (2, 'Ackerman', 'Soldier', FALSE),
  (3, 'Arlert', 'Soldier', FALSE),
  (4, 'Kirstein', 'Soldier', FALSE),
  (5, 'Midget', 'Corporal', FALSE),
  (6, 'Zoe', 'Corporal', FALSE),
  (7, 'Smith', 'Commander', FALSE),
  (8, 'Hoover', 'Soldier', FALSE),
  (9, 'Braun', 'Soldier', FALSE),
  (10, 'Lenz', 'Soldier', FALSE),
  (11, 'Ymir', 'Soldier', FALSE),
  (12, 'Springer', 'Soldier', FALSE),
  (13, 'Braus', 'Soldier', FALSE)
;

-- INSERT INTO shifters (shifted)

WITH ins (member, shifted) AS
(VALUES
  ('Yeager', FALSE),
  ('Hoover', FALSE),
  ('Braun', FALSE),
  ('Ymir', FALSE)
)
INSERT INTO shifters
  (member_id, shifted)
SELECT
  members.id, ins.shifted
FROM
  members JOIN ins
    ON ins.member = members.name
;

--  update form shifters
  -- shifted value from false to true

-- attach trigger to update on members

CREATE OR REPLACE FUNCTION shift()
RETURNS TRIGGER AS
$$
BEGIN
  -- whenever a Member's damaged state is set to true,
  -- select from shifters
  -- where their id is the same as member's id
  -- and set their shifted bool to true
  UPDATE shifters
  SET shifted = TRUE
  WHERE NEW.damaged = TRUE;
  RETURN NEW;
END $$ LANGUAGE 'plpgsql';

CREATE TRIGGER cause_shift
  AFTER UPDATE
  ON members
  FOR EACH ROW
EXECUTE PROCEDURE shift();

SELECT * FROM members;
SELECT * FROM shifters;

SELECT members.id, shifters.name, members.rank, members.damaged, shifters.shifted FROM shifters, members WHERE shifters.member_id = members.id;

UPDATE members SET damaged = TRUE WHERE id = 1;

SELECT members.id, shifters.name, members.rank, members.damaged, shifters.shifted FROM shifters, members WHERE shifters.member_id = members.id;

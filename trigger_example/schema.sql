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
DROP FUNCTION shift(INTEGER);

CREATE FUNCTION shift(id INTEGER)
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
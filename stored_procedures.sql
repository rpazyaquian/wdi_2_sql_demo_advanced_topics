-- Stored Function to calculate revenue from profit and cost attributes
CREATE FUNCTION revenue(profit INTEGER, cost INTEGER)
  RETURN INTEGER AS $$

  BEGIN
    RETURN profit - cost
  END;

  $$
  LANGUAGE 'plpgsql';

--query to get revenue from some table
SELECT revenue FROM table;

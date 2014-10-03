DROP DATABASE IF EXISTS trigger_lab;
CREATE DATABASE trigger_lab;
\c trigger_lab

CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT);
CREATE TABLE address (id_user int, address TEXT);

INSERT INTO users VALUES
    (1, 'Michael P');
INSERT INTO address VALUES
    (1, 'Work in Tokyo, Japan'),
    (1, 'Live in San Francisco, California');

CREATE FUNCTION delete_address() RETURNS TRIGGER AS $_$  -- $_$ marks the beginning of PL/pgSQL
BEGIN  -- beginning of block
    DELETE FROM address WHERE address.id_user = OLD.id;  -- delete a row in address that has the id of the user that was just deleted
    RETURN OLD;  -- return this
END $_$ LANGUAGE 'plpgsql';  -- end of block and language configuration

CREATE TRIGGER delete_user_address BEFORE DELETE ON users FOR EACH ROW EXECUTE PROCEDURE delete_address();


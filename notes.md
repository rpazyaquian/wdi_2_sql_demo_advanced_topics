# Triggers

Trigger functions can be written in many languages including pgSQL and Python.

Trigger functions are a way of telling the database to execute a certain procedure when certain operations are performed. They can be attached to both tables and views.

On tables, triggers accompany INSERT, UPDATE, DELETE, coming either before or after their occurrence. On views, triggers can take the place of operations like INSERT or DELETE.

In order to define a trigger, the function must first be defined. Trigger functions take no arguments, and return the data type `trigger`. After being created, the trigger function is called in an expression by using CREATE TRIGGER. Triggers can be set to occur `BEFORE`, `AFTER` or `INSTEAD OF` operations.

This will be a bit easier to explain in an example.

# EXPLAIN and ANALYZE

Predicts what algorithms will be used in and the efficiency of a potential operation. Using ANALYZE after EXPLAIN will actually execute the command, so it will
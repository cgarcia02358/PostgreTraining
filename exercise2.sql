CREATE ROLE John;

ALTER ROLE John WITH PASSWORD 'password1';

GRANT CREATE on DATABASE "testdb" john;

CREATE SCHEMA sales;

GRANT USAGE on SCHEMA sales to John;

SET seach_path to sales;

CREATE TABLE customers();

CREATE TABLE orders();

GRANT SELECT, INSERT on TABLE customers to John;

GRANT SELECT on TABLE orders to John;

CREATE ROLE sales_manager;

ALTER ROLE sales_manager WITH PASSWORD 'password1';

GRANT CREATE on DATABASE "testdb" to sales_manager;


GRANT SELECT, INSERT, DELETE, UPDATE on TABLE customers to sales_manager;

REVOKE SELECT on customers from john;





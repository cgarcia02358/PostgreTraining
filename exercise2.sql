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


DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS categories;



CREATE TABLE IF NOT EXISTS products (
        id INT,
        name VARCHAR(50),
        description TEXT

);

ALTER TABLE products ADD COLUMN category_id INT NOT NULL;
ALTER TABLE products ADD COLUMN branch_id INT NOT NULL;



ALTER TABLE products
ADD CONSTRAINT pk_product
PRIMARY KEY (id);

ALTER TABLE products DROP CONSTRAINT pk_product;

CREATE SEQUENCE products_id_seq
AS Integer START 1 OWNED BY products.id;

ALTER TABLE products
ALTER COLUMN id SET DEFAULT nextval('products_id_seq');

ALTER TABLE products
ADD CONSTRAINT pk_product
PRIMARY KEY (id);



CREATE TABLE IF NOT EXISTS branches (
        id INT,
        name VARCHAR(50)

);

CREATE SEQUENCE branches_id_seq
AS Integer START 1 OWNED BY branches.id;

ALTER TABLE branches
ALTER COLUMN id SET DEFAULT nextval('branches_id_seq');


ALTER TABLE branches
ADD CONSTRAINT pk_branches
PRIMARY KEY (id);



CREATE TABLE IF NOT EXISTS categories (
        id INT,
        name VARCHAR(50)

);

CREATE SEQUENCE categories_id_seq
AS Integer START 1 OWNED BY categories.id;

ALTER TABLE categories
ALTER COLUMN id SET DEFAULT nextval('categories_id_seq');


ALTER TABLE categories
ADD CONSTRAINT pk_categories
PRIMARY KEY (id);


AlTER TABLE products ADD CONSTRAINT fk_category_id
FOREIGN KEY (category_id)
REFERENCES categories (id);

AlTER TABLE products ADD CONSTRAINT fk_branch_id
FOREIGN KEY (branch_id)
REFERENCES branches (id);



INSERT INTO categories (name) VALUES ('PC PARTS');
INSERT INTO branches (name) VALUES ('MANILA');
INSERT INTO branches (name) VALUES ('PASIG');



INSERT INTO products (name, description, category_id, branch_id) VALUES ('CPU','RYZEN',1,1);
INSERT INTO products (name, description, category_id, branch_id) VALUES ('CPU','INTEL',1,2);





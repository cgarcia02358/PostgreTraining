
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


--INSERT INTO categories (name) VALUES ('PC PARTS');
--INSERT INTO branches (name) VALUES ('MANILA');
--INSERT INTO branches (name) VALUES ('PASIG');



--INSERT INTO products (name, description, category_id, branch_id) VALUES ('CPU','RYZEN',1,1);
--INSERT INTO products (name, description, category_id, branch_id) VALUES ('CPU','INTEL',1,2);



COPY branches FROM '/home/ubuntu/PostgreTraining/branches.csv'
WITH delimiter ',' CSV HEADER;

COPY categories FROM '/home/ubuntu/PostgreTraining/categories2.csv'
WITH delimiter ',' CSV HEADER;

COPY products FROM '/home/ubuntu/PostgreTraining/products.csv'
WITH delimiter ',' CSV HEADER;






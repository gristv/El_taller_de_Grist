CREATE TABLE products (
  id IDENTITY,
  description varchar(255),
  price decimal(15,2)
);
CREATE INDEX products_description ON products(description);
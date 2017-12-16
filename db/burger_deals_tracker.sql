DROP TABLE if EXISTS deals;
DROP TABLE if EXISTS burgers;
DROP TABLE if EXISTS eateries;

CREATE TABLE eateries
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  location VARCHAR(255)
);

CREATE TABLE burgers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  price NUMERIC,
  eatery_id INT8 REFERENCES eateries(id)
);

CREATE TABLE deals
(
  id SERIAL8 PRIMARY KEY,
  deal_name VARCHAR(255),
  day VARCHAR(255),
  burger_id INT8 REFERENCES burgers(id)
);

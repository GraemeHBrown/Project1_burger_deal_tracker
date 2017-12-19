DROP TABLE if EXISTS burgers_deals;
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
  eatery_id INT8 REFERENCES eateries(id) ON DELETE CASCADE
);

CREATE TABLE deals
(
  id SERIAL8 PRIMARY KEY,
  deal_name VARCHAR(255) not null,
  day VARCHAR(255),
  eatery_id INT8 REFERENCES eateries(id) ON DELETE CASCADE
);

CREATE TABLE burgers_deals
(
  id SERIAL8 PRIMARY KEY,
  deal_id INT8 REFERENCES deals(id) ON DELETE CASCADE,
  burger_id INT8 REFERENCES burgers(id) ON DELETE CASCADE
);

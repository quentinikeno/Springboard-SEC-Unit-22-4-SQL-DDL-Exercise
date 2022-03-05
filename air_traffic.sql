-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL CHECK (arrival <> departure),
  airline_id INTEGER REFERENCES airlines,
  from_city_id INTEGER REFERENCES cities,
  to_city_id INTEGER REFERENCES cities CHECK (from_city_id <> to_city_id)
);

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways');

INSERT INTO countries
  (name)
VALUES 
  ('United States'),
  ('Japan'),
  ('United Kingdom');

INSERT INTO cities
  (name, country_id)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 2),
  ('London', 3);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4);
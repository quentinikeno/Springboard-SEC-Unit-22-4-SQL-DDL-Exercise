-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_star_id INTEGER REFERENCES stars ON DELETE SET NULL,
  galaxy_id INTEGER REFERENCES galaxies ON DELETE CASCADE
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons ON DELETE SET NULL
);

INSERT INTO stars
  (name)
VALUES
  ('The Sun');

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_star_id, galaxy_id)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1);

INSERT INTO moons
  (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos');

INSERT INTO planets_moons
  (planet_id, moon_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3);
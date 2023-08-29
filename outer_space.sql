-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE orbit_in_years(
  orb_yr_id SERIAL PRIMARY KEY UNIQUE,
  planet_id INTEGER REFERENCES planets,
  orbit_time FLOAT
);

CREATE TABLE orbits_around(
  orb_around_id SERIAL PRIMARY KEY UNIQUE,
  planet_id INTEGER REFERENCES planets,
  orbits TEXT
);

CREATE TABLE moons(
  moon_id SERIAL PRIMARY KEY UNIQUE,
  planet_id INTEGER REFERENCES planets,
  moons TEXT[]
);

INSERT INTO planets(name, galaxy)
VALUES
  ('Earth','Milky Way'),
  ('Mars','Milky Way'),
  ('Venus','Milky Way'),
  ('Neptune','Milky Way'),
  ('Proxima Centauri b','Milky Way'),
  ('Gliese 876 b','Milky Way');

INSERT INTO orbit_in_years (planet_id, orbit_time)
VALUES ('1', 1.00), ('2', 1.88), ('3', 0.62), ('4', 164.8), ('5', 0.03), ('6', 0.23);

INSERT INTO orbits_around(planet_id, orbits)
VALUES ('1', 'The Sun') , ('2', 'The Sun'), ('3', 'The Sun'), ('4', 'The Sun'), ('5', 'Proxima Centauri'), ('6', 'Gliese 876');

INSERT INTO moons(planet_id, moons)
VALUES ('1', '{"The Moon"}'),
('2', '{"Phobos", "Deimos"}'), 
('4', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}');



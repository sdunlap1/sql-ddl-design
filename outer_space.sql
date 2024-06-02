-- from the terminal run:
-- psql < outer_space.sql
DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,  -- Ensure planet names are unique
  orbital_period_in_years FLOAT NOT NULL CHECK (orbital_period_in_years > 0),  -- Ensure orbital period is greater than zero
  orbits_around TEXT NOT NULL CHECK (orbits_around <> ''),  -- Ensure orbits_around is not an empty string
  galaxy TEXT NOT NULL CHECK (galaxy <> ''),  -- Ensure galaxy is not an empty string
  moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

-- Create an index on the name column for faster searches by planet name
CREATE INDEX idx_planet_name ON planets(name);

-- Create an index on the galaxy column for faster searches by galaxy
CREATE INDEX idx_galaxy ON planets(galaxy);

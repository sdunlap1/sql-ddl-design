-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL CHECK (title <> ''),  -- Ensure title is not an empty string
  duration_in_seconds INTEGER NOT NULL CHECK (duration_in_seconds > 0),  -- Ensure duration is a positive integer
  release_date DATE NOT NULL CHECK (release_date > '1900-01-01'),  -- Ensure release_date is a valid date
  artists TEXT[] NOT NULL CHECK (array_length(artists, 1) > 0),  -- Ensure there is at least one artist
  album TEXT NOT NULL CHECK (album <> ''),  -- Ensure album is not an empty string
  producers TEXT[] NOT NULL CHECK (array_length(producers, 1) > 0)  -- Ensure there is at least one producer
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '1997-04-15', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '1975-10-31', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '1995-11-14', '{"Mariah Carey", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '2018-09-27', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '2001-08-21', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '2009-10-20', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, '2013-12-17', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '2011-06-21', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '2002-05-14', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, '1999-11-07', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

-- Create an index on the title column for faster searches by song title
CREATE INDEX idx_title ON songs(title);

-- Create an index on the album column for faster searches by album
CREATE INDEX idx_album ON songs(album);


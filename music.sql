-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs(
  song_id SERIAL PRIMARY KEY UNIQUE,
  title TEXT NOT NULL
);

CREATE TABLE duration_in_seconds(
  duration_id SERIAL PRIMARY KEY UNIQUE,
  duration INTEGER NOT NULL,
  song_id INTEGER REFERENCES songs
);

CREATE TABLE release_date(
  release_id SERIAL PRIMARY KEY UNIQUE,
  release_date DATE NOT NULL,
  song_id INTEGER REFERENCES songs
);

CREATE TABLE artists(
  artist_id SERIAL PRIMARY KEY UNIQUE,
  artist TEXT NOT NULL,
  song_id INTEGER REFERENCES songs
);

CREATE TABLE albums(
  album_id SERIAL PRIMARY KEY UNIQUE,
  album TEXT NOT NULL,
  song_id INTEGER REFERENCES songs
);

CREATE TABLE producers(
  producer_id SERIAL PRIMARY KEY UNIQUE,
  producer TEXT NOT NULL,
  song_id INTEGER REFERENCES songs
);


INSERT INTO songs
  (title)
VALUES
  ('MMMBop'),
  ('Bohemian Rhapsody'),
  ('One Sweet Day'),
  ('Shallow'),
  ('How You Remind Me'),
  ('New York State of Mind'),
  ('Dark Horse'),
  ('Moves Like Jagger'),
  ('Complicated'),
  ('Say My Name');

INSERT INTO duration_in_seconds
  (duration, song_id)
VALUES 
  (238, '1'), (355, '2'), (282, '3'), (216, '4'), (223,'5'), 
  (276,'6'), (215,'7'), (201,'8'),( 244,'9'),( 244,'10');

INSERT INTO release_date
  (release_date, song_id)
VALUES 
  ('04-15-1997', '1'), ('10-31-1975', '2'), ('11-14-1995', '3'), 
  ('09-27-2018', '4'), ('08-21-2001', '5'), ('10-20-2009', '6'), 
  ('12-17-2013', '7'), ('06-21-2011', '8'), ('05-14-2002', '9'),
  ('11-07-1999', '10');

INSERT INTO artists
  (artist, song_id)
VALUES 
  ('Hanson', '1'), 
  ('Queen', '2'), 
  ('Mariah Cary', '3'),
  ('Boyz II Men', '3'),
  ('Lady Gaga', '4'),
  ('Bradley Cooper', '4'),
  ('{"Nickelback"}', '5'), 
  ('Alicia Keys', '6'), 
  ('Jay Z', '6'),
  ('Katy Perry', '7'),
  ('Juicy J', '7'),
  ('Christina Aguilera', '8'),
  ('Maroon 5', '8'),
  ('Avril Lavigne', '9'),
  ('Destiny''s Child"', '10');

INSERT INTO albums
  (album, song_id)
VALUES 
  ('Middle of Nowhere', '1'), 
  ('A Night at the Opera', '2'), 
  ('Daydream', '3'), 
  ('A Star Is Born', '4'), 
  ('Silver Side Up', '5'), 
  ('The Blueprint 3', '6'), 
  ('Prism', '7'), 
  ('Hands All Over', '8'),
  ( 'Let Go', '9'),
  ( 'The Writing''s on the Wall', '10');

INSERT INTO producers
(producer, song_id)
VALUES 
 ('Stephen Lironi','1'),
 ('Dust Brothers', '1'),
 ('Roy Thomas Baker','2'), 
 ('Walter Afanasieff','3'), 
 ('Benjamin Rice','4'), 
 ('Rick Parashar','5'), 
 ('Al Shux','6'), 
 ('Max Martin','7'), 
 ('Cirkut','7'),
 ('Benny Blanco','8'),
 ('Shellback', '8'),
 ('The Matrix','9'),
 ('Darkchild','10');


DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db


CREATE TABLE categories
(
    cats_id SERIAL PRIMARY KEY UNIQUE,
    cat_name TEXT NOT NULL 
);


CREATE TABLE regions 
(
    regions_id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users
(
    users_id SERIAL PRIMARY KEY UNIQUE,
    username VARCHAR(12) NOT NULL,
    region TEXT
);

CREATE TABLE posts 
(
    posts_id SERIAL PRIMARY KEY UNIQUE,
    title TEXT,
    txt TEXT,
    users_id INTEGER REFERENCES users,
    post_location TEXT,
    region_id INTEGER REFERENCES regions,
    cats_id INTEGER REFERENCES categories
);


INSERT INTO categories (cat_name)
VALUES ('Jobs'), ('Housing'), ('Community'),
('Services'), ('Discussion Forums'), ('Gigs');

INSERT INTO users (username, region)
VALUES ('milo', 'San Diego'), 
('marteen', 'Sofia'),
('sam_i_am', 'Tulum');

INSERT INTO regions (region_name)
VALUES ('New York'), ('Sofia'), ('Tulum'), ('San Diego');

INSERT INTO posts (title, txt, users_id, post_location, region_id, cats_id)
VALUES 
('Kittens for addoption', 'I have 4 Kittens to give away','1','Brooklyn','1','1');


-- I tried to reference the region name instead of the associated ID but it keeps raising an error even though
-- I followed the videos exactly...



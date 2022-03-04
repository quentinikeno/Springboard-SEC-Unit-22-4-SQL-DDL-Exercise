-- Part Two: Craigslist

DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users_region (
    user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
    region_id INTEGER NOT NULL REFERENCES region ON DELETE SET NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
    location TEXT NOT NULL,
    region_id INTEGER NOT NULL REFERENCES region ON DELETE SET NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    post_id INTEGER NOT NULL REFERENCES posts ON DELETE CASCADE
);

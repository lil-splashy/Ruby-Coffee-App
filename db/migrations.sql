DROP DATABASE IF EXISTS coffee_recipes;
CREATE DATABASE coffee_recipes;

--Connect to DB
\c coffee_recipes

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username VARCHAR(32),
	password_digest VARCHAR(60)
);

CREATE TABLE recipes(
	id SERIAL PRIMARY KEY,
	drink_name VARCHAR(60),
	recipe VARCHAR(255)
	user_id INTEGER REFERENCES users(id) --foreign key
);
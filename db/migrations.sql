DROP DATABASE IF EXISTS coffee_recipes;
CREATE DATABASE coffee_recipes;

\c coffee_recipes

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username VARCHAR(32),
	password_digest VARCHAR(60)
);

CREATE TABLE recipes(
	id SERIAL PRIMARY KEY,
	drink_name VARCHAR(60),
	body VARCHAR(255),
	user_id INTEGER REFERENCES users(id) 
);

CREATE TABLE ratings(
	id SERIAL PRIMARY KEY,
	rating SMALLINT, 				
	recipe_id INTEGER REFERENCES recipes(id),
	user_id INTEGER REFERENCES users(id) 
);
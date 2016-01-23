CREATE DATABASE IF NOT EXISTS gopher;

USE gopher;

CREATE TABLE IF NOT EXISTS countries (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	country VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS addresses (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	country_id INT unsigned,
	city VARCHAR(50),
	street_address_1 VARCHAR(50),
	street_address_2 VARCHAR(50),
	postal_code VARCHAR(6),
	territory VARCHAR(20),
	PRIMARY KEY (id),
	FOREIGN KEY (country_id)
		REFERENCES countries (id)
);

CREATE TABLE IF NOT EXISTS users (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
	name_first VARCHAR(50),
	name_last VARCHAR(50),
	email VARCHAR(50),
	address_id_home INT unsigned,
	address_id_work INT unsigned,
	phone_home VARCHAR(20),
	phone_mobile VARCHAR(20),
	phone_work VARCHAR(20),
	password VARCHAR(50),
	date_joined TIMESTAMP,
    PRIMARY KEY (id),
	FOREIGN KEY (address_id_home)
		REFERENCES addresses (id),
	FOREIGN KEY (address_id_work)
		REFERENCES addresses (id)
);

CREATE TABLE IF NOT EXISTS transactions (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	user_id_customer INT unsigned,
	user_id_gopher INT unsigned,
	date_created TIMESTAMP,
	date_completed TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id_customer)
		REFERENCES users (id),
	FOREIGN KEY (user_id_gopher)
		REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS tasks (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	transaction_id INT unsigned,
	date_initiated TIMESTAMP,
	date_completed TIMESTAMP,
	deadline TIMESTAMP,
	reward VARCHAR(50),
	category VARCHAR(50),
	address_id_location INT unsigned,
	status VARCHAR(50),
	importance VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (address_id_location)
		REFERENCES addresses (id),
	FOREIGN KEY (transaction_id)
		REFERENCES transactions (id)
);

CREATE TABLE IF NOT EXISTS ratings (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	user_rated INT unsigned,
	user_rating INT unsigned,
	rating INT,
	comments VARCHAR(200),
	date_created TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_rated)
		REFERENCES users (id),
	FOREIGN KEY (user_rating)
		REFERENCES users (id)
);
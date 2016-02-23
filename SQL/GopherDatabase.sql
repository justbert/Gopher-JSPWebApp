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
    is_admin BOOLEAN default false,
    PRIMARY KEY (id),
	FOREIGN KEY (address_id_home)
		REFERENCES addresses (id),
	FOREIGN KEY (address_id_work)
		REFERENCES addresses (id)
);

CREATE TABLE IF NOT EXISTS errands (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	user_id_customer INT unsigned,
	user_id_gopher INT unsigned,
	date_created TIMESTAMP,
	date_completed TIMESTAMP,
    reward_id INT unsigned,
    deadline TIMESTAMP,
    status VARCHAR(200),
	importance VARCHAR(50),
	category VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id_customer)
		REFERENCES users (id),
	FOREIGN KEY (user_id_gopher)
		REFERENCES users (id),
	FOREIGN KEY (rating_id)
		REFERENCES ratings (id)
);

CREATE TABLE IF NOT EXISTS rewards(
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    reward_value numeric(15,2) default NULL,
    address_id INT unsigned,
    description VARCHAR(2000),
    PRIMARY KEY (id),
    FOREIGN KEY (address_id)
		REFERENCES addresses (id)
);

CREATE TABLE IF NOT EXISTS notifications (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    title VARCHAR(50),
    receiving_user_id INT unsigned,
    type INT,
    PRIMARY KEY (id),
    FOREIGN KEY (receiving_user_id) 
    	REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS tasks (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
	errand_id INT unsigned,
    date_created TIMESTAMP,
	date_initiated TIMESTAMP,
	date_completed TIMESTAMP,
	address_id INT unsigned,
	is_active boolean,
    description VARCHAR(2000),
	PRIMARY KEY (id),
	FOREIGN KEY (address_id)
		REFERENCES addresses (id),
	FOREIGN KEY (errand_id)
		REFERENCES errands (id)
);

CREATE TABLE IF NOT EXISTS ratings (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	user_rated_id INT unsigned,
	user_rater_id INT unsigned,
    errand_id INT unsigned,
	rating INT,
	comments VARCHAR(200),
	date_created TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_rated_id)
		REFERENCES users (id),
	FOREIGN KEY (user_rater_id)
		REFERENCES users (id),
	FOREIGN KEY (errand_id) 
		REFERENCES errands(id)
);
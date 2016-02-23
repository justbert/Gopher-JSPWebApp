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
	streetAddress1 VARCHAR(50),
	streetAddress2 VARCHAR(50),
	postalCode VARCHAR(6),
	territory VARCHAR(20),
	PRIMARY KEY (id),
	FOREIGN KEY (countryID)
		REFERENCES countries (id)
);

CREATE TABLE IF NOT EXISTS users (
    id INT unsigned NOT NULL AUTO_INCREMENT,
	nameFirst VARCHAR(50),
	nameLast VARCHAR(50),
	email VARCHAR(50) NOT NULL UNIQUE,
	addressIDHome INT unsigned,
	addressIDWork INT unsigned,
	phoneHome VARCHAR(20),
	phoneMobile VARCHAR(20),
	phoneWork VARCHAR(20),
	password CHAR(128),
	salt CHAR(32),
	dateJoined TIMESTAMP,
    PRIMARY KEY (id),
	FOREIGN KEY (addressIDHome)
		REFERENCES addresses (id),
	FOREIGN KEY (addressIDWork)
		REFERENCES addresses (id)
);

CREATE TABLE IF NOT EXISTS transactions (
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
	FOREIGN KEY (userIDCustomer)
		REFERENCES users (id),s
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
	transactionID INT unsigned,
	dateCreated TIMESTAMP,
	dateInitiated TIMESTAMP,
	dateCompleted TIMESTAMP,
	deadline TIMESTAMP,
	addressIDLocation INT unsigned,
	status VARCHAR(50),
	importance VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (addressIDLocation)
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
	dateCreated TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_rated_id)
		REFERENCES users (id),
	FOREIGN KEY (user_rater_id)
		REFERENCES users (id),
	FOREIGN KEY (errand_id) 
		REFERENCES errands(id)
);
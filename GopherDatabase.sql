CREATE DATABASE IF NOT EXISTS gopher;

USE gopher;

CREATE TABLE IF NOT EXISTS countries (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	country VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS addresses (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	countryID INT unsigned,
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
    username VARCHAR(50) NOT NULL,
	nameFirst VARCHAR(50),
	nameLast VARCHAR(50),
	email VARCHAR(50),
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
	userIDCustomer INT unsigned,
	userIDGopher INT unsigned,
	dateCreated TIMESTAMP,
	dateCompleted TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (userIDCustomer)
		REFERENCES users (id),
	FOREIGN KEY (userIDGopher)
		REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS tasks (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	transactionID INT unsigned,
	dateInitiated TIMESTAMP,
	dateCompleted TIMESTAMP,
	deadline TIMESTAMP,
	reward VARCHAR(50),
	category VARCHAR(50),
	addressIDLocation INT unsigned,
	status VARCHAR(50),
	importance VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (addressIDLocation)
		REFERENCES addresses (id),
	FOREIGN KEY (transactionID)
		REFERENCES transactions (id)
);

CREATE TABLE IF NOT EXISTS ratings (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	userRated INT unsigned,
	userRating INT unsigned,
	rating INT,
	comments VARCHAR(200),
	dateCreated TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (userRated)
		REFERENCES users (id),
	FOREIGN KEY (userRating)
		REFERENCES users (id)
);
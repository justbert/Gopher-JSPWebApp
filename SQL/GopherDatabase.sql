CREATE DATABASE IF NOT EXISTS gopher;

USE gopher;

CREATE TABLE IF NOT EXISTS countries (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	country VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS addresses (
	address_id INT unsigned NOT NULL AUTO_INCREMENT,
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
    reward_id INT,
    deadline TIMESTAMP,
    task_status varchar(200),
	importance VARCHAR(50),
    reward VARCHAR(50),
	category VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id_customer)
		REFERENCES users (id),
	FOREIGN KEY (user_id_gopher)
		REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS rewards(
	id INT unsigned NOT NULL AUTO_INCREMENT,
    reward_name varchar(100),
    reward_value numeric(15,2) default NULL,
    reward_address INT,
    reward_description varchar(2000),
    foreign key (reward_address)
		REFERENCES addresses (id)
);

CREATE TABLE IF NOT EXISTS errands_tasks(
	task_id INT,
    errand_id INT,
    errands_tasks_id INT unsigned NOT NULL AUTO_INCREMENT,
    primary key (errands_tasks_id),
    FOREIGN KEY (task_id)
		REFERENCES tasks (id),
	FOREIGN KEY (errand_id)
		REFERENCES errand(id)
);

CREATE TABLE IF NOT EXISTS notifications (
	id INT unsigned NOT NULL AUTO_INCREMENT,
    title VARCHAR(50),
    receiving_user_id INT,
    type INT,
    foreign key (receiving_user_id) REFERENCES users(id)
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
	FOREIGN KEY (transaction_id)
		REFERENCES transactions (id)
);

CREATE TABLE IF NOT EXISTS ratings (
	id INT unsigned NOT NULL AUTO_INCREMENT,
	user_rated INT unsigned,
	user_rating INT unsigned,
    task_id INT unsigned,
	rating INT,
	comments VARCHAR(200),
	date_created TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_rated)
		REFERENCES users (id),
	FOREIGN KEY (user_rating)
		REFERENCES users (id),
	FOREIGN KEY (task_id) references tasks(id)
);
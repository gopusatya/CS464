CREATE DATABASE IF NOT EXISTS cs_464;
USE cs_464;

CREATE TABLE IF NOT EXISTS companies(
	company_id int NOT NULL auto_increment,	
	company_name varchar(50) NOT NULL,
	hq_address varchar(250) NOT NULL,
	date_creation date NOT NULL,
	country varchar(50) NOT NULL,
	PRIMARY KEY (company_id)
);

CREATE TABLE IF NOT EXISTS categories(
	category_name varchar(100) NOT NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	deleted_at timestamp,
	PRIMARY KEY (category_name)
);

CREATE TABLE IF NOT EXISTS products(
	product_id int NOT NULL auto_increment,
	company_id int,
	name varchar(3000) NOT NULL,
	picture varchar(500) NOT NULL,
	description varchar(5000) NOT NULL,
	price decimal(10, 2) unsigned NOT NULL,
	quantity_in_stock int NOT NULL DEFAULT 0,
	category_name varchar(100),
	PRIMARY KEY (product_id),
	FOREIGN KEY (company_id) REFERENCES companies(company_id) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (category_name) REFERENCES categories(category_name) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS items(
	item_id int NOT NULL auto_increment,
	quantity int NOT NULL DEFAULT 1,
	product_id int,
	PRIMARY KEY (item_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS users(
	email varchar(100) NOT NULL,
	phone_number varchar(17) NOT NULL,
	lastname varchar(20) NOT NULL,
	firstname varchar(20) NOT NULL,
	date_birth date NOT NULL,
	type varchar(20) NOT NULL DEFAULT 'client',
	created_at timestamp NOT NULL,
	sex char(1) NOT NULL,
	password char(32) NOT NULL,
	default_address_id int,
	PRIMARY KEY (email)
);

CREATE TABLE IF NOT EXISTS demographics(
	zip varchar(20) NOT NULL,
	country varchar(50) NOT NULL,
	state varchar(30) NOT NULL,
	city varchar(50) NOT NULL,
	PRIMARY KEY (zip, country)
);

CREATE TABLE IF NOT EXISTS addresses( 
	address_id int NOT NULL auto_increment,
	email varchar(100),
	street varchar(100) NOT NULL,
	apartment varchar(10),
	country varchar(50),
	zip varchar(20),
	PRIMARY KEY (address_id),
	FOREIGN KEY (email) REFERENCES users(email) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (zip, country) REFERENCES demographics(zip, country) ON DELETE SET NULL ON UPDATE CASCADE
);

ALTER TABLE users ADD FOREIGN KEY (default_address_id) REFERENCES addresses(address_id) ON UPDATE CASCADE ON DELETE SET NULL;

CREATE TABLE IF NOT EXISTS deliveries(
	delivery_id int NOT NULL auto_increment,
	delivered_at timestamp,
	shipped_at timestamp,
	type varchar(100) DEFAULT '3 days',
	address_id int,
	PRIMARY KEY (delivery_id),
	FOREIGN KEY (address_id) REFERENCES addresses(address_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS orders(
	order_id int NOT NULL auto_increment,
	status varchar(30) NOT NULL DEFAULT 'in process',
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	delivery_id int NOT NULL,
	item_id int,
	email varchar(100),
	PRIMARY KEY (order_id),
	FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (email) REFERENCES users(email) ON DELETE SET NULL ON UPDATE CASCADE
);
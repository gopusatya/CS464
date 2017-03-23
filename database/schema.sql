CREATE DATABASE IF NOT EXISTS cs464;

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
	created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	deleted_at datetime,
	PRIMARY KEY (category_name)
);

CREATE TABLE IF NOT EXISTS products(
	product_id int NOT NULL auto_increment,
	company_id int NOT NULL,
	name varchar(30) NOT NULL,
	picture varchar(500) NOT NULL,
	description varchar(100) NOT NULL,
	price decimal(10, 2) unsigned NOT NULL,
	quantity_in_stock int NOT NULL DEFAULT 0,
	category_name varchar(100),
	PRIMARY KEY (product_id),
	FOREIGN KEY (company_id), REFERENCES companies(company_id),
	FOREIGN KEY (category_name), REFERENCES categories(category_name)
);

CREATE TABLE IF NOT EXISTS items(
	item_id int NOT NULL auto_increment,
	quantity int NOT NULL DEFAULT 1,
	product_id int NOT NULL,
	PRIMARY KEY (item_id),
	FOREIGN KEY (product_id), REFERENCES products(product_id)
);


CREATE TABLE IF NOT EXISTS users(
	email varchar(100) NOT NULL,
	phone_number char(10) NOT NULL,
	lastname varchar(20) NOT NULL,
	firstname varchar(20) NOT NULL,
	date_birth date NOT NULL,
	type varchar(5) NOT NULL DEFAULT 'client',
	created_at datetime NOT NULL,
	sex char(1) NOT NULL,
	password char(32) NOT NULL,
	default_address_id int NOT NULL,
	PRIMARY KEY (email),
	FOREIGN KEY (default_address_id), REFERENCES addresses(default_address_id)
);


CREATE TABLE IF NOT EXISTS addresses( 
	address_id int NOT NULL auto_increment,
	email varchar(100) NOT NULL,
	street varchar(100) NOT NULL,
	apartment varchar(10) NOT NULL,
	country varchar(50) NOT NULL,
	zip int NOT NULL,
	PRIMARY KEY (address_id),
	FOREIGN KEY (email), REFERENCES users(email)
);


CREATE TABLE IF NOT EXISTS deliveries(
	delivery_id int NOT NULL auto_increment,
	delivered_at datetime,
	shipped_at datetime,
	type varchar(100) DEFAULT '3 days',
	address_id int NOT NULL,
	PRIMARY KEY (delivery_id),
	FOREIGN KEY (address_id), REFERENCES addresses(address_id)
);


CREATE TABLE IF NOT EXISTS orders(
	order_id int NOT NULL auto_increment,
	status varchar(30) NOT NULL DEFAULT 'in process',
	created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	delivery_id int NOT NULL,
	item_id int NOT NULL,
	email varchar(100),
	PRIMARY KEY (order_id),
	FOREIGN KEY (item_id), REFERENCES items(item_id),
	FOREIGN KEY (email), REFERENCES users(email)
);


CREATE TABLE IF NOT EXISTS demographics(
	zip varchar(20) NOT NULL,
	country varchar(50) NOT NULL,
	state varchar(30) NOT NULL,
	city varchar(50) NOT NULL,
	PRIMARY KEY (zip),
);	 																					


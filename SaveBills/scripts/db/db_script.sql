# Database : MySQL

CREATE DATABASE billrack;

USE billrack;

# Tables
#use billrack;

CREATE TABLE savebills_user
(
	user_id BIGINT AUTO_INCREMENT ,
	email_id VARCHAR(255),  
	password VARCHAR(45),   
	first_name VARCHAR(255) NULL ,
	last_name VARCHAR(255) NULL ,
	authentication_provider_id INT NULL,
	PRIMARY KEY (user_id) 
	FOREIGN KEY (authentication_provider_id) REFERENCES authentication_provider (authentication_provider_id)
);

CREATE TABLE savebills_authentication_provider
(
	authentication_provider_id INT,
	authentication_provider_name VARCHAR(255);
	authentication_provider_desc VARCHAR(255);
	PRIMARY KEY (authentication_provider_id)
);


CREATE TABLE savebills_bill
(
	bill_id BIGINT AUTO_INCREMENT,
	bill_number VARCHAR(255),
	bill_name VARCHAR(255),
	bill_image VARCHAR(255),
	PRIMARY KEY (bill_id) 
);



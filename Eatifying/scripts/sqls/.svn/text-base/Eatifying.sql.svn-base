# Database : MySQL

CREATE DATABASE eatifying;

USE eatifying;

# Tables
#use Eatifying;


CREATE TABLE customer_user_address
(
	customer_user_address_id BIGINT AUTO_INCREMENT,
	customer_user_id BIGINT,
	address_line1 VARCHAR(100) NOT NULL,
	address_line2 VARCHAR(100),
	place_name VARCHAR(100) NOT NULL,
	city_name VARCHAR(50) NOT NULL,
	zipcode INT NOT NULL,
	directions VARCHAR(1000),
	latitude FLOAT NOT NULL,
	longitude FLOAT NOT NULL,
	address_name VARCHAR(100) NOT NULL, #Home/Office
	PRIMARY KEY (customer_user_address_id)
);


CREATE TABLE customer_user
(
	customer_user_id BIGINT AUTO_INCREMENT ,
	customer_email_id VARCHAR(255),  #if '-' then not logged in user
	customer_password VARCHAR(45),    #if '-' then not logged in user
	customer_first_name VARCHAR(255) NOT NULL ,
	customer_last_name VARCHAR(255) NOT NULL ,
	#customer_user_address_id BIGINT NOT NULL,
	customer_phone VARCHAR(12) NOT NULL, #use phone number to check if user has logged in again
	PRIMARY KEY (customer_user_id) 
	#,
	#CONSTRAINT fk_customer_user_address 
	#FOREIGN KEY fk_user_address(customer_user_address_id) 
	#REFERENCES customer_user_address (customer_user_address_id)
);

CREATE TABLE restaurant_address
(
	restaurant_address_id BIGINT AUTO_INCREMENT,
	address_line1 VARCHAR(100) NOT NULL,
	address_line2 VARCHAR(100),
	place_name VARCHAR(100) NOT NULL,
	city_name VARCHAR(50) NOT NULL,
	zipcode INT NOT NULL,
	directions VARCHAR(1000),
	latitude FLOAT NOT NULL,
	longitude FLOAT NOT NULL,
	PRIMARY KEY (restaurant_address_id)
);

CREATE TABLE restaurant
(
	restaurant_id BIGINT AUTO_INCREMENT ,
	restaurant_name VARCHAR(255) NOT NULL ,  
	restaurant_email_id VARCHAR(255),
	restaurant_address_id BIGINT NOT NULL,
	restaurant_phone VARCHAR(50) NOT NULL, 
	PRIMARY KEY (restaurant_id) ,
	CONSTRAINT fk_restaurant_address 
	FOREIGN KEY fk_restaurant_address(restaurant_address_id) 
	REFERENCES restaurant_address (restaurant_address_id)
);

CREATE  TABLE restaurant_menu_item_category 
(
  category_id INT NOT NULL AUTO_INCREMENT ,
  category_name VARCHAR(100) NOT NULL ,
  PRIMARY KEY (category_id) 
);

CREATE TABLE restaurant_menu_details
(
	restaurant_menu_id BIGINT AUTO_INCREMENT,
	restaurant_id BIGINT NOT NULL,
	added_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL,
	PRIMARY KEY (restaurant_menu_id,restaurant_id),
	FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id)
);

CREATE TABLE restaurant_min_amount_map
(
	restaurant_min_map_id INT AUTO_INCREMENT,
	restaurant_id INT,
	distance FLOAT NOT NULL,
	min_amount float NOT NULL,
	PRIMARY KEY (restaurant_min_map_id,restaurant_id)
);

CREATE TABLE cusine_type
(
	cusine_id INT AUTO_INCREMENT,
	cusine_name VARCHAR(255) NOT NULL,
	cusine_description VARCHAR(1000),
	PRIMARY KEY (cusine_id)
);

CREATE TABLE cost_type
(
	cost_type_id INT AUTO_INCREMENT,
	cost_type_name VARCHAR(255) NOT NULL,
	cost_description VARCHAR(1000), #<500
	PRIMARY KEY (cost_type_id)
);

CREATE TABLE rating_details
(
	rating_id INT AUTO_INCREMENT,
	rating_name VARCHAR(255) NOT NULL,
	rating_description VARCHAR(1000),
	PRIMARY KEY (rating_id)
);

CREATE TABLE restaurant_details
(
	restaurant_id BIGINT NOT NULL,
	about_restaurant_gist VARCHAR(500) NOT NULL,
	about_restaurant VARCHAR(5000),   # use BLOB
	restaurant_website VARCHAR(255),
	restaurant_menu_id BIGINT NOT NULL,
	opening_time TIME NOT NULL,
	closing_time TIME NOT NULL,
	cost_type_id INT NOT NULL,
	delivery_time INT NOT NULL, # in minutes
	cusine_id INT NOT NULL,
	rating_id INT NOT NULL,
	restaurant_added_date DATETIME NOT NULL,
    PRIMARY KEY (restaurant_id),
	FOREIGN KEY (restaurant_id)	REFERENCES restaurant (restaurant_id),
	FOREIGN KEY (restaurant_menu_id) REFERENCES restaurant_menu_details (restaurant_menu_id),
	FOREIGN KEY (cusine_id) REFERENCES cusine_type (cusine_id)
);



CREATE TABLE restaurant_cusine_map
(
	restaurant_id BIGINT,
	cusine_id INT,
	PRIMARY KEY (restaurant_id,cusine_id),
	FOREIGN KEY (cusine_id) REFERENCES cusine_type (cusine_id),
	FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id)
);

CREATE TABLE restaurant_menu
(
	item_id BIGINT AUTO_INCREMENT,
	restaurant_menu_id BIGINT,
	item_name VARCHAR(500) NOT NULL,
	category_id INT NOT NULL, 
	cusine_id INT NOT NULL,
	sort_order INT NOT NULL,
	description VARCHAR(1000), #we can improve this to description id and store all details abt item
	price FLOAT NOT NULL,
	taste_type VARCHAR(50),
	number_of_times_ordered INT NOT NULL,
	likes INT NOT NULL,
    PRIMARY KEY (item_id,restaurant_menu_id),
	FOREIGN KEY (restaurant_menu_id) REFERENCES restaurant_menu_details (restaurant_menu_id),
	FOREIGN KEY (cusine_id) REFERENCES cusine_type (cusine_id),
	FOREIGN KEY (category_id) REFERENCES restaurant_menu_item_category (category_id)
);


CREATE TABLE  customer_order
(
	order_id BIGINT,
	order_time DATETIME NOT NULL,
	user_confirmation_code VARCHAR(10) NOT NULL,
	customer_user_id BIGINT NOT NULL,
	restaurant_confirmation_code VARCHAR(10) NOT NULL,
	restaurant_id BIGINT NOT NULL,
	total_amount FLOAT NOT NULL,
	status VARCHAR(50) NOT NULL, #success/failure
	PRIMARY KEY (order_id, restaurant_id),
	FOREIGN KEY (customer_user_id) REFERENCES customer_user (customer_user_id),
	FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id)
);

CREATE TABLE order_details
(
	order_id BIGINT ,
	item_id BIGINT NOT NULL,
	quantity VARCHAR(10) NOT NULL,
	total_amount FLOAT NOT NULL,
	restaurant_id BIGINT NOT NULL,
	PRIMARY KEY (order_id,item_id),
	FOREIGN KEY (order_id) REFERENCES customer_order (order_id),
	FOREIGN KEY (item_id) REFERENCES restaurant_menu (item_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id)
);


CREATE TABLE user_stat_details
(
	customer_user_id BIGINT NOT NULL,
	first_login_time DATETIME NOT NULL,
	last_login_time DATETIME NOT NULL,
	number_of_times_ordered INT NOT NULL,
	number_of_successful_orders INT NOT NULL,
	number_of_failed_orders INT NOT NULL,
	FOREIGN KEY (customer_user_id) REFERENCES customer_user (customer_user_id)
);

--format
CREATE TABLE `review_source` (
 `source_id` int(11) NOT NULL,
 `source` varchar(100) DEFAULT NULL,
 `source_website` varchar(45) DEFAULT NULL,
 PRIMARY KEY (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `restaurant_reviews` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `source_id` int(11) DEFAULT NULL,
 `review` text,
 `restaurant_id` bigint(20) DEFAULT NULL,
 `user` varchar(100) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK1` (`source_id`),
 KEY `FK2` (`restaurant_id`),
 CONSTRAINT `FK1` FOREIGN KEY (`source_id`) REFERENCES
`review_source` (`source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
 CONSTRAINT `FK2` FOREIGN KEY (`restaurant_id`) REFERENCES
`restaurant` (`restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

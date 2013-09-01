
use Eatifying;

select * from
restaurant_address;

insert into restaurant_address(address_line1,address_line2,place_name,city_name,zipcode,directions,latitude,longitude)
VALUES('Plot No.1-99/14/A Madhina Plaza','','madhapur','hyderabad',500081,
'opposite to madhapur petrol pump',17.4198569,78.3590543);


select * from
Restaurant;

insert into restaurant(restaurant_name,restaurant_email_id,restaurant_address_id,restaurant_phone) values
('Shanghai Chef','',1,04066786661);

select * from
restaurant_menu_details;

insert into restaurant_menu_details(restaurant_id,added_time,updated_time)
values(1,CURDATE(),CURDATE());

select * from
restaurant_min_amount_map;


insert into restaurant_min_amount_map(restaurant_id,distance,min_amount)
values(1,5,300);

select * from 
restaurant_menu_item_category;

insert into restaurant_menu_item_category
(category_name)
values
('Main Course');
insert into restaurant_menu_item_category
(category_name)
values
('Starters');

select * from
cusine_type;

INSERT INTO Eatifying.cusine_type(cusine_name,cusine_description) VALUES('Italian','Italian');
INSERT INTO Eatifying.cusine_type(cusine_name,cusine_description) VALUES('North Indian','North Indian');
INSERT INTO Eatifying.cusine_type(cusine_name,cusine_description) VALUES('South Indian','South Indian');

select * from
rating_details;

INSERT INTO Eatifying.rating_details (rating_name,rating_description) VALUES('poor','poor');
INSERT INTO Eatifying.rating_details (rating_name,rating_description) VALUES('average','average');
INSERT INTO Eatifying.rating_details (rating_name,rating_description) VALUES('good','good');
INSERT INTO Eatifying.rating_details (rating_name,rating_description) VALUES('Excellent','Excellent');

select * from
cost_type;

INSERT INTO Eatifying.cost_type (cost_type_name,cost_description) VALUES('cheap','<150 for a user');
INSERT INTO Eatifying.cost_type (cost_type_name,cost_description) VALUES('medium','150 to 300 for a user');
INSERT INTO Eatifying.cost_type (cost_type_name,cost_description) VALUES('medium high','300 to 500');
INSERT INTO Eatifying.cost_type (cost_type_name,cost_description) VALUES('costly','more than 500 for a user');


select * from
restaurant_menu;


insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Chicken Fried Rice',1,1,1,'',100.0,'normal spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Veg Fried Rice',1,1,1,'',100.0,'normal spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Brown Garlic Chicken',1,1,1,'',150.0,'Spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Red Chilli Chicken',1,1,1,'',125.0,'Spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Red Chilli Lamb',1,1,1,'',200.0,'Spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Thai Roasted Chicken',1,1,1,'',160.0,'Spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Shredded Chicken in Oriental Suase',1,1,1,'',180.0,'Normal Spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Chicken in Bar-B-Q-Sause',1,1,1,'',220.0,'Medium Spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Black Pepper Chicken',1,1,1,'',280.0,'Medium Spicy',0,0);
insert into restaurant_menu
(restaurant_menu_id,item_name,category_id,sort_order,cusine_id,description,price,taste_type,number_of_times_ordered,likes)
values
(1,'Black Pepper Fish',1,1,1,'',300.0,'spicy',0,0);



select * from
restaurant_details;

insert into restaurant_details 
(restaurant_id,about_restaurant_gist,about_restaurant,restaurant_website,restaurant_menu_id,opening_time,
closing_time,cost_type_id,delivery_time,cusine_id,rating_id,restaurant_added_date)
values
(1,'Chinese Restaurant','Chinese Restaurant','www.shanghaichef.com',1,'11:00:00',
'23:00:00',3,30,1,3,CURDATE());

select * from 
customer_user;

insert into 
customer_user (`customer_email_id`, `customer_password`, `customer_first_name`, `customer_last_name`, `customer_phone`) VALUES ('narayan.hd@gmail.com', 'pass', 'Narayanan', 'Vijayaraghavan', '9030985465');



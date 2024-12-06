DROP SCHEMA IF EXISTS torg CASCADE;
CREATE SCHEMA torg;
Set search_path = 'torg';

CREATE TABLE product(
	article int primary key,
	name varchar(75) not null,
	category varchar(75) not null,
	cost decimal not null,
	img text,
	units_of_product varchar(10) not null,
	date_of_product TIMESTAMP not null,
	expiration_date TIMESTAMP not null,
	firm varchar(75) not null,
	country varchar(75) not null
);

Create table users (
	id_user int primary key,
	name varchar(50) not null,
	surname varchar(75) not null,
	patronymic varchar(75),
	number_phone varchar(20) not null,
	email varchar(75) not null
);
CREATE TABLE addres(
	id serial primary key,
	city varchar(75) not null,
	street varchar(75) not null,
	home int not null,
	apartament int not null
);
CREATE TABLE emploers (
	id_emploers serial primary key,
	name varchar(50) not null,
	surname varchar(75) not null,
	patronymic varchar(75),
	birthday TIMESTAMP not null,
	number_phone varchar(20) not null,
	id_adders int REFERENCES addres(id) 
);
CREATE TABLE bid (
	id_bid int primary key,
	id_users int REFERENCES users(id_user),
	id_produkts int REFERENCES product(article),
	status varchar(10) not null
);
CREATE TABLE sale(
	id_sale int primary key,
	date_sale timestamp not null,
	patment_method varchar(25) not null,
	id_emploer int REFERENCES emploers(id_emploers),
	id_user int REFERENCES users(id_user),
	id_produkts int REFERENCES product(article)
);
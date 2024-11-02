DROP SCHEMA IF EXISTS ofh cascade;
CREATE SCHEMA IF NOT EXISTS ofh;
SET search_path = 'ofh';

CREATE SEQUENCE IF NOT EXISTS sq_idpurchase;

CREATE TABLE IF NOT EXISTS purchase
(
	idPurchase int not null primary key default(nextval('sq_idpurchase')),
	need bool not null,
	tipe_thing varchar(75) not null,
	supplier varchar(500) not null,
	composition_purchase varchar(500) not null
);

CREATE SEQUENCE IF NOT EXISTS sq_idstorage;

CREATE TABLE IF NOT EXISTS "storage"
(
	idStorage int not null primary key default(nextval('sq_idstorage')) UNIQUE,
	id_purchase int references purchase (idPurchase),
	addres varchar(500) not null,
	tipe_thing varchar(150) not null,
	thing varchar(50) not null,
	quantity int not null
);

CREATE SEQUENCE IF NOT EXISTS sq_iddelivery;

CREATE TABLE IF NOT EXISTS delivery
(
	idDelivery int not null primary key default(nextval('sq_iddelivery')),
	id_storage int references "storage" (idStorage),
	volume int not null,
	status varchar(50) not null,
	number_cars int not null,
	delivery_date date not null
);

CREATE SEQUENCE IF NOT EXISTS sq_idemployees;

CREATE TABLE IF NOT EXISTS employees
(
    id_employee int not null primary key default(nextval('sq_idemployees')),
    full_name varchar(150) not null,
    status varchar(50) not null, 
    direction varchar(50) not null,
    job_title varchar(50) not null
);

CREATE SEQUENCE IF NOT EXISTS sq_idarea;

CREATE TABLE IF NOT EXISTS area
(
	idArea int not null primary key default(nextval('sq_idarea')),
	cost int not null,
	size int not null, 
	addres varchar(100) not null,
	tipe_area varchar(50) not null,
	owner_area varchar(150) not null
);

CREATE SEQUENCE IF NOT EXISTS sq_idorder;

CREATE TABLE IF NOT EXISTS "order"
(
	idOrder int not null primary key default(nextval('sq_idorder')),
	id_delivery int not null references delivery (idDelivery),
	id_area int not null references area (idArea),
	id_employees int not null references employees (id_employee),
	subject_matter varchar(50) not null,
	maximum_asmount int not null,
	total_cost int not null,
	delivery_date date not null, 
	description varchar(500)
);

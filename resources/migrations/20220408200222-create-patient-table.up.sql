CREATE TABLE patient
(id SERIAL PRIMARY KEY,
 first_name varchar(100),
 second_name varchar(100),
 middle_name varchar(100),
 gender varchar(30),
 birthday_date varchar(100),
 address_name text,
 policy_number varchar(16));
-- :name create-patient! :! :n
INSERT INTO patient
(first_name, second_name, middle_name, gender, 
birthday_date, address_name, policy_number)
VALUES (:first_name, :second_name, :middle_name, :gender,
:birthday_date, :address_name, :policy_number);

-- :name get-patient :? :*
SELECT * FROM patient;

-- :name delete-patient! :! :n
DELETE FROM patient
WHERE id = :id;

-- :name get-current-patient :? :1
SELECT * FROM patient
WHERE id = :id;

-- :name update-current-patient! :! :n
UPDATE patient
SET first_name = :first_name, second_name = :second_name,
middle_name = :middle_name, gender = :gender, birthday_date = :birthday_date,
address_name = :address_name, policy_number = :policy_number
WHERE id = :id::int;
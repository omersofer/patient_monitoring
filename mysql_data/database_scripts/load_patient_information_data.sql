LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\patient_information.csv'
INTO TABLE patients
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patient_id, first_name, last_name, @date_of_birth, primary_physician, insurance_provider, blood_type, allergies)
SET date_of_birth = STR_TO_DATE(@date_of_birth, '%m/%d/%Y');
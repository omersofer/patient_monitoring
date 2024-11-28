CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    primary_physician VARCHAR(100),
    insurance_provider VARCHAR(100),
    blood_type VARCHAR(10),
    allergies TEXT
);
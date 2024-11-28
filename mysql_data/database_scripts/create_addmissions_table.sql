CREATE TABLE admissions (
    hospitalization_case_number INT PRIMARY KEY,
    patient_id INT,
    admission_date DATE,
    admission_time TIME,
    release_date DATE,
    release_time TIME,
    department VARCHAR(100),
    room_number VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

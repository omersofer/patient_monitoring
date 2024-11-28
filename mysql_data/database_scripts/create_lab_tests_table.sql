CREATE TABLE lab_tests (
    test_id INT PRIMARY KEY,
    patient_id INT,
    test_name VARCHAR(255),
    order_date DATE,
    order_time TIME,
    ordering_physician VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
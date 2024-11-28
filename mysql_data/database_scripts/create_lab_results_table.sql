CREATE TABLE lab_results (
    result_id INT PRIMARY KEY,
    test_id INT,
    result_value DECIMAL(10, 9),
    result_unit VARCHAR(100),
    reference_range VARCHAR(100),
    result_status VARCHAR(50),
    performed_date DATE,
    performed_time TIME,
    reviewing_physician VARCHAR(100),
    FOREIGN KEY (test_id) REFERENCES lab_tests(test_id)
);
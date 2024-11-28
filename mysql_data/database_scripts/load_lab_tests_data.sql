LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\lab_tests.csv'
INTO TABLE lab_tests
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(test_id, patient_id, test_name, @order_date, @order_time, ordering_physician)
SET 
    order_date = STR_TO_DATE(@order_date, '%m/%d/%Y'),
    order_time = STR_TO_DATE(@order_time, '%I:%i:%s %p');

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\lab_results.csv'
INTO TABLE lab_results
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(result_id, test_id, result_value, result_unit, reference_range, result_status, @performed_date, @performed_time, reviewing_physician)
SET
    performed_date = STR_TO_DATE(@performed_date, '%m/%d/%Y'),
    performed_time = STR_TO_DATE(@performed_time, '%h:%i:%s %p');

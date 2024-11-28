LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\admissions.csv'
INTO TABLE admissions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patient_id, hospitalization_case_number, @admission_date, @admission_time, release_date, @release_time, department, room_number)
SET 
    admission_date = STR_TO_DATE(@admission_date, '%m/%d/%Y'),
    admission_time = STR_TO_DATE(@admission_time, '%I:%i:%s %p'),
    release_time = STR_TO_DATE(@release_time, '%H:%i');


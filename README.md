# patient_monitoring
## How to set up and run the solution:
1. Clone the solution from the github repository: https://github.com/omersofer/patient_monitoring
2. Required installations and setup:
   1. Install Python, and then:
      1. Create virtual environment with all requirements. In "...\patient_monitoring\flask_backend\" directory:
         1. python -m venv venv
         2. .\venv\Scripts\activate
         3. pip install -r requirements.txt
   2. Install Node.js, and then:
      1. Install dependencies in "...\patient_monitoring\react_frontend\" directory:
         1. npm install
   3. Install MySQL
      1. MySQL should be installed with default values.
      2. root password shold be Aa123456 in order to work with the attached solution.
         If another password was already set, the password should be changed in backend.py file.
         * Handling user and password in a better way is included in future TODO list.
      3. Copy patient_monitoring database from "...\patient_monitoring\mysql_data\" to "C:\ProgramData\MySQL\MySQL Server 9.1\Data\" (or where your MySQL data is saved).
3. Executing the application:
   1. Run backend: ...\patient_monitoring\flask_backend\run_backend.bat
   2. Run frontend: ...\patient_monitoring\react_frontend\run_frontend.bat
* Packing the solution with Docker for an easier setup and execution is included in future TODO list.

## Design choises and rationale:
1. MySQL database:
    <br>As the data is structured, a ralational database is a good fit. In addition, a database that supports efficient querying, indexing, and filtering is important.
    <br>At first I chose PostgreSQL for my database implementation, known for its scalability and robust support for complex queries and joins.
    <br>After I encountered some setup issues with PostrgeSQL, and in order to meet the time constrains of the exercise, I decided to choose MySQL for my database implementation.
    <br>MySQL database serves similar use cases as PostgreSQL with a simpler setup, which is a good fit for the exercise.
3. Flask backend developed in Python:
	<br>Flask is a lightweight and versatile Python web framework.
	<br>In addition, python has an easy integration to MySQL databases.
	<br>Considering Python's abilities, ease of use, and my previous experience with Python, made this choise a good fit.
4. React frontend:
	<br>React is a popular JavaScript library for building user interfaces.
	<br>In addition, React works well together with Flask for the following reasons:
	- Separation of Concerns: Flask serves as a robust backend to handle business logic, data processing, and database interactions, while React focuses solely on delivering an exceptional user interface.
	- API Integration: Flask can expose RESTful APIs that React seamlessly consumes to render dynamic and real-time data on the frontend.
	- Scalability and Maintenance: The decoupled architecture allows to work on the frontend and backend independently, making the system easier to scale and maintain over time.
	- Developer Productivity: Python's simplicity and React's modularity ensure faster development cycles.
<br>Taking these considerations into account made this choise a good fit for the exercise.

## Assumptions and justifications:
1. the fields: patient_id, hospitalization_case_number, test_id are all unique.
	<br>Justification - This way the relations between the data in different tables can be determined in an unambiguous way.
	<br>Note: in lab_tests.csv, lab_results.csv tables there were two test_ids that were not unique (27687, 18861). After consulting with Tamar, we decided to remove the extra entries for these 2 test_ids.
2. Date & time formats are consistent for each date/time table column.
	<br>It is important in order to inject the data from the csv files to the database.
	<br>Justification - assuming the same system is populating the data for each table, and for the sake of the exercise, it is reasonable to assume the date and time formats are consistent between updates for each column.
3. Happy flow - all prerequisites are met, the data in the database is valid, the backend is executed before the frontend etc.
	<br>Justification - for the sake of the exercise.

## "Additional Considerations" section:
1. Unfortunately, due to the time constrains of the exercise, I didn't have time to get to this section.

## Tests description:
1. Unfortunately, due to the time constrains of the exercise, I didn't have time to add any tests.
	<br>Potential tests to add are attached in "...\patient_monitoring\documentation\Suggested_tests_by_chatgpt.txt".
	<br>I would choose the reasonable and required tests out of these suggestions.

## Considerations for productizing the code:
1. This solution is ran locally with a static database.
	<br>In order to meet the exercise time constrains, I've attached "...\patient_monitoring\documentation\productize_suggestions_by_chatgpt.txt" with suggestions for how to productize the solution.

## TODO list (important things that I didn't have time for):
1. Handle incorrect data that was loaded to the database.
   1. The following fields were not loaded correctly to the database:
      <br>patients: patient_id
      <br>lab_tests: test_id
      <br>lab_results: result_id, test_id
   2. Unfortunately, after trying to solve the issue in a reasonable time, I didn't get to a solution.
      <br>In order to meet the time constrains of the exercise, I decided to move on and put this issue as the first priority on the TODO list.
2. Add tests.
3. Handle MySQL database user & password in a better way.
4. Pack the solution with Docker for an easier setup and execution.
   <br>Instructions for how to do it (using ChatGPT) are attached in "...\patient_monitoring\documentation\Dockerizing_the_application.txt" file.
6. Add changes according to "Additional Considerations" section.

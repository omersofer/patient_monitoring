from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)  # Enable CORS for frontend-backend communication

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Aa123456',
    'database': 'patient_monitoring'
}

@app.route('/api/hospitalized-patients-new-test-required', methods=['GET'])
def get_hospitalized_patients_new_test_required():
    """
    API route to fetch hospitalized patients with no tests in the last 48 hours
    """
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT p.patient_id, p.first_name, p.last_name, a.department, a.room_number
    FROM patients p
    JOIN admissions a ON p.patient_id = a.patient_id
    WHERE a.release_date IS NULL
    AND a.release_time IS NULL
    AND NOT EXISTS (
        SELECT 1
        FROM lab_tests lt
        JOIN lab_results lr ON lt.test_id = lr.test_id
        WHERE lt.patient_id = p.patient_id
        AND STR_TO_DATE(
            CONCAT(lr.performed_date, ' ', lr.performed_time),
            '%Y-%m-%d %H:%i:%s'
        ) >= NOW() - INTERVAL 48 HOUR
    )
    ORDER BY a.department;
    """

    cursor.execute(query)
    patients = cursor.fetchall()
    conn.close()

    return jsonify(patients)

if __name__ == '__main__':
    app.run(debug=True, host='localhost', port=5000)

import React, { useEffect, useState } from 'react';
import axios from 'axios';

function App() {
  const [patients, setPatients] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:5000/api/hospitalized-patients-new-test-required')
      .then(response => {
        setPatients(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return (
    <div className="App">
      <h1>NOTE - new test is required for:</h1>
      <table border="1">
        <thead>
          <tr>
            <th>Patient ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Department</th>
            <th>Room Number</th>
          </tr>
        </thead>
        <tbody>
          {patients.map((patient) => (
            <tr key={patient.patient_id}>
              <td>{patient.patient_id}</td>
              <td>{patient.first_name}</td>
              <td>{patient.last_name}</td>
              <td>{patient.department}</td>
              <td>{patient.room_number}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default App;

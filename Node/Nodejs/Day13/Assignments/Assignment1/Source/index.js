// Create A Mogoose model design and insert record in the collection. 
// In a hospital there are different departments. Patients are treated in these departments by the doctors assigned to patients.
// Usually each patient is treated by a single doctor, but in rare cases they will have two or three.
// Healthcare assistants will also attend to patients; every department has many healthcare assistants.
// Each patient is required to take a variety of drugs during different parts of the day such as morning, afternoon and night.
// After Creating a Database design. 
// Create ORM with database first Approach. 
// Insert a Doctor - Update a Doctor - Delete a Doctor - Find a report of patient assigned to a particular doctor -
// Find a report of medicine list for a particular patient - Display summary report of Doctor and patient (use Include method).

const express = require('express');
const app = express();
app.use(express.json());

// Routes
const departroutes = require('./routes/department_routes');
const assistantroutes = require('./routes/assistant_routes');
const doctorroutes = require('./routes/doctor_routes');
const drugsroutes = require('./routes/drugs_routes');
const patientsroutes = require('./routes/patients_routes');

// Connection of mongooseCompass
const mongoose = require('mongoose');
const connection = mongoose.connect('mongodb://localhost:27017/hospital');



app.use('/department',departroutes);
app.use('/assistant',assistantroutes);
app.use('/doctor',doctorroutes);
app.use('/drug',drugsroutes);
app.use('/patient',patientsroutes);


app.listen(3001);
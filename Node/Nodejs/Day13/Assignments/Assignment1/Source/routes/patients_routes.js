const express = require('express');
const routes = express.Router();
const patientscontroller = require('../controller/patients_controller');

routes.get('/:id',patientscontroller.patients);
routes.get('/report/:id',patientscontroller.patientsreport);
routes.get('/list/:id',patientscontroller.patientlist);

module.exports = routes;
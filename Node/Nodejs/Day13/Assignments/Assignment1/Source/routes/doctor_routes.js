const express = require('express');
const routes = express.Router();
const doctorcontroller = require('../controller/doctor_controller');

routes.post('/:id',doctorcontroller.doctorCreate);
routes.put('/update/:id',doctorcontroller.doctorupdate);

module.exports = routes;
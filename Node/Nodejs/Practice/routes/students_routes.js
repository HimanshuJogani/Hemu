const express = require('express')
const routes = express.Router()
const studentscontroller = require('../controller/students_controller')
const auth = require('../middleware/authenticate')

routes.get('/',auth,studentscontroller.fetchdata);
routes.get('/std',auth,studentscontroller.std);

module.exports = routes;
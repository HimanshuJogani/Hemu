const employee = require('../controller/employee_controller');
const express = require('express');
const routes = express.Router();
const auth = require('../middleware/authentication')


routes.get('/:id/assignment/:aid',[auth],employee.assignment);

module.exports = routes;
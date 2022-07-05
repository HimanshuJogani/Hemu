const departcontroller = require('../controller/department_controller');
const express = require('express');
const routes = express.Router();


routes.get('/',departcontroller.departments);

module.exports = routes;
const express = require('express');
const routes = express.Router();
const drugscontroller = require('../controller/drugs_controller');


routes.use('/',drugscontroller.drugs);

module.exports = routes;
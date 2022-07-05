
const express = require('express');
const routes = express.Router();
const authController = require('../controller/authentication_controller');



routes.post('/login',authController.login);

module.exports = routes;
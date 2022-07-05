const express = require('express');
const routes = express.Router();
const assistantcontroller = require('../controller/assistant_controller');

routes.use('/',assistantcontroller.assistant);

module.exports = routes;
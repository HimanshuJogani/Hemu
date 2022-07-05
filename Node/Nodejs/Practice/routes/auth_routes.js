const express = require('express')
const routes = express.Router()
const authroutes = require('../controller/auth_controller')


routes.post('/',authroutes.authlogin)

module.exports = routes;






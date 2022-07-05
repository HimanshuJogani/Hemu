const express = require('express');
const router = express.Router();
const auth = require('../middleware/authentication');
const employeecontroller = require('../controller/employee_controller');

router.get('/:id/assignment/:aid',[auth],employeecontroller.assignment);

module.exports = router;
const express = require('express');
const router = express.Router();
const auth = require('../middleware/authentication');
const employeecontroller = require('../controller/employee_controller');

router.get('/:id/assignment/:aid',[auth],employeecontroller.assignment);
router.get('/:id',[auth],employeecontroller.empdelete);
router.post('/add',[auth],employeecontroller.empcreate);

module.exports = router;
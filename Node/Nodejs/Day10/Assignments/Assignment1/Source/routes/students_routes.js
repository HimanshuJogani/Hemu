const students = require('../controller/students_controller');
const express = require('express');
const router = express.Router();
const auth = require('../middleware/authentication')



router.get('/:id/fees',[auth],students.fees);
router.get('/:id/result',[auth],students.result);

module.exports = router;

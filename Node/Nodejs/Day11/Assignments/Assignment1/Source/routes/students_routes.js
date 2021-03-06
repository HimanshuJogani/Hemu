const students = require('../controller/students_controller');
const express = require('express');
const router = express.Router();
const auth = require('../middleware/authentication')



router.get('/:id/fees',[auth],students.fees);
router.get('/:id/result',[auth],students.result);
router.get('/:id',[auth],students.stddelete);
router.post('/add',[auth],students.stdcreate);

module.exports = router;

const students = require('../controller/students_controller');
const express = require('express');
const router = express.Router();
const auth = require('../middleware/authentication')



router.get('/:id/fees',students.fees);
router.get('/',students.getStudents);
router.get('/:id/result',[auth],students.result);
router.delete('/delete/:id',students.stddelete);
router.post('/add',students.stdcreate);
router.put('/update/:studentId',students.updateStudent);

module.exports = router;

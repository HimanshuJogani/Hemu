import express, {Express,Router} from 'express';
var router:Router = express.Router();
import student from '../controller/students_controller';


router.post('/add',student.addstudents);
router.get('/',student.viewStudents);
router.delete('/delete/:id',student.deleteStudents);
router.put('/update',student.updateStudents);

export = router






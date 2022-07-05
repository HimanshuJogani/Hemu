const express = require('express');
const app = express();

app.use(express.json());

const studentsroutes = require('./routes/students_routes');
const employeeroutes = require('./routes/employee_routes');
const loginroutes = require('./routes/auth_routes');

app.get('/',(req,res) => {
    res.send('Hello World!!')
})

app.use('/student',studentsroutes);
app.use('/employee',employeeroutes);
app.use('/user', loginroutes)

app.listen(3000);

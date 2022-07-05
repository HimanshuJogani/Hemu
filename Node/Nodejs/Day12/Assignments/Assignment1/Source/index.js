const express = require('express');
const app = express();

app.use(express.json());

const studentsroutes = require('./routes/students_routes');
const employeeroutes = require('./routes/employee_routes');
const loginroutes = require('./routes/auth_routes');
const mongoose = require('mongoose');

const connection = mongoose.connect('mongodb://localhost:27017/mydata');

app.get('/',(req,res)=> {
    res.send('Hello World!!')
})

app.use('/students',studentsroutes);
app.use('/user', loginroutes);
app.use('/employee',employeeroutes);


app.listen(3000);
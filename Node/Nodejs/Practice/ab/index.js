const express = require('express')
const app = express()
app.use(express.json())
const loginroutes = require('../routes/auth_routes')
const studentsroutes = require('../routes/students_routes')


app.use('/login',loginroutes);
app.use('/fetch',studentsroutes)

app.listen(3000);
const express = require('express')
const app = express()
app.use(express.json());
// const port = 3000
// const jwt = require('jsonwebtoken')
// const fs = require('fs')

// const customerlist = [
//     {name: 'a', id: 1},
//     {name: 'b', id: 2},
//     {name: 'c', id: 3}
// ]



// app.post('/', function(req, res){
//     let userdata = {
//         username: req.body.username,
//         password: req.body.password
//     };

//     if(userdata.username == 'admin' && userdata.password == 'admin'){
//             const accestoken = jwt.sign(userdata,global.config.key{
//                 algorithm: global.config.algorithm,
//                 expiresIn: global.config.expiresIn
//             })

//             res.status(200).json({
//                 token: accestoken,
//                 message: 'Login Successful'
//             })
//     }else{
//         res.status(401).json({
//             message: 'Login Failed'
//         })
//     }
// })





// app.listen(port, () => console.log(`Example app listening on port ${port}!`))


const mongoose = require('mongoose');
const finaldata = require('./routes');

mongoose.connect('mongodb://localhost:27017/test')
    

app.use('/name',finaldata);

app.listen(3000);



// app.get('/name',function(req,res){
//     fs.readFile('./students.json',function(err,data){
//       res.send(data)
//       res.end()
//     })
//   });

// app.listen(3000)






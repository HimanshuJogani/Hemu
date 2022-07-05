//Create a login API, After a successfully log in we can access after that Result API, Fees API.


const express = require('express');
const app = express();
app.use(express.json());
const jwt=require("jsonwebtoken");
global.config=require("./config");
const auth = require("./authenticate")
 
const customerlist = [
{name: 'a', id: 1},
{name: 'b', id: 2},
{name: 'c', id: 3}
]


app.post('/login', function (req, res) {
    let userdata = {
    username: req.body.username,
    password: req.body.password
    };
    
    //Go to server for user Verification
    if (userdata.username == "admin" && userdata.password == "admin") {
        customerlist.push(userdata)
        const acesstoken=jwt.sign(userdata,global.config.key,{
            algorithm: global.config.algorithm,
            expiresIn: global.config.expireIn
    })
        res.status(200).json({
            token:acesstoken,
            message: 'Login Successful'
       });
    }
    else {
    res.status(401).json({
    message: 'Login Failed'
    });
    }
});


app.get('/customers',auth, (req,res)=> {
    res.send(customerlist);                     
});

    
app.listen(3000);
const express = require('express')
const app = express()
app.use(express.json())
const jwb = require('jsonwebtoken')
global.config = require('./config')
const auth = require('./authecation')

const customerlist = [
    {name: 'a', id: 1},
    {name: 'b', id: 2},
    {name: 'c', id: 3}
    ]
console.log('Auth');

app.post('/login', function(req,res){
    let userdata ={
        username: req.body.username,
        password: req.body.password
    }

    if(userdata.username == 'admin' && userdata.password == 'admin'){
        const auth = jwb.sign(userdata,global.config.key,{
            algorithm: global.config.algorithm,
            expiresIn: global.config.expireIn
        });

        res.status(200).json({
            token: auth,
            message: 'Login Successful'
        })
    } else {
        res.status(401).json({
            message: 'Login Fail'
        })
    }
})

app.get('/customers',auth,function(req,res){
    res.send(customerlist)
});

app.listen(3000);




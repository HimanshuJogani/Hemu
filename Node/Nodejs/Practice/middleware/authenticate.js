const jwt = require('jsonwebtoken')
global.config = require('../util/config')

function authenticate(req,res,next){
    jwt.sign(req.headers['token'],global.config.key,function(err,decoded){
        if(err){
            let errdata = {
                message: err.message
            };
            console.log(errdata);

            return res.status(401).json({
                message: 'UnAuthourized access'
            })
        }
        req.decoded = decoded;
        next();
    })
}


module.exports = authenticate;
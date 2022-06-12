const jwt = require('jsonwebtoken')
global.config = require('./config')

function authenticate(req,res,next){
    jwt.verify(req.headers['token'],global.config.key,function(err,decoder){
        if(err){
            let errdata = {
                message: err.message,
            };
            console.log(errdata);

            return res.status(401).json({
                message: 'Unauthorized Access'
            })
        }
        req.decoder = decoder;
        next();
    });
    
}

module.exports = authenticate;
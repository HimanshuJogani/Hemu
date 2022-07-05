const jwt = require("jsonwebtoken");
global.config = require("../util/config");

function authenticate(req,res,next){
   
    jwt.verify(req.headers["token"], global.config.key,{algorithms: global.config.algorithm}, function (err, decoded){
        if(err){
            let errordata = {
                message: err.message,
            };
            console.log(errordata);
            return res.status(401).json({
                message: 'Unauthorized Access'
            });
        }
        req.decoded = decoded;
        console.log(decoded);
        next();
    });
}

module.exports = authenticate
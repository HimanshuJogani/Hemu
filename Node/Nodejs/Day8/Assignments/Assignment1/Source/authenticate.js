const jwt=require("jsonwebtoken");
global.config=require("./config");

function authenticate(req,res,next){
    const authheader=req.headers['authorization']
    const token=authheader && authheader.split(" ")[1]
    console.log(token)

    jwt.verify(token, global.config.key, function (err, decoded) {
        if (err) {
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
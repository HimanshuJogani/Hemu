
const jwt = require("jsonwebtoken");
global.config = require("../util/config");

const login = (req, res) => {
    let userdata = {
        username: req.body.username,
        password: req.body.password
    };

    if (userdata.username == "admin" && userdata.password == "admin") {
        const acesstoken = jwt.sign(userdata, global.config.key, {
            algorithm: global.config.algorithm,
            expiresIn: global.config.expireIn
        })
        res.status(200).json({
            token: acesstoken,
            message: 'Login Successful'
        });
    } else {
        res.status(401).json({
            message: 'Login Failed'
        });

    }

}

module.exports = {login};
const jwt = require('jsonwebtoken')
global.config = require('../util/config')

module.exports = {
    authlogin(req,res){
        let userdata = {
            username: req.body.username,
            password: req.body.password
        }

        if(userdata.username == 'admin' && userdata.password == 'admin'){
        const authtoken = jwt.sign(userdata,global.config.key,{
            algorithm: global.config.algorithm,
            expiresIn: global.config.expiresIn
        })

        res.status(200).json({
            token: authtoken,
            message: 'Login Successful'
        })
      }else {
          res.status(401).json({
              message: 'Login Failed'
          })
      }

    }

}
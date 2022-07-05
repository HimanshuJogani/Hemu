
const modelstd = require('../model/students');


module.exports = {
    fees(req,res){
        var id = req.params.id
        var query = {ID: id}
        modelstd.find(query,{Fees:1},function(err,result){
            res.send(result)
        });
    },

    result(req, res){
        var id = req.params.id
        var query = {ID: id}
        modelstd.find(query,{Result:1},function(err,result){
            res.send(result)
        });
    }
}

var obj = {
    name = 'himanshu'
}
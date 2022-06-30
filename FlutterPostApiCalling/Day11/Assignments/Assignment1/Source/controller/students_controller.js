

const modelstd = require('../model/students');


module.exports = {
    getStudents(req,res){
        modelstd.find({},function(err,result){
            res.send(result)
        });
    },
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

    },

    stddelete(req,res){
        var id = req.params.id
        var query = {ID: id}
        modelstd.deleteOne(query,function(err,result){
            res.send(result)
        })
    },

    stdcreate(req,res){
        var std = new modelstd(req.body);
        std.save();
        res.send(std); 
    }

}
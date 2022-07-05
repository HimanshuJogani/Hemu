

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
    },

    stddelete(req,res){
        var id = req.params.id
        var query = {ID: id}
        modelstd.deleteOne(query,function(err,result){
            res.send(result)
        })
    },

    async stdcreate(req,res){

        let error;
        try{
            var std = new modelstd(req.body);
            await std.save();
            res.send(std); 
        } catch(err) {
            error = err;
            res.send(error.message);
            console.log(error);
            res.end();
        }
    }

}
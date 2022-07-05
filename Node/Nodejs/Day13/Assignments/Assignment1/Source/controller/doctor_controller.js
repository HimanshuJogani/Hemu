
const doctormodel = require('../model/doctor');
const departmodel = require('../model/department');


module.exports = {
    async doctorCreate(req,res){
       var doc = await departmodel.findOne({'departmentId': req.params.id});
       console.log(doc._id);
        var data = new doctormodel(req.body);
        data.departmentId=doc._id;
        data.save();
        res.send(data)
    },

    async doctorupdate(req,res){
        var doc = await doctormodel.findOneAndUpdate({doctorId: req.params.id}, req.body,{new: true});
        await doc.save();
    }
}



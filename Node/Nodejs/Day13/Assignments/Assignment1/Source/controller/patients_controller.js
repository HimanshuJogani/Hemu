const patientsmodel = require('../model/patients');
const doctormodel = require('../model/doctor');


module.exports = {
    async patients(req,res){
        const doctor = await doctormodel.findOne({'doctorName': req.params.id});
        const doc = doctor._id;
        const patient = await patientsmodel.find({doctorId: doc}).select("-assistantsId -drugsId").populate("doctorId");
        res.send(patient);
    },

    async patientsreport(req,res){
        const doctor = await doctormodel.findOne({'doctorName': req.params.id});
        const doc = doctor._id;
        const patient = await patientsmodel.find({doctorId: doc}).select("-assistantsId -doctorId").populate("drugsId");
        res.send(patient);
    },

    async patientlist(req,res) {
        const patient = await patientsmodel.find({patientId: req.params.id});
        res.send(patient);
    }

}
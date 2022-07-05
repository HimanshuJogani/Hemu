const mongoose = require('mongoose');


const patients = mongoose.Schema({

    patientId: {type: Number},
    patientName: {type: String},
    doctorId: {type: mongoose.Schema.Types.ObjectId, ref: 'doctor'},
    assistantsId: {type: mongoose.Schema.Types.ObjectId, ref: 'assistants'},
    drugsId: {type: mongoose.Schema.Types.ObjectId, ref: 'drugs'}
});

module.exports = Patient = mongoose.model('patients', patients);
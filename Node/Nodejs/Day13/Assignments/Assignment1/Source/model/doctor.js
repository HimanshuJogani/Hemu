const mongoose = require('mongoose');


const doctor = mongoose.Schema({

    doctorId: {type: Number},
    doctorName: {type: String},
    departmentId: {type: mongoose.Schema.Types.ObjectId, ref: 'departments'}

});

module.exports = mongoose.model('doctor', doctor);
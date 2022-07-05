const mongoose = require('mongoose');


const department = mongoose.Schema({

    departmentId: {type: Number},
    departmentName: {type: String}

});

module.exports = Department = mongoose.model('departments', department);
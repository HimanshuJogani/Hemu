const mongoose = require('mongoose');

const studentsData = new mongoose.Schema({ 
    id: {
      type: Number
    },
    name: {
      type: String
    }
});



module.exports = mongoose.model("tests",studentsData);

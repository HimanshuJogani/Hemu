const mongoose = require('mongoose');


const assistants = mongoose.Schema({

    assistantsId: {type: Number},
    assistantName: {type: String},

});

module.exports = Assistants = mongoose.model('assistants', assistants);
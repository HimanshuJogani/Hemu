const mongoose = require('mongoose');



const drugs = mongoose.Schema({

    drugsId: {type: Number},
    drugsName: {type: String},
    drugsTime: [{type: String, enum: ['Morning','Afternoon','Night']}],

});

module.exports = Drugs = mongoose.model('drugs', drugs);



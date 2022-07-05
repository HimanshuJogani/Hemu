const drugsmodel = require('../model/drugs');


module.exports = {
    async drugs(req,res){
        const medicine = await drugsmodel.find({});
        res.send(medicine);
    }
}
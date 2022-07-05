const assistantmodel = require('../model/assistants');



module.exports = {
    async assistant(req,res){
        const assistant = await assistantmodel.find({});
        res.send(assistant);
    }
}
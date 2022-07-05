const { model } = require('mongoose');
const departmodel = require('../model/department');


module.exports = {
    async departments(req,res){
        const depart = await departmodel.find({});
        res.send(depart);
    },
}
const employee = require('../model/employee');

module.exports = {
    async assignment(req, res) {
        var data = await employee.findOne({id: req.params.id}).select({assignments: {'$elemMatch': {AssignmentId: req.params.aid}}})
        console.log(data);
        res.send(data);
    },

    empdelete(req,res){
        var id = req.params.id
        var query = {id: id}
        employee.deleteOne(query,function(err,result){
            res.send(result)
        })
    },

    empcreate(req,res){
        var emp = new employee(req.body);
        emp.save();
        res.send(emp); 
    }
}
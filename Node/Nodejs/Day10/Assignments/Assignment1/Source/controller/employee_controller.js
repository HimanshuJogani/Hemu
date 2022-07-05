const employee = require('../model/employee');

module.exports = {
    async assignment(req, res) {
        var data = await employee.findOne({id: req.params.id}).select({assignments: {'$elemMatch': {AssignmentId: req.params.aid}}})
        console.log(data);
        res.send(data);
    }
}
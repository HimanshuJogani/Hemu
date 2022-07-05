const employee = require("../data/employee.json")
module.exports = {
    assignment(req, res) {

        data1 = employee;
        const result = data1.find((data) => {
            return data.id === parseInt(req.params.id);
        })
        var ass = result.assignments;
        const result1 = ass.find((d) => d.AssignmentId === parseInt(req.params.aid));
        console.log(result1);
        console.log(data1);
        res.send(result1);
        res.end();
    }

}
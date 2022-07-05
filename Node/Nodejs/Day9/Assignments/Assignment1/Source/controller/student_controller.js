const students = require("../data/students.json")

module.exports = {
    fees(req, res) {
        data1 = students;
        const result = data1.find((data) => {
            return data.ID === parseInt(req.params.id);
        })
        console.log(result);
        res.send(result.Fees);
        console.log(result.Fees);
        res.end();
    },
    result(req, res) {
        data1 = students;
        const result = data1.find((data) => {
            return data.ID === parseInt(req.params.id);
        })
        res.send(result.Result);
        console.log(result.Result);
        res.end();
    }
}
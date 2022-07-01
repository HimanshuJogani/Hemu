

const modelstd = require('../model/students');


module.exports = {
    getStudents(req, res) {
        modelstd.find({}, function (err, result) {
            res.send(result)
        });
    },
    fees(req, res) {
        var id = req.params.id
        var query = { ID: id }
        modelstd.find(query, { Fees: 1 }, function (err, result) {
            res.send(result)
        });
    },

    result(req, res) {
        var id = req.params.id
        var query = { ID: id }

        modelstd.find(query, { Result: 1 }, function (err, result) {
            res.send(result)
        });

    },

    updateStudent(req, res) {
        var id = req.params.studentId
        var name = req.body.Name;
        var address = req.body.Address;
        var query = { StudentId: id }
        var newValues = { $set: { Name: name, Address: address } }
        
        modelstd.find(query, function (err, result) {

            if (result.length == 0) {
                res.send("Data not found");
            }
            else {
                console.log(result);
                modelstd.updateOne({ StudentId: id },{ $set: { Name: name, Address: address } },{new :true} ,function (err, result) {
                    if (err) { 
                        console.log(err);
                        res.send(err) };
                   
                    if (result) {
                        console.log(result);
                        console.log("1 document updated");
                        res.send(result);
                    }
                    res.end();
                })
            }
        })
    },
    stddelete(req, res) {
        var id = req.params.id
        var query = { StudentId: id }
        modelstd.deleteOne(query, function (err, result) {
            res.send(result)
        })
    },

    stdcreate(req, res) {
        var std = new modelstd(req.body);
        std.save();
        res.send(std);
    }

}
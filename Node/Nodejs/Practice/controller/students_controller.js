const studentsdata = require('../model/students.json')
const fs = require('fs')

module.exports = {
    fetchdata(req,res){
        res.send(studentsdata)
    },
    std(req,res){
        fs.readFile('../model/students.json',function(err,data){
          
            console.log(data);
            res.send(data)
        })
    }
}
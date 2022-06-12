
const studentscontroller = require('./model')
const fs = require('fs')
const stdjson = require('./students.json');


module.exports = {
    add(req, res) {
        // const author = new studentscontroller({
        //     id: 1,
        //     name: "Himanshu"
        // })
        // author.save();
        // res.end();
        // console.log('data')
       
       
        fs.readFile('./students.json',function (err,data){
            var data1 = [];
            data1 = JSON.parse(data); // when we want to take data from json then use the parse 
                                       // when we want to add data into json then use the stringfly
            for(let i of data1){
                const author = new studentscontroller(i);
                console.log(author)
                author.save();
            }
            res.send(data1);
            res.end();
        })
          
    }

}
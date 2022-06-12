const { rejects } = require('assert');
const fs = require('fs');
const { resolve } = require('path');
const name = process.argv.slice(2);

fs.readFile('person.txt','utf8',(err,data)=>{
    console.log(data);
});

fs.appendFile('person1.txt','Hello World' + ' Hello India',(err,data)=>{
    console.log('Saved!');
});

fs.appendFile('person.txt','Hello '+ name,(err,data)=> {
    console.log('Saved!');
});

async function readfile(){
    var response="";
    try{
        response += await read('person.txt');
        response += await read('person1.txt');
        console.log(response);
    } catch (err){
        console.log(err);
    }

}
function read(file){
    return new Promise((resolve,rejects)=>{
        fs.readFile(file,(err,data)=>{
            resolve(data);
        });
    });
}

readfile();


var arg = process.argv.slice(2)

var data = parseInt(arg[0]);
var data1 = parseInt(arg[1]);

var add = (a,b) => a+b;
var multi = (a,b) => a*b;
var div = (a,b) => a/b;
var sub = (a,b) => a-b;

var ch = 1;
switch(ch){
    case 1:
        var addition = add(2,5);
        console.log(addition);
        result(addition.toString());
        break;
    default:
        console.log('please select vaild number');
}

function result(res){
    fs.writeFile('person.txt',res,(err)=>{
        if (err) throw err;
        console.log('Saved!');
    })
}


module.exports.areaofcircle = function(l,b) {
    console.log('area of rectangle '+ (l*b));
    console.log('perimeter of rectangle '+ (l+b));
}

var http = require('http');
http.createServer(function (request, response) {
    fs.readFile('person.txt', function (err,data) {
        if (err) throw err;
        console.log('Saved!');
        response.write(data);
        response.end();
      }); 
}).listen(8081);

console.log('Server running at http://127.0.0.1:8081/');


const mongoose = require('mongoose');

mongoose.Promise = global.Promise;

// Connect MongoDB at default port 27017.
mongoose.connect('mongodb://localhost:27017/test', {
    useNewUrlParser: true,
    useCreateIndex: true,
}, (err) => {
    if (!err) {
        console.log('MongoDB Connection Succeeded.')
    } else {
        console.log('Error in DB connection: ' + err)
    }
});


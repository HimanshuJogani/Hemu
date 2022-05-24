
var args = process.argv.slice(2);

var data = parseInt(args[0]);
var data1 = parseInt(args[1]);

var add = (a,b) => a+b;
var sub = (a,b) => a-b;
var mul = (a,b) => a*b;
var div = (a,b) => a/b;


var ch = 1;


function result(res) {
    var fs = require('fs');
   fs.writeFile('result.txt',res.toString(), function (err) {
     if (err) throw err;
     console.log('Saved!');
   }); 
}

switch(ch) {
    case 1:
        var addition = add(data,data1);
        result(addition);
        console.log(addition.toString());
        break;
    case 2:
        var subscration = sub(data,data1);
        result(subscration);
        console.log(subscration.toString());
        break;
    case 3: 
        var multiplation = mul(data,data1);
        result(multiplation);
        console.log(multiplation.toString());
        break;
    case 4:
        var division = div(data,data1);
        result(division);
        console.log(division.toString());
        break;
    default:
        console.log('Please Enter valid Choices');
        break;
}



const fs = require("fs");

async function readfile() {
var response="";
try {
  response += await read('person.txt')  ;
  response += await read('hello.txt')  ;
  console.log(response);
} catch (err) {
    console.log('Http error');
}
}

function read(file){
    return new Promise((resolve, reject) => {
        fs.readFile(file, function(err, data){
         resolve(data);
       });
  });
}

readfile();



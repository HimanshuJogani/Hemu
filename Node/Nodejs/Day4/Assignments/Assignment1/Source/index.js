
//Write a Nodejs server that listen on port 3001 and which will read person.json and return a response in JSON format. Person.json content as follows:
// [{ PersonID:1, PersonName:”Rita”, PersonAddress:”Ahmedabad” }, { PersonID:2, PersonName:”Reema”, PersonAddress:”Calcutta” }]


var http = require('http');
var fs = require('fs');

http.createServer(function (request, response) {
    fs.readFile('person.json', "utf8", function (err,data) {
        if (err) throw err;
        console.log('Saved!');
        response.write(data);
        response.end();
      }); 
}).listen(3003);

console.log('Server running at http://localhost:3003/');
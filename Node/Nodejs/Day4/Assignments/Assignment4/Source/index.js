
//Write a Nodejs server that serve as a RESTFUL API that accepts a file content and writes them to the disk. http://localhost:3001/upload


var http = require('http');
var fs = require('fs');
var url = require('url');

http.createServer(function (request, response) {
    if(url.parse(request.url,true).pathname === '/upload'){
    fs.readFile('person.json', "utf8", function (err,data) {
        if (err) throw err;
        console.log('Saved!');
        response.write(data);
        response.end();
      }); 
    }
}).listen(3002);

console.log('Server running at http://localhost:3002/upload');
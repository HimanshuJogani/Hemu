
// http

var http = require('http');

http.createServer(function (request, response) {
  response.writeHead(200, {'Content-Type': 'text/plain'});
  response.end('Hello World');
}).listen(8089);

console.log('Server running at http://127.0.0.1:8089/');
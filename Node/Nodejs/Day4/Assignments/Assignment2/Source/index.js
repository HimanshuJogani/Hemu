

//Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call and produces their sum.

const http = require('http');
const url = require('url');

http.createServer(function (req, res) {
    if(url.parse(req.url,true).pathname === '/product'){
    const query = url.parse(req.url, true).query;
    var sum = parseInt(query.param1) + parseInt(query.param2);
    res.write(`Sum of (${query.param1} and ${query.param2}) is : (${sum})`);
    res.end('done');
    }
  })
  .listen(8089);
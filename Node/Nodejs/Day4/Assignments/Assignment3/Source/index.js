
//Write a Nodejs server that serves as a RESTFUL API that accepts a string as an input name and returns the first vowel character from the string.

const http = require('http');
const url = require('url');

http.createServer(function (req, res) {
   
    const queryObject = url.parse(req.url, true).query;
    var vowel;
    if(Object.keys(queryObject).length == 1){
        console.log(Object.keys(queryObject));
        for(let i of queryObject.name){
            if(['a','e','i','o','u'].includes(i.toLowerCase())){
                vowel = i;
                break;
            }
        }
        res.write(`First vowel character ${vowel}`);
        res.end();
    }
  })
  .listen(8087);

  console.log('Server running at http://localhost:8087/');
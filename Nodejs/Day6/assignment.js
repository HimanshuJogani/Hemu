const express = require('express')
const fs = require('fs')
const app = express()
const port = 3000

app.get('/students/:id', function(req, res) {
    var data1 = [];
    fs.readFile('./student.json',function(err,data){
        data1 = JSON.parse(data);
        var result = data1.find((val)=> {
            return val.ID === parseInt(req.params.id); 
        })
        res.send(result.Result);
        res.end();
    })
});




app.listen(port, () => console.log(`Example app listening on port ${port}!`))




app.use('/', function(req, res, next){
   console.log("A request for things received at " + Date.now());
   next();
});


app.get('/things', function(req, res){
   res.send('Things');
});

app.listen(3001);




//Create a Restful API, which will return Customer list in JSON format. http://localhost:3000/customers

let express=require("express");
let fs=require("fs");
let app=express();


app.get("/customers",(req,res)=>{
    fs.readFile("./info.json",'utf8',(err,data)=>{
    res.send(data);
    console.log(data);
    res.end();
    })
}).listen(3003);
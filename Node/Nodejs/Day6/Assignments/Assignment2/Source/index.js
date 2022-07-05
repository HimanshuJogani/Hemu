
//Create RESTFUL API which will return a Particular Student Record http://localhost:3010/students/1

let express=require("express");
let fs=require("fs");
let app=express();


app.get("/students/:id",(req,res)=>{
    data1=[];
    fs.readFile("./students.json",'utf8',(err,data)=>{
        data1=JSON.parse(data);
        const result =  data1.find((data)=>{
            return  data.ID === parseInt( req.params.id);
        })
    res.send(result);
    console.log(result);
    res.end();
    })
}).listen(3010);
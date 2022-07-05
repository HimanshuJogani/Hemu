
//Create a RESTFUL API which will return a particular student Exam Result. Result Fields are http://localhost:3000/students/1/result

let express=require("express");
let fs=require("fs");
let app=express();


app.get("/students/:id/result",(req,res)=>{
    data1=[];
    fs.readFile("./students.json",'utf-8',(err,data)=>{
        data1=JSON.parse(data);
        const result =  data1.find((data)=>{
            return  data.ID === parseInt( req.params.id);
        })
    res.send(result.Result);
    console.log(result.Result);
    res.end();
    })
}).listen(3010);
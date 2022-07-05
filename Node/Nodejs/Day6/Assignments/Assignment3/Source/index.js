
// Create a RESTFUL API which return a particular student FEES Record. Fees field are http://localhost:3010/students/1/fees


let express=require("express");
let fs=require("fs");
let app=express();


app.get("/students/:id/fees",(req,res)=>{
    data1=[];
    fs.readFile("./students.json",'utf-8',(err,data)=>{
        data1=JSON.parse(data);
        const result =  data1.find((data)=>{
            return  data.ID === parseInt( req.params.id);
        })
        console.log(result);
    res.send(result.Fees);
    console.log(result.Fees);
    res.end();
    })
}).listen(3010);

// Create a Restful API which will search a particular record from the customer list. http://localhost:3007/customers/1


let express=require("express");
let fs=require("fs");
let app=express();


app.get("/customers/:id",(req,res)=>{
    data1=[];
    fs.readFile("./info.json",'utf8',(err,data)=>{
        data1=JSON.parse(data);
        const result =  data1.find((data)=>{
            return  data.id === parseInt( req.params.id);
        })
    res.send(result);
    console.log(result);
    res.end();
    })
}).listen(3004);
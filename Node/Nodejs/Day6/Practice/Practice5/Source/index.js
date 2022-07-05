
//Create a Restful API which will delete a record from the customer list. http://localhost:3000/customer

let express=require("express");
let fs=require("fs");
let app=express();

app.delete("/customers/:id",(req,res)=>{
    data1=[];
    fs.readFile("./info.json","utf-8",(err,data)=>{
        data1=JSON.parse(data);
     const result=   data1.find((data)=>{
                return  data.id === parseInt( req.params.id);
     })
     data1.splice(data1.indexOf(result),1);
    fs.writeFile("./info.json",JSON.stringify(data1),(err)=>{
        console.log("File written");
    })
    res.send(data1);
    res.end();
    })

}).listen(3004);
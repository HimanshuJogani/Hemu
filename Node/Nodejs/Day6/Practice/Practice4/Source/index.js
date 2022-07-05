
// Create a Restful API which update a name of existing customer whose customer ID is 1 http://locahost:3006/customers.


let express=require("express");
let fs=require("fs");
let app=express();
app.use(express.json());


app.put("/customers/:id",(req,res)=>{
    data1=[];
    fs.readFile("./info.json","utf-8",(err,data)=>{
        data1=JSON.parse(data);
     const result=   data1.find((data)=>{
                return  data.id=== parseInt( req.params.id);
     })
    
    result.Name=req.body.Name;
    result.Address=req.body.Address;
    fs.writeFile("./info.json",JSON.stringify(data1),(err)=>{
        console.log("File written");
    })
    res.send(data1);
    res.end();
    })
}).listen(3006)


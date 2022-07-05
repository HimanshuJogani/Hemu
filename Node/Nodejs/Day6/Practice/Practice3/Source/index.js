
//Create a Restful API which will insert a new customer object in the customer list. http://localhost:3000/customer


let express=require("express");
let fs=require("fs");
let app=express();
app.use(express.json());

app.post("/customers",(req,res)=>{
    data1=[];
    datainfo={};
    fs.readFile("./info.json","utf-8",(err,data)=>{
        data1= JSON.parse( data);
        data1.push(req.body);
        console.log(req.body);
        console.log(data1);
        fs.writeFile("./info.json",JSON.stringify(data1),(err)=>{
            console.log("File written");
        })
        res.send(data1);
        res.end();
    })
}).listen(3004);
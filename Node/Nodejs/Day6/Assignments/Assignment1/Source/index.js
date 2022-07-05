
//Collections as follows:
//Students= [{ “ID”:1, ”Name”:Reena”, ”Address”:”Ahmedabad”, ”Fees”:{“Amount:10000,”PaymentDate”:”12/12/2020”,”Status”:”true”}, ”Result”:{“Hindi”:80,”Eng”:70,”Math”:60,”Total”:210,”Grade”:”A”}},
//{ “ID”:2, ”Name”:”Rita”, ”Address”:”Surat”, ”Fees”:{“Amount:12000,”PaymentDate”:”12/12/2020”,”Status”:”false”}, ”Result”:{“Hindi”:80,”Eng”:70,”Math”:60,”Total”:210,”Grade”:”A”} }] 
//Create a RESTFUL API which will return a Studentlist. http://localhost:3000/students


let express=require("express");
let fs=require("fs");
let app=express();


app.get("/students",(req,res)=>{
    fs.readFile("./students.json",'utf8',(err,data)=>{
    res.send(data);
    console.log(data);
    res.end();
    })
}).listen(3010);


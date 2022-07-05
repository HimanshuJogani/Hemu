
//Create a Restful API to create an employee, get all employees, get an employees, 
//get an employee, update and employee http://localhost:3000/emps AddressLine1(optional): 
//string AddressLine2(optional): string AddressLine3(optional): string assignments(optional): 
//array CitizenshipId(optional): integer(int64) CitizenshipLegislationCode(optional): string CitizenshipStatus(optional): 
//string CitizenshipToDate(optional): string(date) City(optional): string CorrespondenceLanguage(optional): 
//string Country(optional): string CreationDate(optional): string(date-time) DateOfBirth(optional): 
//string(date) directReports(optional): array DisplayName(optional): string DriversLicenseExpirationDate(optional):
// string(date) DriversLicenseId(optional): integer(int64) DriversLicenseIssuingCountry(optional): 
//string EffectiveStartDate(optional): string(date) Ethnicity(optional): string FirstName(optional): 
//string Gender(optional): string HireDate(optional): string(date) HomeFaxAreaCode(optional): 
//string HomeFaxCountryCode(optional): string HomeFaxExtension(optional): string HomeFaxLegislationCode(optional): 
//string HomeFaxNumber(optional): string HomePhoneAreaCode(optional): string HomePhoneCountryCode(optional): 
//string HomePhoneExtension(optional): string HomePhoneLegislationCode(optional): string HomePhoneNumber(optional): 
//string Honors(optional): string LastName(optional): string LastUpdateDate(optional): string(date-time) LegalEntityId(optional): 
//integer(int64) LicenseNumber(optional): string links(optional): array MaritalStatus(optional): string MiddleName(optional):
//string MilitaryVetStatus(optional): string NameSuffix(optional): string NationalId(optional): string NationalIdCountry(optional): string

let express=require("express");
let fs=require("fs");
let app=express();
app.use(express.json())


app.listen(3000, () => {
    console.log("Server is listing on 3000 port")
})

app.get("/emps",(req,res)=>{
    fs.readFile("./employee.json",'utf8',(err,data)=>{
    res.send(data);
    console.log(data);
    res.end();
    })
})

app.get("/emps/:id", (req, res) => {
    data1 = [];
    fs.readFile("./employee.json", "utf-8", (err, data) => {
        data1 = JSON.parse(data);
        console.log(data1);
        const result = data1.find(c => c.id === parseInt(req.params.id));
        console.log(result);
        res.send(result);
        res.end();
    })
})

app.put("/emps/update/:id", (req, res) => {
    data1 = [];
    fs.readFile("./employee.json", "utf-8", (err, data) => {
        data1 = JSON.parse(data);
        const result = data1.find((data) => {
            return data.id === parseInt(req.params.id);
        })
        console.log(result);
        console.log(data1);
        result.name = req.body.name;
        result.displayname=req.body.displayname;
        result.Dlno=req.body.Dlno;
        result.dob=req.body.dob;
        result.phone=req.body.phone;
        result.address=req.body.address;
        result.state=req.body.state;
        result.country=req.body.country;

        fs.writeFile("./employee.json", JSON.stringify(data1), (err) => {
            console.log("File written");
        })
        res.send(data1);
        res.end();
    })
})



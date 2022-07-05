

//Assignment Fields ActionCode(optional): string ActionReasonCode(optional): string ActualTerminationDate(optional): string(date) 
//AssignmentCategory(optional): string assignmentDFF(optional): array assignmentExtraInformation(optional): array 
//AssignmentId(optional): integer(int64) AssignmentName(optional): string AssignmentNumber(optional): string AssignmentProjectedEndDate(optional): 
//string(date) AssignmentStatus(optional): string Create an Assignments API http://localhost:3000/emps/{empID}/child/assignments
// AssignmentStatusTypeId(optional): integer(int64) BusinessUnitId(optional): integer(int64) CreationDate(optional): string(date-time) 
//DefaultExpenseAccount(optional): string DepartmentId(optional): integer(int64) EffectiveEndDate(optional): string(date) EffectiveStartDate(optional): 
//string(date) empreps(optional): array EndTime(optional): string Frequency(optional): string FullPartTime(optional): string GradeId(optional): 
//integer(int64) GradeLadderId(optional): integer(int64) JobId(optional): integer(int64) LastUpdateDate(optional): string(date-time) LegalEntityId(optional):
// integer(int64) links(optional): array LocationId(optional): integer(int64) ManagerAssignmentId(optional): integer(int64) ManagerId(optional): integer(int64)
//Get All Assignments http://localhost:3000/emps/{empID}/child/assignments
//Get an Assignment http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID}
//Update an assignment http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID}



let express = require("express");
let app = express();

let fs = require("fs");
app.use(express.json())

app.get("/employee", (req, res) => {
    fs.readFile("employee.json", (err, data) => {
        res.send(JSON.parse(data));
        res.end();
    })
})

app.get("/employee/:id/child/assignment", (req, res) => {
    data1 = [];
    fs.readFile("employee.json", (err, data) => {

        data1 = JSON.parse(data);
        const result = data1.find((data) => {
            return data.id === parseInt(req.params.id);
        })
        console.log(result);
        console.log(data1);
        res.send(result);
        res.end();
    })
})


app.get("/employee/:id/child/assignment/:aid", (req, res) => {
    data1 = [];
    fs.readFile("employee.json", (err, data) => {
        data1 = JSON.parse(data);
        const result = data1.find((data) => {
            return data.id === parseInt(req.params.id);
        })
        var ass = result.assignments;
        const result1 = ass.find((d) => d.AssignmentId === parseInt(req.params.aid));
        console.log(result1);
        console.log(data1);
        res.send(result1);
        res.end();
    })
})

app.put("/employee/:id/child/assignment/:aid", (req, res) => {
    data1 = [];
    fs.readFile("employee.json", (err, data) => {
        data1 = JSON.parse(data);
        const result = data1.find((data) => {
            return data.id === parseInt(req.params.id);
        })
        var ass = result.assignments;
        const result1 = ass.find((d) => {
            if (d.AssignmentId === parseInt(req.params.aid)) {
                d.AssignmentStatus = req.body.AssignmentStatus;
            }
            return d.AssignmentId === parseInt(req.params.aid)
        })
        console.log(result1);
        fs.writeFile("./employee.json", JSON.stringify(data1), (err) => {
            console.log("File written");
        })
        res.send(data1);
        res.end();
    })
})



app.listen(3000, () => {
    console.log("Server is listing on 3000 port")
})
==> Assignment Fields ActionCode(optional): string ActionReasonCode(optional): string ActualTerminationDate(optional): string(date) AssignmentCategory(optional): string assignmentDFF(optional): array assignmentExtraInformation(optional): array AssignmentId(optional): integer(int64) AssignmentName(optional): string AssignmentNumber(optional): string AssignmentProjectedEndDate(optional): string(date) AssignmentStatus(optional): string Create an Assignments API http://localhost:3000/emps/{empID}/child/assignments AssignmentStatusTypeId(optional): integer(int64) BusinessUnitId(optional): integer(int64) CreationDate(optional): string(date-time) DefaultExpenseAccount(optional): string DepartmentId(optional): integer(int64) EffectiveEndDate(optional): string(date) EffectiveStartDate(optional): string(date) empreps(optional): array EndTime(optional): string Frequency(optional): string FullPartTime(optional): string GradeId(optional):integer(int64) GradeLadderId(optional): integer(int64) JobId(optional): integer(int64) LastUpdateDate(optional): string(date-time) LegalEntityId(optional):integer(int64) links(optional): array LocationId(optional): integer(int64) ManagerAssignmentId(optional): integer(int64) ManagerId(optional): integer(int64) Get All Assignments http://localhost:3000/emps/{empID}/child/assignments Get an Assignment http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID} Update an assignment http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID}.



1. Declare the module express and fs.
2. Use the get method of express for fetching the data json file.
3. Use the get method of express for fetching the data of assignment from json file.
4. Declare the array data1.
5. Use the readfile method of fs for reading the json file.
6. Store the data into array data1.
7. Find the id from data using array data1 and store into result.
8. Use the write method to write the data into json file.
9. Data send to response.
10. Same as logic for the finding the assignmentid.
11. Store the data into array data1.
12. Find the assignmentid from data using array data1 and store into result.
13. Data send to response.
14. For Updating the data using put method of express module.
15. Find the assignmentid and update the status of the asssignment id.
16. Use the write method to write the data into json file.
17. Data send to response.
18. Listening at port number 3000.




/*Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id 
and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.*/

CREATE TABLE jobhistory (
empid INTEGER,
stdate date NOT NULL,
enddate date NOT NULL CHECK (enddate like '__/__/____'),
depid INTEGER NOT NULL,
PRIMARY KEY(empid)
)


INSERT INTO jobhistory (empid,stdate,enddate,depid) VALUES
(1,'03/03/2022','07/07/1956',73)

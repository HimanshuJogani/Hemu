CREATE TABLE "jobs" (
	"jobid"	TEXT NOT NULL,
	"jobtitle"	TEXT NOT NULL,
	"salary_min"	NUMERIC NOT NULL,
	"salary_max"	INTEGER NOT NULL,
	PRIMARY KEY("jobid")
);

INSERT INTO "main"."jobs" ("jobid", "jobtitle", "salary_min", "salary_max") VALUES ('AD_PRES', 'Team Leader', '50000', '100000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "salary_min", "salary_max") VALUES ('AD_VP', 'Project manager', '100', '1000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "salary_min", "salary_max") VALUES ('FI_MGR', 'Software Analysis', '500', '5000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "salary_min", "salary_max") VALUES ('SH_CLERK', 'Seniour Prjoect manager', '5000', '302000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "salary_min", "salary_max") VALUES ('ST_MAN', 'Junior Software Developer', '2090', '20939');


CREATE TABLE "department" (
	"departmentId"	INTEGER NOT NULL,
	"departmentname"	TEXT NOT NULL,
	PRIMARY KEY("departmentId")
);

INSERT INTO "main"."department" ("departmentId", "departmentname") VALUES ('1', 'Web');
INSERT INTO "main"."department" ("departmentId", "departmentname") VALUES ('2', 'Mobile');
INSERT INTO "main"."department" ("departmentId", "departmentname") VALUES ('3', 'Testing');
INSERT INTO "main"."department" ("departmentId", "departmentname") VALUES ('4', 'HR');
INSERT INTO "main"."department" ("departmentId", "departmentname") VALUES ('5', 'BD');


CREATE TABLE "employee" (
	"empId"	INTEGER NOT NULL,
	"fname"	TEXT NOT NULL,
	"lname"	TEXT NOT NULL,
	"email"	INTEGER NOT NULL,
	"jobid"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"commission"	NUMERIC NOT NULL,
	"managerid"	INTEGER NOT NULL,
	"departmentid"	INTEGER NOT NULL,
	FOREIGN KEY("departmentid") REFERENCES "department"("departmentId"),
	FOREIGN KEY("jobid") REFERENCES "jobs"("jobid"),
	PRIMARY KEY("empId")
);


INSERT INTO "main"."employee" ("empId", "fname", "lname", "email", "jobid", "salary", "commission", "managerid", "departmentid") VALUES ('101', 'Himanshu', 'Jogani', 'not available', 'AD_PRES', '37500', '0.1', '301', '1');
INSERT INTO "main"."employee" ("empId", "fname", "lname", "email", "jobid", "salary", "commission", "managerid", "departmentid") VALUES ('102', 'Akash', 'Gupta', ' no available', 'AD_VP', '38000', '0.3', '302', '2');
INSERT INTO "main"."employee" ("empId", "fname", "lname", "email", "jobid", "salary", "commission", "managerid", "departmentid") VALUES ('103', 'Anand', 'Jamani', 'not available', 'SH_CLERK', '10560', '0.22', '303', '3');
INSERT INTO "main"."employee" ("empId", "fname", "lname", "email", "jobid", "salary", "commission", "managerid", "departmentid") VALUES ('104', 'Ashish', 'chauhan', 'not available ', 'SH_CLERK', '35270.4', '0.22', '304', '4');
INSERT INTO "main"."employee" ("empId", "fname", "lname", "email", "jobid", "salary", "commission", "managerid", "departmentid") VALUES ('105', 'samay', 'nakrani', 'not available', 'ST_MAN', '57687', '0.6', '305', '5');



/*Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.*/

UPDATE  employee SET email="not available"

/*Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.*/

UPDATE  employee SET email="not available", commission= 0.2


/*Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.*/

UPDATE  employee SET email="not available", commission= 0.2 WHERE departmentid = 3


/*Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%*/

UPDATE employee SET email = "not available "  WHERE departmentid = 4 AND commission <= 0.2


/*Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.*/

UPDATE  employee SET email = " no available" WHERE departmentid = (SELECT departmentid FROM department WHERE departmentname =  "Mobile");


/*Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.*/

UPDATE employee SET salary = 8000 WHERE empId = 103 AND salary > 5000


/*Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.*/

UPDATE employee SET jobid = "SH_CLERK" WHERE  empid = 103 AND departmentid = 3 AND   jobid  not like ' ST%'


/*Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same*/

UPDATE employee set salary = CASE departmentid 
	WHEN 1 THEN salary + (salary * 0.25) 
	WHEN 2 THEN salary + (salary * 0.90)
	WHEN 3 THEN salary + (salary * 0.10)
	ELSE salary
	END
	WHERE departmentid IN (1,2,3);


/*Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission by 10% .*/

UPDATE jobs  set salary_min =  (salary_min + 2000) , salary_max = (salary_max + 2000) WHERE jobid = 'SH_CLERK' 

UPDATE employee SET   salary = salary + (salary *0.20) , 
commission   = commission + (commission  * 0.10) WHERE jobid = 'SH_CLERK'






/*SELECT QUREIES*/


/*Get all employee details from the Employee table*/ 

SELECT * from employee


/*Get FirstName, LastName from Employees table */

SELECT fname , lname from employee


/*Get FirstName from Employees table using alias name “Employee Name” */

SELECT fname  AS "Employee Name" from employee

/*Get employee details from Employees table whose Employee Name is “Steven” */

SELECT * from employee WHERE fname = "steven"

/* Get employee details from Employees table whose Employee Name are “Neena” and “Lex” */

SELECT * from employee WHERE fname = 'steven' OR fname = 'Lex'


/* Get employee details from Employees table whose Employee name are not “Neena” and “Neena” */ 

SELECT * from employee WHERE NOT fname = 'Neena'


/* Get employee details from Employees table whose Salary between 5000 and 8000*/ 

SELECT * from employee WHERE salary BETWEEN 5000 AND 8000

/* Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary). */

SELECT fname  ||  " " || lname  AS Fullname  , salary  , (salary  + (salary  *0.12 )) AS PF From employee


/*Get employee details from Employees table whose FirstName starts with ‘N’*/

SELECT *  From employee WHERE fname like 'N%'


/* Write a query to get unique department ID from Employees table*/

SELECT DISTINCT departmentid from employee 

/* Write a query to get all employee details from the employee table order by FirstName, descending.*/

SELECT * from employee ORDER by fname COLLATE NOCASE DESC 


/* Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary. */

SELECT empid , fname || " " || lname as Names , salary FROM employee ORDER by salary 	ASC

/*Select TOP 2 salary from employee table*/

SELECT *  FROM employee ORDER by salary 	DESC LIMIT 2

CREATE TABLE "employees" (
	"empid"	INTEGER NOT NULL,
	"fname"	TEXT NOT NULL,
	"lname"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"joindate"	date NOT NULL,
	"department"	TEXT NOT NULL,
	"managerid"	INTEGER,
	PRIMARY KEY("empid" AUTOINCREMENT),
	FOREIGN KEY("managerid") REFERENCES "employees"("empid")
)

INSERT INTO "main"."employees" ("empid", "fname", "lname", "salary", "joindate", "department", "managerid") VALUES ('1', 'Himanshu', 'Jogani', '5000', '2022-05-12', 'mobile', '1');
INSERT INTO "main"."employees" ("empid", "fname", "lname", "salary", "joindate", "department", "managerid") VALUES ('2', 'Akash', 'Gupta', '8000', '2020-01-01', 'mobile', '1');
INSERT INTO "main"."employees" ("empid", "fname", "lname", "salary", "joindate", "department", "managerid") VALUES ('3', 'Arpit', 'Rao', '18000', '2016-02-11', 'php', '4');
INSERT INTO "main"."employees" ("empid", "fname", "lname", "salary", "joindate", "department", "managerid") VALUES ('4', 'Parva', 'sharama', '10000', '2006-02-11', 'php', '4');
INSERT INTO "main"."employees" ("empid", "fname", "lname", "salary", "joindate", "department", "managerid") VALUES ('5', 'Nikhil', 'kumar', '15000', '2018-12-21', 'node', '');




CREATE TABLE "incentive" (
	"empid"	INTEGER,
	"incdate"	date NOT NULL,
	"incamount"	NUMERIC NOT NULL,
	FOREIGN KEY("empid") REFERENCES "employees"("empid")
);
INSERT INTO "main"."incentive" ("empid", "incdate", "incamount") VALUES ('1', '2022-07-12', '2000');
INSERT INTO "main"."incentive" ("empid", "incdate", "incamount") VALUES ('3', '2017-02-01', '5000');
INSERT INTO "main"."incentive" ("empid", "incdate", "incamount") VALUES ('1', '2022-08-12', '4000');


INSERT INTO employees 
(empid,fname,lname,salary,joindate,department)
VALUES (1 , 'Himanshu' , 'Jogani', 5000, date('2022-05-12') , 'mobile'),
(2,'Akash','Gupta',8000,date('2020-01-01') ,'mobile'),
(3,'Arpit','Rao',18000,date('2016-02-11') ,'php'),
(4,'Parva','sharama',10000,date('2006-02-11') ,'php'),
(5,'Nikhil','kumar',15000,date('2018-12-21') ,'node');

/*Get difference between JOINING_DATE and INCENTIVE_DATE 
from employee and incentives table*/

SELECT fname, incdate , joindate from employees A INNER JOIN incentive B on A.empid = B.empid


/*Select first_name, incentive amount from employee and incentives table 
for those employees who have incentives and incentive amount greater than 3000*/


SELECT fname, incamount from employees A INNER JOIN incentive B on A.empid = B.empid AND incamount > 3000;

/*Select first_name, incentive amount from employee and incentives table for 
all employees even if they didn’t get incentives.*/

SELECT fname, incamount from employees A LEFT  JOIN incentive B  on A.empid = B.empid


/*Select EmployeeName, ManagerName from the employee table.*/

SELECT e.fname as empname , m.fname as manager from employees e LEFT OUTER JOIN employees m on m.empid = e.managerid

/*Select first_name, incentive amount from employee and incentives table 
for all employees even if they didn’t get incentives and set incentive amount 
as 0 for those employees who didn’t get incentives.*/

SELECT fname,  ifnull(incamount, 0) from employees A LEFT  JOIN incentive B  on A.empid = B.empid
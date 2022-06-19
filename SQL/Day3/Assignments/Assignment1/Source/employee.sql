CREATE TABLE "employee" (
	"empid"	INTEGER NOT NULL,
	"fname"	TEXT NOT NULL,
	"lname"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"hiredate"	date NOT NULL,
	"phone"	INTEGER NOT NULL,
	"dob"	date NOT NULL,
	PRIMARY KEY("empid" AUTOINCREMENT)
);

INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "hiredate", "phone", "dob") VALUES ('1', 'akash', 'sharma', '5000', '2022-06-17', '878856565', '2001-06-17');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "hiredate", "phone", "dob") VALUES ('2', 'lex', 'musk', '6000', '2021-06-21', '65656565', '2001-03-17');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "hiredate", "phone", "dob") VALUES ('3', 'joy', 'qw', '7000', '2017-05-30', '4567891212', '2001-03-10');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "hiredate", "phone", "dob") VALUES ('4', 'sk', 'singh', '6000', '2017-04-30', '5656565', '2001-04-07');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "hiredate", "phone", "dob") VALUES ('5', 'mayank', 'jadeja', '10000', '2017-05-07', '5484878', '1997-03-10');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "hiredate", "phone", "dob") VALUES ('6', 'kash', 'jadeja', '15000', '2017-07-07', '788445', '1994-03-14');



/* Write a query that displays the fname and the length of the fname for all employee whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employee’ fname*/


select fname as name , length("fname") as lengthofname from employee
WHERE fname like  'a%' or fname  like 'j%' 
or fname  like 'm%' ORDER by fname ASC


/* Write a query to display the fname and Salary for all employee. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.*/

SELECT fname , salary , printf('%s%d','$',salary) from employee 

/* Write a query to display the employee with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.*/

SELECT empid,fname,hiredate from employee 
WHERE hiredate = date(hiredate,'start of month','+6 day') or
strftime(' %m',hiredate)  = strftime(' %m','2022-07-21') 

/*Write a query to display the length of first name for employee where last name contains character ‘c’ after 2nd position.*/

select length(fname) , lname from employee WHERE instr(lname, 'a') > 2

/* Write a query to extract the last 4 character of PhoneNumber.*/

SELECT substr(phone, LENGTH(phone)-3) as 'Ph.No.' FROM employee;

/* Write a query to update the portion of the PhoneNumber in the employee table, within the phone number the substring ‘124’ will be replaced by ‘999’.*/

update employee set  phone = (replace("phone", "123","999"))

/*Write a query to calculate the age in year.*/

SELECT dob ,strftime('%Y','now') - strftime('%Y',dob) as age from employee

/* Write a query to get the distinct Mondays from HireDate in employee tables.*/

select * from employee where strftime('%w',hiredate) = strftime('%w','2021-06-21') 

/*Write a query to get the fname and HireDate from employee table where HireDate between ‘1987-06-01’ and ‘1987-07-30’*/

select * from employee where hiredate BETWEEN '1987-06-01' and '1987-07-01'


/*Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014*/

SELECT
CASE WHEN
StrFTime('%H', 'now') % 12 = 0 THEN 12
ELSE StrFTime('%H', 'now') % 12 END
|| ':' ||
StrFTime('%M', 'now')
|| ' ' ||
CASE WHEN
StrFTime('%H', 'now') > 12 THEN 'PM'
ELSE 'AM' END
||' '||strftime('%m-%d-%Y','now')
`currentTime`

/*Write a query to get the fname, lname who joined in the month of June.*/

SELECT empid,fname,lname , hiredate from employee 
WHERE strftime(' %m',hiredate)  = strftime(' %m','2022-06-21') 

/*Write a query to get first name, hire date and experience of the employee.*/

SELECT fname , hiredate , strftime('%Y' , 'now' ) - strftime('%Y',hiredate) as Experiance
FROM employee

/*Write a query to get first name of employee who joined in 1987.*/

SELECT fname FROM employee WHERE strftime('%Y',hiredate) = strftime('%Y','1987-01-01')
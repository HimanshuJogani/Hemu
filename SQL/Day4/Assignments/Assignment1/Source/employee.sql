CREATE TABLE employee (
empid INTEGER ,
fname TEXT NOT NULL,
lname TEXT NOT NULL,
salary NUMERIC NOT NULL,
joindate date NOT NULL,
department TEXT NOT NULL,
PRIMARY KEY(empid AUTOINCREMENT)
)

INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "joindate", "department") VALUES ('1', 'Himanshu', 'Jogani', '5000', '2021-05-01', '.net');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "joindate", "department") VALUES ('2', 'Akash', 'gupta', '7000', '2021-06-01', '.net');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "joindate", "department") VALUES ('3', 'Nikhil', 'Thomas', '9000', '2020-07-01', 'mobile');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "joindate", "department") VALUES ('4', 'John', 'Abraham', '10000', '2019-04-20', 'mobile');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "joindate", "department") VALUES ('5', 'Jerry', 'Pinto', '650000', '2019-05-20', 'HR');
INSERT INTO "main"."employee" ("empid", "fname", "lname", "salary", "joindate", "department") VALUES ('6', 'Arpit', 'Name1', '70000', '2019-04-20', 'Accountant');




/* Write a query to rank employee based on their salary for a month */

SELECT empid, fname ,salary, rank() OVER (ORDER by salary DESC ) Ranksalary FROM employee


/*Select 4th Highest salary from employee table using ranking function*/

 select * from(select fname, salary, dense_rank() over(order by salary desc)salaryrank from employee) where salaryrank=4  



/* Get department, total salary with respect to a department from employee table.*/

SELECT department, sum(salary) from employee GROUP by department


/* Get department, total salary with respect to a department from employee table order by total salary descending */

SELECT department, sum(salary) as totalsalary from employee GROUP by department ORDER by totalsalary DESC

/*Get department wise maximum salary from employee table order by salary ascending*/

SELECT department, max(salary) as maxsalary from employee GROUP by department ORDER by maxsalary ASC


/* Get department wise minimum salary from employee table order by salary ascending*/
SELECT department, min(salary) as minsalary from employee GROUP by department ORDER by minsalary ASC


/* Select department, total salary with respect to a department from employee table where 
total salary greater than 50000 order by TotalSalary descending*/

SELECT department, sum(salary) as  totalsalary from employee GROUP by department HAVING sum(salary) > 50000 ORDER by  totalsalary DESC
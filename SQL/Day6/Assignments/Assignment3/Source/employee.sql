CREATE TABLE empl ( 
empid  INTEGER,
fname TEXT NOT NULL,
lname TEXT NOT NULL,
city TEXT NOT NULL,
hiredate  TEXT NOT NULL,
depname  TEXT NOT NULL, 
managerid INTEGER ,
salary NUMERIC,
PRIMARY key (empid),
FOREIGN KEY (managerid) REFERENCES empl(empid)
)

INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('1', 'Himanshu', 'Jogani', 'ahmedabad', '2000-01-01', 'mobile', '8', '50000');
INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('2', 'Akash', 'Gupta', 'surat', '2005-02-01', 'mobile', '1', '40000');
INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('3', 'Nikhil', 'kocher', 'vadodara', '2012-02-01', 'hr', '', '30000');
INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('4', 'Arpit', 'austin', 'gandhinagar', '2013-05-01', 'php', '5', '50000');
INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('5', 'Rushi', 'Gandhi', 'bhavnagar', '2006-12-01', 'php', '', '45000');
INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('6', 'Nidhi', 'popp', 'ahmedabad', '2007-11-28', 'php', '5', '100000');
INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('7', 'Parva', 'himuro', 'gandhinagar', '2015-11-24', 'hr', '3', '45000');
INSERT INTO "main"."empl" ("empid", "fname", "lname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('8', 'Ashish', 'kumar', 'ahmedabad', '2020-05-04', 'mobile', '', '50000');


/*Write a View to display the department name, manager name, and city. */

CREATE view mangemp as
SELECT e.depname , e.fname, m.fname,e.city from empl e
INNER join empl m on
m.empid = e.managerid

SELECT * FROM mangemp

/*Create a View to display department name, name (first_name, last_name), 
hire date, salary of the manager for all managers whose experience is more than 15 years.*/

CREATE VIEW mgexp as
SELECT d.depname , d.fname || ' ' || d.lname as mangername , 
e.hiredate,e.salary
FROM empl e  INNER JOIN empl d
on d.empid = e.managerid 
WHERE  (julianday('now') - julianday(d.hiredate)) / 365  >  15

SELECT * from mgexp

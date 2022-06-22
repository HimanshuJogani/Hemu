/*Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, 
Commission, Manager_Id and Department_Id and make sure that, the Employee_Id column does not contain any duplicate value 
at the time of insertion, and the foreign key column DepartmentId,reference by the column DepartmentId of Departments table, can 
contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId 
of jobs table, can contain only those values which are exists in the jobs table.*/


CREATE TABLE "job" (
	"jobid"	TEXT NOT NULL,
	"jobtitle"	TEXT NOT NULL,
	PRIMARY KEY("jobid")
);



INSERT INTO "main"."job" ("jobid", "jobtitle") VALUES ('AD_PRES', 'preseident');
INSERT INTO "main"."job" ("jobid", "jobtitle") VALUES ('AD_VP', 'vice preseident');
INSERT INTO "main"."job" ("jobid", "jobtitle") VALUES ('FI_MGR', 'Finance manager');
INSERT INTO "main"."job" ("jobid", "jobtitle") VALUES ('ST_MAN', 'Stock manger');
INSERT INTO "main"."job" ("jobid", "jobtitle") VALUES ('ST_CLERK', 'Stock clark');
INSERT INTO "main"."job" ("jobid", "jobtitle") VALUES ('SH_CLERK', 'Shopping clark');



CREATE TABLE "employees" (
	"empid"	INTEGER,
	"fname"	TEXT NOT NULL,
	"lname"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"phone"	INTEGER NOT NULL,
	"hiredate"	date,
	"jobid"	TEXT NOT NULL,
	"salary"	NUMERIC,
	"commission"	NUMERIC,
	"managerid"	INTEGER,
	"depid"	INTEGER NOT NULL,
	FOREIGN KEY("depid") REFERENCES "departments"("departmentid"),
	FOREIGN KEY("jobid") REFERENCES "job"("jobid"),
	PRIMARY KEY("empid")
);


CREATE table departments (
departmentid INTEGER,
departmentname TEXT NOT NULL,
PRIMARY KEY (depid)
)

INSERT INTO "main"."departments" ("departmentid", "departmentname") VALUES ('10', 'admin');
INSERT INTO "main"."departments" ("departmentid", "departmentname") VALUES ('20', 'marketing');
INSERT INTO "main"."departments" ("departmentid", "departmentname") VALUES ('40', 'sales');
INSERT INTO "main"."departments" ("departmentid", "departmentname") VALUES ('80', 'mobile');
INSERT INTO "main"."departments" ("departmentid", "departmentname") VALUES ('90', 'hr');
INSERT INTO "main"."departments" ("departmentid", "departmentname") VALUES ('100', 'Accouning');
INSERT INTO "main"."departments" ("departmentid", "departmentname") VALUES ('110', 'qa');
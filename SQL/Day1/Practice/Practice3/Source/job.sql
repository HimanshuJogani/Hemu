
/* Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, 
and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered 
automatically at the time of insertion if no value assigned for the specified columns.*/


CREATE TABLE jobs (
jobid INTEGER,
jobtitle TEXT DEFAULT '', 
minslary NUMERIC DEFAULT 8000, 
maxsalary NUMERIC NOT NULL
);
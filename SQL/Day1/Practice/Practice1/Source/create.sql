/* Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries 
except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique*/


CREATE TABLE countries (
	CountryId	INTEGER ,
	CountryName	TEXT NOT NULL 
	CHECK(CountryName IN ('Italy','India','China')),
	RegionId	TEXT NOT NULL UNIQUE,
	PRIMARY KEY(CountryId)
);


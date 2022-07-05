
==> Create a Restful API to create an employee, get all employees, get an employees,get an employee, update and employee http://localhost:3000/emps AddressLine1(optional):string AddressLine2(optional): string AddressLine3(optional): string assignments(optional): array CitizenshipId(optional): integer(int64) CitizenshipLegislationCode(optional): string CitizenshipStatus(optional): string CitizenshipToDate(optional): string(date) City(optional): string CorrespondenceLanguage(optional): string Country(optional): string CreationDate(optional): string(date-time) DateOfBirth(optional): string(date) directReports(optional): array DisplayName(optional): string DriversLicenseExpirationDate(optional): string(date) DriversLicenseId(optional): integer(int64) DriversLicenseIssuingCountry(optional): string EffectiveStartDate(optional): string(date) Ethnicity(optional): string FirstName(optional): string Gender(optional): string HireDate(optional): string(date) HomeFaxAreaCode(optional): string HomeFaxCountryCode(optional): string HomeFaxExtension(optional): string HomeFaxLegislationCode(optional): string HomeFaxNumber(optional): string HomePhoneAreaCode(optional): string HomePhoneCountryCode(optional): string HomePhoneExtension(optional): string HomePhoneLegislationCode(optional): string HomePhoneNumber(optional): string Honors(optional): string LastName(optional): string LastUpdateDate(optional): string(date-time) LegalEntityId(optional): integer(int64) LicenseNumber(optional): string links(optional): array MaritalStatus(optional): string MiddleName(optional):string MilitaryVetStatus(optional): string NameSuffix(optional): string NationalId(optional): string NationalIdCountry(optional): string




1. Declare the module express and fs.
2. Use the get method of express for fetching the data json file.
3. Use the get method of express for fetching the data of employee from json file.
4. Declare the array data1.
5. Use the readfile method of fs for reading the json file.
6. Store the data into array data1.
7. Find the id from data using array data1 and store into result.
8. Use the write method to write the data into json file.
9. Data send to response.
10. For Updating the data using put method of express module.
11. Find the employee id and update the data of the employee.
12. Use the write method to write the data into json file.
13. Data send to response.
14. Listening at port number 3000.

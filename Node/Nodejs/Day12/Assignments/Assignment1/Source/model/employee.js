 
 const mongoose = require("mongoose");
 const EmployeeModel = mongoose.Schema({
     AddressLine1: {
         type: String
     },
     AddressLine2: {
         type: String
     },
     AddressLine3: {
         type: String
     },
     CitizenshipId: {
         type: Number
     },
     CitizenshipLegislationCode: {
         type: String
     },
     CitizenshipStatus: {
         type: String
     },
     CitizenshipToDate: {
         type: String
     },
     City: {
         type: String
     },
     CorrespondenceLanguage: {
         type: String
     },
     Country: {
         type: String
     },
     CreationDate: {
         type: Date
     },
     DateOfBirth: {
         type: Date
     },
     DisplayName: {
         type: String
     },
     DriversLicenseExpirationDate: {
         type: String
     },
     DriversLicenseId: {
         type: Number
     },
     DriversLicenseIssuingCountry: {
         type: String
     },
     EffectiveStartDate: {
         type: Date
     },
     Ethnicity: {
         type: String
     },
     FirstName: {
         type: String
     },
     Gender: {
         type: String
     },
     HireDate: {
         type: Date
     },
     HomeFaxAreaCode: {
         type: String
     },
     HomeFaxCountryCode: {
         type: String
     },
     HomeFaxExtension: {
         type: String
     },
     HomeFaxLegislationCode: {
         type: String
     },
     HomeFaxNumber: {
         type: String
     },
     HomePhoneAreaCode: {
         type: String
     },
     HomePhoneCountryCode: {
         type: String
     },
     HomePhoneExtension: {
         type: String
     },
     HomePhoneLegislationCode: {
         type: String
     },
     HomePhoneNumber: {
         type: String
     },
     Honors: {
         type: String
     },
     LastName: {
         type: String
     },
     LastUpdateDate: {
         type: Date
     },
     LegalEntityId: {
         type: Number
     },
     LicenseNumber: {
         type: String
     },
     MaritalStatus: {
         type: String
     },
     MiddleName: {
         type: String
     },
     MilitaryVetStatus: {
         type: String
     },
     NameSuffix: {
         type: String
     },
     NationalId: {
         type: String
     },
     NationalIdCountry: {
         type: String
     },
     assignments: {
         ActionCode: {
             type: String
         },
         ActionReasonCode: {
             type: String
         },
         ActualTerminationDate: {
             type: Date
         },
         AssignmentCategory: {
             type: String
         },
         AssignmentId: {
             type: String
         },
         AssignmentName: {
             type: String
         },
         AssignmentNumber: {
             type: String
         },
         AssignmentProjectedEndDate: {
             type: String
         },
         AssignmentStatus: {
             type: String
         },
         AssignmentStatusTypeId: {
             type: Number
         },
         BusinessUnitId: {
             type: Number
         },
         CreationDate: {
             type: String
         },
         DefaultExpenseAccount: {
             type: String
         },
         DepartmentId: {
             type: Number
         },
         EffectiveEndDate: {
             type: String
         },
         EffectiveStartDate: {
             type: Date
         },
         EndTime: {
             type: String
         },
         Frequency: {
             type: String
         },
         FullPartTime: {
             type: String
         },
         GradeId: {
             type: Number
         },
         GradeLadderId: {
             type: Number
         },
         JobId: {
             type: Number
         },
         LastUpdateDate: {
             type: String
         },
         LegalEntityId: {
             type: Number
         },
         LocationId: {
             type: Number
         },
         ManagerAssignmentId: {
             type: Number
         },
         ManagerId: {
             type: Number
         },
         assignmentDFF: {
             type: Array
         },
         assignmentExtraInformation: {
             type: Array
         },
         empreps: {
             type: Array
         },
         links: {
             type: [
                 String
             ]
         }
     },
     directReports: {
         type: [
             String
         ]
     },
     id: {
         type: Number
     },
     links: {
         type: [
             String
         ]
     }
 });
 module.exports = mongoose.model("employees", EmployeeModel);
import 'employee_entities.dart';

class EmployeesModel extends EmployeesEntities {
  EmployeesModel({
    required int employeeId,
    required String employeeName,
    required int employeeSalary,
    required String employeeJoiningDate,
  }) : super(
    employeeId: employeeId,
    employeeName: employeeName,
    employeeSalary: employeeSalary,
    employeeJoiningDate: employeeJoiningDate,
  );

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
    employeeId: json["EmployeeId"],
    employeeName: json["EmployeeName"],
    employeeSalary: json["EmployeeSalary"],
    employeeJoiningDate: json["EmployeeJoiningDate"],
  );

  Map<String, dynamic> toJson() => {
    "EmployeeId": employeeId,
    "EmployeeName": employeeName,
    "EmployeeSalary": employeeSalary,
    "EmployeeJoiningDate": employeeJoiningDate,
  };
}
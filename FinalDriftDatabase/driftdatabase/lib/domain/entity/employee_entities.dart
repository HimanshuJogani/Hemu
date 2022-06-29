import 'package:equatable/equatable.dart';

class EmployeesEntities extends Equatable {
  final int? employeeId;
  final String? employeeName;
  final int? employeeSalary;
  final String? employeeJoiningDate;

  EmployeesEntities({
    this.employeeId,
    this.employeeName,
    this.employeeSalary,
    this.employeeJoiningDate,
  });

  @override
  List<Object?> get props => [employeeId!, employeeName!, employeeSalary!, employeeJoiningDate!];
}
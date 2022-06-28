import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:driftdatabase/core/error/failures.dart';
import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/data/model/employee_model.dart';
import 'package:driftdatabase/domain/repository/employee_entities_repository.dart';
import 'package:flutter/services.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final AppDatabase appDatabase = AppDatabase();

  EmployeeRepositoryImpl();

  @override
  Future<Either<Failure, void>?>? addEmployeeEntities() async {
    // TODO: implement addEmployeeEntities
    var jsonText = await rootBundle.loadString('assets/employee.json');
    Map<String, dynamic> map = json.decode(jsonText);
    List<dynamic> data = map["auditEntity"];
    List<EmployeesModel> subList =
        data.map((e) => EmployeesModel.fromJson(e)).toList();
    List<EmployeeTableCompanion> list = [];
    try {
      for (var element in subList) {
        final data = EmployeeTableCompanion.insert(
          employeeId: Value(element.employeeId),
          employeeName: Value(element.employeeName),
          employeeSalary: Value(element.employeeSalary),
          employeeJoiningDate: Value(element.employeeJoiningDate),
        );
        list.add(data);
      }
      final add = await appDatabase.employeeDao.insertEmployee(list);
      return Right(add);
    } catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>?>? deleteEmployeeEntities(
      Employee employeeDetails) async {
    // TODO: implement deleteEmployeeEntities
    final delete = await appDatabase.employeeDao.deleteEmployee(employeeDetails);
    return Right(delete);
  }

  @override
  Future<Either<Failure, List<Employee?>>?>? getEmployeeEntities() async {
    // TODO: implement getEmployeeEntities
    try{
      final get = await appDatabase.employeeDao.watchAllEmployee();
      return Right(get);
    }on Exception{
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>?>? updateEmployeeEntities(
      Employee employeeDetails) async {
    // TODO: implement updateEmployeeEntities
    final update = await appDatabase.employeeDao
        .updateEmployee(employeeDetails);
    return Right(update);
  }
}

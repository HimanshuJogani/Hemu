import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/datasources/local/database/drift_database.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee?>>?>? getEmployeeEntities();
  Future<Either<Failure, void>?>? updateEmployeeEntities(
      Employee auditEntities);
  Future<Either<Failure, void>?>? addEmployeeEntities(Employee employee);
  Future<Either<Failure, void>?>? deleteEmployeeEntities(
      Employee auditEntities);
}

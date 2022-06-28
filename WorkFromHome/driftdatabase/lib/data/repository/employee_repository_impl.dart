import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:driftdatabase/core/error/failures.dart';
import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/data/model/employee_model.dart';
import 'package:driftdatabase/domain/repository/employee_entities_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final AppDatabase appDatabase;

  EmployeeRepositoryImpl(this.appDatabase);

  @override
  Future<Either<Failure, void>?>? addEmployeeEntities() async {
    // TODO: implement addEmployeeEntities
    List<EmployeesModel> subList =
        data.map((e) => EmployeesModel.fromJson(e)).toList();
    List<EmployeeTableCompanion> list = [];
    try {
      final data = EmployeeTableCompanion.insert(
        employeeId: Value(int.parse(id)),
        employeeName: Value(name),
        employeeSalary: Value(int.parse(salary)),
        employeeJoiningDate: Value(joiningdate),
      );
      list.add(data);
      await appDatabase.employeeDao.insertEmployee(list);
    } catch (e) {
      print('fail');
    }
  }

  @override
  Future<Either<Failure, void>?>? deleteEmployeeEntities(
      Employee auditEntities) {
    // TODO: implement deleteEmployeeEntities
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Employee?>>?>? getEmployeeEntities() {
    // TODO: implement getEmployeeEntities
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>?>? updateEmployeeEntities(
      Employee auditEntities) {
    // TODO: implement updateEmployeeEntities
    throw UnimplementedError();
  }
}

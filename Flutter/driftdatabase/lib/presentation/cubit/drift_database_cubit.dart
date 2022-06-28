import 'package:driftdatabase/presentation/cubit/drift_database_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart' as drift;

import '../../data/datasources/local/database/drift_database.dart';

class DriftDatabaseCubit extends Cubit<DriftDatabaseState> {
  DriftDatabaseCubit() : super(DriftDatabaseSuccess());
  AppDatabase appDatabase = AppDatabase();

  Future<void> addEmp(
      String id, String name, String salary, String joiningdate) async {
    try {
      List<EmployeeTableCompanion> list = [];
      final data = EmployeeTableCompanion.insert(
        employeeId: drift.Value(int.parse(id)),
        employeeName: drift.Value(name),
        employeeSalary: drift.Value(int.parse(salary)),
        employeeJoiningDate: drift.Value(joiningdate),
      );
      list.add(data);
      print(data);
      print(list.toString());
      await appDatabase.employeeDao.insertEmployee(list);
      emit(DriftDatabaseSuccess());
    } catch (e) {
      print('fail');
    }
  }

  Future<void> updateEmp(
      String id, String name, String salary, String joiningdate) async {
    Employee e = Employee(
        employeeId: int.parse(id),
        employeeName: name,
        employeeSalary: int.parse(salary),
        employeeJoiningDate: joiningdate);
    await appDatabase.employeeDao.updateEmployee(e);
    emit(DriftDatabaseSuccess());
  }

  Future<void> deleteEmp(Employee emp) async {
    await appDatabase.employeeDao.deleteEmployee(emp);
    emit(DriftDatabaseSuccess());
  }
}

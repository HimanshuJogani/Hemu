import 'dart:ffi';

import 'package:driftdatabase/core/usecase/usecase.dart';
import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/domain/usecase/add_employee_entities.dart';
import 'package:driftdatabase/domain/usecase/delete_employee_entities.dart';
import 'package:driftdatabase/domain/usecase/get_employee_entities_usecase.dart';
import 'package:driftdatabase/domain/usecase/update_employee_entities.dart';
import 'package:driftdatabase/presentation/cubit/drift_database_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart' as drift;

class DriftDatabaseCubit extends Cubit<DriftDatabaseState> {
  DriftDatabaseCubit(this.getEmployeeEntities, this.addEmployeeEntities,
      this.deleteEmployeeEntities, this.updateEmployeeEntities)
      : super(DriftDatabaseInitial()) {
    getEmp();
  }

  final GetEmployeeEntities getEmployeeEntities;
  final AddEmployeeEntities addEmployeeEntities;
  final DeleteEmployeeEntities deleteEmployeeEntities;
  final UpdateEmployeeEntities updateEmployeeEntities;

  insertEmp(int id, String name, int salary, String Joindate) async {
    await addEmployeeEntities.call(Employee(
        employeeId: id,
        employeeName: name,
        employeeSalary: salary,
        employeeJoiningDate: Joindate));
    getEmp();
  }

  getEmp() async {
    final datalist = await getEmployeeEntities.call(NoParams());
    datalist?.fold((l) => null,
        (r) => emit(DriftDatabaseSuccess(employeeList: r as List<Employee>)));
  }

  deleteEmp(Employee employee) async {
    await deleteEmployeeEntities.call(employee);
    getEmp();
  }

  updateEmp(Employee employee) async {
    await updateEmployeeEntities.call(employee);
    getEmp();
  }
}

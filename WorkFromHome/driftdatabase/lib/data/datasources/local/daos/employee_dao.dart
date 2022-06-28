import 'package:drift/drift.dart';
import '../database/drift_database.dart';
part 'employee_dao.g.dart';

@DriftAccessor(tables: [EmployeeTable])
class EmployeeDao extends DatabaseAccessor<AppDatabase>
    with _$EmployeeDaoMixin {
  final AppDatabase db;

  EmployeeDao(this.db) : super(db);

  Future<List<Employee>> watchAllEmployee() => select(employeeTable).get();

  Future<void> insertEmployee(
      List<EmployeeTableCompanion> employeeDetails) async {
    await batch((batch) {
      batch.insertAll(employeeTable, employeeDetails);
    });
  }

  Future updateEmployee(Insertable<Employee> employeeDetails) =>
      update(employeeTable).replace(employeeDetails);

  Future deleteEmployee(Insertable<Employee> employeeDetails) =>
      delete(employeeTable).delete(employeeDetails);
}

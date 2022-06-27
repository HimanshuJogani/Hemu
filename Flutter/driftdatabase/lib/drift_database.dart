import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:driftdatabase/employee_dao.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'drift_database.g.dart';


@DataClassName('Employee')
class EmployeeTable extends Table {
  IntColumn get employeeId => integer().nullable()();
  TextColumn get employeeName => text().nullable()();
  IntColumn get employeeSalary => integer().nullable()();
  TextColumn get employeeJoiningDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {employeeId};
}

@DriftDatabase(tables: [EmployeeTable], daos: [EmployeeDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(_openConnection());

  @override
  int get schemaVersion => 1;

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'employee.db'));
    return NativeDatabase(file);
  });
}
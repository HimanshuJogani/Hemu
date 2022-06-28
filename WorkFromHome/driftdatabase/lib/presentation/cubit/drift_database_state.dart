import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/presentation/cubit/drift_database_cubit.dart';

abstract class DriftDatabaseState {}

class DriftDatabaseInitial extends DriftDatabaseState {}

class DriftDatabaseSuccess extends DriftDatabaseState {
  final List<Employee> employeeList;
  DriftDatabaseSuccess({required this.employeeList});
}

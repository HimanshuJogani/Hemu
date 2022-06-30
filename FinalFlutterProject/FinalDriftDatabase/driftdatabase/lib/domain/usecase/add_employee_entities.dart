import 'package:dartz/dartz.dart';
import 'package:driftdatabase/core/error/failures.dart';
import 'package:driftdatabase/core/usecase/usecase.dart';
import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/domain/repository/employee_entities_repository.dart';

class AddEmployeeEntities extends UseCase<void, Employee> {
  final EmployeeRepository repository;

  AddEmployeeEntities(this.repository);

  @override
  Future<Either<Failure, void>?>? call(Employee params) async {
    return await repository.addEmployeeEntities(params);
  }
}

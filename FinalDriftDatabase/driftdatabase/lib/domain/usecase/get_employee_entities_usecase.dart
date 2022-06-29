import 'package:dartz/dartz.dart';
import 'package:driftdatabase/core/error/failures.dart';
import 'package:driftdatabase/core/usecase/usecase.dart';
import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/domain/repository/employee_entities_repository.dart';

class GetEmployeeEntities extends UseCase<List<Employee?>, NoParams> {
  final EmployeeRepository repository;

  GetEmployeeEntities(this.repository);

  @override
  Future<Either<Failure, List<Employee?>>?>? call(NoParams params) async {
    return await repository.getEmployeeEntities();
  }
}

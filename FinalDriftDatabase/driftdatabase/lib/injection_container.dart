import 'package:driftdatabase/presentation/cubit/drift_database_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/local/daos/employee_dao.dart';
import 'data/datasources/local/database/drift_database.dart';
import 'data/repository/employee_repository_impl.dart';
import 'domain/repository/employee_entities_repository.dart';
import 'domain/usecase/add_employee_entities.dart';
import 'domain/usecase/delete_employee_entities.dart';
import 'domain/usecase/get_employee_entities_usecase.dart';
import 'domain/usecase/update_employee_entities.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(
    () => DriftDatabaseCubit(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  //Usecase
  sl.registerLazySingleton(() => GetEmployeeEntities(sl()));
  sl.registerLazySingleton(() => AddEmployeeEntities(sl()));
  sl.registerLazySingleton(() => DeleteEmployeeEntities(sl()));
  sl.registerLazySingleton(() => UpdateEmployeeEntities(sl()));

  // Repository
  sl.registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(appDatabase: sl()));

  sl.registerSingleton(AppDatabase());
  // Dio client
  sl.registerSingleton(EmployeeDao(sl()));
}

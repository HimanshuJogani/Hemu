

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tddarch/feature/data/datasources/number_trivia_local_data_sources.dart';
import 'package:tddarch/feature/data/datasources/number_trivia_remote_data_sources.dart';
import 'package:tddarch/feature/data/repository/number_trivia_repository_impl.dart';
import 'package:tddarch/feature/domain/repository/number_trivia_repository.dart';
import 'package:tddarch/feature/domain/usecase/get_random_number_trivia.dart';
import 'package:tddarch/feature/presentation/cubit/numbertrivia_cubit.dart';
import 'package:tddarch/platform/network_info.dart';
import 'package:http/http.dart' as http;

import 'feature/domain/usecase/get_conceret_number_trivia.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //cubit
  sl.registerFactory(() => NumberTriviaCubit(sl(),sl()));

  //usecase
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(() => NumberTriviaRepositoryImpl(networkInfo: sl(), localDataSources: sl(), remoteDataSources: sl()));

  //DataSources
  sl.registerLazySingleton<NumberTriviaLocalDataSources>(() => NumberTriviaLocalSourcesImple(sharedPreferences: sl()));
  sl.registerLazySingleton<NumberTriviaRemoteDataSources>(() => NumberTriviaRemoteDataSourcesImple(client: sl()));
  
  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetWorkInfoImpl(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerLazySingleton(() => http.Client());


}
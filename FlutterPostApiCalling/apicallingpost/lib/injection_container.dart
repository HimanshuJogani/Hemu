import 'package:apicallingpost/features/apicalling_post/data/datasources/api_call_remote_datasource.dart';
import 'package:apicallingpost/features/apicalling_post/data/repository/api_call_remote_repository_impl.dart';
import 'package:apicallingpost/features/apicalling_post/domain/repository/api_call_post_repository.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_delete_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_get_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_post_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_update_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/presentation/cubit/api_call_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(() => ApiCallCubit(sl(), sl()));

  //Usecase
  sl.registerLazySingleton(() => GetApiCallingGetUsecase(sl()));
  sl.registerLazySingleton(() => GetApiCallingPostUsecase(sl()));
  sl.registerLazySingleton(() => DeleteApiCallingGetUsecase(sl()));
  sl.registerLazySingleton(() => UpdateApiCallingUpdateUsecase(sl()));

  // Repository
  sl.registerLazySingleton<ApiCallingPostRepository>(
      () => ApiCallRepositoryImpl(apiCallRemoteDataSource: sl()));

  //datasource
  sl.registerLazySingleton<ApiCallRemoteDataSource>(
      () => ApiCallRemoteDataSourceImpl(dio: sl()));

  //external
  //sl.registerLazySingleton<NetworkInfo>(() => NetWorkInfoImpl(sl()));
  sl.registerLazySingleton(() => Dio());
}

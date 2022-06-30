import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_character_name_usecase.dart';
import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_character_random_usecase.dart';
import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_specific_category_usecase.dart';
import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_specific_id_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'characterapicalling/data/datasources/character_remote_data_sources.dart';
import 'characterapicalling/data/repository/character_repository_impl.dart';
import 'characterapicalling/domain/repository/character_repository.dart';
import 'characterapicalling/domain/usecases/get_all_character_usecase.dart';
import 'characterapicalling/presentation/bloc/character_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(() => CharacterCubit(sl(), sl()));

  //Usecase
  sl.registerLazySingleton(() => GetAllCharacterUsecase(sl()));
  sl.registerLazySingleton(() => GetCharacterSpecificById(sl()));
  sl.registerLazySingleton(() => GetCharacterSpecificByCategory(sl()));
  sl.registerLazySingleton(() => GetCharacterRandom(sl()));
  sl.registerLazySingleton(() => GetCharacterNameUsecase(sl()));

  // Repository
  sl.registerLazySingleton<CharacterApiRepository>(
      () => CharacterApiRepositoryImpl(characterRemoteDataSource: sl()));

  //datasource
  sl.registerLazySingleton<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(dio: sl()));

  //external
  //sl.registerLazySingleton<NetworkInfo>(() => NetWorkInfoImpl(sl()));
  sl.registerLazySingleton(() => Dio());
}

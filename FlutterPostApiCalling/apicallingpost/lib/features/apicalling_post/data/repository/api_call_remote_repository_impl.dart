import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/features/apicalling_post/data/datasources/api_call_remote_datasource.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/domain/repository/api_call_post_repository.dart';
import 'package:dartz/dartz.dart';

class ApiCallRepositoryImpl extends ApiCallingPostRepository {
  final ApiCallRemoteDataSource apiCallRemoteDataSource;
  ApiCallRepositoryImpl({required this.apiCallRemoteDataSource});

  @override
  Future<Either<Failure, List<ApiCallModel>>> apiCallingPostRepo(
      ApiCallModel apiCallModel) async {
    // TODO: implement apiCallingPostRepo
    try {
      print('repoImpl');
      final addPostData =
          await apiCallRemoteDataSource.postAllDataInApi(apiCallModel);
      return Right(addPostData);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<ApiCallModel>>> apiCallingGetRepo() async {
    // TODO: implement apiCallingGetRepo
    print('apiCallingGetRepo 3');
    try {
      final getAllData = await apiCallRemoteDataSource.getAllDataInApi();
      print(getAllData);
      return Right(getAllData);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<ApiCallModel>>> apiCallingDeleteRepo(
      int id) async {
    // TODO: implement apiCallingDeleteRepo
    try {
      print('apiDeleteImpl');
      final getAllData = await apiCallRemoteDataSource.deleteAllDataApi(id);
      print(getAllData);
      return Right(getAllData);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<ApiCallModel>>> apiCallingUpdateRepo(
      ApiCallModel apiCallModel) async {
    // TODO: implement apiCallingUpdateRepo
    try {
      print('apiUpdateImpl');
      final getAllData =
          await apiCallRemoteDataSource.updateSpecificData(apiCallModel);
      print(getAllData);
      return Right(getAllData);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }
}

import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/features/apicalling_post/data/datasources/api_call_remote_datasource.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/domain/repository/api_call_post_repository.dart';
import 'package:dartz/dartz.dart';

class ApiCallRepositoryImpl extends ApiCallingPostRepository{

  final ApiCallRemoteDataSource apiCallRemoteDataSource;
  ApiCallRepositoryImpl({required this.apiCallRemoteDataSource});

  @override
  Future<Either<Failure, List<ApiCallModel>>> apiCallingPostRepo() {
    // TODO: implement apiCallingPostRepo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ApiCallModel>>> apiCallingGetRepo() async {
    // TODO: implement apiCallingGetRepo
    print('apiCallingGetRepo 3');
    try {
      final getAllData =
          await apiCallRemoteDataSource.getAllDataInApi();
      print(getAllData);
      return Right(getAllData);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

}
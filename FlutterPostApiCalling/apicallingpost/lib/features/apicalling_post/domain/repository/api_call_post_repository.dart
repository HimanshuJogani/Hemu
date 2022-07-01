import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';

import 'package:dartz/dartz.dart';

abstract class ApiCallingPostRepository {
  Future<Either<Failure, List<ApiCallModel>>> apiCallingPostRepo(
      ApiCallModel apiCallModel);
  Future<Either<Failure, List<ApiCallModel>>> apiCallingGetRepo();
  Future<Either<Failure, List<ApiCallModel>>> apiCallingDeleteRepo(int id);
  Future<Either<Failure, List<ApiCallModel>>> apiCallingUpdateRepo(
      ApiCallModel apiCallModel);
}

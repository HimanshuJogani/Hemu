import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';

import 'package:dartz/dartz.dart';

abstract class ApiCallingPostRepository{
  Future<Either<Failure, List<ApiCallModel>>> apiCallingPostRepo();
  Future<Either<Failure,List<ApiCallModel>>> apiCallingGetRepo();
}


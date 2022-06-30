import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/core/usecase/usecase.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/domain/repository/api_call_post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetApiCallingGetUsecase implements UseCase<List<ApiCallModel>,NoParams>{
  final ApiCallingPostRepository apiCallingPostRepository;
  GetApiCallingGetUsecase(this.apiCallingPostRepository);

  @override
  Future<Either<Failure, List<ApiCallModel>>> call(NoParams params) {
    // TODO: implement call
    return apiCallingPostRepository.apiCallingGetRepo();
  }
}

class NoParams extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}



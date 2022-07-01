import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/core/usecase/usecase.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/domain/repository/api_call_post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateApiCallingUpdateUsecase
    implements UseCase<List<ApiCallModel>, UpdateParams> {
  final ApiCallingPostRepository apiCallingPostRepository;
  UpdateApiCallingUpdateUsecase(this.apiCallingPostRepository);

  @override
  Future<Either<Failure, List<ApiCallModel>>> call(UpdateParams params) {
    // TODO: implement call
    return apiCallingPostRepository.apiCallingUpdateRepo(params.apiCallModel);
  }
}

class UpdateParams extends Equatable {
  final ApiCallModel apiCallModel;
  UpdateParams(this.apiCallModel);

  @override
  // TODO: implement props
  List<Object?> get props => [apiCallModel];
}

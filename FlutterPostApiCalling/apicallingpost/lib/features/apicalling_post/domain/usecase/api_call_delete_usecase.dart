import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/core/usecase/usecase.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/domain/repository/api_call_post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteApiCallingGetUsecase
    implements UseCase<List<ApiCallModel>, DeleteParams> {
  final ApiCallingPostRepository apiCallingPostRepository;
  DeleteApiCallingGetUsecase(this.apiCallingPostRepository);

  @override
  Future<Either<Failure, List<ApiCallModel>>> call(DeleteParams params) {
    // TODO: implement call
    return apiCallingPostRepository.apiCallingDeleteRepo(params.studentId);
  }
}

class DeleteParams extends Equatable {
  final int studentId;
  DeleteParams(this.studentId);

  @override
  // TODO: implement props
  List<Object?> get props => [studentId];
}

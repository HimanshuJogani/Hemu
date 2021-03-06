import 'package:apicallingpost/core/error/failure.dart';
import 'package:apicallingpost/core/usecase/usecase.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/domain/repository/api_call_post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetApiCallingPostUsecase implements UseCase<List<ApiCallModel>, Params> {
  final ApiCallingPostRepository apiCallingPostRepository;
  GetApiCallingPostUsecase(this.apiCallingPostRepository);

  @override
  Future<Either<Failure, List<ApiCallModel>>> call(Params params) async {
    // TODO: implement call
    print('usecase');
    return await apiCallingPostRepository
        .apiCallingPostRepo(params.apiCallModel);
  }
}

class Params extends Equatable {
  final ApiCallModel apiCallModel;
  Params(this.apiCallModel);

  @override
  // TODO: implement props
  List<Object?> get props => [apiCallModel];
}

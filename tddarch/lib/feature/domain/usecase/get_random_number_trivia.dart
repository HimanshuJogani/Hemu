import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tddarch/error/failure.dart';
import 'package:tddarch/feature/domain/entity/number_trivia.dart';
import 'package:tddarch/usecases/usecase.dart';

import '../repository/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {

  final NumberTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(params) async {
    // TODO: implement call
    print('GetRandomNumberTrivia');
    return await repository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
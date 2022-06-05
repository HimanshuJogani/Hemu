import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tddarch/error/failure.dart';
import 'package:tddarch/feature/domain/entity/number_trivia.dart';
import 'package:tddarch/feature/domain/repository/number_trivia_repository.dart';
import 'package:tddarch/usecases/usecase.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia,Params>{

  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(params) async {
    // TODO: implement call
    print('GetConcreteNumberTrivia');
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable{

   final int number;
  const Params(this.number);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
import 'package:dartz/dartz.dart';
import 'package:tddarch/error/failure.dart';
import 'package:tddarch/feature/domain/entity/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
}
import 'package:tddarch/feature/domain/entity/number_trivia.dart';

abstract class NumberTriviaState {
}

class NumberTriviaInitial extends NumberTriviaState{}

class NumberTriviaRandom extends NumberTriviaState {}

class NumberTriviaRandomFailure extends NumberTriviaState {}

class NumberTriviaConcerte extends NumberTriviaState {
  final NumberTrivia numberTrivia;
  NumberTriviaConcerte(this.numberTrivia);

}

class NumberTriviaConcerteFailure extends NumberTriviaState {}
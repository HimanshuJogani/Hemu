
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tddarch/feature/domain/usecase/get_conceret_number_trivia.dart';
import 'package:tddarch/feature/domain/usecase/get_random_number_trivia.dart';
import 'package:tddarch/feature/presentation/cubit/numbertrivia_state.dart';

import '../../../error/failure.dart';
import '../../domain/entity/number_trivia.dart';

class NumberTriviaCubit extends Cubit<NumberTriviaState> {
  NumberTriviaCubit(this.getConcreteNumberTrivia, this.getRandomNumberTrivia) : super(NumberTriviaInitial());

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;

  getNumberTriviaConcerete(int number) async{
    print('getNumberTriviaConcerete');
    final a = number as Params;
    print(a);
   // a.number = number;
    Either<Failure, NumberTrivia> data = await getConcreteNumberTrivia.call(a);
    data.fold((l) => emit(NumberTriviaConcerteFailure()), (r) => emit(NumberTriviaConcerte(r)));

  }

  getNumberTriviaRandom() {
    print('getNumberTriviaRandom');
    emit(NumberTriviaRandom());
  }

}
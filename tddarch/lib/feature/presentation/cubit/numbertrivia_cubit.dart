
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tddarch/feature/domain/usecase/get_conceret_number_trivia.dart';
import 'package:tddarch/feature/domain/usecase/get_random_number_trivia.dart';

import 'package:tddarch/feature/presentation/cubit/numbertrivia_state.dart';

import '../../../error/failure.dart';
import '../../domain/entity/number_trivia.dart';

class NumberTriviaCubit extends Cubit<NumberTriviaState> {
  
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;

  NumberTriviaCubit(this.getConcreteNumberTrivia, this.getRandomNumberTrivia) : super(NumberTriviaInitial());

  
  getNumberTriviaConcerete(String number) async{
    int num = int.parse(number);
    debugPrint('getNumberTriviaConcerete');
   // a.number = number;
    final data = await getConcreteNumberTrivia.call(Params(num));
    data.fold((l) => emit(NumberTriviaConcerteFailure()), (r) => emit(NumberTriviaConcerte(r)));

  }

  getNumberTriviaRandom() {
    print('getNumberTriviaRandom');
    emit(NumberTriviaRandom());
  }

}
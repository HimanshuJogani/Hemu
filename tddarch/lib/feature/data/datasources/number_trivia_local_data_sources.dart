import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tddarch/error/failure.dart';
import 'package:tddarch/feature/data/model/number_trivia_model.dart';

abstract class  NumberTriviaLocalDataSources {

  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cachNumberTrivia(NumberTriviaModel triviaToCache);
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalSourcesImple implements NumberTriviaLocalDataSources{

  final SharedPreferences sharedPreferences;
  NumberTriviaLocalSourcesImple({required this.sharedPreferences});

  @override
  Future<void> cachNumberTrivia(NumberTriviaModel triviaToCache) {
    // TODO: implement cachNumberTrivia
    print('cachNumberTrivia');
    return sharedPreferences.setString(CACHED_NUMBER_TRIVIA, json.encode(triviaToCache.toJson()));
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    // TODO: implement getLastNumberTrivia
    print('getLastNumberTrivia');
   final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
   if(jsonString != null){
     print('jsonString');
    return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
   } else {
    throw CacheFailure();
   }

  }
}
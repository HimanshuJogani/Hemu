import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tddarch/error/failure.dart';
import 'package:tddarch/feature/data/model/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSources{
Future<NumberTriviaModel> getRandomNumberTrivia();
Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
}

class NumberTriviaRemoteDataSourcesImple implements NumberTriviaRemoteDataSources{

  final http.Client client;
  NumberTriviaRemoteDataSourcesImple({required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    print('NumberTriviaRemoteDataSourcesImple // getConcreteNumberTrivia');
    return _getTriviaFromUrl('http://numbersapi.com/$number');
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    print('NumberTriviaRemoteDataSourcesImple // getRandomNumberTrivia');
   return _getTriviaFromUrl('http://numbersapi.com/random');
  }

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
  final response = await client.get( Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },);

  if(response.statusCode == 200){
    print('response');
   return NumberTriviaModel.fromJson(json.decode(response.body));
  }else {
  throw ServerFailure();
  }
  }
}
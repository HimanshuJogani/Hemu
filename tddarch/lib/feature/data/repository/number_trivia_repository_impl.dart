import 'package:dartz/dartz.dart';
import 'package:tddarch/error/expection.dart';
import 'package:tddarch/error/failure.dart';
import 'package:tddarch/feature/data/datasources/number_trivia_local_data_sources.dart';
import 'package:tddarch/feature/data/datasources/number_trivia_remote_data_sources.dart';
import 'package:tddarch/feature/data/model/number_trivia_model.dart';
import 'package:tddarch/feature/domain/entity/number_trivia.dart';
import 'package:tddarch/feature/domain/repository/number_trivia_repository.dart';

import '../../../platform/network_info.dart';

typedef Future<NumberTrivia> _ConcreteOrRandomChooser();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository{
  final NumberTriviaLocalDataSources localDataSources;
  final NumberTriviaRemoteDataSources remoteDataSources;
  final NetworkInfo networkInfo;


  NumberTriviaRepositoryImpl({required this.networkInfo, required this.localDataSources, required this.remoteDataSources});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    // TODO: implement getConcreteNumberTrivia
    print('NumberTriviaRepositoryImpl && getConcreteNumberTrivia');
    return await _getTrivia(() => remoteDataSources.getConcreteNumberTrivia(number));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    // TODO: implement getRandomNumberTrivia
    print('NumberTriviaRepositoryImpl && getRandomNumberTrivia');
   return await _getTrivia(() => remoteDataSources.getRandomNumberTrivia());
  }

  Future<Either<Failure,NumberTrivia>> _getTrivia(_ConcreteOrRandomChooser getConcreteOrRandom) async {
  if(await networkInfo.isConnected){
    try{
      print('remoteTrivia');
      final remoteTrivia = await getConcreteOrRandom;
      localDataSources.cachNumberTrivia(remoteTrivia as NumberTriviaModel);
      return Right(remoteTrivia as NumberTriviaModel);
    } on ServerException  {
      return Left(ServerFailure());
    }
  }else {
    try {
      print('localTrivia');
      final localTrivia = await localDataSources.getLastNumberTrivia();
      return Right(localTrivia);
    } on CacheException {
      return Left(CacheFailure());
    }
   }
  }


}
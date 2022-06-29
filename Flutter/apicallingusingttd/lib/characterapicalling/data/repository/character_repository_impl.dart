import 'package:apicallingusingttd/characterapicalling/core/error/failures.dart';
import 'package:apicallingusingttd/characterapicalling/core/platform/network_info.dart';
import 'package:apicallingusingttd/characterapicalling/data/datasources/character_remote_data_sources.dart';
import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:apicallingusingttd/characterapicalling/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class CharacterApiRepositoryImpl implements CharacterApiRepository {
  final CharacterRemoteDataSource characterRemoteDataSource;

  CharacterApiRepositoryImpl({required this.characterRemoteDataSource});

  @override
  Future<Either<Failure, List<CharacterModel>>> getAllCharacters() async {
    // TODO: implement getAllCharacters
    try {
      final characterremotedata =
          await characterRemoteDataSource.getAllCharacterData();
      print(characterremotedata.length);
      return Right(characterremotedata);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharactersByCategory(
      String category) async {
    // TODO: implement getCharactersByCategory
    print('getCharactersByCategory 3');
    try {
      final getSpecificByCategory =
          await characterRemoteDataSource.getCharactersByCategoryData(category);
      print(getSpecificByCategory);
      return Right(getSpecificByCategory);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharactersRandom() async {
    // TODO: implement getCharactersRandom
    try {
      final getCharacterRandom =
          await characterRemoteDataSource.getCharacterRandomData();
      print(getCharacterRandom);
      return Right(getCharacterRandom);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> getSpecificCharactersById(
      int number) async {
    // TODO: implement getSpecificCharactersById
    try {
      final getSpecificByid =
          await characterRemoteDataSource.getSpecificCharactersByIdData(number);
      print(getSpecificByid);
      return Right(getSpecificByid);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> getSpecificCharactersByName(
      String name) async {
    // TODO: implement getSpecificCharactersByName
    try {
      final getSpecificByName =
          await characterRemoteDataSource.getCharactersByNameData(name);
      print(getSpecificByName);
      return Right(getSpecificByName);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }
}

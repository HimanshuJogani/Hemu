import 'package:apicallingusingttd/characterapicalling/core/error/failures.dart';
import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterApiRepository {
  Future<Either<Failure, List<CharacterModel>>> getAllCharacters();
  Future<Either<Failure, List<CharacterModel>>> getSpecificCharactersById(
      int number);
  Future<Either<Failure, List<CharacterModel>>> getCharactersByCategory(
      String category);
  Future<Either<Failure, CharacterModel>> getCharactersRandom();
  Future<Either<Failure, CharacterModel>> getSpecificCharactersByName(
      String name);
}

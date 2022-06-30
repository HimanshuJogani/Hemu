import 'package:apicallingusingttd/characterapicalling/core/error/failures.dart';
import 'package:apicallingusingttd/characterapicalling/core/usecases/usecase.dart';
import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:apicallingusingttd/characterapicalling/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCharacterNameUsecase implements UseCase<List<CharacterModel>, NameParams>{

  final CharacterApiRepository repository;
  GetCharacterNameUsecase(this.repository);

  @override
  Future<Either<Failure, List<CharacterModel>>> call(NameParams params) async {
    // TODO: implement call
    return await repository.getSpecificCharactersByName(params.name);
  }
}

class NameParams extends Equatable {
  final String name;

  NameParams({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
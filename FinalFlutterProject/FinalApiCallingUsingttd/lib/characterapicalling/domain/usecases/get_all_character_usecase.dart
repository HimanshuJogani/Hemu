import 'package:apicallingusingttd/characterapicalling/core/error/failures.dart';
import 'package:apicallingusingttd/characterapicalling/core/usecases/usecase.dart';
import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:apicallingusingttd/characterapicalling/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAllCharacterUsecase
    implements UseCase<List<CharacterModel>, NoParams> {
  final CharacterApiRepository repository;

  GetAllCharacterUsecase(this.repository);

  @override
  Future<Either<Failure, List<CharacterModel>>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getAllCharacters();
  }
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

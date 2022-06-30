import 'package:apicallingusingttd/characterapicalling/core/error/failures.dart';
import 'package:apicallingusingttd/characterapicalling/core/usecases/usecase.dart';
import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:apicallingusingttd/characterapicalling/domain/repository/character_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCharacterSpecificByCategory
    implements UseCase<List<CharacterModel>, CategoryParams> {
  final CharacterApiRepository repository;
  GetCharacterSpecificByCategory(this.repository);

  @override
  Future<Either<Failure, List<CharacterModel>>> call(
      CategoryParams params) async {
    print('GetCharacterSpecificByCategory 4');
    // TODO: implement call
    return await repository.getCharactersByCategory(params.catgory);
  }
}

class CategoryParams extends Equatable {
  final String catgory;

  CategoryParams({required this.catgory});

  @override
  // TODO: implement props
  List<Object?> get props => [catgory];
}

import 'package:apicallingusingttd/characterapicalling/core/error/failures.dart';
import 'package:apicallingusingttd/characterapicalling/core/usecases/usecase.dart';
import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:apicallingusingttd/characterapicalling/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GetCharacterSpecificById
    implements UseCase<List<CharacterModel>, Params> {
  final CharacterApiRepository repository;
  GetCharacterSpecificById(this.repository);

  @override
  Future<Either<Failure, List<CharacterModel>>> call(Params params) async {
    // TODO: implement call
    return await repository.getSpecificCharactersById(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}

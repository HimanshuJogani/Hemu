import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterSuccess extends CharacterState {
  final List<CharacterModel> characterModel;
  CharacterSuccess(this.characterModel);
}

class CharacterFailure extends CharacterState {}

class serchActive extends CharacterState {
  int num;
  serchActive(this.num);
}

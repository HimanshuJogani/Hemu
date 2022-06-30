import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_all_character_usecase.dart';
import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_character_name_usecase.dart';
import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_character_random_usecase.dart';

import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_specific_category_usecase.dart';
import 'package:apicallingusingttd/characterapicalling/domain/usecases/get_specific_id_usecase.dart';
import 'package:apicallingusingttd/characterapicalling/presentation/bloc/character_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(
    this.getAllCharacterUsecase,
    this.getCharacterSpecificById,
  ) : super(CharacterInitial()) {
    getAllCharacterDataFromApi();
  }

  final GetAllCharacterUsecase getAllCharacterUsecase;
  final GetCharacterSpecificById getCharacterSpecificById;
  final GetCharacterSpecificByCategory getCharacterSpecificByCategory =
      sl<GetCharacterSpecificByCategory>();
  final GetCharacterRandom getCharacterRandom = sl<GetCharacterRandom>();
  final GetCharacterNameUsecase getCharacterByName =
      sl<GetCharacterNameUsecase>();

  getAllCharacterDataFromApi() async {
    final data = await getAllCharacterUsecase.call(NoParams());
    data.fold(
        (l) => emit(CharacterFailure()), (r) => emit(CharacterSuccess(r)));
  }

  getCharacterById(int id) async {
    final res = await getCharacterSpecificById.call(Params(number: id));
    res.fold((failure) {
      print(failure);
    }, (success) {
      emit(CharacterSuccess(success));
    });
  }

  getSpecificCategory(String name) async {
    print('getSpecificCategory 5');
    final res = await getCharacterSpecificByCategory
        .call(CategoryParams(catgory: name));
    res.fold((failure) {
      print(failure);
    }, (success) {
      emit(CharacterSuccess(success));
    });
  }

  getCharacterRandomData() async {
    print('getCharacterRandomData 5');
    final res = await getCharacterRandom.call(RandomParams());
    res.fold((failure) {
      print(failure);
    }, (success) {
      emit(CharacterSuccess(success));
    });
  }

  getSpecificCharacterByName(String name1) async {
    final res = await getCharacterByName.call(NameParams(name: name1));
    res.fold((failure) {
      print(failure);
    }, (success) {
      emit(CharacterSuccess(success));
    });
  }

  void serch(a) {
    emit(serchActive(a));
  }
}

import 'dart:convert';

import 'package:apicallingusingttd/characterapicalling/core/error/exception.dart';
import 'package:apicallingusingttd/characterapicalling/data/model/character_model.dart';
import 'package:dio/dio.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacterData();
  Future<List<CharacterModel>> getSpecificCharactersByIdData(int number);
  Future<List<CharacterModel>> getCharactersByCategoryData(String catg);
  Future<List<CharacterModel>> getCharacterRandomData();
  Future<List<CharacterModel>> getCharactersByNameData(String name);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio dio;

  CharacterRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CharacterModel>> getAllCharacterData() {
    // TODO: implement getAllCharacterData
    print('getAllCharacterData');
    return _getAllCharacterUrl('https://www.breakingbadapi.com/api/characters');
  }

  @override
  Future<List<CharacterModel>> getSpecificCharactersByIdData(int number) {
    // TODO: implement getSpecificCharactersByIdData
    return _getAllCharacterUrl(
        'https://www.breakingbadapi.com/api/characters/$number');
  }

  @override
  Future<List<CharacterModel>> getCharactersByCategoryData(String catg) {
    // TODO: implement getCharactersByCategoryData
    print('getCharactersByCategoryData 2');
    return _getAllCharacterUrl(
        'https://www.breakingbadapi.com/api/characters/?category=$catg');
  }

  @override
  Future<List<CharacterModel>> getCharacterRandomData() {
    // TODO: implement getCharacterRandomData
    return _getAllCharacterUrl(
        'https://www.breakingbadapi.com/api/characters/random');
  }

  @override
  Future<List<CharacterModel>> getCharactersByNameData(String name) {
    // TODO: implement getCharactersByNameData
    return _getAllCharacterUrl(
        'https://www.breakingbadapi.com/api/characters/?name=$name');
  }

  Future<List<CharacterModel>> _getAllCharacterUrl(String url) async {
    print('_getAllCharacterUrl 1');
    final response = await dio.get(url);
    print(response.data);
    if (response.statusCode == 200) {
      print('response 200');
      List<CharacterModel> characterdata = [];
      final apidata = response.data;

      for (var elements in apidata) {
        characterdata.add(CharacterModel.fromJson(elements));
      }
      return characterdata;
    } else {
      print('response 404');
      throw ServerException();
    }
  }


}



import 'package:apicallingpost/core/error/exception.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:dio/dio.dart';

abstract class ApiCallRemoteDataSource {
  Future<List<ApiCallModel>> postAllDataInApi();
  Future<List<ApiCallModel>> getAllDataInApi();
}

class ApiCallRemoteDataSourceImpl implements ApiCallRemoteDataSource {

  final Dio dio;
  ApiCallRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ApiCallModel>> postAllDataInApi() {
    // TODO: implement postAllDataInApi
    throw UnimplementedError();
  }

  @override
  Future<List<ApiCallModel>> getAllDataInApi() {
    // TODO: implement getAllDataInApi
    return _getAllCharacterUrl(
        'http://192.168.1.9:3000/students');
  }

  Future<List<ApiCallModel>> _getAllCharacterUrl(String url) async {
    print('_getAllCharacterUrl 1');
    final response = await dio.get(url);
    print(response.data);
    if (response.statusCode == 200) {
      List<ApiCallModel> characterdata = [];
      final apidata = response.data;

      for (var elements in apidata) {
        characterdata.add(ApiCallModel.fromJson(elements));
      }
      return characterdata;
    } else {
      print('response 404');
      throw ServerException();
    }
  }

}
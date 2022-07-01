import 'package:apicallingpost/core/error/exception.dart';
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:dio/dio.dart';

abstract class ApiCallRemoteDataSource {
  Future<List<ApiCallModel>> postAllDataInApi(ApiCallModel apiCallModel);
  Future<List<ApiCallModel>> getAllDataInApi();
  Future<List<ApiCallModel>> deleteAllDataApi(int id);
  Future<List<ApiCallModel>> updateSpecificData(ApiCallModel apiCallModel);
}

class ApiCallRemoteDataSourceImpl implements ApiCallRemoteDataSource {
  final Dio dio;
  ApiCallRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ApiCallModel>> postAllDataInApi(ApiCallModel apiCallModel) async {
    try {
      Response response = await dio.post(
        "http://192.168.101.124:3000/students/add",
        data: apiCallModel.toJson(),
      );

      final responseData =
          await dio.get('http://192.168.101.124:3000/students');

      if (response.statusCode == 200 && responseData.statusCode == 200) {
        print('repons');
        final List<ApiCallModel> studentlist = [];
        final jsonlist = responseData.data;
        for (var item in jsonlist) {
          studentlist.add(ApiCallModel.fromJson(item));
        }
        return (studentlist);
      } else {
        throw ServerException();
        // return (ServerFailure());
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<ApiCallModel>> getAllDataInApi() {
    // TODO: implement getAllDataInApi
    return _getAllCharacterUrl('http://192.168.101.124:3000/students');
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

  @override
  Future<List<ApiCallModel>> deleteAllDataApi(int id) async {
    // TODO: implement deleteAllDataApi
    print('deletedataSOURCE');
    final response =
        await dio.delete('http://192.168.101.124:3000/students/delete/$id');
    final responseData = await dio.get('http://192.168.101.124:3000/students');
    print(response.data);
    if (response.statusCode == 200 && responseData.statusCode == 200) {
      List<ApiCallModel> characterdata = [];
      final apidata = responseData.data;

      for (var elements in apidata) {
        characterdata.add(ApiCallModel.fromJson(elements));
      }
      return characterdata;
    } else {
      print('response 404');
      throw ServerException();
    }
  }

  @override
  Future<List<ApiCallModel>> updateSpecificData(
      ApiCallModel apiCallModel) async {
    // TODO: implement updateSpecificData
    try {
      final Response response = await dio.put(
        'http://192.168.101.124:3000/students/update/${apiCallModel.studentId}',
        data: apiCallModel.toJson(),
      );
      final responseData =
          await dio.get('http://192.168.101.124:3000/students');

      if (response.statusCode == 200 && responseData.statusCode == 200) {
        print('repons');
        final List<ApiCallModel> studentlist = [];
        final jsonlist = responseData.data;
        for (var item in jsonlist) {
          studentlist.add(ApiCallModel.fromJson(item));
        }
        return (studentlist);
      } else {
        throw ServerException();
        // return (ServerFailure());
      }
    } catch (e) {
      rethrow;
    }
  }
}

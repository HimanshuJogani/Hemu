
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';

abstract class ApiCallState {}

class ApiCallInitial extends ApiCallState {}

class ApiCallSuccess extends ApiCallState {
  final List<ApiCallModel> apiCallModel;
  ApiCallSuccess(this.apiCallModel);
}

class ApiCallFailure extends ApiCallState {}
import 'package:apicallingpost/features/apicalling_post/data/model/api_call_model.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_delete_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_get_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_post_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_update_usecase.dart';

import 'package:apicallingpost/features/apicalling_post/presentation/cubit/api_call_state.dart';
import 'package:apicallingpost/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiCallCubit extends Cubit<ApiCallState> {
  ApiCallCubit(this.getApiCallingGetUsecase, this.getApiCallingPostUsecase)
      : super(ApiCallInitial()) {
    getAllDataFromApi();
  }

  final GetApiCallingGetUsecase getApiCallingGetUsecase;
  final GetApiCallingPostUsecase getApiCallingPostUsecase;
  final DeleteApiCallingGetUsecase deleteApiCallingGetUsecase =
      sl<DeleteApiCallingGetUsecase>();
  final UpdateApiCallingUpdateUsecase updateApiCallingUpdateUsecase =
      sl<UpdateApiCallingUpdateUsecase>();

  getAllDataFromApi() async {
    final data = await getApiCallingGetUsecase.call(NoParams());
    data.fold((l) => emit(ApiCallFailure()), (r) => emit(ApiCallSuccess(r)));
  }

  addAllDataToApi(ApiCallModel apiCallModel) async {
    print('cubitdata');
    var res = await getApiCallingPostUsecase.call(Params(apiCallModel));
    res.fold((l) {
      emit(ApiCallFailure());
    }, (r) {
      print('rhis crestd ${r.toString()}');
      emit(ApiCallSuccess(r));
    });
  }

  deleteStudentData(int id) async {
    var res = await deleteApiCallingGetUsecase.call(DeleteParams(id));
    res.fold((l) {
      emit(ApiCallFailure());
    }, (r) {
      print('rhis crestd ${r.toString()}');
      emit(ApiCallSuccess(r));
    });
  }

  updateStudentData(ApiCallModel apiCallModel) async {
    var res =
        await updateApiCallingUpdateUsecase.call(UpdateParams(apiCallModel));
    res.fold((l) {
      emit(ApiCallFailure());
    }, (r) {
      print('rhis crestd ${r.toString()}');
      emit(ApiCallSuccess(r));
    });
  }
}

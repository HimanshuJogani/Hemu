
import 'package:apicallingpost/features/apicalling_post/domain/usecase/api_call_get_usecase.dart';
import 'package:apicallingpost/features/apicalling_post/presentation/cubit/api_call_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiCallCubit extends Cubit<ApiCallState> {
  ApiCallCubit(this.getApiCallingGetUsecase) : super(ApiCallInitial());

  final GetApiCallingGetUsecase getApiCallingGetUsecase;


  getAllDataFromApi() async {
    final data = await getApiCallingGetUsecase.call(NoParams());
    data.fold(
            (l) => emit(ApiCallFailure()), (r) => emit(ApiCallSuccess(r)));
  }
}

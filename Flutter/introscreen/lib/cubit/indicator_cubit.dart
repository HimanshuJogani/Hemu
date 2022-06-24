import 'package:flutter_bloc/flutter_bloc.dart';
import 'indicator_state.dart';

class BottomIndicatorCubit extends Cubit<BottomIndicatorState> {
  BottomIndicatorCubit() : super(BottomIndicatorInitialState());

  nextIndicator(double index) {
    if (index < 5) {
      emit(BottomIndicatorIndexChangeState(index: index));
    }
  }
}

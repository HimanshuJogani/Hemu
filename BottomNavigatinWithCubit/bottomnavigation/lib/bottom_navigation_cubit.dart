import 'package:bottomnavigation/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial()) {
    emit(BottomNavigationSuccess(index: 0));
  }

  void updateIndex(int index) => emit(BottomNavigationSuccess(index: index));
}

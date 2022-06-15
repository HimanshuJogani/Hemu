import 'package:flutter_bloc/flutter_bloc.dart';

import './switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      isSwitched = true;
      textValue = 'Switch Button is ON';
      print('Switch Button is ON');
      emit(SwitchTrue());
    } else {
      isSwitched = false;
      textValue = 'Switch Button is OFF';
      print('Switch Button is OFF');
      emit(SwitchFalse());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit() : super(BillInitial());

  int counter = 0;

   billSwitchToggle(){
    counter++;
    emit(BillSuccess(val: counter));
  }
}

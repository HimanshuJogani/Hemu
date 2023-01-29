import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../products/data/models/product_model.dart';
import 'tp_bill_state.dart';

class TransportBillCubit extends Cubit<TransportBillState> {
  TransportBillCubit() : super(BillInitial()){
    billCounter();
  }

  billCounter()async{
    final prefs = await SharedPreferences.getInstance();
    int? c = prefs.getInt('tpcounter');
    if(c==null){
      await prefs.setInt('tpcounter', 1).then((bool sucess)=>{
        if(sucess){
          emit(BillSuccess(val: 1))
        }
      });
    }else{
      emit(BillSuccess(val: c));
    }
  }
   billSwitchToggle(int value) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.setInt('tpcounter', value).then((bool sucess)=>{
       if(sucess){
           emit(BillSuccess(val: value))
         }
       });
  }

}

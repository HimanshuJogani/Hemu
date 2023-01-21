import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../products/data/models/product_model.dart';
import 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit() : super(BillInitial()){
    billCounter();
  }

  billCounter()async{
    final prefs = await SharedPreferences.getInstance();
    int? c = prefs.getInt('counter');
    if(c==null){
      await prefs.setInt('counter', 1).then((bool sucess)=>{
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
     await prefs.setInt('counter', value).then((bool sucess)=>{
       if(sucess){
           emit(BillSuccess(val: value))
         }
       });
  }

  check(value){
     emit(CheckState(val:value));
  }

}

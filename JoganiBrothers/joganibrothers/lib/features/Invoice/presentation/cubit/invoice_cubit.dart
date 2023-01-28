import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:joganibrothers/features/Invoice/presentation/cubit/invoice_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());

  savePdf(generatedPdfFilePath)  async {
    emit(InvoiceLoading());
    Directory? appDocDir = await getExternalStorageDirectory();
    String appDocPath = appDocDir!.path;
    final prefs = await SharedPreferences.getInstance();
    int? c = prefs.getInt('counter');
    final file = File(appDocPath + '/Bill_No:${c}.pdf');
    print('Save as file ${file.path} ...');
    var bytes = await File('$generatedPdfFilePath').readAsBytes();
    await file.writeAsBytes(bytes);
    if (kDebugMode) {
      print('$file');
    }
    c=(c ?? 0) + 1;
    await prefs.setInt('counter',c);
    emit(InvoiceSuccess());
  }

}

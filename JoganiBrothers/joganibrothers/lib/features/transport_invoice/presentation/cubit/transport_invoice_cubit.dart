import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:joganibrothers/features/transport_invoice/presentation/cubit/transport_invoice_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransportInvoiceCubit extends Cubit<TransportInvoiceState> {
  TransportInvoiceCubit() : super(InvoiceInitial());

  savePdf(generatedPdfFilePath)  async {
    emit(InvoiceLoading());
    Directory? appDocDir = await getExternalStorageDirectory();
    String appDocPath = appDocDir!.path;
    final prefs = await SharedPreferences.getInstance();
    int? c = prefs.getInt('tpcounter');
    final file = File(appDocPath + '/Tp_Bill_No:${c}.pdf');
    var bytes = await File('$generatedPdfFilePath').readAsBytes();
    await file.writeAsBytes(bytes);
    if (kDebugMode) {
      print('$file');
    }
    c=(c ?? 0) + 1;
    await prefs.setInt('tpcounter',c);
    emit(InvoiceSuccess());
  }

}

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
    final date = DateTime.now();
    final current = "${date.day}-${date.month}-${date.year}";
    final file = File(appDocPath + '/Tp_Bill_No:${current}.pdf');
    var bytes = await File('$generatedPdfFilePath').readAsBytes();
    await file.writeAsBytes(bytes);
    if (kDebugMode) {
      print('$file');
    }
    emit(InvoiceSuccess());
  }

}

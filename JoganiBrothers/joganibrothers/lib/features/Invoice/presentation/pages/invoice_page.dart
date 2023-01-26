import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joganibrothers/features/Invoice/presentation/cubit/invoice_cubit.dart';
import 'package:joganibrothers/features/Invoice/presentation/cubit/invoice_state.dart';
import 'package:joganibrothers/features/Invoice/presentation/pages/loading_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../core/navigation/route_info.dart';
import '../../../../core/theme/jogani_brothers_color.dart';


class InvoicePage extends StatelessWidget {
  InvoicePage({Key? key, required this.generatedPdfFilePath}) : super(key: key);

  String generatedPdfFilePath;
  bool saveFile = false;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvoiceCubit, InvoiceState>(
      listener: (context, state) {
        if(state is InvoiceLoading){
           ProgressDialog.showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark
            ),
            title: const Text("Document"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.print),
                onPressed: () {
                  showAlertDialog(context,generatedPdfFilePath);
                },
              ),
            ],
          ),
          body: SfPdfViewer.file(File(generatedPdfFilePath)),
        );
      },
    );
  }
}

showAlertDialog(BuildContext context, String name) {
  var snackBar = SnackBar(
    content: const Text('Bill PDF generated Successfully!!!'),
    backgroundColor: JoganiBrothersColors.customDarkBlue.withOpacity(0.8),
  );
  // Create button
  Widget okButton = ElevatedButton(
    child: const Text("Yes"),
    onPressed: () {
      context.read<InvoiceCubit>().savePdf(name);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home,(Route<dynamic> route) => false);
    },
  );

  Widget cancelButton = ElevatedButton(
    child: const Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Save Pdf!"),
    content: const Text("Are you sure you have save pdf?"),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

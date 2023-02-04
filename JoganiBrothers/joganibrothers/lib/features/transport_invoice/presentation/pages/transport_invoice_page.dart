import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import '../../../../core/navigation/route_info.dart';
import '../../../../core/theme/jogani_brothers_color.dart';
import '../cubit/transport_invoice_cubit.dart';

class TransportInvoicePage extends StatelessWidget {
  TransportInvoicePage({Key? key, required this.generatedPdfFilePath}) : super(key: key);

  String generatedPdfFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              await Share.shareFiles([generatedPdfFilePath],text: 'TP_Jogani');
            },
          ),
          const SizedBox(width: 5,),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              showAlertDialog(context,generatedPdfFilePath);
            },
          ),
        ],
      ),
      body: SfPdfViewer.file(File(generatedPdfFilePath)),
    );
  }
}

showAlertDialog(BuildContext context, String name) {
  var snackBar = SnackBar(
    content: const Text('Transport Bill PDF generated Successfully!!!'),
    backgroundColor: JoganiBrothersColors.customDarkBlue.withOpacity(0.8),
  );
  // Create button
  Widget okButton = ElevatedButton(
    child: const Text("Yes"),
    onPressed: () {
      context.read<TransportInvoiceCubit>().savePdf(name);
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

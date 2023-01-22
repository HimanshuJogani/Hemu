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


class InvoicePage extends StatelessWidget {
  InvoicePage({Key? key, required this.generatedPdfFilePath}) : super(key: key);

  String generatedPdfFilePath;
  bool saveFile = false;


  // Future<bool> saveFile(String url, String fileName) async {
  //   try {
  //      Directory? directory;
  //       directory = await getExternalStorageDirectory();
  //       String newPath = "";
  //       List<String> paths = directory!.path.split("/");
  //       for (int x = 1; x < paths.length; x++) {
  //         String folder = paths[x];
  //         if (folder != "Android") {
  //           newPath += "/" + folder;
  //         } else {
  //           break;
  //         }
  //       }
  //       newPath = newPath + "/PDF_Download";
  //       directory = Directory(newPath);
  //
  //       File saveFile = File(directory.path + "/$fileName");
  //       if (kDebugMode) {
  //         print(saveFile.path);
  //       }
  //
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Bill PDF generated Successfully!!!'),
    );
    return BlocConsumer<InvoiceCubit, InvoiceState>(
      listener: (context, state) {
        if(state is InvoiceLoading){
          LoadingWidget();
        }
        if(state is InvoiceSuccess){
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  context.read<InvoiceCubit>().savePdf(generatedPdfFilePath);
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



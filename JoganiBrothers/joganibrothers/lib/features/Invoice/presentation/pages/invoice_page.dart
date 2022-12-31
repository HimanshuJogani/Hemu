import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class InvoicePage extends StatelessWidget {
   InvoicePage({Key? key,required this.generatedPdfFilePath}) : super(key: key);

   String generatedPdfFilePath;


   savePdf()async {
     final file = File('$generatedPdfFilePath/jogani.pdf');
     print('Save as file ${file.path} ...');
     var bytes = await File('$generatedPdfFilePath/jogani.pdf').readAsBytes();
     await file.writeAsBytes(bytes);
     if (kDebugMode) {
       print('$file');
     }
     return file;
     // final url = file.path;
     //
     // await OpenFile.open(url);
   }

   // Future<bool> saveFile(String url, String fileName) async {
   //   try {
   //     final Permission _permission;
   //     if (await _requestPermission(Permission.storage)) {
   //       Directory? directory;
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
   //     }
   //     return true;
   //   } catch (e) {
   //     return false;
   //   }
   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
        title: Text("Document"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              savePdf();
            },
          ),
        ],
      ),
      body: SfPdfViewer.file(File(generatedPdfFilePath)),
    );
  }
}



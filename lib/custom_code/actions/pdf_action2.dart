// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

Future pdfAction2(String? imageUrl) async {
  final pdf = pw.Document();

  final response = await http.get(Uri.parse(imageUrl ??
      'https://res.cloudinary.com/dcato1y8g/image/upload/v1711266483/1711266482828000_ez8amh.jpg'));
  final Uint8List byteList = response.bodyBytes;

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(
            pw.MemoryImage(byteList),
            fit: pw.BoxFit.fitWidth,
          ),
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => await pdf.save(),
  );
}

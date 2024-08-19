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

import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';
import 'dart:convert';

Future pdfAction(String? html, Future Function() rebuildPage) async {
  const defaultHtml = '''
  <h1>Heading Example</h1>
  <p>This is a paragraph.</p>
  <img src="image.jpg" alt="Example Image" />
  <blockquote>This is a quote.</blockquote>
  <ul>
    <li>First item</li>
    <li>Second item</li>
    <li>Third item</li>
  </ul>
  ''';

  final pdf = pw.Document();
  final htmlContent = html ?? defaultHtml;

  try {
    // Convert HTML to PDF widgets
    final widgets = await HTMLToPdf().convert(htmlContent);

    // Check if the widgets list is not empty
    if (widgets.isNotEmpty) {
      pdf.addPage(
          pw.MultiPage(build: (context) => [pw.Column(children: widgets)]));
    } else {
      // Add a blank page if the widgets list is empty
      pdf.addPage(
          pw.Page(build: (context) => pw.Center(child: pw.Text('No content'))));
    }

    String base64Image1 = base64Encode(await pdf.save());

    FFAppState().error = base64Image1;
    rebuildPage();

    // Layout and save the PDF
    return await Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      return await pdf.save();
    });
  } catch (e) {
    print('Error creating PDF: $e');
    return Uint8List(0);
  }
}

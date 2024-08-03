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

import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future pdfInvoiceDownload(
  String? title,
  String? body,
  String? invoiceNumber,
  String? date,
  String? duedate,
  String? name,
  String? total,
  String? client,
  String? clientadress,
  String productsJsonString,
) async {
  // null safety
  title = title ?? '';
  body = body ?? '';
  invoiceNumber = invoiceNumber ?? '';
  date = date ?? '';
  duedate = duedate ?? '';
  name = name ?? '';
  total = total ?? '';
  client = client ?? '';
  clientadress = clientadress ?? '';

  final pdf = pw.Document();

  List<Map<String, dynamic>> productsList = [];
  if (productsJsonString.isNotEmpty) {
    productsList =
        List<Map<String, dynamic>>.from(jsonDecode(productsJsonString));
  }

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(children: [
          pw.Container(
            height: 50,
            child: pw.Text("Invoice",
                style: const pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 40,
                )),
          ),
          pw.Container(
            height: 60,
            child: pw.Text(title ?? '',
                style: const pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 15,
                )),
          ), //Made by Blupry.com //Blupry.com No-code marketplace, custom template and support!
          pw.Divider(thickness: 4),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(
                height: 100,
                width: 230,
                decoration: pw.BoxDecoration(
                  borderRadius: const pw.BorderRadius.all(
                    pw.Radius.circular(10),
                  ),
                  border: pw.Border.all(
                    color: PdfColors.black,
                    width: 2,
                    style: pw.BorderStyle.solid,
                  ),
                ),
                padding: const pw.EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom: 10,
                  right: 20,
                ),
                alignment: pw.Alignment.centerLeft,
                child: pw.DefaultTextStyle(
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                  child: pw.GridView(
                    crossAxisCount: 2,
                    children: [
                      pw.Text('Bill to:'),
                      pw.Text(client ?? ''),
                      pw.Text(''),
                      pw.Text(clientadress ?? ''),
                    ],
                  ),
                ),
              ),
              pw.Container(
                height: 100,
                width: 220,
                decoration: pw.BoxDecoration(
                  borderRadius: const pw.BorderRadius.all(
                    pw.Radius.circular(10),
                  ),
                  border: pw.Border.all(
                    color: PdfColors.black,
                    width: 2,
                    style: pw.BorderStyle.solid,
                  ),
                ),
                padding: const pw.EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom: 10,
                  right: 20,
                ),
                alignment: pw.Alignment.centerLeft,
                child: pw.DefaultTextStyle(
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                  child: pw.GridView(
                    crossAxisCount: 2,
                    children: [
                      pw.Text('Invoice #'),
                      pw.Text(invoiceNumber ?? ''),
                      pw.Text('Date:'),
                      pw.Text(date ?? ''),
                      pw.Text('Due Date:'),
                      pw.Text(duedate ?? ''),
                    ],
                  ),
                ),
              ),
            ],
          ), //Made by Blupry.com //Blupry.com No-code marketplace, custom template and support!
          pw.SizedBox(height: 10),
          pw.Container(
              height: 200,
              width: 500,
              decoration: pw.BoxDecoration(
                borderRadius: const pw.BorderRadius.all(
                  pw.Radius.circular(10),
                ),
                border: pw.Border.all(
                  color: PdfColors.black,
                  width: 0.5,
                  style: pw.BorderStyle.solid,
                ),
              ),
              padding: const pw.EdgeInsets.all(20),
              alignment: pw.Alignment.centerLeft,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 5),
                  pw.Row(
                    mainAxisSize: pw.MainAxisSize.max,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Text(
                          "Product",
                          style: pw.TextStyle(fontSize: 16),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          "Units",
                          style: pw.TextStyle(fontSize: 16),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          "Price",
                          style: pw.TextStyle(fontSize: 16),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          "Total Amount",
                          style: pw.TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  for (var product in productsList)
                    pw.Row(
                      mainAxisSize: pw.MainAxisSize.max,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            "${product["name"]}",
                            style: pw.TextStyle(fontSize: 16),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            "${product["units"]}",
                            style: pw.TextStyle(fontSize: 16),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            "${product["price"]}",
                            style: pw.TextStyle(fontSize: 16),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            "${product["totalAmount"]}",
                            style: pw.TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                ],
              )),
          pw.SizedBox(height: 10),
          pw.Container(
            decoration: pw.BoxDecoration(
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
            ),
            padding: const pw.EdgeInsets.only(
                left: 40, top: 10, bottom: 10, right: 20),
            alignment: pw.Alignment.centerLeft,
            height: 50,
            child: pw.DefaultTextStyle(
              style: pw.TextStyle(
                fontSize: 12,
              ),
              child: pw.GridView(
                crossAxisCount: 4,
                children: [
                  pw.Text(' '),
                  pw.Text(' '),
                  pw.Text('Total Amount'),
                  pw.Text(total ?? ''),
                ],
              ),
            ),
          ),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(width: 10),
              pw.Text(body ?? ''),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Container(
            width: 450,
            height: 100,
            alignment: pw.Alignment
                .topLeft, // aligns container to the top-left corner of the page
            child: pw.Text(
              name ?? '',
              style: pw.TextStyle(
                fontSize: 15,
                fontStyle: pw.FontStyle.italic,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ]);
      }));

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => await pdf.save());
}
//Made by Blupry.com
//Blupry.com No-code marketplace, custom template and support!

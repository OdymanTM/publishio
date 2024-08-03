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

import 'index.dart'; // Imports other custom actions

import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'dart:developer';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';

Future<String> scannerAaction(BuildContext context) async {
  List<String> _pictures = [];
  List<String> pictures = [];
  String resultMessage = 'Failed to save images';
  pictures =
      await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ??
          [];
  _pictures = pictures;

  Future<String> _saveScannedImage(String imagePath, int count) async {
    Directory? externalDirectory = await getApplicationDocumentsDirectory();
    final imageName =
        '${count}scanned_document_${DateTime.now().millisecondsSinceEpoch}.jpg';
    if (externalDirectory != null) {
      if (Platform.isAndroid) {
        Directory directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          externalDirectory = await getExternalStorageDirectory();
        } else {
          externalDirectory = directory;
        }
      }
      String newPath = '${externalDirectory!.path}/${imageName}';
      //imagePath = cacheDirectory.path;
      final imageFile = File(imagePath);
      final finalImage = await File(newPath);
      List<int> imageBytes = await imageFile.readAsBytes();
      await finalImage.writeAsBytes(imageBytes);
      resultMessage = 'Images saved successfully';
      // Save the file to the document directory
    }
    return 'success';
  }

  if (pictures.isNotEmpty) {
    int count = 0;
    for (String picture in pictures) {
      count += 1;
      await _saveScannedImage(picture, count);
    }
  }

  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');
  int count = 1;
  bool allSuccess = true;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 7),
      content: Text(resultMessage),
    ),
  );

  return 'end';
}

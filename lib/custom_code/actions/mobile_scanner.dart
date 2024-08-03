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

import 'package:mobile_scanner/mobile_scanner.dart';

Future mobileScanner(
  BuildContext context,
  Future Function() rebuildPage,
) async {
  MobileScannerController cameraController = MobileScannerController();
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => MobileScanner(
        controller: cameraController,
        onDetect: (p0) {
          FFAppState().qrcodelink = p0.barcodes[0].displayValue!;
          cameraController.stop();
          Navigator.of(context).pop();
          rebuildPage();
        },
      ),
    ),
  );
  cameraController.stop();
}

import '/flutter_flow/flutter_flow_util.dart';
import 'scanner_widget.dart' show ScannerWidget;
import 'package:flutter/material.dart';

class ScannerModel extends FlutterFlowModel<ScannerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

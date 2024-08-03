import '/flutter_flow/flutter_flow_util.dart';
import 'qrscan_widget.dart' show QrscanWidget;
import 'package:flutter/material.dart';

class QrscanModel extends FlutterFlowModel<QrscanWidget> {
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

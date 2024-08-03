import '/flutter_flow/flutter_flow_util.dart';
import 'printpdf_widget.dart' show PrintpdfWidget;
import 'package:flutter/material.dart';

class PrintpdfModel extends FlutterFlowModel<PrintpdfWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

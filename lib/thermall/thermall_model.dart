import '/flutter_flow/flutter_flow_util.dart';
import 'thermall_widget.dart' show ThermallWidget;
import 'package:flutter/material.dart';

class ThermallModel extends FlutterFlowModel<ThermallWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - thermalPrinterEnAr80mmPDF] action in Button widget.
  FFUploadedFile? fef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

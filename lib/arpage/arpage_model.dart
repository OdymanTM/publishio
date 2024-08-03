import '/flutter_flow/flutter_flow_util.dart';
import 'arpage_widget.dart' show ArpageWidget;
import 'package:flutter/material.dart';

class ArpageModel extends FlutterFlowModel<ArpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

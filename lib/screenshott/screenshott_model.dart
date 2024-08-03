import '/flutter_flow/flutter_flow_util.dart';
import 'screenshott_widget.dart' show ScreenshottWidget;
import 'package:flutter/material.dart';

class ScreenshottModel extends FlutterFlowModel<ScreenshottWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

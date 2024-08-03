import '/flutter_flow/flutter_flow_util.dart';
import 'pagerequest_widget.dart' show PagerequestWidget;
import 'package:flutter/material.dart';

class PagerequestModel extends FlutterFlowModel<PagerequestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

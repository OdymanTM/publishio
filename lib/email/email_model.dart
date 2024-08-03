import '/flutter_flow/flutter_flow_util.dart';
import 'email_widget.dart' show EmailWidget;
import 'package:flutter/material.dart';

class EmailModel extends FlutterFlowModel<EmailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

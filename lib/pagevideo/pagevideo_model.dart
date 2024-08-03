import '/flutter_flow/flutter_flow_util.dart';
import 'pagevideo_widget.dart' show PagevideoWidget;
import 'package:flutter/material.dart';

class PagevideoModel extends FlutterFlowModel<PagevideoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

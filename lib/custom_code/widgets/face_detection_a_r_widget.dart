// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class FaceDetectionARWidget extends StatefulWidget {
  const FaceDetectionARWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<FaceDetectionARWidget> createState() => _FaceDetectionARWidgetState();
}

class _FaceDetectionARWidgetState extends State<FaceDetectionARWidget> {
  late ARKitController arkitController;
  ARKitNode? node;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: ARKitSceneView(
            configuration: ARKitConfiguration.faceTracking,
            onARKitViewCreated: onARKitViewCreated,
          ),
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
    this.arkitController.onUpdateNodeForAnchor = _handleUpdateAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (!(anchor is ARKitFaceAnchor)) {
      return;
    }

    final material = ARKitMaterial(
      diffuse: ARKitMaterialProperty.image(
          'https://res.cloudinary.com/dcato1y8g/image/upload/v1717848258/p6qimwsxrhxxogwyoefk.jpg'),
      doubleSided: true,
    );

    final plane = ARKitPlane(
      width: 0.2,
      height: 0.3,
      materials: [material],
    );

    final position = vector.Vector3(
      anchor.transform.getColumn(3).x,
      anchor.transform.getColumn(3).y,
      anchor.transform.getColumn(3).z,
    );

    node = ARKitNode(
      geometry: plane,
      position: position,
    );

    arkitController.add(node!, parentNodeName: anchor.nodeName);
  }

  void _handleUpdateAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitFaceAnchor && mounted) {
      final faceAnchor = anchor;
      final position = vector.Vector3(
        faceAnchor.transform.getColumn(3).x,
        faceAnchor.transform.getColumn(3).y,
        faceAnchor.transform.getColumn(3).z,
      );
      node?.position = position;
    }
  }
}

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

import '/custom_code/actions/index.dart'; // Imports custom actions

import 'dart:async';

import 'package:pedometer/pedometer.dart';

class PedometerWidget extends StatefulWidget {
  const PedometerWidget({
    Key? key,
    this.width,
    this.height,
    required this.rebuildpage,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() rebuildpage;

  @override
  _PedometerWidgetState createState() => _PedometerWidgetState();
}

class _PedometerWidgetState extends State<PedometerWidget> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) async {
    FFAppState().update(() {
      FFAppState().stepss = event.steps;
    });

    await widget.rebuildpage();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) async {
    FFAppState().update(() {
      FFAppState().statuss = event.status;
    });

    await widget.rebuildpage();
  }

  void onPedestrianStatusError(error) async {
    FFAppState().update(() {
      FFAppState().pedometerStatus = 'Pedestrian Status not available';
    });

    await widget.rebuildpage();
  }

  void onStepCountError(error) async {
    FFAppState().update(() {
      FFAppState().stepss = 0;
    });

    await widget.rebuildpage();
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Steps Taken',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              FFAppState().stepss.toString(),
              style: TextStyle(fontSize: 60),
            ),
            Divider(
              height: 100,
              thickness: 0,
              color: Colors.white,
            ),
            Text(
              'Pedestrian Status:',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              FFAppState().statuss == 'walking'
                  ? Icons.directions_walk
                  : FFAppState().statuss == 'stopped'
                      ? Icons.accessibility_new
                      : Icons.error,
              size: 100,
            ),
            Center(
              child: Text(
                FFAppState().statuss,
                style: FFAppState().statuss == 'walking' ||
                        FFAppState().statuss == 'stopped'
                    ? TextStyle(fontSize: 30)
                    : TextStyle(fontSize: 20, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}

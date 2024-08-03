import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'thermall_model.dart';
export 'thermall_model.dart';

class ThermallWidget extends StatefulWidget {
  const ThermallWidget({super.key});

  @override
  State<ThermallWidget> createState() => _ThermallWidgetState();
}

class _ThermallWidgetState extends State<ThermallWidget> {
  late ThermallModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThermallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  _model.fef = await actions.thermalPrinterEnAr80mmPDF(
                    'https://res.cloudinary.com/dpxrpzvry/image/upload/v1688323086/nrx5dhxceiqaqd2esxw6.png',
                    'jsjhbs',
                    'sjhbwshj',
                    'swhjb',
                    'snbhjsw',
                    'sjhbjws',
                    'shjbswhj',
                    'swhbs',
                    'swhjbs',
                    'jhbsw',
                    'sjbws',
                    List.generate(
                        random_data.randomInteger(5, 5),
                        (index) => random_data.randomString(
                              0,
                              0,
                              true,
                              false,
                              false,
                            )).toList(),
                    List.generate(random_data.randomInteger(5, 5),
                        (index) => random_data.randomInteger(0, 10)).toList(),
                    List.generate(random_data.randomInteger(5, 5),
                        (index) => random_data.randomDouble(0.0, 1.0)).toList(),
                    List.generate(random_data.randomInteger(5, 5),
                        (index) => random_data.randomDouble(0.0, 1.0)).toList(),
                    44.0,
                    33.0,
                    233.0,
                    2,
                    'cdd',
                    true,
                    45,
                    List.generate(random_data.randomInteger(5, 5),
                        (index) => random_data.randomDouble(0.0, 1.0)).toList(),
                    334.0,
                    4334.0,
                  );

                  setState(() {});
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
